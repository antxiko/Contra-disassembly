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

RUTINAS = {
    # --- banco 0: arranque, interrupcion, bancos, VDP ---
    (0, 0x402E): ("init", "el arranque del cartucho (INIT de la cabecera AB): RAM a cero, bancos 0-1-2-3, SCREEN 5, sonido y bucle"),
    (0, 0x4117): ("bucle_partida", "el bucle de cada partida: titulo, demostracion o juego"),
    (0, 0x4277): ("carga_fase", "carga la fase de 0xE020: paleta, graficos (p00:4666), pantalla y musica"),
    (0, 0x436A): ("pon_colores", "pone A en los colores de la BIOS (0xF3E9-0xF3EB) y llama a CHGCLR"),
    (0, 0x452D): ("devuelve_banco_8000", "devuelve a 0x8000 el banco guardado en 0xE2CC"),
    (0, 0x4532): ("pon_banco_12", "guarda en 0xE2CC el banco de 0x8000 y pone el 12"),
    (0, 0x453A): ("pon_banco_8000", "pone el banco A en 0x8000 (y su copia en 0xE203)"),
    (0, 0x4629): ("borra", "pone a cero BC bytes desde HL"),
    (0, 0x468E): ("pon_paleta", "pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM"),
    (0, 0x47BE): ("carga_graficos", "pone el banco A en 0x6000 y lo copia entero a la VRAM con HMMC"),
    (0, 0x47CD): ("carga_graficos_arriba", "copia el banco A a la VRAM en la linea 0 de la pagina de dibujos"),
    (0, 0x47DF): ("carga_graficos_abajo", "copia el banco A a la VRAM en la linea 0x40 de la pagina de dibujos"),
    (0, 0x484E): ("orden_copia", "prepara en 0xE0D0 la orden HMMM de copiar un dibujo de 8 x 8"),
    (0, 0x486E): ("pinta_dibujo", "pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla"),
    (0, 0x48D3): ("escribe", "escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8"),
    (0, 0x48E6): ("borra_partida", "pantalla apagada, mapa 0xC300 a 0x10 y RAM de la partida a cero"),
    (0, 0x4BBB): ("copia_sprites", "copia y, x y dibujo de las 32 fichas de 0xE300 a la tabla de 0xE100"),
    (0, 0x4B86): ("vuelca_sprites", "lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)"),
    (0, 0x4BD2): ("interrupcion", "la interrupcion (H.KEYI): el cuadro del juego con los bancos 1-2 y el sonido con 4-5"),
    (0, 0x4F5E): ("lee_palanca", "lee las dos palancas (GTSTCK 0 y 1) y deja la direccion en 0xE180"),
    (0, 0x4F78): ("pon_banco_6000_graficos", "apunta A en 0xE017 y lo pone en 0x6000"),
    (0, 0x4F7B): ("pon_banco_6000", "pone el banco A en 0x6000 (y su copia en 0xE202)"),
    (0, 0x4FD2): ("lee_disparo", "el disparo: GTTRIG(1) o el espacio (fila 8 de SNSMAT), en 0xE066"),
    (0, 0x5052): ("pide_sonido", "pide el sonido A al motor (p04:6003, con los bancos 4-5)"),
    (0, 0x507B): ("orden_vdp", "manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe"),
    (0, 0x50C5): ("borra_vram_ff", "llena de 0xFF los 0x6800 primeros bytes de la VRAM"),
    (0, 0x50CC): ("borra_vram", "pone a cero los 0x6A00 primeros bytes de la VRAM"),
    (0, 0x50D6): ("apaga_pantalla", "apaga la pantalla (DISSCR)"),
    (0, 0x51B2): ("borra_b", "pone a cero B bytes desde HL"),
    (0, 0x51B8): ("lee_tabla", "HL = HL + A y A = (HL)"),
    (0, 0x531B): ("es_base_3d", "acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)"),
    # --- banco 3: las pantallas ---
    (3, 0xA03E): ("despacha_estado", "salta por la tabla que va detras del call, con el estado del objeto (IY+5)"),
    (3, 0xA041): ("despacha_e", "salta por la tabla que va detras del call, con el indice en E"),
    (3, 0xB14A): ("sale_izquierda", "en una base: sale por la puerta izquierda a la sala de la tabla (FF: no hay)"),
    (3, 0xB191): ("sale_derecha", "en una base: sale por la puerta derecha a la sala de la tabla (FF: no hay)"),
    (3, 0xB58B): ("cambia_tramo", "suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no"),
    (3, 0xBB0C): ("pantalla_nueva", "construye la pantalla del tramo y sus objetos"),
    (3, 0xBB3C): ("construye_pantalla", "construye la pantalla del tramo 0xE022: mapa 0xC300 y dibujos en la VRAM"),
}
RAM = {
    0xC300: ("el mapa de la pantalla: 32 x 24 dibujos", "p03:BB59, p03:BCE8"),
    0xE006: ("1 en la demostracion (la palanca sale de su grabacion)", "p00:4F82"),
    0xE008: ("el puntero de la grabacion de la demostracion", "p00:4FA2, p00:4FC1"),
    0xE00A: ("los cuadros que le quedan al paso de la demostracion", "p00:4F97"),
    0xE017: ("el banco de graficos puesto en 0x6000", "p00:4F78"),
    0xE018: ("el banco de graficos que se carga", "p00:47BE"),
    0xE01F: ("la fila de la hoja de dibujos (0xD8 la de las letras)", "p00:48C8, p00:488F"),
    0xE020: ("la fase (0-19; la 8 se salta)", "p00:4496-44A2"),
    0xE021: ("las vidas que quedan (en BCD)", "p00:4261, p03:AF2C"),
    0xE022: ("el tramo: la pantalla de la lista de la fase", "p03:BB8F, p03:B58B"),
    0xE066: ("el disparo pulsado", "p00:4FF1"),
    0xE0D0: ("la orden del VDP que se manda (registros 32-46)", "p00:507B"),
    0xE100: ("la copia de los atributos de sprite (32 x 4 bytes)", "p00:4BBB, p00:4BA4"),
    0xE180: ("la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)", "p00:4F74"),
    0xE181: ("la palanca 0 (los cursores)", "p00:4F62"),
    0xE202: ("la copia del banco de 0x6000", "p00:4F7E"),
    0xE203: ("la copia del banco de 0x8000", "p00:453A"),
    0xE208: ("la ranura del cartucho (para devolverla tras usar el otro)", "p00:4093, p00:4DF3"),
    0xE209: ("la ranura del otro cartucho (el que contesta Y y Z por RDSLT)", "p00:4DBE"),
    0xE2C9: ("la energia del jugador", "p00:4266, p03:AF11"),
    0xE2CC: ("el banco de 0x8000 guardado al poner el 12", "p00:4535"),
    0xE300: ("las 32 fichas de objeto de 16 bytes (las 4 primeras, el jugador)", "p00:4BBB"),
}
RAM16 = {}
FICHAS = ()
