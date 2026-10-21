#!/usr/bin/env python3
"""La musica de Contra, ejecutando su motor de sonido (tools/motor_musica.py).

El motor esta en el banco 4 (con el 5 en 0x8000) y tiene tres entradas:
p04:6000 lo pone a cero (el arranque, p00:4103), p04:6003 arranca un sonido
(p00:5052, A = numero, con los bancos 4-5) y p04:6006 es el cuadro (la
interrupcion, p00:4C29, con los bancos 4-5). La cabecera de cada sonido
(p04:6E12 + 2 x numero) dice que canales usa.

Uso:  musica.py registros 0x03 [cuadros] | mp3 0x03 f.mp3 | todas docs/audio
      musica.py barrido 0x01 0x3C
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
from motor_musica import P  # noqa: E402

PIEZAS = []

PAGINA = None

CFG = dict(rom="contra.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 3)),
           bancos_frame=((0x6000, 4), (0x8000, 5)),
           ram0=[], init=[(0x6000, {})], frame=0x6006, pide=0x5052, banco_frame=4, bp_frame=0x4C29,
           banco_pide=0, ram=(0xC000, 0xC200), hz=60, psg0={7: 0xB8},
           romtype="KonamiSCC", max_s=240, piezas=PIEZAS, pagina=PAGINA,
           maquina="Panasonic_FS-A1WSX")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
