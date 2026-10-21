#!/usr/bin/env python3
"""Lo que tools/anota.py sabe de Contra: rutinas con nombre, RAM y los campos
de las fichas. Solo datos; la maquinaria esta en anota.py.

CADA ENTRADA SALE DE LEER SU RUTINA en el listado (la direccion es la fuente).
Lo que no se sabe no esta en la tabla. Vacio hasta leer el codigo
(2026-10-21).
"""
from cartucho import PONE_BANCOS

# Los bancos con codigo, medidos en el trazado de cartucho entero (los demas,
# de momento sin una instruccion). PROVISIONAL.
BANCOS = (0, 2, 3, 4, 12, 14)

# Los registros del mapper Konami con SCC (tools/paginas.py).
REGISTROS_MAPPER = {0x5000: "0x4000", 0x7000: "0x6000", 0x9000: "0x8000", 0xB000: "0xA000"}


# Que banco se ve en cada ventana al empezar una rutina del banco b: el juego
# corre con 2 en 0x8000 y 3 en 0xA000, el sonido con 4-5. PROVISIONAL.
def trio(b):
    if b == 0:
        return {}
    if b in (4, 5):
        return {0x6000: 4, 0x8000: 5, 0xA000: 3}
    return {0x8000: 2, 0xA000: 3}


# Las rutinas del banco 0 que cambian lo que se ve (cartucho.PONE_BANCOS).
CAMBIOS_DE_BANCO = {a: {v: b for v, b in zip((0x6000, 0x8000, 0xA000), t) if b is not None}
                    for a, t in PONE_BANCOS.items()}

RUTINAS = {}
RAM = {}
RAM16 = {}
FICHAS = ()
