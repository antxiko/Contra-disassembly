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
HORIZONTALES = (0, 6, 7, 8, 9, 13, 17, 19)    # la 8 no se juega (p00:449A)
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


TEXTOS_RUTA = {
    "es": dict(izq="puerta izquierda", der="puerta derecha", sala="sala %d",
               entrada="la entrada", nucleo="el n\u00facleo",
               otra="la otra puerta (%s): a la sala %d", vuelta="la otra puerta (%s): vuelve a la %d",
               sin="la otra puerta (%s): no hay", izq_c="izquierda", der_c="derecha"),
    "en": dict(izq="left door", der="right door", sala="room %d",
               entrada="the entrance", nucleo="the core",
               otra="the other door (%s): to room %d", vuelta="the other door (%s): back to %d",
               sin="the other door (%s): none", izq_c="left", der_c="right"),
}


def camino(f):
    """El camino mas corto de la sala 0 al nucleo: [(sala, puerta que se toma
    (0 izquierda, 1 derecha) o None en el nucleo)]."""
    sal = salidas(f)
    nucleo = max(recorrido(f))
    de = {0: None}
    cola = [0]
    while cola:
        s = cola.pop(0)
        for lado, t_ in enumerate(sal.get(s, (None, None))):
            if t_ is not None and t_ not in de:
                de[t_] = (s, lado)
                cola.append(t_)
    out, s = [(nucleo, None)], nucleo
    while de[s]:
        a, lado = de[s]
        out.insert(0, (a, lado))
        s = a
    return out


def ruta(f, ims, idioma):
    """La ruta de la entrada al nucleo, de arriba abajo: cada sala con su
    pantalla; entre una y otra, la puerta que hay que tomar (azul la izquierda,
    naranja la derecha); y al lado, adonde lleva la otra puerta de esa sala."""
    from PIL import Image, ImageDraw, ImageFont
    T = TEXTOS_RUTA[idioma]
    sal = salidas(f)
    pasos = camino(f)
    try:
        fuente = ImageFont.truetype("arial.ttf", 22)
        grande = ImageFont.truetype("arialbd.ttf", 24)
    except OSError:
        fuente = grande = ImageFont.load_default()
    tw, th = 240, 165
    hueco = 110
    W, x0 = 760, 30
    H = 30 + len(pasos) * th + (len(pasos) - 1) * hueco + 30
    im = Image.new("RGB", (W, H), (24, 24, 32))
    d = ImageDraw.Draw(im)
    AZUL, NARANJA = (90, 160, 255), (255, 160, 60)
    y = 30
    for k, (s, lado) in enumerate(pasos):
        im.paste(ims[s].resize((tw, th)), (x0, y))
        nucleo = lado is None
        d.rectangle((x0 - 2, y - 2, x0 + tw + 1, y + th + 1),
                    outline=(230, 60, 60) if nucleo else (255, 255, 255), width=3)
        tx = x0 + tw + 30
        titulo = T["sala"] % s
        if k == 0:
            titulo += " \u2014 " + T["entrada"]
        if nucleo:
            titulo += " \u2014 " + T["nucleo"]
        d.text((tx, y + 10), titulo, font=grande, fill=(255, 255, 255))
        if not nucleo:
            otro = 1 - lado
            nom = T["der_c"] if otro else T["izq_c"]
            dest = sal.get(s, (None, None))[otro]
            ant = pasos[k - 1][0] if k else None
            if dest is None:
                txt = T["sin"] % nom
            elif dest == ant:
                txt = T["vuelta"] % (nom, dest)
            else:
                txt = T["otra"] % (nom, dest)
            d.text((tx, y + 50), txt, font=fuente, fill=(190, 190, 190))
            # la flecha hasta la sala siguiente, con la puerta que se toma
            col = NARANJA if lado else AZUL
            cx = x0 + tw // 2
            y1, y2 = y + th + 8, y + th + hueco - 8
            d.line((cx, y1, cx, y2 - 14), fill=col, width=6)
            d.polygon([(cx, y2), (cx - 14, y2 - 18), (cx + 14, y2 - 18)], fill=col)
            d.text((cx + 26, (y1 + y2) // 2 - 14), T["der"] if lado else T["izq"],
                   font=grande, fill=col)
        y += th + hueco
    return im


def plano(f, ims):
    """El plano de la base: arriba la entrada (sala 0) y, fila a fila, las salas a
    las que se llega con una puerta mas; abajo, el nucleo. Cada sala con su
    pantalla y su numero. De cada sala salen sus puertas: la IZQUIERDA (azul)
    por su lado izquierdo y la DERECHA (naranja) por el derecho, con una flecha
    hasta la sala a la que lleva. Las salas a las que no lleva ninguna puerta no
    se pintan."""
    from PIL import Image, ImageDraw
    sal = salidas(f)
    niv = recorrido(f)
    nucleo = max(niv)
    filas = {}
    for s, k in niv.items():
        filas.setdefault(k, []).append(s)
    # cada fila, en el orden que menos cuesta (se prueban todos): una puerta
    # que lleva a una sala de su fila pero al lado contrario cuesta mucho; luego,
    # lo lejos que queda cada sala de las de arriba que llevan a ella
    import itertools
    pos = {0: 0.0}
    for k in sorted(filas):
        if not k:
            continue
        mejor = None
        for orden in itertools.permutations(sorted(filas[k])):
            p_ = {s: j - (len(orden) - 1) / 2.0 for j, s in enumerate(orden)}
            coste = 0.0
            for s in orden:
                for lado, t_ in enumerate(sal.get(s, (None, None))):
                    if t_ in p_ and t_ != s and (p_[t_] < p_[s]) != (lado == 0):
                        coste += 100
                for a, (i, d) in sal.items():
                    if a in pos and s in (i, d):
                        coste += abs(pos[a] - p_[s])
            if mejor is None or coste < mejor[0]:
                mejor = (coste, orden, p_)
        filas[k] = list(mejor[1])
        pos.update(mejor[2])
    tw, th = 160, 110              # la sala
    hx, vy = 120, 120              # hueco entre salas y entre filas
    ancho_fila = max(len(v) for v in filas.values())
    W = ancho_fila * tw + (ancho_fila + 1) * hx
    H = len(filas) * th + (len(filas) + 1) * vy
    im = Image.new("RGB", (W, H), (24, 24, 32))
    d = ImageDraw.Draw(im)
    caja = {}
    for k, ss in filas.items():
        y = vy + k * (th + vy)
        for s in ss:
            x = int(W / 2 + pos[s] * (tw + hx) - tw / 2)
            caja[s] = (x, y)
    AZUL, NARANJA = (90, 160, 255), (255, 160, 60)

    def curva(p0, p1, p2, p3, n=40):
        out = []
        for i in range(n + 1):
            u = i / n
            a, b, c, e = (1 - u) ** 3, 3 * u * (1 - u) ** 2, 3 * u * u * (1 - u), u ** 3
            out.append((a * p0[0] + b * p1[0] + c * p2[0] + e * p3[0],
                        a * p0[1] + b * p1[1] + c * p2[1] + e * p3[1]))
        return out

    def flecha(pts, col):
        d.line(pts, fill=col, width=4)
        (x0, y0), (x1, y1) = pts[-3], pts[-1]
        import math
        ang = math.atan2(y1 - y0, x1 - x0)
        for da in (2.6, -2.6):
            pass
        pa = (x1 - 18 * math.cos(ang - 0.45), y1 - 18 * math.sin(ang - 0.45))
        pb = (x1 - 18 * math.cos(ang + 0.45), y1 - 18 * math.sin(ang + 0.45))
        d.polygon([(x1, y1), pa, pb], fill=col)

    # las puertas, debajo de las salas
    for s, (x, y) in caja.items():
        for lado, t_, col in ((0, sal.get(s, (None, None))[0], AZUL),
                              (1, sal.get(s, (None, None))[1], NARANJA)):
            if t_ is None or t_ not in caja:
                continue
            sx = x if lado == 0 else x + tw
            sy = y + th // 2
            tx, ty = caja[t_]
            out = -1 if lado == 0 else 1
            if ty > y:              # hacia abajo: entra por arriba
                dst = (tx + tw // 2 + (-18 if lado == 0 else 18), ty - 2)
                pts = curva((sx, sy), (sx + out * 90, sy), (dst[0], dst[1] - 90), dst)
            elif ty == y and (tx < x) == (lado == 0):
                # en la misma fila y hacia el lado de la puerta: recta de lado a lado
                dy = 14 if lado == 0 else -14
                dst = (tx + tw + 3 if lado == 0 else tx - 3, sy + dy)
                pts = [(sx, sy + dy), ((sx + dst[0]) / 2, sy + dy), dst]
            else:
                # hacia el otro lado (o hacia arriba): por debajo, entra por abajo
                dst = (tx + tw // 2 + (-18 if lado == 0 else 18), ty + th + 3)
                pts = curva((sx, sy), (sx + out * 90, sy + 150),
                            (dst[0], dst[1] + 110), dst)
            flecha(pts, col)
    for s, (x, y) in caja.items():
        im.paste(ims[s].resize((tw, th)), (x, y))
        borde = (230, 60, 60) if s == nucleo else (255, 255, 255)
        d.rectangle((x - 2, y - 2, x + tw + 1, y + th + 1), outline=borde, width=3)
        d.rectangle((x, y, x + 26, y + 16), fill=(0, 0, 0))
        d.text((x + 4, y + 3), "%d" % s, fill=borde)
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
            for idioma in ("es", "en"):
                ruta(f, ims, idioma).save(os.path.join(dst, "ruta_%02d_%s.png" % (f, idioma)))
        print("fase %2d: %d pantallas" % (f, len(ims)), flush=True)


if __name__ == "__main__":
    main(sys.argv)
