#!/usr/bin/env python3
"""Un clip por jefe: la partida de verdad (tools/anima.py) desde el tramo del
jefe de cada fase.

- En las fases que corren (horizontales y verticales), el tramo del jefe es el
  ultimo hacia donde va la fase: el 0 en la 10, 13, 16 y 17 (que van hacia
  abajo o hacia la izquierda, tools/mapas.py) y el ultimo de la lista en las
  demas. Las paredes (2, 5, 12 y 15) tienen un solo tramo.
- En las bases en 3D (1, 4, 11 y 14) el nucleo es la ultima sala de la lista.
  Una sala que no es la 0 no se puede poner al cargar la fase: el marco del
  pasillo solo lo pinta la sala 0, y las demas pintan encima su pared del
  fondo (p03:B16F-B180 cambia 0xE022 y llama a pantalla_nueva). Asi que se
  empieza en la sala 0, se barre disparando hasta romper los blancos, se entra
  en el pasillo (arriba) y se sale a un lado; la primera vez que se cruza una
  puerta (p03:B16F, con A = la sala nueva), la puerta lleva al nucleo. El clip
  empieza ahi. En las bases 1, 4 y 11 se entra en el pasillo de la sala 0 sin
  romper nada; en la 14 hacen falta los blancos rotos (0xE18B = 0xFF,
  p03:AFC7-AFD8), y el guion no los rompe: en esa sala se pone 0xFF a mano.

Uso: jefes.py <dir> [fases]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import anima       # noqa: E402
import fases       # noqa: E402
import mapas       # noqa: E402

PUERTA = 0xB16F
JUGADAS = [f for f in fases.FASES if f != 8]


def tramo_del_jefe(f):
    n = len(fases.lista(f)[2])
    return 0 if f in (10, 13, 16, 17) else n - 1


def clip_base(f, segundos=12, cada=2):
    nucleo = len(fases.lista(f)[2]) - 1
    m = anima.partida(f, 0)
    m.apunta = False
    paso = m.paso
    dentro = [None]

    def paso_con_puerta():
        if m.pc == PUERTA and dentro[0] is None:
            m.a = nucleo
            dentro[0] = m.cuadro
        paso()
    m.paso = paso_con_puerta
    n = [0]

    def mando(m):
        n[0] += 1
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        m.mem[anima.VIDAS] = 3
        m.mem[anima.ENERGIA] = 0x10
        if m.cuadro < fases.PULSA + 60:
            m.palanca, m.botones = {}, set()
            return
        if dentro[0] is None:
            if f == 14:
                m.mem[0xE18B] = 0xFF
            # barrer disparando, entrar (arriba) y salir a un lado
            k = n[0] % 600
            d = (3 if (k // 60) % 2 else 7) if k < 480 else (1 if k < 520 else 3)
        else:
            d = 3 if (n[0] // 60) % 2 else 7
        m.palanca = {1: d}
        m.botones = {1} | ({3} if n[0] % 45 < 8 else set())
    for _ in range(60 * 120):
        m.cuadros(1, cada=mando)
        if dentro[0] is not None:
            break
    else:
        raise SystemExit("fase %d: no se ha cruzado ninguna puerta en 120 s" % f)
    ims = []
    for k in range(segundos * 60):
        m.cuadros(1, cada=mando)
        if k % cada == 0:
            ims.append(m.foto().copy())
    return ims


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    dst = argv[1]
    fs = [int(x) for x in argv[2:]] or JUGADAS
    for f in fs:
        if f in mapas.TRES_D:
            ims = clip_base(f)
        else:
            ims = anima.clip(f, 12, tramo_del_jefe(f))
        anima.guarda_gif(ims, os.path.join(dst, "jefe_%02d.gif" % f))
        print("fase %d: %d cuadros" % (f, len(ims)), flush=True)


if __name__ == "__main__":
    main(sys.argv)
