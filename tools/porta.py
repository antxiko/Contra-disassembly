#!/usr/bin/env python3
"""Lleva los comentarios de un listado de OTRO cartucho al de este, cuando el
codigo es el mismo (el motor de sonido de Konami de King's Valley II y el de
Contra casan en 1.680 de sus 1.681 instrucciones).

Como lo hace:
  1. Lee los dos listados (instruccion, direccion y comentario de cada linea).
  2. Los casa con difflib sobre la instruccion con los numeros y etiquetas
     cambiados por '#'; solo cuentan los tramos de 4 o mas.
  3. De cada pareja casada saca las parejas de numeros: la direccion de la
     instruccion (p04:XXXX de alli -> p04:YYYY de aqui) y cada operando
     (0xE1EB de alli -> 0xC1EB de aqui). Si un numero de alli casa con dos
     distintos de aqui, no se usa.
  4. Cada comentario de alli va a su instruccion de aqui con las direcciones
     traducidas. Si alguna direccion del texto no esta en el mapa, NO se lleva:
     diria una direccion falsa. Tampoco se pisa un comentario que ya haya.

Lo que sale son lineas `C 0xDIR texto` para la seccion de notas del banco;
las cifras de DATOS (cuantos sonidos, cuantas ondas) no las sabe traducir y
hay que mirarlas: --cifras lista los que llevan numeros decimales.

Uso: porta.py <listado de alli> <listado de aqui> <banco> [--cifras]
"""
import collections
import difflib
import re
import sys

NUM = re.compile(r"\b(?:0x([0-9A-Fa-f]{3,4})|([0-9A-Fa-f]{3,4})h|0([0-9a-f]{4})h)\b")


def lee(ruta):
    out = []
    for ln in open(ruta, encoding="utf-8"):
        m = re.match(r"^\t([^;]*?)\s*;([0-9a-f]{4})\b(?:\s*;\s*(.*))?", ln.rstrip("\n"))
        if not m:
            continue
        ins = m.group(1).strip()
        norm = re.sub(r"\b(L_[0-9A-F]+|0[0-9a-f]+h|[0-9]+)\b", "#", ins)
        out.append((int(m.group(2), 16), norm, (m.group(3) or "").strip(), ins))
    return out


def numeros(ins):
    """Los numeros de 16 bits de una instruccion (etiquetas y hex)."""
    xs = [int(x, 16) for x in re.findall(r"L_([0-9A-F]{4})", ins)]
    xs += [int(x, 16) for x in re.findall(r"\b0([0-9a-f]{4})h\b", ins)]
    return xs


def mapa(a, b, bl):
    pares = collections.defaultdict(set)
    for blq in bl:
        for k in range(blq.size):
            x, y = a[blq.a + k], b[blq.b + k]
            pares[x[0]].add(y[0])
            for p, q in zip(numeros(x[3]), numeros(y[3])):
                pares[p].add(q)
    return {p: next(iter(qs)) for p, qs in pares.items() if len(qs) == 1}


def traduce(texto, m, banco):
    malas = []

    def cambia_p(mt):
        n = int(mt.group(2), 16)
        if int(mt.group(1)) == banco and n in m:
            return "p%02d:%04X" % (banco, m[n])
        malas.append(mt.group(0))
        return mt.group(0)
    texto = re.sub(r"p(\d\d):([0-9A-F]{4})", cambia_p, texto)

    def cambia_n(mt):
        h = mt.group(1) or mt.group(2) or mt.group(3)
        n = int(h, 16)
        if n < 0x100:
            return mt.group(0)
        if n in m:
            return "0x%04X" % m[n]
        malas.append(mt.group(0))
        return mt.group(0)
    texto = NUM.sub(cambia_n, texto)
    return texto, malas


def main(argv):
    if len(argv) < 4:
        sys.exit(__doc__)
    de, a_, banco = argv[1], argv[2], int(argv[3])
    cifras = "--cifras" in argv
    b = lee(de)
    a = lee(a_)
    s = difflib.SequenceMatcher(None, [x[1] for x in b], [x[1] for x in a], autojunk=False)
    bl = [x for x in s.get_matching_blocks() if x.size >= 4]
    m = mapa(b, a, bl)
    llevados = fuera = 0
    for blq in bl:
        for k in range(blq.size):
            x, y = b[blq.a + k], a[blq.b + k]
            if not x[2] or y[2]:
                continue
            t, malas = traduce(x[2], m, banco)
            if malas:
                fuera += 1
                continue
            if cifras and re.search(r"\b\d+\b", re.sub(r"0x[0-9A-F]+|p\d\d:[0-9A-F]+", "", t)):
                print("# CIFRAS %04X: %s" % (y[0], t))
                continue
            print("C 0x%04X %s" % (y[0], t))
            llevados += 1
    print("# llevados %d, sin llevar por direcciones sin traducir %d" % (llevados, fuera), file=sys.stderr)


if __name__ == "__main__":
    main(sys.argv)
