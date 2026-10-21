#!/usr/bin/env python3
"""La ROM del cartucho, la que haya en la raiz del repositorio (*.rom).

Una direccion de 0x6000-0xBFFF no dice nada sin el reparto de bancos puesto
(tools/paginas.py); eso lo lleva quien lee (tools/bloques.py: Ventana).
"""
import glob
import os

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
RUTA_ROM = os.environ.get("CARTUCHO_ROM") or sorted(glob.glob(os.path.join(RAIZ, "*.rom")))[0]
ROM = open(RUTA_ROM, "rb").read()
