#!/usr/bin/env python3
"""Los sprites que se ven en cada fase, como los pinta el V9938, sacados de la
partida ejecutada (tools/anima.py).

En Contra cada objeto es un sprite de 16 x 16 del modo 2: los 32 registros de
16 bytes de 0xE300 (y, x y numero de dibujo en sus tres primeros bytes) los
copia p00:4BBB a 0xE100 y de ahi p00:4BA4 a la tabla de atributos de la VRAM
(0x7600); los colores van por linea en la tabla de 0x7400. Dos sprites
seguidos con el bit CC en el segundo se pintan juntos, con sus colores
sumados (OR): asi tiene el jugador mas de un color por linea.

Aqui, cada cuadro de la partida, se recorta cada sprite (o cada grupo CC) de
la imagen que pinta tools/msx2run.py y se guarda una vez por dibujo distinto.
Los registros 0 a 3 (0xE300-0xE33F) son el jugador: dos parejas CC de 16 x 16,
una encima de otra (medido: y 144 y 160 con la misma x); el resto del
codigo lleva su estado con IX = 0xE320. Van aparte.

Los tipos son de una sola tabla para todo el cartucho (p02:8000), asi que
`todas` junta en una hoja lo que se ve en todas las fases y todos sus tramos.

Uso: sprites.py fase <fase> <salida.png> [segundos] [tramo]
     sprites.py todas <salida.png> [segundos por tramo]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import anima       # noqa: E402
import fases       # noqa: E402

JUGADOR = (0, 1, 2, 3)


def grupos(v):
    """[(sprites del grupo, y, x)] de la tabla de atributos de ahora."""
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    cols = attr - 0x200
    out = []
    for n in range(32):
        y = v.vram[attr + 4 * n]
        if y == 216:
            break
        cc = v.vram[cols + 16 * n] & 0x40
        if cc and out:
            out[-1][0].append(n)
        elif not cc:
            out.append(([n], y, v.vram[attr + 4 * n + 1]))
    return out


def recorta(m, ns):
    """El dibujo del grupo ns (PIL, 16 x 16 con transparencia) pintado solo."""
    from PIL import Image
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    cols = attr - 0x200
    pat = (v.r[6] & 0x3F) << 11
    im = Image.new("RGBA", (16, 16), (0, 0, 0, 0))
    px = im.load()
    y0 = v.vram[attr + 4 * ns[0]]
    x0 = v.vram[attr + 4 * ns[0] + 1]
    puntos = {}
    for n in ns:
        y, x, d = v.vram[attr + 4 * n:attr + 4 * n + 3]
        d &= 0xFC
        for fila in range(16):
            c = v.vram[cols + 16 * n + fila]
            for col in range(16):
                b = v.vram[pat + 8 * d + (col // 8) * 16 + fila]
                if (b >> (7 - col % 8)) & 1:
                    k = (col + x - x0, fila + y - y0)
                    if 0 <= k[0] < 16 and 0 <= k[1] < 16:
                        puntos[k] = puntos.get(k, 0) | (c & 15)
    for (xx, yy), c in puntos.items():
        if c:
            px[xx, yy] = v.rgb(c) + (255,)
    return im


CLAVE = (255, 0, 255)


def figuras(m):
    """[(imagen RGBA, x, y, ancho, alto)] de cada figura del cuadro: los
    sprites pintados por el V9938 (tools/msx2run.py) sobre un fondo clave, y
    cada mancha de puntos pegados (a dos puntos, para que la capsula del arma
    salga entera) es una figura."""
    from PIL import Image
    im = Image.new("RGB", (256, 212), CLAVE)
    m.vdp.sprites(im)
    px = im.load()
    marca = [[px[x, y] != CLAVE for x in range(256)] for y in range(212)]
    visto = [[False] * 256 for _ in range(212)]
    out = []
    for y in range(212):
        for x in range(256):
            if not marca[y][x] or visto[y][x]:
                continue
            pila = [(x, y)]
            visto[y][x] = True
            x0 = x1 = x
            y0 = y1 = y
            while pila:
                a, b = pila.pop()
                x0, x1, y0, y1 = min(x0, a), max(x1, a), min(y0, b), max(y1, b)
                for dx in (-2, -1, 0, 1, 2):
                    for dy in (-2, -1, 0, 1, 2):
                        c, d = a + dx, b + dy
                        if 0 <= c < 256 and 0 <= d < 212 and marca[d][c] and not visto[d][c]:
                            visto[d][c] = True
                            pila.append((c, d))
            rec = im.crop((x0, y0, x1 + 1, y1 + 1)).convert("RGBA")
            q = rec.load()
            for yy in range(rec.height):
                for xx in range(rec.width):
                    if q[xx, yy][:3] == CLAVE:
                        q[xx, yy] = (0, 0, 0, 0)
            out.append((rec, x0, y0, x1 - x0 + 1, y1 - y0 + 1))
    return out


def del_jugador(m):
    """El rectangulo del jugador: sus sprites (registros 2 y 3)."""
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    rs = []
    for n in JUGADOR:
        y, x = v.vram[attr + 4 * n], v.vram[attr + 4 * n + 1]
        if y != 216:
            rs.append(((x, (y + 1) & 0xFF)))
    return rs


# Tipos que son disparos o explosiones (los crean asi p02 y p03): no son
# enemigos y no van a la hoja. 0x0B la explosion (p03:A0FF), 0x1C/0x1D las de
# p02:9085-90B1, y las balas 0x03, 0x04, 0x09, 0x0A, 0x0C, 0x0D, 0x11, 0x1F,
# 0x22, 0x23, 0x25 y 0x29 (p02:8323, p02:85A9, p02:8680, p02:8DC4, p02:9019,
# p02:9B57, p02:9EB0, p03:A141, p03:A67B, p03:A731...); 0x1E lo lanza p02:8C18
# y 0x20 es la explosion de p02:81A0, p03:A339 y p03:A499.
NO_ENEMIGOS = {0x03, 0x04, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x11, 0x1C, 0x1D, 0x1E,
               0x1F, 0x20, 0x22, 0x23, 0x25, 0x29}
POR_TIPO = 4
# Tipos que son una parte de otro objeto y no lo nombran: 0x2D el cuerpo de
# los soldados (va encima de las piernas, que llevan el tipo del soldado) y
# 0x2B el destello del disparo.
PARTES = {0x2B, 0x2D}


def objetos(m):
    """[(tipos, [registros])] de los objetos en pantalla. Un objeto son los
    registros de 0xE340-0xE4FF que se tocan en la pantalla: la misma x (a 4
    puntos) y una y a 16 (la parte de abajo, p02:9ABF), o a 16 en x y la misma
    y (los de cuatro, p03:A01A). Cada parte puede llevar su tipo (el soldado
    lleva uno en las piernas y otro en el cuerpo)."""
    pos = {}
    for k in range(4, 32):
        a = 0xE300 + 16 * k
        if m.mem[a] in (0xEC, 0xD8, 0xE8) or m.mem[a + 4] in NO_ENEMIGOS:
            continue
        pos[k] = (m.mem[a], m.mem[a + 1])

    def cerca(p, q):
        dy = abs(((p[0] - q[0] + 128) & 0xFF) - 128)
        dx = abs(((p[1] - q[1] + 128) & 0xFF) - 128)
        return (dx <= 4 and dy <= 18) or (dy <= 4 and dx <= 18)
    grupos = []
    for k in sorted(pos):
        junto = [g for g in grupos if any(cerca(pos[k], pos[n]) for n in g)]
        nuevo = [k] + [n for g in junto for n in g]
        grupos = [g for g in grupos if g not in junto] + [sorted(nuevo)]
    out = []
    for g in grupos:
        tipos = tuple(sorted({m.mem[0xE300 + 16 * n + 4] for n in g} - {0} - PARTES))
        if len(tipos) == 1:                 # dos enemigos cruzados no valen
            out.append((tipos, g))
    return out


def pinta(m, ks):
    """Los sprites ks (y sus parejas CC) pintados solos: imagen RGBA recortada."""
    from PIL import Image
    v = m.vdp
    attr = ((v.r[11] & 3) << 15) | ((v.r[5] & 0xFC) << 7)
    cols = attr - 0x200
    pat = (v.r[6] & 0x3F) << 11
    ns = set()
    for k in ks:
        ns.add(k)
        n = k + 1
        while n < 32 and v.vram[cols + 16 * n] & 0x40:   # las de CC que le siguen
            ns.add(n)
            n += 1
    puntos = {}
    for n in sorted(ns):
        y, x, d = v.vram[attr + 4 * n:attr + 4 * n + 3]
        if y in (216, 0xEC, 0xD8):
            continue
        y = (y + 1) & 0xFF
        d &= 0xFC
        for fila in range(16):
            c = v.vram[cols + 16 * n + fila]
            dx = x - 32 if c & 0x80 else x
            for col in range(16):
                b = v.vram[pat + 8 * d + (col // 8) * 16 + fila]
                if (b >> (7 - col % 8)) & 1:
                    k2 = (dx + col, y + fila)
                    puntos[k2] = puntos.get(k2, 0) | (c & 15)
    puntos = {k2: c for k2, c in puntos.items() if c}
    if not puntos:
        return None
    x0 = min(p[0] for p in puntos); y0 = min(p[1] for p in puntos)
    x1 = max(p[0] for p in puntos); y1 = max(p[1] for p in puntos)
    im = Image.new("RGBA", (x1 - x0 + 1, y1 - y0 + 1), (0, 0, 0, 0))
    px = im.load()
    for (xx, yy), c in puntos.items():
        px[xx - x0, yy - y0] = v.rgb(c) + (255,)
    return im


def recoge(f, segundos=25, tramo=None, vistos=None):
    """{tipo: [imagenes distintas]} de los objetos que se ven en la fase."""
    vistos = {} if vistos is None else vistos
    m = anima.partida(f, tramo)
    m.apunta = False
    n = [0]

    def mando(m):
        n[0] += 1
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        m.mem[anima.VIDAS] = 3
        m.mem[anima.ENERGIA] = 0x10
        if m.cuadro < fases.PULSA + 60:
            m.palanca, m.botones = {}, set()
            return
        d = anima.HACIA.get(f, 3)
        m.palanca = {1: d} if d else {}
        m.botones = {1} | ({3} if n[0] % 45 < 8 else set())
        if m.cuadro > fases.PULSA + 120 and n[0] % 2 == 0:
            for tipos, ks in objetos(m):
                if set(tipos) <= NO_ENEMIGOS:
                    continue
                tipo = tipos
                im = pinta(m, ks)
                # un grupo de mas de 48 puntos junta sprites lejanos (el mayor de
                # verdad, cuatro de 16 x 16, son 32 x 32): no es una figura
                if im is None or im.width < 6 or im.height < 6 or im.width > 48 or im.height > 48:
                    continue
                ya = vistos.setdefault(tipo, [])
                if len(ya) < POR_TIPO and all(im.tobytes() != o.tobytes() for o in ya):
                    ya.append(im)
    m.cuadros(fases.PULSA + 120 + segundos * 60, cada=mando)
    return vistos


def hoja(vistos, escala=3, fondo=(40, 40, 48)):
    """Una fila por tipo de objeto, con sus dibujos (como mucho POR_TIPO)."""
    from PIL import Image, ImageDraw
    filas = sorted(vistos.items())
    if not filas:
        return Image.new("RGB", (64, 16), fondo)
    alto = [max(i.height for i in ims) + 4 for _, ims in filas]
    ancho = max(sum(i.width + 4 for i in ims) for _, ims in filas) + 44
    h = Image.new("RGB", (ancho, sum(alto)), fondo)
    d = ImageDraw.Draw(h)
    y = 0
    for (tipo, ims), a in zip(filas, alto):
        d.text((1, y + a // 2 - 4), "+".join("%02X" % x for x in tipo), fill=(150, 150, 150))
        x = 40
        for im in ims:
            h.paste(im, (x, y + (a - im.height) // 2), im)
            x += im.width + 4
        y += a
    return h.resize((h.width * escala, h.height * escala), Image.NEAREST)


def main(argv):
    if len(argv) >= 3 and argv[1] == "todas":
        seg = int(argv[3]) if len(argv) > 3 else 10
        vistos = {}
        for f in fases.FASES:
            for tramo in range(len(fases.lista(f)[2])):
                recoge(f, seg, tramo, vistos)
                print("fase %d tramo %d: %d tipos" % (f, tramo, len(vistos)), flush=True)
                hoja(vistos).save(argv[2])
        return
    if len(argv) < 4 or argv[1] != "fase":
        sys.exit(__doc__)
    f, salida = int(argv[2]), argv[3]
    seg = int(argv[4]) if len(argv) > 4 else 20
    tramo = int(argv[5]) if len(argv) > 5 else None
    v = recoge(f, seg, tramo)
    hoja(v).save(salida)
    print("fase %d: %d tipos de objeto (%s) -> %s" % (
        f, len(v), " ".join("+".join("%02X" % x for x in t) for t in sorted(v)), salida))


if __name__ == "__main__":
    main(sys.argv)
