#!/usr/bin/env python3
"""Los textos de Contra, sacados de la ROM y dibujados con su propia letra.

El rotulador es p00:48D3: pone 0xD8 en 0xE01F y pinta cada byte de la cadena
(DE) con p00:486E hasta un 0xFF. El byte es el numero de dibujo en la hoja de
letras, que esta en la pagina 0 de la VRAM a partir de la linea 0xD8: 32
dibujos de 8 x 8 por fila. Leida esa hoja (tools/ejecuta.py, con el titulo en
pantalla), las letras son: 0x00-0x09 las cifras, 0x0A (c), 0x0B una flecha,
0x10 el espacio, 0x11-0x2A la A-Z, y 0x2B / . - " ! ? ' hasta el 0x31.

Las cadenas:
  - p00:4508-4651: el marcador (STAGE, LIFE, STAGE/, REST/, SCORE/).
  - p00:502B-5050: GAME OVER, (c) KONAMI 1989, PUSH SPACE KEY.
  - p00:53AF-54C7: las armas, PAUSE y los mensajes de grabar y cargar.
  - p12:9622-974B: el texto del final (la tabla p12:9600 apunta a 17 de sus lineas).
  - p12:9774-98C3: los nombres de las 20 fases (tabla p12:974C, 20 punteros).

Uso: textos.py lista            las cadenas con su direccion
     textos.py dibuja <dir>     un PNG por grupo con la letra del juego
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from paginas import ORG                 # noqa: E402

RAIZ = os.path.dirname(AQUI)
ROM = open(os.path.join(RAIZ, "contra.rom"), "rb").read()

LETRAS = {0x0A: "©", 0x0B: "→", 0x10: " ", 0x2B: "/", 0x2C: ".", 0x2D: "-",
          0x2E: '"', 0x2F: "!", 0x30: "?", 0x31: "'"}
for _i in range(10):
    LETRAS[_i] = chr(48 + _i)
for _i in range(26):
    LETRAS[0x11 + _i] = chr(65 + _i)

FILA_LETRAS = 0xD8


def lee(b, a):
    """La cadena del banco b en la direccion a, hasta el 0xFF: (bytes, fin)."""
    o = b * 0x2000 + a - ORG[b]
    out = []
    while ROM[o] != 0xFF:
        out.append(ROM[o])
        o += 1
    return bytes(out), ORG[b] + (o - b * 0x2000) + 1


def texto(bs):
    return "".join(LETRAS.get(x, "[%02X]" % x) for x in bs)


def seguidas(b, ini, fin):
    """Las cadenas pegadas unas a otras de [ini, fin)."""
    out = []
    a = ini
    while a < fin:
        bs, sig = lee(b, a)
        out.append((b, a, bs))
        a = sig
    return out


def por_tabla(b, tabla, n):
    """Las n cadenas cuyos punteros estan en la tabla."""
    o = b * 0x2000 + tabla - ORG[b]
    out = []
    for k in range(n):
        p = ROM[o + 2 * k] | ROM[o + 2 * k + 1] << 8
        out.append((b, p, lee(b, p)[0]))
    return out


def grupos():
    return [
        ("marcador", seguidas(0, 0x4632, 0x4652) + [(0, 0x4508, lee(0, 0x4508)[0])]),
        ("titulo", seguidas(0, 0x502B, 0x5052)),
        ("armas", seguidas(0, 0x53AF, 0x53EB)),
        ("grabar", seguidas(0, 0x53EB, 0x54CB)),
        ("final", seguidas(12, 0x9622, 0x974C)),
        ("fases", por_tabla(12, 0x974C, 20)),
    ]


def hoja_de_letras():
    """La VRAM con la hoja de letras cargada: el titulo en pantalla."""
    from ejecuta import Partida
    m = Partida(ROM)
    m.arranca_cartucho(0x402E)
    m.apunta = False
    m.cuadros(600)
    return m.vdp


def dibuja(vdp, cadenas, escala=2):
    from PIL import Image
    ancho = max(len(bs) for _, _, bs in cadenas) * 8 + 16
    im = Image.new("RGB", (ancho, len(cadenas) * 12 + 8), vdp.rgb(0))
    px = im.load()
    for k, (_, _, bs) in enumerate(cadenas):
        for i, c in enumerate(bs):
            sx, sy = (c & 31) * 8, FILA_LETRAS + (c >> 5) * 8
            for y in range(8):
                for x in range(8):
                    px[8 + i * 8 + x, 4 + k * 12 + y] = vdp.rgb(vdp.punto(sx + x, sy + y))
    return im.resize((im.width * escala, im.height * escala), Image.NEAREST)


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "lista":
        for nom, cs in grupos():
            print("== %s" % nom)
            for b, a, bs in cs:
                print("  p%02d:%04X  %s" % (b, a, texto(bs)))
    elif argv[1] == "dibuja":
        dst = argv[2]
        os.makedirs(dst, exist_ok=True)
        v = hoja_de_letras()
        for nom, cs in grupos():
            dibuja(v, cs).save(os.path.join(dst, "textos_%s.png" % nom))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
