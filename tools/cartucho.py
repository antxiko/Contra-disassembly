#!/usr/bin/env python3
"""Lo que el trazador de cartucho entero (tools/bancos.py) necesita saber de
ESTE cartucho: donde esta el despachador, como cambia de banco y por donde
arranca. bancos.py es maquinaria y no lleva direcciones de ningun juego; las
lee de aqui.

Contra (Konami, RC-762, 1989), MSX2, mapper Konami con SCC (sin el chip:
nadie escribe 0x3F en 0x9000 salvo el sonido de p04, que lo prueba).
Todo medido sobre los bytes (tools/reconocimiento.py repasa cada escritura al
mapper).
"""

# El despachador de Konami, con la tabla de destinos pegada detras del
# `call`: p03:A03E `ld e,(iy+5) / pop hl / rlc e / ld d,0 / add hl,de /
# ld e,(hl) / inc hl / ld d,(hl) / ex de,hl / jp (hl)` (el indice, el estado
# del objeto en IY+5), y p03:A041, la misma sin el `ld e,(iy+5)` (el indice
# llega en E). Las otras tablas de saltos van aparte (`ld hl,tabla / add a,a /
# call p00:51B8 / ... / jp (hl)`) y salen en el informe como puntos ciegos.
DESPACHADOR = 0xA03E
DESPACHADORES = (0xA03E, 0xA041)

# Registro del mapper -> casilla del reparto (0x6000, 0x8000, 0xA000). El de
# 0x5000 solo lo escribe INIT (p00:4083), con un 0, y el de 0xB000 tambien
# solo INIT (p00:408F), con un 3: el banco 3 se queda fijo en 0xA000.
RANURA_REG = {0x7000: 0, 0x9000: 1, 0xB000: 2}

# Las copias en RAM de los registros: 0xE202 (0x7000) y 0xE203 (0x9000),
# que escriben p00:4F7B y p00:453A junto al registro y que la interrupcion
# (p00:4BEF) lee para devolver lo que habia.
SOMBRA = {0xE202: 0, 0xE203: 1, 0xE2CC: 3}
SOMBRA_RANURA = {0: 0, 1: 1}

# 0xE2CC (casilla 3 de la sombra) es donde p00:4532 guarda el banco de 0x8000
# antes de poner el 12 (`ld a,(0xE203) / ld (0xE2CC),a / ld a,12 / ...`), y
# p00:452D lo devuelve (`ld a,(0xE2CC) / jr 453A`). Subrutina -> (ranura que
# guarda, casilla de la sombra donde la deja).
GUARDA_RANURA = {0x4532: (1, 3)}
PONE_ZONA = ()
DEVUELVE_ZONA = ()

# Las rutinas de banco de Contra reciben el numero en A (p00:4F78 y 4F7B
# para 0x7000, p00:453A para 0x9000); bancos.py las resume siguiendo el A
# de quien llama. Aqui solo van las de banco FIJO.
PONE_BANCOS = {}

# Los bancos que llevan codigo y el reparto con el que corre (para
# tools/huerfanas.py). Se rellena con lo que mida el trazado.
CODIGO = {0: (1, 2, 3), 1: (1, 2, 3), 2: (1, 2, 3), 3: (1, 2, 3)}


def semillas_iniciales(rom):
    """Los dos unicos puntos de entrada que el hardware garantiza.

    - INIT de la cabecera "AB" (0x402E): lo llama la BIOS al arrancar, con el
      mapper en su estado de encendido (bancos 1, 2 y 3 en 0x6000, 0x8000 y
      0xA000; INIT los vuelve a poner en p00:4082-4091).
    - 0x4BD2: lo que INIT instala en el gancho H.KEYI, con `ld hl,0x4BD2 /
      ld (0xFD9B),hl / ld a,0xC3 / ld (0xFD9A),a` (p00:40E3-40EB).
    """
    init = rom[2] | (rom[3] << 8)
    return [(init, (1, 2, 3), "cabecera AB: INIT"),
            (0x4BD2, (1, 2, 3),
             "gancho de interrupcion H.KEYI: INIT escribe esta direccion en"
             " 0xFD9B y 0xC3 en 0xFD9A (p00:40E3-p00:40EB)")]


# Para tools/reconocimiento.py: las rutinas que escriben un registro del
# mapper con el banco que les llega en A, y el registro que escriben. Las
# tres primeras no tocan A, y Konami las encadena: `ld a,4 / call 4F7B /
# inc a / call 453A` pone el 4 y el 5.
RUTINAS_BANCO = {
    0x4F78: 0x7000,     # p00:4F78  ld (0xE017),a / ld (0x7000),a / ld (0xE202),a / ret
    0x4F7B: 0x7000,     # p00:4F7B  ld (0x7000),a / ld (0xE202),a / ret
    0x453A: 0x9000,     # p00:453A  ld (0xE203),a / ld (0x9000),a / ret
    0x47BE: 0x7000,     # p00:47BE  ld (0xE018),a / call 4F78 / ld hl,0x6000 ...
    0x47CD: 0x7000,     # p00:47CD  call 47BE / ...
    0x47DF: 0x7000,     # p00:47DF  call 47BE / ...
}

# Tablas de bancos: (banco de la tabla, direccion, entradas, paso, registro,
# por que). Las dos van por fase (0xE020) y tienen 20; las dos acaban donde
# empieza codigo (p00:467A `ld hl,0x46BE`, p03:BAF8 `ld a,14 / call 4F78`).
TABLAS_BANCO = [
    (0, 0x4666, 20, 2, 0x7000, "1er banco de graficos de la fase: p00:4293 -> call 47CD"),
    (0, 0x4667, 20, 2, 0x7000, "2o banco de graficos de la fase: p00:429C -> call 47DF"),
    (3, 0xBAE4, 20, 1, 0x7000, "banco de la fase: p03:B592/BB6F -> call 4F78"),
]

# Las rutinas de banco que vuelven con A intacto (tools/bancos.py sigue A a
# traves de ellas).
NO_TOCAN_A = (0x4F78, 0x4F7B, 0x453A)

# Llamadas que van a OTRO cartucho (paginas.OTRO_SLOT): p00:4DEF `call 0x8000`
# con la ranura de 0xE209 puesta en 0x8000-0xBFFF por ENASLT. El trazador no
# las sigue. (banco, pc del call).
LLAMADAS_AJENAS = {(0, 0x4DEF)}
