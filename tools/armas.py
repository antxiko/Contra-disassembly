#!/usr/bin/env python3
"""Un clip por arma: la partida de la fase 0 con 0xE032 (el arma, la que
elige el menu que abre la capsula de dibujo 0x2C: p03:BF82) puesta cada cuadro, el jugador quieto
disparando hacia la derecha y luego en diagonal hacia arriba.

Las cinco del menu (p00:5128-5160 las escribe y la tabla p03:BFAB da el
numero de cada fila): 0 NORMAL, 3 MACHINE, 5 REAR, 1 LASER y 2 FIRE. El clip
es la franja de la pantalla donde esta el jugador (lineas 8-104), al doble.

`menu`: el menu de armas en la fase 7 (TUNDRA AREA, la primera con las cinco),
abierto como lo abre la capsula de dibujo 0x2C (p02:958D: 0xE2C1 = 1), un
segundo despues.

Uso: armas.py <dir> [armas, por defecto 0 3 5 1 2]
     armas.py menu <salida.png>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import anima      # noqa: E402
import fases      # noqa: E402

ARMA = 0xE032


def clip(w, segundos=4):
    m = anima.partida(0)
    m.apunta = False
    n = [0]

    def mando(m):
        n[0] += 1
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        m.mem[anima.VIDAS] = 3
        m.mem[anima.ENERGIA] = 0x10
        m.mem[ARMA] = w
        if m.cuadro < fases.PULSA + 60:
            m.palanca, m.botones = {}, set()
            return
        m.palanca = {1: 2} if (n[0] // 90) % 2 else {}
        m.botones = {1} if n[0] % 8 < 4 else set()
    m.cuadros(fases.PULSA + 200, cada=mando)
    ims = []
    for k in range(segundos * 60):
        m.cuadros(1, cada=mando)
        if k % 2 == 0:
            ims.append(m.foto().crop((0, 8, 256, 104)))
    return ims


def menu():
    m = anima.partida(6)
    m.apunta = False

    def mando(m):
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
    m.cuadros(fases.PULSA + 300, cada=mando)
    m.mem[0xE2C1] = 1
    m.cuadros(60)
    return m


def main(argv):
    if argv[1:2] == ["menu"]:
        menu().foto().save(argv[2])
        return
    dst = argv[1]
    ws = [int(x) for x in argv[2:]] or [0, 3, 5, 1, 2]
    for w in ws:
        ims = clip(w)
        anima.guarda_gif(ims, os.path.join(dst, "arma_%d.gif" % w), escala=2)
        print("arma %d: %d cuadros" % (w, len(ims)), flush=True)


if __name__ == "__main__":
    main(sys.argv)
