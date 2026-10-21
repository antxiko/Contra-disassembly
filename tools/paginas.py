#!/usr/bin/env python3
"""La regla banco -> direccion del MegaROM, compartida por todas las herramientas.

Contra (Konami, RC-762, 1989, MSX2) es un cartucho de 128 KB con
el mapper Konami CON SCC: 16 bancos de 8 KB que se eligen escribiendo el numero
de banco en 0x5000 (para 0x4000-0x5FFF), 0x7000 (0x6000-0x7FFF), 0x9000
(0x8000-0x9FFF) y 0xB000 (0xA000-0xBFFF). Escribir 0x3F en 0x9000 no pone un
banco: enciende el SCC en 0x9800-0x9FFF.

Lo que dice la ROM (tools/reconocimiento.py lo vuelve a medir cada vez):
  - 0x5000 y 0xB000 solo los escribe INIT (p00:4083 y p00:408F), con un 0 y
    un 3: el banco 0 se queda fijo en 0x4000 y el 3 en 0xA000.
  - 0x7000 se escribe por p00:4F78/4F7B y 0x9000 por p00:453A, con el banco
    en A. Casi todo pasa por 0x6000: los graficos de cada fase salen de la
    tabla p00:4666 (dos bancos por fase, p00:4297-429D) y de p03:BAE4 (uno
    por fase, p03:B58C y p03:BB69).
  - En 0x8000 solo corren el 2 (el de arranque), el 5 (con el sonido, p00:4100)
    y el 12 (p00:4538). El 12 se pone TAMBIEN en 0x6000 para copiar sus
    graficos a la VRAM (p00:49BF): ver EXCEPCIONES.

Uso como programa:
    paginas.py org <n>               imprime el org del banco n
    paginas.py lista                 imprime "n org" para los 16
    paginas.py corta <rom> <dir>     escribe <dir>/pNN.bin con cada banco
"""
import os
import sys

TAM_PAGINA = 0x2000
N_PAGINAS = 16

# banco -> direccion de ejecucion. Medido, no supuesto: ver reconocimiento.py.
ORG = {0: 0x4000,
       1: 0x6000, 2: 0x8000, 3: 0xA000,
       4: 0x6000, 5: 0x8000,
       6: 0x6000, 7: 0x6000, 8: 0x6000, 9: 0x6000, 10: 0x6000, 11: 0x6000,
       12: 0x8000,
       13: 0x6000, 14: 0x6000, 15: 0x6000}

# Registro del mapper -> ranura que gobierna (Konami con SCC).
REGISTROS = {0x5000: 0x4000, 0x7000: 0x6000, 0x9000: 0x8000, 0xB000: 0xA000}

# Los registros del OTRO mapper Konami: nadie de este cartucho escribe en
# ellos, salvo las escrituras de OTRO_SLOT.
AJENOS = (0x6000, 0x8000, 0xA000)

# Escrituras a un registro ajeno que van a otro slot: p00:4DD5 hace ENASLT
# (0x0024) con H = 0x80 y la ranura de 0xE209 (la del cartucho que contesta
# "Y"/"Z" por RDSLT en p00:4DA7/4DC2), escribe en el 0x8000 y el 0xA000 de ESE
# cartucho, lo llama en 0x8000 y lo vuelve a quitar con la de 0xE208. (banco, pc).
OTRO_SLOT = {(0, 0x4DDF), (0, 0x4DE7)}

# Valores escritos en un registro que no son un banco: (registro, valor).
NO_BANCO = {(0x9000, 0x3F): "enciende el SCC en 0x9800"}

# Escrituras al mapper que ponen un banco fuera de su ranura, medidas en
# reconocimiento.py: (banco, pc de la escritura) -> ranura.
EXCEPCIONES = {
    # p00:49BF ld a,12 / call 4F78: el banco 12 en 0x6000 para copiar a la
    # VRAM los graficos que lee la tabla p00:49D3 (ld hl,0x6480 / call LDIRVM...)
    (12, (0, 0x49C1)): 0x6000,
}

NUNCA_MAPEADOS = ()


def org(p):
    """Direccion en la que se ejecuta el banco p."""
    return ORG[p]


def nombre(p):
    """Nombre del modulo del banco p: p00..p15."""
    return "p%02d" % p


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "org":
        print("%#06x" % org(int(argv[2], 10)))
    elif argv[1] == "lista":
        for p in range(N_PAGINAS):
            print("%d %#06x" % (p, org(p)))
    elif argv[1] == "corta":
        rom, dst = argv[2], argv[3]
        d = open(rom, "rb").read()
        if len(d) != TAM_PAGINA * N_PAGINAS:
            sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
        os.makedirs(dst, exist_ok=True)
        for p in range(N_PAGINAS):
            with open(os.path.join(dst, nombre(p) + ".bin"), "wb") as f:
                f.write(d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA])
        print("16 bancos de %d bytes en %s/" % (TAM_PAGINA, dst))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
