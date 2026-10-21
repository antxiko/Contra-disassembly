#!/usr/bin/env python3
"""Las animaciones de la web: la partida de verdad, ejecutada por
tools/ejecuta.py, cuadro a cuadro y con los sprites como los pinta el V9938.

Se arranca la partida (espacio con el titulo, como en tools/fases.py), se pone
la fase en 0xE020 y, si se pide, el tramo en 0xE022 (asi se empieza delante
del jefe), y se juega con un mando de guion: hacia donde va la fase (derecha,
izquierda, arriba o abajo, tools/mapas.py) con el disparo pulsado y un salto
de vez en cuando. Para que el clip no se acabe en un "game over", cada cuadro
se rellenan las vidas (0xE021, que p00:4261 pone a 3 al empezar) y la energia
(0xE2C9, que p00:4266 pone a 0x10): es lo unico que se toca de la partida.

El mando va como en el juego: GTSTCK (0 cursores, 1 mando) da la direccion
(p00:4F5F-4F6F), GTTRIG(1) o el espacio dispara (p00:4F02-4F0D) y GTTRIG(3) o
las teclas de la fila 4 saltan (p00:4F38-4F44).

Uso: anima.py fase <fase> <salida.gif> [segundos] [tramo]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import fases       # noqa: E402
import mapas       # noqa: E402

VIDAS, ENERGIA = 0xE021, 0xE2C9
# GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda
HACIA = {0: 3, 6: 3, 7: 3, 9: 3, 19: 3, 13: 7, 17: 7, 3: 1, 18: 1, 10: 5, 16: 5,
         2: 0, 5: 0, 12: 0, 15: 0, 1: 3, 4: 3, 11: 3, 14: 3}


def partida(f, tramo=None):
    """El juego arrancado hasta el titulo; la fase (y el tramo) se ponen
    cuando el programa llega a p00:4277, donde empieza a cargar la fase."""
    m = fases.partida_en(f, 1)
    paso = m.paso
    puesto = [False]

    def paso_con_fase():
        if m.pc == fases.CARGA_FASE and not puesto[0]:
            m.mem[fases.FASE] = f
            if tramo is not None:
                m.mem[fases.TRAMO] = tramo
            puesto[0] = True
        paso()
    m.paso = paso_con_fase
    return m


def clip(f, segundos=8, tramo=None, cada=2, espera=fases.PULSA + 160):
    """Los cuadros (PIL) del clip de la fase f: `espera` cuadros para que
    cargue y luego `segundos` de partida, uno de cada `cada`."""
    m = partida(f, tramo)
    m.apunta = False
    ims = []
    n = [0]

    def mando(m):
        n[0] += 1
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        m.mem[VIDAS] = 3
        m.mem[ENERGIA] = 0x10
        d = HACIA.get(f, 3)
        m.palanca = {1: d} if d else {}
        m.botones = {1} | ({3} if n[0] % 45 < 8 else set())
    m.cuadros(espera, cada=mando)
    for k in range(segundos * 60):
        m.cuadros(1, cada=mando)
        if k % cada == 0:
            ims.append(m.foto().copy())
    return ims


def guarda_gif(ims, salida, cada=2, escala=1):
    if escala != 1:
        ims = [i.resize((i.width * escala, i.height * escala)) for i in ims]
    q = [i.convert("P", palette=1, colors=255) for i in ims]
    q[0].save(salida, save_all=True, append_images=q[1:], duration=int(1000 * cada / 60),
              loop=0, optimize=True, disposal=1)


def main(argv):
    if len(argv) < 4 or argv[1] != "fase":
        sys.exit(__doc__)
    f, salida = int(argv[2]), argv[3]
    seg = int(argv[4]) if len(argv) > 4 else 8
    tramo = int(argv[5]) if len(argv) > 5 else None
    ims = clip(f, seg, tramo)
    guarda_gif(ims, salida)
    print("fase %d: %d cuadros -> %s" % (f, len(ims), salida))


if __name__ == "__main__":
    main(sys.argv)
