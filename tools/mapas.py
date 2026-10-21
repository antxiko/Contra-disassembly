#!/usr/bin/env python3
"""Los mapas de las 19 fases, montados con las pantallas que pinta el cartucho
(tools/fases.py) y con la orientacion que dice el codigo.

- Hacia donde va cada fase (p03, las llamadas a p03:B58B, que suma B al tramo):
  p03:B09E suma 1 al salir por la derecha en las fases de la lista p03:B18B
  (0, 6, 7, 8, 9 y 19); p03:B0E9 resta 1 al salir por la izquierda en la 13 y
  la 17; p03:B6CC suma 1 al subir en la 3 y la 18; p03:BACA resta 1 al bajar
  en las de la lista p03:BAB9 (3, 10, 16 y 18). El tramo con el que se empieza
  es el de p00:450E (7 en la 10 y la 13, 9 en la 16, 6 en la 17).
  Asi que en las horizontales el tramo crece hacia la derecha y en las
  verticales hacia arriba.
- Las bases en 3D (p00:532C: 1, 4, 11 y 14) son salas sueltas: de cada una se
  sale por la izquierda (p03:B14A, el jugador con x < 0x60) o por la derecha
  (p03:B191, x >= 0x90) a la sala que dice su tabla (FF: no hay puerta). Las
  tablas, [izquierda] y [derecha] por sala, estan en TABLAS_3D.
- Las paredes del jefe de la base (2, 5, 12 y 15) son una sola pantalla.

Uso: mapas.py <dir>        escribe fase_NN.png (y laberinto_NN.png en las 3D)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import fases   # noqa: E402

ROM = fases.ROM
ALTO = 176                      # las 22 filas de juego; debajo va el marcador
HORIZONTALES = (0, 6, 7, 9, 13, 17, 19)
VERTICALES = (3, 10, 16, 18)
TRES_D = (1, 4, 11, 14)
PAREDES = (2, 5, 12, 15)
# (tabla izquierda, tabla derecha, numero de salas): p03:B14A y p03:B191
TABLAS_3D = {1: (0xB45D, 0xB462, 5), 4: (0xB467, 0xB46E, 7),
             11: (0xB475, 0xB47F, 10), 14: (0xB489, 0xB497, 14)}


def p03(a, n):
    o = 3 * 0x2000 + a - 0xA000
    return list(ROM[o:o + n])


def salidas(f):
    """{sala: (izquierda, derecha)} de la base f (None si no hay puerta)."""
    iz, de, n = TABLAS_3D[f]
    a, b = p03(iz, n), p03(de, n)
    return {s: (None if a[s] == 0xFF else a[s], None if b[s] == 0xFF else b[s])
            for s in range(n)}


def recorrido(f):
    """Las salas a las que se llega desde la 0, por niveles (anchura)."""
    sal = salidas(f)
    nivel = {0: 0}
    cola = [0]
    while cola:
        s = cola.pop(0)
        for t in sal.get(s, (None, None)):
            if t is not None and t not in nivel:
                nivel[t] = nivel[s] + 1
                cola.append(t)
    return nivel


def monta(f, ims):
    from PIL import Image
    n = len(ims)
    if f in VERTICALES:
        im = Image.new("RGB", (256, ALTO * n))
        for i, t in enumerate(ims):
            im.paste(t, (0, ALTO * (n - 1 - i)))
        return im
    im = Image.new("RGB", (256 * n, ALTO))
    for i, t in enumerate(ims):
        im.paste(t, (256 * i, 0))
    return im


def laberinto(f, ims):
    """Las puertas de la base, una fila por sala: en medio la sala, a su
    izquierda la sala a la que lleva su puerta izquierda y a su derecha la de
    la puerta derecha (una cruz si no hay puerta). Las filas van en el orden
    en que se llega desde la entrada (la sala 0); al final, en gris, las salas
    a las que no lleva ninguna puerta."""
    from PIL import Image, ImageDraw
    sal = salidas(f)
    niv = recorrido(f)
    orden = sorted(niv, key=lambda s: (niv[s], s)) +         [s for s in range(len(ims)) if s not in niv]
    tw, th = 128, 88            # la sala
    pw, ph = 96, 66             # la sala de destino
    flecha = 56
    margen = 12
    ancho = margen + pw + flecha + tw + flecha + pw + margen
    fila = th + 2 * margen
    im = Image.new("RGB", (ancho, fila * len(orden)), (24, 24, 32))
    dib = ImageDraw.Draw(im)

    def numero(x, y, n, col):
        dib.rectangle((x, y, x + 22, y + 12), fill=(0, 0, 0))
        dib.text((x + 3, y + 1), "%d" % n, fill=col)

    def cruz(x, y):
        dib.rectangle((x, y, x + pw, y + ph), outline=(90, 90, 90))
        dib.line((x + 30, y + 15, x + pw - 30, y + ph - 15), fill=(160, 60, 60), width=4)
        dib.line((x + pw - 30, y + 15, x + 30, y + ph - 15), fill=(160, 60, 60), width=4)

    for k, s in enumerate(orden):
        y = k * fila + margen
        gris = s not in niv
        xs = margen + pw + flecha
        sala = ims[s].resize((tw, th))
        if gris:
            sala = Image.blend(sala, Image.new("RGB", sala.size, (24, 24, 32)), 0.6)
        im.paste(sala, (xs, y))
        dib.rectangle((xs - 1, y - 1, xs + tw, y + th), outline=(255, 255, 255) if not gris else (90, 90, 90))
        numero(xs + 2, y + 2, s, (255, 255, 255) if not gris else (150, 150, 150))
        iz, de = sal.get(s, (None, None))
        yc = y + th // 2
        for t_, xd, sentido, col in ((iz, margen, -1, (90, 160, 255)),
                                     (de, xs + tw + flecha, 1, (255, 160, 60))):
            yd = y + (th - ph) // 2
            # la flecha, del borde de la sala hacia fuera
            x0 = xs if sentido < 0 else xs + tw
            x1 = x0 + sentido * (flecha - 8)
            if t_ is None:
                cruz(xd, yd)
                continue
            dib.line((x0, yc, x1, yc), fill=col, width=4)
            dib.polygon([(x1 + sentido * 8, yc), (x1, yc - 7), (x1, yc + 7)], fill=col)
            im.paste(ims[t_].resize((pw, ph)), (xd, yd))
            dib.rectangle((xd - 1, yd - 1, xd + pw, yd + ph), outline=col)
            numero(xd + 2, yd + 2, t_, col)
    return im


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    dst = argv[1]
    os.makedirs(dst, exist_ok=True)
    que = [int(x) for x in argv[2:]] or fases.FASES
    for f in que:
        ims = fases.pantallas(f, ALTO)
        monta(f, ims).save(os.path.join(dst, "fase_%02d.png" % f))
        if f in TRES_D:
            laberinto(f, ims).save(os.path.join(dst, "laberinto_%02d.png" % f))
        print("fase %2d: %d pantallas" % (f, len(ims)), flush=True)


if __name__ == "__main__":
    main(sys.argv)
