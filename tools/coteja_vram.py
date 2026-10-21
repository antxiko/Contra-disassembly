#!/usr/bin/env python3
"""Coteja la pantalla que pinta tools/fases.py con la VRAM de openMSX.

Lee un volcado de tools/omsx_vram.tcl (vram-<t>.bin, 128 KB, y vdp-<t>.txt con
R2) y compara, linea a linea, las ALTO primeras lineas de la pagina visible
con las de la pantalla que construye p03:BB3C en tools/ejecuta.py para la fase
y el tramo que dice la RAM volcada (ram-<t>.bin, 0xE020 y 0xE022).

Uso: coteja_vram.py <dir> <t> [alto]
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import fases   # noqa: E402


def main(d, t, alto=176):
    vram = open(os.path.join(d, "vram-%s.bin" % t), "rb").read()
    ram = open(os.path.join(d, "ram-%s.bin" % t), "rb").read()
    regs = open(os.path.join(d, "vdp-%s.txt" % t)).read()
    r2 = int(re.search(r"R2 = 0x([0-9A-F]+)", regs).group(1), 16)
    pag = (r2 >> 5) & 3
    f, tramo = ram[fases.FASE], ram[fases.TRAMO]
    m = fases.partida_en(f)
    m.apunta = False
    m.mem[fases.TRAMO] = tramo
    m.llama(fases.CONSTRUYE)
    mia = (m.vdp.r[2] >> 5) & 3
    iguales = 0
    malas = []
    for y in range(alto):
        a = vram[(pag * 256 + y) * 128:(pag * 256 + y + 1) * 128]
        b = bytes(m.vdp.vram[(mia * 256 + y) * 128:(mia * 256 + y + 1) * 128])
        if a == b:
            iguales += 1
        else:
            malas.append(y)
    print("fase %d tramo %d (pagina %d en openMSX, %d aqui): %d de %d lineas iguales byte a byte%s" % (
        f, tramo, pag, mia, iguales, alto, "" if not malas else "; distintas: %s" % malas[:20]))
    return 0 if iguales == alto else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1], sys.argv[2], *(int(x) for x in sys.argv[3:])))
