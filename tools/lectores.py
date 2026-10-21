#!/usr/bin/env python3
"""Los lectores de datos de Contra y sus formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado.

El del sonido es el de King's Valley II (el motor es el mismo codigo, ver
src/p04.notes), con las direcciones de este cartucho: las tablas salen de
las instrucciones que las leen (p04:605B, p04:6973, p04:67A3, p04:64E4-6512).
"""
import re

import bloques as B   # noqa: F401


LARGO_ORDEN = {0xE4: 2, 0xE5: 4, 0xE6: 3, 0xE7: 2, 0xE8: 1, 0xE9: 2, 0xEA: 2,
               0xEB: 3, 0xEC: 1, 0xED: 2, 0xEE: 2, 0xEF: 1, 0xF0: 1, 0xF1: 2,
               0xF2: 2, 0xF3: 1, 0xF4: 1, 0xF5: 1, 0xF6: 1, 0xF7: 2, 0xF8: 2,
               0xF9: 3, 0xFA: 1, 0xFB: 4, 0xFC: 4, 0xFD: 3, 0xFE: 2}
# Y de las 0xD0-0xDF (p04:6AF8, por la cifra baja): 0-5 octava, 8 dos
# cifras de 4 bits, 9 llamada (palabra), A vuelta, B repeticion hacia atras
# [veces][salto], C y E un byte; el resto, sola.
LARGO_D = {0x8: 2, 0x9: 3, 0xB: 3, 0xC: 2, 0xE: 2}


def largo_nota(modo, d, e):
    """Bytes de una nota con el estado del canal; None si el modo no lee."""
    if modo & 1:
        return 1
    if modo & 2:
        return 2 if (d & 3) >= 2 and not (e & 0x60) else 1
    if modo & 0x1C:
        return 1
    return None


def orden(x, q, modo, d, e, e2):
    """(largo, modo, d, e, e2) tras la orden x (0xD0-0xFE) con operando q."""
    if 0xD0 <= x < 0xE0:
        n = x & 0x0F
        if n == 0x0C:
            d |= 0x80                   # p04:6B7E
        elif n == 0x0D:
            d &= 0x7F                   # p04:6B88
        elif n == 0x07:
            d &= 0x9F                   # p04:6B28
        elif n == 0x08:
            d |= 0x60                   # p04:6B31
        elif n == 0x0F or n == 0x06:
            e &= 0x7F                   # p04:6B93
        return LARGO_D.get(n, 1), modo, d, e, e2
    if x <= 0xE3:
        # p04:68E1: IX+0D = orden & 3 (entero) y el byte de detras en IX+13,
        # salvo con 0xE0, que no lo lee
        return (1 if x & 3 == 0 else 2), modo, x & 3, e & ~0x40 & 0xFF, e2
    n = LARGO_ORDEN[x]
    if x == 0xE5:
        d = (d & ~8) | 4
    elif x in (0xE6, 0xE7):
        d |= 4
    elif x == 0xE8:
        d &= 0xF3
    elif x == 0xEE:
        e |= 2
    elif x == 0xEF:
        e &= ~2
    elif x == 0xF0:
        e &= 0xE2
    elif x == 0xF1:
        e |= 0x14
    elif x == 0xF2:
        e |= 0x0C
    elif x == 0xF3:
        e &= ~8
    elif x == 0xF4:
        e |= 0x40
    elif x == 0xF5:
        e |= 0x20
    elif x == 0xF6:
        e &= 0x9F
    elif x == 0xF7:
        e |= 0x80
    elif x == 0xFE:
        viejo, modo = modo, q
        if q == 1 and viejo != 1:
            e = e2                      # p04:6AE8: recupera IX+0E de IX+2A
        elif q != 1 and viejo == 1:
            e2, e = e, 0                # p04:6AD4: lo guarda y lo pone a 0
    return n, modo, d & 0xFF, e & 0xFF, e2 & 0xFF


class Partituras:
    """Recorre canales apuntando cada byte leido (y con que largo)."""

    def __init__(self, v):
        self.v = v
        self.usados = {}           # direccion -> (inicio de la instruccion, largo)
        self.dos = set()           # bytes leidos con dos largos distintos
        self.golpes = set()        # (bits del modo, octava, cifra alta)
        self.ondas = set()
        self.avisos = []
        self.memo = {}

    def apunta(self, a, n):
        for k in range(n):
            if a + k in self.usados and self.usados[a + k] != (a, n):
                self.dos.add(a + k)
            self.usados[a + k] = (a, n)

    def recorre(self, a, estado, vuelta=None, hondo=0):
        """Estados con los que se sale por la orden `vuelta` (0xFA de una
        0xF9, 0xDA de una 0xD9); vacio si acaba en 0xFF."""
        clave = (a, estado, vuelta)
        if clave in self.memo:
            return self.memo[clave]
        self.memo[clave] = set()
        salidas = set()
        pila = [(a, estado)]
        vistos = set()
        v = self.v
        while pila:
            a, (modo, d, e, e2, oct_) = pila.pop()
            while True:
                est = (modo, d, e, e2, oct_)
                if (a, est) in vistos:
                    break
                vistos.add((a, est))
                x = v(a)
                if x == 0xFF:
                    self.apunta(a, 1)
                    break
                if x in (0xFA, 0xDA):
                    self.apunta(a, 1)
                    if x == vuelta:
                        salidas.add(est)
                    else:
                        self.avisos.append("%04X: vuelta 0x%02X fuera de su llamada" % (a, x))
                    break
                if x >= 0xD0:
                    q = v(a + 1)
                    n, modo, d, e, e2 = orden(x, q, modo, d, e, e2)
                    if 0xD0 <= x <= 0xD5:
                        oct_ = x & 0x0F         # p04:6AFF: IX+16 e IX+2C
                    self.apunta(a, n)
                    est = (modo, d, e, e2, oct_)
                    if x == 0xF8:
                        self.ondas.add(q)
                    if x == 0xFD:
                        a = v.w(a + 1)
                        continue
                    if x in (0xF9, 0xD9):
                        tras = (self.recorre(v.w(a + 1), est, 0xFA if x == 0xF9 else 0xDA, hondo + 1)
                                if hondo < 8 else set())
                        for s in tras:
                            pila.append((a + 3, s))
                        break
                    if x in (0xFB, 0xFC):
                        pila.append((v.w(a + 2), est))      # vuelve atras hasta acabar
                    if x == 0xDB:
                        pila.append((a + 2 - v(a + 2), est))   # p04:6B6E: atras desde el byte del salto
                    a += n
                    continue
                n = largo_nota(modo, d, e)
                if n is None:
                    self.avisos.append("%04X: nota con el modo %02X" % (a, modo))
                    break
                if modo & 0x1C and not modo & 3:
                    self.golpes.add((modo & 0x1C, oct_, x >> 4))
                self.apunta(a, n)
                a += n
        self.memo[clave] = salidas
        return salidas


def tramos(conjunto):
    """[(ini, fin)] de un conjunto de direcciones."""
    out = []
    for x in sorted(conjunto):
        if out and out[-1][1] == x and x & 0x1FFF:
            out[-1][1] = x + 1
        else:
            out.append([x, x + 1])
    return [tuple(t) for t in out]


# Las seis tablas de guiones de bateria (p04:64C2): el modo con el bit 2, 3
# o 4, y la octava IX+2C a 1 o a cualquier otra cosa.
TABLAS_GOLPES = {(0x04, 0): 0x740E, (0x04, 1): 0x754F, (0x08, 0): 0x7568,
                 (0x08, 1): 0x7581, (0x10, 0): 0x759A, (0x10, 1): 0x75B3}   # p04:64E4-6512
TABLA_SONIDOS = 0x6E12          # p04:605B: HL = 0x6E12 + 2 x A
TABLA_ONDAS = 0x709E            # p04:6973: DE = 0x709E + 2 x n
TABLA_ORDENES = 0x67B0          # p04:67A3: 0xE0-0xFE


def palabras_hasta_lo_apuntado(v, t):
    """Palabras de la tabla t hasta la primera direccion que apunta una de
    ellas (la tabla va seguida de lo que apunta)."""
    dirs = []
    a = t
    while not dirs or a < min(d for d in dirs if d > t):
        dirs.append(v.w(a))
        a += 2
    return dirs, a


def sonido():
    v = B.Ventana((4, 5, 3))
    lec = "p04:605B"
    cab, fin = palabras_hasta_lo_apuntado(v, TABLA_SONIDOS + 2)
    cab = [None] + cab
    n_son = len(cab) - 1
    B.declara(v, TABLA_SONIDOS + 2, fin, "sonidos", "%d punteros, uno por sonido del 1 al "
              "0x%02X (A en p04:603D, tabla en 0x%04X + 2 x A): su cabecera [canales][prioridad]"
              "[una palabra por canal]. La entrada 0 serian los dos ultimos bytes del codigo de "
              "delante: no hay sonido 0" % (n_son, n_son, TABLA_SONIDOS), lec, F="w8")
    P = Partituras(v)
    de_quien = {}
    for k in range(1, n_son + 1):
        c = cab[k]
        m = v(c)
        canales = [b for b in range(7, -1, -1) if m >> b & 1]
        B.declara(v, c, c + 2 + 2 * len(canales), "cabecera_%02X" % k,
                  "cabecera del sonido 0x%02X: canales 0x%02X, prioridad 0x%02X y %d "
                  "partituras (p04:6068 copia 18 bytes a 0xC1CD)" % (k, m, v(c + 1), len(canales)),
                  lec, F=2 + 2 * len(canales))
        for j, b in enumerate(canales):
            ini = v.w(c + 2 + 2 * j)
            antes = set(P.usados)
            P.recorre(ini, (0, 0, 0, 0, 0))
            for x in set(P.usados) - antes:
                de_quien[x] = k
    # Los guiones de bateria.
    for (bit, octava), t in sorted(TABLAS_GOLPES.items()):
        dirs, fin = palabras_hasta_lo_apuntado(v, t)
        otras = sorted(x for x in TABLAS_GOLPES.values() if t < x < fin)
        if otras:
            fin = otras[0]
            dirs = dirs[:(fin - t) // 2]
        B.declara(v, t, fin, "golpes_%04X" % t, "%d punteros a los guiones de bateria del modo con "
                  "el bit %d y la octava %s (p04:64C2; la cifra alta de la nota elige uno)" % (
                      len(dirs), bit.bit_length() - 1, "1" if octava else "distinta de 1"),
                  "p04:649C", F="w8")
        for n, g in enumerate(dirs):
            antes = set(P.usados)
            P.recorre(g, (0x02, 0, 0, 0, 0))
            for x in set(P.usados) - antes:
                de_quien[x] = "golpe %d de 0x%04X" % (n, t)
    quien = {}
    for x in P.usados:
        quien.setdefault(x, set()).add(de_quien[x])
    for ini, fin in tramos(set(P.usados)):
        ks = sorted(set().union(*(quien[x] for x in range(ini, fin))), key=str)
        s = ", ".join("0x%02X" % x if isinstance(x, int) else x for x in ks[:6])
        nd = len([x for x in range(ini, fin) if x in P.dos])
        B.declara(v, ini, fin, "partitura_%04X" % ini,
                  "partitura (p04:6367: ordenes 0xD0-0xFF y notas) de %s%s%s" % (
                      "los sonidos " if isinstance(ks[0], int) else "", s + (" y otros" if len(ks) > 6 else ""),
                      "; %d bytes los leen dos canales con distinto largo de nota" % nd
                      if nd else ""),
                  "p04:6367", F=16)
    ptr_ondas, fin = palabras_hasta_lo_apuntado(v, TABLA_ONDAS)
    tope = min(TABLAS_GOLPES.values())
    n_buenas = len([o for o in ptr_ondas if o < tope])
    B.declara(v, TABLA_ONDAS, fin, "ondas", "%d punteros a las formas de onda del SCC (orden 0xF8 de "
              "la partitura, p04:6973: 0x%04X + 2 x n); los %d primeros apuntan a las de detras, los "
              "%d ultimos a 0x%04X, la tabla de golpes" % (len(ptr_ondas), TABLA_ONDAS, n_buenas,
                                                         len(ptr_ondas) - n_buenas, tope),
              "p04:697C", F="w8")
    # Las ultimas entradas apuntan a la tabla de golpes que va detras de las
    # ondas: no son ondas (ninguna partitura las pide).
    tope = min(TABLAS_GOLPES.values())
    no_ondas = [n for n, o in enumerate(ptr_ondas) if o >= tope]
    if no_ondas:
        B.AVISOS.append("sonido: las entradas %d-%d de las ondas apuntan a 0x%04X (golpes)%s" % (
            no_ondas[0], no_ondas[-1], tope,
            "; las PIDE una partitura" if set(no_ondas) & P.ondas else ""))
    usadas = {ptr_ondas[n] for n in P.ondas if n < len(ptr_ondas)}
    bytes_ondas = {o + k for o in ptr_ondas if o < tope for k in range(0x20)}
    for ini, fin in tramos(bytes_ondas):
        aqui = sorted({o for o in ptr_ondas if ini <= o < fin})
        sin = [o for o in aqui if o not in usadas]
        B.declara(v, ini, fin, "ondas_%04X" % ini,
                  "%d formas de onda del SCC de 32 muestras con signo, que empiezan en %s%s%s" % (
                      len(aqui), ", ".join("0x%04X" % o for o in aqui),
                      "; se solapan: una onda empieza dentro de otra" if fin - ini < 0x20 * len(aqui) else "",
                      "; ninguna partitura pide %s" % ", ".join("0x%04X" % o for o in sin) if sin else ""),
                  "p04:697C", F=16)
    B.declara(v, TABLA_ORDENES, TABLA_ORDENES + 62, "ordenes", "31 destinos, uno por orden de la "
              "partitura de 0xE0 a 0xFE (p04:67A3: HL = 0x%04X + 2 x (orden & 0x1F); jp (hl) en "
              "p04:67AF); el 0xFF no llega aqui (lo mira antes p04:6368)" % TABLA_ORDENES,
              "p04:67AF", F="w8")
    B.declara(v, 0x6405, 0x6412, "notas_psg", "13 bytes: el divisor de cada nota (de do a do) que "
              "p04:63B9 lee con la nota < 12 (p04:63AE) y dobla por la octava (p04:63D5); el "
              "13 no lo lee nadie", "p04:63B9", F=13)
    B.declara(v, 0x6124, 0x6152, "canal_nuevo", "46 bytes con los que p04:611B llena un canal "
              "desde IX+05 al empezar un sonido", "p04:6121", F=16)
    for c in P.avisos:
        B.AVISOS.append("sonido: " + c)
    print("sonido: %d sonidos, %d bytes de partitura, golpes %d, ondas %s, %d leidos de dos maneras"
          % (n_son, len(P.usados), len(P.golpes), sorted(P.ondas), len(P.dos)))
    return P



# ------------------------------------------------------------ las pantallas
#
# Lo que lee p03:BB3C (la pantalla del tramo) en el banco de fase de 0x6000
# (13, 14 o 15, la tabla p03:BAE4):
#   0x6000 + 2 x fase   el puntero a la lista de pantallas de la fase
#   la lista            un numero de pantalla por tramo, hasta un 0 que no
#                       sea el primero (p03:B5B5)
#   0x6100 + 2 x Z      el puntero a las ordenes de la pantalla Z
#   las ordenes         hasta 0xFF; 0xFE + puntero: ordenes de otro sitio
#                       (hasta su 0xFF); con el bit 7, una pieza en forma
#                       corta (fila | 0x80, columna, puntero: p03:BBCC); sin
#                       el, en forma larga (fila, columna, veces en
#                       vertical, veces en horizontal, puntero: p03:BC14)
#   la pieza            el modo y la fila de la hoja, su alto, su ancho y
#                       alto x ancho dibujos (p03:BBEE, p03:BC2F)
#   los objetos         tras el 0xFF de las ordenes (p03:BD7B): tipo, IY+3,
#                       fila y columna, hasta 0xFF
#   los sprites         tras el 0xFF de los objetos (p03:BDD6): tipo,
#                       cuantos, y, x, hasta 0xFF

BANCO_DE_FASE = 0xBAE4          # p03:BAE4


def banco_de_fase(f):
    v = B.Ventana((1, 2, 3))
    return v(BANCO_DE_FASE + f)


def pantallas():
    from collections import defaultdict
    hechas = defaultdict(set)
    piezas = defaultdict(dict)            # banco -> {puntero: (ini, fin, quien)}
    for b in (13, 14, 15):
        v = B.Ventana((b, 2, 3))
        fs = [f for f in range(20) if banco_de_fase(f) == b]
        B.declara(v, 0x6000, 0x6028, "listas_de_fase",
                  "20 punteros, uno por fase, a la lista de pantallas de cada fase (p03:BB82: "
                  "0x6000 + 2 x 0xE020); en este banco valen los de las fases %s (p03:BAE4)"
                  % ", ".join(str(f) for f in fs), "p03:BB8B", F="w8")
        zs = set()
        for f in fs:
            p = v.w(0x6000 + 2 * f)
            a, ls = p, []
            while True:
                x = v(a)
                if x == 0 and ls:
                    break
                ls.append(x)
                a += 1
            zs |= set(ls)
            B.declara(v, p, a + 1, "lista_fase_%02d" % f,
                      "la lista de pantallas de la fase %d: %s y el 0 que la acaba (p03:BB8F lee "
                      "la del tramo; p03:B5B5 mira el final)" % (f, " ".join("%02X" % x for x in ls)),
                      "p03:BB92", F=len(ls) + 1)
        # todas las entradas de la tabla con un puntero dentro del banco, desde
        # la primera que usa una fase hasta el primer cero: tambien las que no
        # estan en ninguna lista (no se juegan)
        z0 = min(zs)
        zmax = z0
        while v.w(0x6100 + 2 * (zmax + 1)) and 0x6000 <= v.w(0x6100 + 2 * (zmax + 1)) < 0x8000:
            zmax += 1
        zmax = max(zmax, max(zs))
        sin = [z for z in range(z0, zmax + 1) if z not in zs]
        B.declara(v, 0x6100 + 2 * z0, 0x6100 + 2 * zmax + 2, "pantallas_%d" % b,
                  "los punteros a las ordenes de las pantallas 0x%02X-0x%02X (p03:BB95: 0x6100 "
                  "+ 2 x pantalla)%s" % (z0, zmax, "; las %s no estan en ninguna lista de fase"
                                         % " ".join("%02X" % z for z in sin) if sin else ""),
                  "p03:BB9F", F="w8")
        # detras de la tabla, las entradas a 0: pantallas que no hay en el banco
        z = zmax + 1
        while 0x6100 + 2 * z < 0x8000 and v.w(0x6100 + 2 * z) == 0:
            z += 1
        if z > zmax + 1:
            B.declara(v, 0x6100 + 2 * zmax + 2, 0x6100 + 2 * z, "pantallas_%d_a_cero" % b,
                      "%d punteros a 0 detras de los de la pantalla 0x%02X: la tabla de p03:BB95 "
                      "sigue, pero en este banco no hay mas pantallas" % (z - zmax - 1, zmax),
                      "p03:BB9F", F="w8")
        # las listas de las fases que se juegan con OTRO banco (p03:BAE4): el
        # puntero de esa fase en este banco lleva a una lista que no se lee
        ajenas = defaultdict(list)
        for f in range(20):
            q = v.w(0x6000 + 2 * f)
            if f not in fs and 0x6028 <= q < 0x8000 and q not in [v.w(0x6000 + 2 * g) for g in fs]:
                ajenas[q].append(f)
        for q, fs_ in sorted(ajenas.items()):
            a, ls = q, []
            while True:
                x = v(a)
                if x == 0 and ls:
                    break
                ls.append(x)
                a += 1
            B.declara(v, q, a + 1, "lista_ajena_%04X" % q,
                      "una lista de pantallas (%s y el 0 que la acaba) a la que apunta, en este "
                      "banco, la fase %s, que se juega con otro (p03:BAE4): no la lee nadie" % (
                          " ".join("%02X" % x for x in ls), ", ".join(str(f) for f in fs_)),
                      "nadie", F=len(ls) + 1)
        for z in range(z0, zmax + 1):
            ordenes(v, v.w(0x6100 + 2 * z), z, piezas[b], hechas[b], no_se_juega=z not in zs)
    for b, ps in piezas.items():
        v = B.Ventana((b, 2, 3))
        for p, (ini, fin, quien) in sorted(ps.items()):
            B.declara(v, ini, fin, "pieza_%04X" % ini,
                      "una pieza de %d x %d dibujos (alto, ancho) de la fila 0x%02X de la hoja, "
                      "copia %s; la usan las pantallas %s (p03:BC2F/BBEE)" % (
                          v(ini + 1), v(ini + 2), v(ini) & 0xF0,
                          "con el color 0 transparente" if v(ini) & 1 else "normal",
                          " ".join("%02X" % z for z in sorted(quien)[:10])),
                      "p03:BC5C", F=3)


def ordenes(v, a, z, piezas, hechas, sub=False, no_se_juega=False):
    ini = a
    while True:
        if not (0x6000 <= a < 0x8000 or a < 0x6000 and sub):
            B.AVISOS.append("ordenes de la pantalla 0x%02X: se salen del banco en 0x%04X" % (z & 0xFF, a))
            return
        x = v(a)
        if x == 0xFF:
            a += 1
            break
        if x == 0xFE:
            q = v.w(a + 1)
            if q not in hechas:
                hechas.add(q)
                ordenes(v, q, z, piezas, hechas, sub=True)
            a += 3
            continue
        if x & 0x80:
            p = v.w(a + 2)
            a += 4
        else:
            p = v.w(a + 4)
            a += 6
        alto, ancho = v(p + 1), v(p + 2)
        ini_p, fin_p, quien = piezas.get(p, (p, p + 3 + alto * ancho, set()))
        quien.add(z)
        piezas[p] = (ini_p, fin_p, quien)
    if ini in hechas and not sub:
        return
    hechas.add(ini)
    B.declara(v, ini, a, "ordenes_%02X_%04X" % (z & 0xFF, ini),
              "las ordenes de pieza %s%s (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE "
              "+ puntero, 0xFF acaba)" % ("compartidas que usa la pantalla 0x%02X" % (z & 0xFF) if sub
                                          else "de la pantalla 0x%02X" % z,
                                          " (que no esta en ninguna lista de fase)" if no_se_juega
                                          else ""), "p03:BBA2", F=16)
    if sub:
        return
    # los objetos de la pantalla (p03:BD7B)
    o = a
    while v(o) != 0xFF:
        o += 4
    B.declara(v, a, o + 1, "objetos_%02X" % z,
              "los %d objetos de la pantalla 0x%02X: tipo, IY+3, fila y columna (la y, la x y "
              "su casilla salen de las dos: p03:BD7B-BDD5), y el 0xFF que acaba" % ((o - a) // 4, z),
              "p03:BD7F", F=4)
    s = o + 1
    n = 0
    cuenta = 0x0A                       # 0xE1AF (p03:BDD6), hasta 0x14 (p03:BDDF)
    while cuenta < 0x14 and v(s) != 0xFF:
        cuenta += v(s + 1)
        s += 4
        n += 1
    fin_s = s + 1 if cuenta < 0x14 else s
    B.declara(v, o + 1, fin_s, "sprites_%02X" % z,
              "los %d grupos de sprites de la pantalla 0x%02X: tipo, cuantos, y, x "
              "(p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a 0x14 sprites)"
              % (n, z), "p03:BDE3", F=4)


# ------------------------------------------------------------ las hojas de dibujos
#
# p00:47BE pone el banco A en 0x6000 y p00:4801/4832 lo copia ENTERO a la
# VRAM con una orden HMMC de 256 x 64 puntos (p00:4843): las hojas de dibujos
# de 8 x 8 de SCREEN 5. Los bancos: los dos de cada fase (p00:4666), el 11
# del titulo (p00:419D) y el 13 del logotipo de Konami (p00:4130; ese banco
# es ademas el de las pantallas de varias fases, ver pantallas()).

HOJAS = {1: "las fases 0 y 3", 6: "las fases 1, 4, 10, 11, 13, 14, 16, 17 y 18",
         7: "las fases 9 y 19", 8: "el segundo de casi todas", 9: "las fases 2, 5, 12, 15 y "
         "el segundo de 6-9 y 19", 10: "las fases 6, 7 y 8", 11: "el titulo (p00:419D)"}


def hojas():
    v4666 = B.Ventana((1, 2, 3))
    usos = {}
    for f in range(20):
        for k in (0, 1):
            usos.setdefault(v4666(0x4666 + 2 * f + k), []).append((f, k))
    B.declara(v4666, 0x4666, 0x468E, "graficos_de_fase",
              "dos bancos de dibujos por fase (20 fases): el primero lo copia p00:4297 "
              "(p00:47CD, a la linea 0 de la pagina 1) y el segundo p00:429D (p00:47DF, a "
              "la linea 0x40)", "p00:4293", F=2)
    for b in sorted(HOJAS):
        v = B.Ventana((b, 2, 3))
        fs = usos.get(b, [])
        donde = (", ".join("%d%s" % (f, "" if k == 0 else " (2o)") for f, k in fs)
                 if fs else "ninguna fase")
        B.declara(v, 0x6000, 0x8000, "hoja_%02d" % b,
                  "una hoja de dibujos de SCREEN 5 de 256 x 64 puntos (dos por byte) que "
                  "p00:4801/4832 copia entera a la VRAM con HMMC; la usan: %s%s" % (
                      donde, "; y el titulo (p00:419D)" if b == 11 else ""),
                  "p00:4832", F=16)


# ------------------------------------------------------------ lo medido
#
# Lo que no recorre ningun lector de arriba pero lee el cartucho al jugarlo:
# tools/cobertura.py (y tools/lee_sonidos.py) apuntan, de cada byte de la ROM
# que se lee como dato, la primera instruccion que lo lee. Los bytes seguidos
# con el mismo lector van en un bloque, y el texto lo dice: el tamano sale de
# lo leido, no de recorrer un formato.

def medidos():
    import json
    import os
    import quien_lee
    lector = {}
    for nom in ("cobertura.json", "cobertura_sonidos.json"):
        ruta = os.path.join(B.RAIZ, "work", nom)
        if os.path.exists(ruta):
            for k, pc in json.load(open(ruta))["lector"].items():
                b, a = map(int, k.split(":"))
                lector.setdefault((b, a & 0x1FFF), pc)
    ap = set(quien_lee.apuntadores(B.trazador()))
    from paginas import ORG

    def de_la_misma_rutina(x, y):
        return x == y or (0x51BD not in (x, y) and abs(x - y) <= 0x30)

    for p in range(16):
        cod = B.codigo_trazado(p)
        tapado = bytearray(cod)
        for x in B.BLOQUES:
            if x["p"] == p:
                for i in range(x["ini"] - ORG[p], x["fin"] - ORG[p]):
                    tapado[i] = 1
        for i, f in B.a_mano(p):
            for k in range(i - ORG[p], f - ORG[p]):
                tapado[k] = 1
        # 1. las rachas: bytes seguidos que lee la misma instruccion
        rachas = []
        i = 0
        while i < 0x2000:
            pc = lector.get((p, i))
            if tapado[i] or pc is None:
                i += 1
                continue
            j = i
            while j < 0x2000 and not tapado[j] and lector.get((p, j)) == pc:
                j += 1
            rachas.append([i, j, [pc], 0])
            i = j
        # 2. dos rachas de la misma rutina con un hueco sin leer de como mucho
        #    32 bytes entre medias, que no apunta ninguna otra instruccion:
        #    la misma tabla, con entradas que las partidas no han pedido
        juntas = []
        for r in rachas:
            if juntas:
                u = juntas[-1]
                hueco = range(u[1], r[0])
                libre = all(not tapado[k] and lector.get((p, k)) is None for k in hueco)
                misma = any(de_la_misma_rutina(x, y) for x in u[2] for y in r[2])
                # la tabla siguiente empieza donde la apunta otra instruccion:
                # lo de antes es la cola de esta
                if (libre and misma and 0 < len(hueco) <= 4 and (p, ORG[p] + r[0]) in ap
                        and not any((p, ORG[p] + k) in ap for k in hueco)):
                    u[1] = r[0]
                    u[3] += len(hueco)
                if (len(hueco) <= 40 and all(not tapado[k] and lector.get((p, k)) is None for k in hueco)
                        and not any((p, ORG[p] + k) in ap for k in range(u[1], r[0] + 1))
                        and any(de_la_misma_rutina(x, y) for x in u[2] for y in r[2])):
                    u[1] = r[1]
                    u[3] += len(hueco)
                    for x in r[2]:
                        if x not in u[2]:
                            u[2].append(x)
                    continue
            juntas.append(list(r))
        # la cola de una tabla hasta el codigo que la sigue (como mucho 8 bytes)
        for u in juntas:
            k = u[1]
            while k < 0x2000 and k - u[1] < 8 and not tapado[k] and lector.get((p, k)) is None \
                    and (p, ORG[p] + k) not in ap:
                k += 1
            if k > u[1] and k < 0x2000 and cod[k]:
                u[3] += k - u[1]
                u[1] = k
        v = B.ventana_de(p)
        for i, j, pcs, sin in juntas:
            txt = ("%d bytes que lee%s %s al jugar (medido ejecutando el cartucho, "
                   "tools/cobertura.py; el tamano es lo que se lee seguido" % (
                       j - i, "n" if len(pcs) > 1 else "",
                       ", ".join("0x%04X" % x for x in pcs[:6])))
            if sin:
                txt += (", con %d sin leer entre lecturas de la misma rutina, o detras hasta el "
                        "codigo o la tabla siguiente: entradas de la misma tabla que las partidas "
                        "no han pedido" % sin)
            B.declara(v, ORG[p] + i, ORG[p] + j, "leido_%04X" % (ORG[p] + i), txt + ")",
                      ["0x%04X" % x for x in pcs], F=16)


# ------------------------------------------------------------ titulo y logotipo
#
# El logotipo de Konami: p00:413F llama a p03:BBA2 con DE = p00:43C6 y el
# banco 13 en 0x6000 (p00:4130). El titulo: p03:BAF8 pone el banco 14 y
# entra en p03:BB98 con HL = 0x6040 y A = 0xE023 (0 desde p00:41A6): el
# puntero a las ordenes esta en p14:6040 + 2 x 0xE023 (sin numero de pantalla).

def titulo_y_logotipo():
    from collections import defaultdict
    piezas = defaultdict(dict)
    hechas = defaultdict(set)
    v13 = B.Ventana((13, 2, 3))
    ordenes(v13, 0x43C6, 0x100, piezas[13], hechas[13], sub=True)
    v14 = B.Ventana((14, 2, 3))
    B.declara(v14, 0x6040, 0x6042, "ordenes_titulo",
              "el puntero a las ordenes del titulo (p03:BB98 con HL = 0x6040 y A = 0xE023, "
              "que es 0: 0x6040 + 2 x 0xE023)", "p03:BB9F", F="w8")
    ordenes(v14, v14.w(0x6040), 0x101, piezas[14], hechas[14])
    for b, ps in piezas.items():
        v = B.Ventana((b, 2, 3))
        for p_, (ini, fin, quien) in sorted(ps.items()):
            B.declara(v, ini, fin, "pieza_%04X" % ini,
                      "una pieza de %d x %d dibujos del %s (p03:BC2F/BBEE)" % (
                          v(ini + 1), v(ini + 2), "logotipo de Konami" if b == 13 else "titulo"),
                      "p03:BC5C", F=3)


# ------------------------------------------------------------ la demostracion
#
# Tres grabaciones (p00:4203-4216), en el banco 12 puesto en 0x8000 (p00:4F94):
# un byte cada dos pasos de 6 cuadros (una cifra cada uno: la direccion y los
# botones, p00:4FF8-502A), hasta un 0xFF (p00:4FA6).

def demostraciones():
    v = B.Ventana((1, 12, 3))
    for k, (a, f) in enumerate(((0x9C00, 0), (0x9D60, 3), (0x9EC0, 5))):
        fin = a
        while v(fin) != 0xFF:
            fin += 1
        B.declara(v, a, fin + 1, "demo_%d" % k,
                  "la grabacion de la demostracion %d (fase %d): %d bytes de dos pasos de 6 "
                  "cuadros cada uno (la cifra alta y la baja: direccion y botones, p00:4FF8) y "
                  "el 0xFF que la acaba (p00:4FA6)" % (k, f, fin - a), "p00:4FA5", F=16)


# ------------------------------------------------------------ los textos
#
# Las cadenas de tools/textos.py, que escribe p00:48D3 hasta su 0xFF.

def textos():
    import textos as T
    for nom, cs in T.grupos():
        for b, a, bs in cs:
            v = B.ventana_de(b)
            B.declara(v, a, a + len(bs) + 1, "texto_%04X" % a,
                      'el texto "%s" y su 0xFF (lo escribe p00:48D3)' % T.texto(bs).replace('"', "'"),
                      "p00:48DB", F=len(bs) + 1)
    v = B.Ventana((1, 12, 3))
    B.declara(v, 0x974C, 0x9774, "nombres_de_fase",
              "20 punteros a los nombres de fase, uno por fase (p12:9927: 0x974C + 2 x 0xE020)",
              "p12:992E", F="w8")
    B.declara(v, 0x9600, 0x9622, "lineas_del_final",
              "17 punteros a las lineas del texto del final (p12:94F4, por bloques)",
              "p12:94F4", F="w8")


def todo():
    sonido()
    pantallas()
    titulo_y_logotipo()
    demostraciones()
    textos()
    hojas()


def piezas_sueltas():
    """Los huecos de los bancos de fase que son piezas seguidas a las que no
    apunta ninguna orden: se recorren como pieza tras pieza (modo, alto, ancho
    y alto x ancho dibujos) y solo se declaran si encajan justas en el hueco."""
    from paginas import ORG
    for p in (13, 14, 15):
        v = B.Ventana((p, 2, 3))
        cod = B.codigo_trazado(p)
        tapado = bytearray(cod)
        for x in B.BLOQUES:
            if x["p"] == p:
                for i in range(x["ini"] - 0x6000, x["fin"] - 0x6000):
                    tapado[i] = 1
        i = 0
        while i < 0x2000:
            if tapado[i]:
                i += 1
                continue
            j = i
            while j < 0x2000 and not tapado[j]:
                j += 1
            a, n, ok = 0x6000 + i, 0, True
            while a < 0x6000 + j:
                alto, ancho = v(a + 1), v(a + 2)
                if not (1 <= alto <= 24 and 1 <= ancho <= 32) or v(a) & 0x0E:
                    ok = False
                    break
                a += 3 + alto * ancho
                n += 1
            if ok and a == 0x6000 + j and n >= 1:
                B.declara(v, 0x6000 + i, 0x6000 + j, "piezas_sueltas_%04X" % (0x6000 + i),
                          "%d pieza(s) seguidas (modo, alto, ancho y alto x ancho dibujos, el formato "
                          "de p03:BC2F) a las que no apunta ninguna orden de pantalla: encajan justas "
                          "en el hueco" % n, "nadie", F=16)
            i = j


# lo que indexa una tabla desde HL: lee_tabla (p00:51B8), sumarle DE o BC, o
# el ayudante del motor de sonido (p04:6B63: HL = HL + A & 3)
INDEXA = ("call 051b8h", "add hl,de", "add hl,bc", "call L_6B63")


def indexadas():
    """Las tablas que se leen desde HL con un indice: en el listado, un
    `ld hl,TABLA` y, como mucho cinco instrucciones despues, lo que suma el
    indice (INDEXA). La tabla es del banco de la ventana donde cae TABLA (el 0
    en 0x4000, el 3 en 0xA000, o el del propio codigo) y va de su base hasta
    lo siguiente que hay: otra tabla de estas, un bloque de otro lector o
    codigo. Su tamano no sale de recorrerla: el indice lo da quien llama."""
    import os
    from paginas import ORG
    bases = {}
    for p in range(16):
        if not any(B.codigo_trazado(p)):
            continue
        ruta = os.path.join(B.RAIZ, "src", "contra_p%02d.asm" % p)
        if not os.path.exists(ruta):
            continue
        ins = []
        for ln in open(ruta, encoding="utf-8"):
            m = re.match(r"^\t([^;]*?)\s*;([0-9a-f]{4})\b", ln)
            if m:
                ins.append((int(m.group(2), 16), m.group(1).strip()))
        for k, (a, x) in enumerate(ins):
            m = re.match(r"ld hl,0([0-9a-f]{4})h$", x)
            if not m or not any(y in INDEXA for _, y in ins[k + 1:k + 6]):
                continue
            hl = int(m.group(1), 16)
            if 0x4000 <= hl < 0x6000:
                b = 0
            elif 0xA000 <= hl < 0xC000:
                b = 3
            elif ORG[p] <= hl < ORG[p] + 0x2000:
                b = p
            else:
                continue
            bases.setdefault((b, hl), []).append("p%02d:%04X" % (p, a))
    # lo que apunta otra instruccion, o lee en la campana otra que no sea la
    # de lee_tabla (p00:51BD), es otro dato: la tabla acaba ahi
    import json
    import quien_lee
    ap = set(quien_lee.apuntadores(B.trazador()))
    leido = {}
    ruta = os.path.join(B.RAIZ, "work", "cobertura.json")
    if os.path.exists(ruta):
        for k, pc in json.load(open(ruta))["lector"].items():
            x, y = map(int, k.split(":"))
            leido.setdefault((x, y & 0x1FFF), pc)
    for (b, hl), quien in sorted(bases.items()):
        cod = B.codigo_trazado(b)
        if cod[hl - ORG[b]] or any(x["p"] == b and x["ini"] <= hl < x["fin"] for x in B.BLOQUES):
            continue
        fin = ORG[b] + 0x2000
        for (b2, h2) in bases:
            if b2 == b and hl < h2 < fin:
                fin = h2
        for x in B.BLOQUES:
            if x["p"] == b and hl < x["ini"] < fin:
                fin = x["ini"]
        base_pc = leido.get((b, hl - ORG[b]))
        sitios = [int(q.split(":")[1], 16) for q in quien]
        for i in range(hl - ORG[b], fin - ORG[b]):
            x = leido.get((b, i))
            otro = x not in (None, 0x51BD, base_pc) and not any(abs(x - s) <= 0x20 for s in sitios)
            if cod[i] or (i > hl - ORG[b] and ((b, ORG[b] + i) in ap or otro)):
                fin = ORG[b] + i
                break
        B.declara(B.ventana_de(b), hl, fin, "tabla_%04X" % hl,
                  "tabla que se lee desde HL = 0x%04X con un indice (lee_tabla, add hl,de...); va de su "
                  "base hasta lo siguiente que hay (otra tabla, otro bloque, codigo, un puntero de otra "
                  "instruccion o un byte que lee otra al jugar): el tamano "
                  "no sale de recorrerla, el indice lo da quien llama" % hl,
                  quien, F=16)


def conocidas():
    """Tablas cuyo tamano sale del codigo que las lee, aunque las partidas no
    hayan pedido todas sus entradas."""
    import json
    import os
    from paginas import ORG
    import mapas
    v3 = B.ventana_de(3)
    # los dibujos de sprite de cada pantalla (p03:BE1E-BE4F): una tabla por
    # tramo en las fases 6, 9, 10, 16 y 17, y una entrada por fase en las demas
    B.declara(v3, 0xBE6F, 0xBE83, "dibujos_por_fase",
              "el juego de dibujos de sprite de cada fase, uno por fase (20; p03:BE44 con "
              "0xE020)", "p03:BE44", F=20)
    for ini, f in ((0xBE83, 6), (0xBE8B, 9), (0xBE93, 10), (0xBE9B, 16), (0xBEA5, 17)):
        n = len(fases_lista(f))
        B.declara(v3, ini, ini + n, "dibujos_por_tramo_%02d" % f,
                  "el juego de dibujos de sprite de cada tramo de la fase %d (%d tramos; "
                  "p03:BE4C con 0xE022)" % (f, n), "p03:BE4F", F=n)
    # el jugador: dos bytes por postura (dibujo de arriba y de abajo) mirando a
    # la derecha y a la izquierda (p03:B247-B25E), y un byte por postura de
    # altura (p03:B262); 35 posturas: lo que hay entre las tres tablas
    B.declara(v3, 0xB3AE, 0xB3F4, "dibujos_jugador_derecha",
              "los dibujos del jugador mirando a la derecha: 35 posturas x (arriba, abajo) "
              "(p03:B247 con 0xE325 x 2)", "p03:B25A", F=2)
    B.declara(v3, 0xB3F4, 0xB43A, "dibujos_jugador_izquierda",
              "los dibujos del jugador mirando a la izquierda: 35 posturas x (arriba, abajo) "
              "(p03:B250 con 0xE325 x 2)", "p03:B25A", F=2)
    B.declara(v3, 0xB43A, 0xB45D, "alturas_jugador",
              "un byte por postura del jugador, las 35 (p03:B262)", "p03:B262", F=35)
    # las puertas de las bases (p03:B14A, p03:B191): por sala, la sala a la
    # que lleva cada puerta (0xFF: no hay)
    for f, (iz, de, n) in sorted(mapas.TABLAS_3D.items()):
        for ini, lado in ((iz, "izquierda"), (de, "derecha")):
            B.declara(v3, ini, ini + n, "puertas_%02d_%s" % (f, lado[:3]),
                      "la puerta %s de cada sala de la base de la fase %d: %d salas, la sala a "
                      "la que lleva (0xFF: no hay puerta; p03:%s con 0xE022)" % (
                          lado, f, n, "B165" if lado == "izquierda" else "B191"),
                      "p03:B168", F=n)
    # las tablas de saltos de src/semillas.txt ("# pNN:XXXX, N palabras.")
    ruta = os.path.join(B.RAIZ, "src", "semillas.txt")
    for ln in open(ruta, encoding="utf-8"):
        m = re.match(r"# p(\d\d):([0-9A-F]{4}), (\d+) palabras\. (.*)", ln)
        if m:
            b, a, n = int(m.group(1)), int(m.group(2), 16), int(m.group(3))
            if any(x["p"] == b and x["ini"] == a for x in B.BLOQUES):
                continue
            B.declara(B.ventana_de(b), a, a + 2 * n, "saltos_%04X" % a,
                      "tabla de saltos de %d entradas (src/semillas.txt): %s" % (
                          n, m.group(4).strip()), "p%02d:%04X" % (b, a), F="w8")
    # las cajas de choque de se_tocan (p00:5BD5-5C10): cuatro bytes, dy, alto,
    # dx y ancho; las partidas solo leen los que hacen falta para decidir
    ruta = os.path.join(B.RAIZ, "work", "cobertura.json")
    if os.path.exists(ruta):
        vistas = set()
        for k, pc in json.load(open(ruta))["lector"].items():
            b, a = map(int, k.split(":"))
            if pc == 0x5BD5 and (b, a) not in vistas:
                vistas.add((b, a))
                B.declara(B.ventana_de(b), a, a + 4, "caja_%04X" % a,
                          "una caja de choque (dy, alto, dx, ancho) que lee se_tocan "
                          "(p00:5BD5-5C10); el primer byte, medido jugando", "p00:5BD5", F=4)


def fases_lista(f):
    import fases
    return fases.lista(f)[2]


# ------------------------------------------------------------ lo que no lee nada
#
# Lo que queda: ni un puntero de una instruccion, ni una lista, orden o pieza
# de los lectores de arriba, ni las 75 partidas de tools/cobertura.py lo leen.
# Los de los bancos de codigo, leidos a mano, con lo que son; los de los
# bancos de fase, con las piezas que se pueden recorrer (el formato de
# p03:BC2F) y lo demas descrito tal cual.

NADA = "no lo lee nada: ni un puntero, ni una lista, orden o pieza, ni las partidas de tools/cobertura.py"

A_MANO = {
    (0, 0x54CA): "un byte 0xC3 detras del ultimo mensaje de grabar (p00:54BB, acabado en 0xFF) y "
                 "delante de codigo",
    (2, 0x8C83): "cuatro bytes con la forma de una caja de choque (dy, alto, dx, ancho: 10 10 00 10), "
                 "delante de la de p02:8C87",
    (3, 0xA8E9): "0A 6B 0A 6B, entre los colores que lee colores_ficha (p00:5E45) y la tabla p03:A8ED",
    (3, 0xA932): "doce figuras de un sprite (dy 0xF0, dx 0 y el dibujo: FC 58 60 68 70 78 58 78 58 90 "
                 "98 A0) entre las que lee pon_figura (p02:9FFA)",
    (5, 0x9894): "139 bytes de partitura (ordenes 0xE3, 0xE4... del motor) entre dos que lee el motor "
                 "(p04:6367): ninguna cabecera de sonido (p04:6E12) ni salto de partitura lleva aqui",
    (5, 0x9FFB): "cinco bytes a 0xFF hasta el final del banco: relleno",
    (12, 0x95D8): "dos ordenes del VDP de 15 bytes (los registros 32-46, con la orden 0xD0, HMMM), como "
                  "las de p00:5368",
    (12, 0x9BEB): "restos de codigo (ld bc,0x0A11 / ld h,c / ret / ex de,hl / inc hl...) cortados por la "
                  "grabacion de la primera demostracion (p12:9C00)",
    (12, 0x9D5D): "tres bytes a 0 detras de la grabacion de p12:9C00: cada grabacion tiene 0x160 bytes "
                  "(p12:9C00, 9D60 y 9EC0) y esta acaba antes",
    (12, 0x9EBD): "tres bytes a 0 detras de la grabacion de p12:9D60, como los de p12:9D5D",
    (12, 0x9FD3): "45 bytes detras de la tercera grabacion (p12:9EC0) hasta el final del banco: casi "
                  "todo 0xFF, con trozos sin formato",
}


def sin_lector():
    from paginas import ORG
    for p in range(16):
        cod = B.codigo_trazado(p)
        tapado = bytearray(cod)
        for x in B.BLOQUES:
            if x["p"] == p:
                for i in range(x["ini"] - ORG[p], x["fin"] - ORG[p]):
                    tapado[i] = 1
        for i, f in B.a_mano(p):
            for k in range(i - ORG[p], f - ORG[p]):
                tapado[k] = 1
        v = B.ventana_de(p)
        i = 0
        while i < 0x2000:
            if tapado[i]:
                i += 1
                continue
            j = i
            while j < 0x2000 and not tapado[j]:
                j += 1
            ini, fin = ORG[p] + i, ORG[p] + j
            i = j
            if (p, ini) in A_MANO:
                B.declara(v, ini, fin, "sin_lector_%04X" % ini, A_MANO[(p, ini)] + "; " + NADA,
                          "nadie", F=16)
                continue
            if p not in (13, 14, 15):
                continue            # sin descripcion: que lo cace presupuesto.py
            # las piezas que se pueden recorrer desde el principio del hueco
            a, n = ini, 0
            while a < fin:
                alto, ancho = v(a + 1), v(a + 2)
                if not (1 <= alto <= 24 and 1 <= ancho <= 32) or a + 3 + alto * ancho > fin:
                    break
                a += 3 + alto * ancho
                n += 1
            if n:
                B.declara(v, ini, a, "piezas_sin_orden_%04X" % ini,
                          "%d pieza(s) seguidas (modo, alto, ancho y alto x ancho dibujos, el formato de "
                          "p03:BC2F) a las que no apunta ninguna orden de pantalla; %s" % (n, NADA),
                          "nadie", F=16)
            if a < fin:
                bs = [v(k) for k in range(a, fin)]
                ext = sum(1 for x in bs if x in (0x00, 0xFF))
                nib = sum(1 for x in bs if x & 0x0F == 0x0F)
                B.declara(v, a, fin, "sin_lector_%04X" % a,
                          "%d bytes sin formato de pieza, lista ni orden (%d a 0x00 o 0xFF y %d acabados "
                          "en 0xF)%s; %s" % (fin - a, ext, nib,
                                              " detras de las piezas de p%02d:%04X" % (p, ini) if n else "",
                                              NADA),
                          "nadie", F=16)


def despues():
    conocidas()
    indexadas()
    piezas_sueltas()
    medidos()
    sin_lector()
