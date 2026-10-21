#!/usr/bin/env python3
"""Las pantallas de cada fase, pintadas por el propio cartucho.

Contra de MSX2 no hace scroll: va de pantalla en pantalla. Cada fase (0xE020)
tiene en su banco de fase (tabla p03:BAE4) una lista de pantallas, con su
puntero en 0x6000 + 2 x fase; la lista acaba en un 0x00 que no es el primero.
El tramo en curso (0xE022) es el indice en esa lista, y p03:BB3C construye la
pantalla: lee las ordenes de pieza de la pantalla (puntero en 0x6100 + 2 x
numero de pantalla), las apunta en el mapa de 32 x 24 de 0xC300 y pinta cada
dibujo de 8 x 8 con p00:486E.

Aqui se arranca el juego, se pone la fase en 0xE020 cuando el programa llega
a p00:4277 (donde empieza a cargar una fase), se deja que cargue sus graficos
y su paleta, y se llama a p03:BB3C con cada tramo. Lo que sale es la pagina
visible sin sprites, tal cual la deja el cartucho.

Uso: fases.py lista              las listas de pantallas de las 19 fases
     fases.py pinta <fase> <dir> las pantallas de una fase en <dir>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from ejecuta import Partida          # noqa: E402

RAIZ = os.path.dirname(AQUI)
ROM = open(os.path.join(RAIZ, "contra.rom"), "rb").read()

FASE, TRAMO = 0xE020, 0xE022
# 0xE006 = 1 en la demostracion: p00:4F82 lee entonces la palanca de su
# grabacion (p00:4FF8-5014) y no del mando; la fase solo se pone en una
# partida de verdad
DEMO = 0xE006
CARGA_FASE = 0x4277                  # p00:4277, el bucle de cada fase
CONSTRUYE = 0xBB3C                   # p03:BB3C
BANCO_DE_FASE = 0xBAE4               # p03:BAE4, el banco de fase (13, 14 o 15)
# p00:4496-44A2: la fase sube de uno en uno, se salta la 8 y la 20 es el final
FASES = [f for f in range(20) if f != 8]


def banco(b):
    return ROM[b * 0x2000:(b + 1) * 0x2000]


def lista(f):
    """(banco, puntero, [pantallas]) de la fase f."""
    b = ROM[3 * 0x2000 + BANCO_DE_FASE - 0xA000 + f]
    k = banco(b)
    p = k[2 * f] | k[2 * f + 1] << 8
    out = []
    i = p - 0x6000
    while True:
        x = k[i]
        if x == 0 and out:
            break
        out.append(x)
        i += 1
    return b, p, out


def numero(f):
    """El numero de fase que se ve en el marcador (STAGE/nn)."""
    return f + 1 if f < 8 else f


PULSA = 650                          # el cuadro en que se pulsa espacio


def partida_en(f, cuadros=1000):
    """El juego arrancado, con la fase f cargada y en marcha."""
    m = Partida(ROM)
    m.arranca_cartucho(0x402E)
    puesto = [False]
    paso = m.paso

    def paso_con_fase():
        if m.pc == CARGA_FASE and not puesto[0] and m.mem[DEMO] == 0:
            m.mem[FASE] = f
            puesto[0] = True
        paso()
    m.paso = paso_con_fase

    def cada(m):
        # espacio (SNSMAT, fila 8, bit 0) con el titulo en pantalla; sin el, a
        # los ~760 cuadros arranca sola la demostracion (0xE006 = 1)
        m.teclas = {8: 0xFE} if PULSA <= m.cuadro < PULSA + 6 else {}
    m.cuadros(cuadros, cada=cada)
    m.paso = paso
    return m


def en_marcha(f, cuadros=1400, alto=176):
    """La pantalla de la fase f como queda jugando (sin sprites): en las
    paredes del jefe de la base, los nucleos y torretas los pinta encima la
    rutina del jefe, no p03:BB3C."""
    m = partida_en(f, cuadros)
    return m.foto(sprites=False).crop((0, 0, 256, alto))


def pantallas(f, alto=176):
    """Las pantallas de la fase f como imagenes (PIL), en el orden de su lista."""
    m = partida_en(f)
    m.apunta = False
    _, _, ls = lista(f)
    out = []
    for i in range(len(ls)):
        m.mem[TRAMO] = i
        m.llama(CONSTRUYE)
        out.append(m.foto(sprites=False).crop((0, 0, 256, alto)))
    return out


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "lista":
        for f in FASES:
            b, p, ls = lista(f)
            print("fase %2d (STAGE %02d) banco %d lista %04X: %s" % (
                f, numero(f), b, p, " ".join("%02X" % x for x in ls)))
    elif argv[1] == "pinta":
        f, dst = int(argv[2]), argv[3]
        os.makedirs(dst, exist_ok=True)
        for i, im in enumerate(pantallas(f)):
            im.save(os.path.join(dst, "fase%02d_%02d.png" % (f, i)))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
