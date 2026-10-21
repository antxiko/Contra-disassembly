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

# Quien pide cada una, leido en el codigo. Las de fase salen de la tabla
# p00:4356 (una por fase, p00:4316-431F); el numero de STAGE es el indice + 1
# hasta la 8 y el indice desde la 9 (p00:4576).
PIEZAS = [
    P(0x02, "El título", "The title screen", "p00:41D4, tras escribir PUSH SPACE KEY"),
    # la 0x09 (fase 18 y la Trap Hangar) es la misma: su cabecera, p04:6F08,
    # apunta a las mismas partituras que la de la 0x03, p04:6EB4
    P(0x03, "Asphalt Jungle, Cavern y Underground Fortress (fases 1, 10 y 18); también el final", "Asphalt Jungle, Cavern and Underground Fortress (stages 1, 10 and 18); also the ending", "p00:4356 (0x03 y 0x09) y p00:44EB"),
    P(0x04, "Las bases: Underpass y Under Maze (fases 2, 5, 11 y 14)", "The bases: Underpass and Under Maze (stages 2, 5, 11 and 14)", "p00:4356"),
    P(0x05, "Homicide Censor, las paredes del jefe de la base (fases 3, 6, 12 y 15)", "Homicide Censor, the base boss walls (stages 3, 6, 12 and 15)", "p00:4356"),
    P(0x06, "Hell Fall y Underground Fall (fases 4 y 16)", "Hell Fall and Underground Fall (stages 4 and 16)", "p00:4356"),
    P(0x07, "Tundra Area (fase 7)", "Tundra Area (stage 7)", "p00:4356"),
    P(0x08, "Energy Zone y Magma Area (fases 8, 13 y 17)", "Energy Zone and Magma Area (stages 8, 13 and 17)", "p00:4356"),
    P(0x0A, "Alien Zone y Vicious Space (fases 9 y 19)", "Alien Zone and Vicious Space (stages 9 and 19)", "p00:4356"),
    P(0x0E, "Jefe destruido", "Boss destroyed", "p02:892B"),
    P(0x0F, "El último jefe destruido (fase 19)", "The last boss destroyed (stage 19)", "p02:8931"),
    P(0x10, "Fin de la partida", "Game over", "p00:441E, tras escribir GAME OVER"),
]

PAGINA = None

CFG = dict(rom="contra.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 3)),
           bancos_frame=((0x6000, 4), (0x8000, 5)),
           ram0=[], init=[(0x6000, {})], frame=0x6006, pide=0x5052, banco_frame=4, bp_frame=0x4C29,
           banco_pide=0, ram=(0xC000, 0xC200), hz=60, psg0={7: 0xB8},
           excluye=(0xC1FD,),     # contador de cuadros del motor: no cierra el bucle
           romtype="KonamiSCC", max_s=240, piezas=PIEZAS, pagina=PAGINA,
           maquina="Sony_HB-F900")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
