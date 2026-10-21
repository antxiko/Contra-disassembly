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
    (0, 0x5F33): ("suma_puntos", "suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas"),
    (0, 0x5F19): ("suma_100", "suma 1 a los puntos"),
    (0, 0x5F1D): ("suma_200", "suma 2 a los puntos"),
    (0, 0x5F21): ("suma_300", "suma 3 a los puntos"),
    (0, 0x5F25): ("suma_400", "suma 4 a los puntos"),
    (0, 0x5F2D): ("suma_1000", "suma 0x10 a los puntos"),
    (0, 0x5E45): ("colores_ficha", "pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)"),
    (2, 0x8000): ("mueve_sprites", "la rutina del objeto IY (sprite) segun su tipo IY+4 (la tabla de detras)"),
    (2, 0x8063): ("mueve_objetos", "la rutina del objeto IY (de 0xE500) segun su tipo IY+4 (la tabla de detras)"),
    (2, 0x8400): ("pinta_pieza", "pinta en el fondo la pieza DE en la casilla de la ficha (IY+6/IY+7), con p03:BD1F"),
    (2, 0x81B4): ("suma_y", "suma A a la y de la ficha IY"),
    (2, 0x81BB): ("suma_x", "suma A a la x de la ficha IY"),
    (2, 0x8419): ("busca_cuatro", "IX = cuatro fichas libres seguidas en 0xE400 (de dos en dos); acarreo si no hay"),
    (2, 0x843F): ("busca_dos", "IX = dos fichas libres seguidas en 0xE400; acarreo si no hay"),
    (2, 0x8448): ("busca_dos_e380", "IX = dos fichas libres seguidas en 0xE380; acarreo si no hay"),
    (2, 0x8479): ("busca_una", "IX = una ficha libre de 0xE380 (de 19); acarreo si no hay"),
    (2, 0x847E): ("busca_una_de_8", "IX = una ficha libre de 0xE380 (de 8); acarreo si no hay"),
    (2, 0x83C7): ("crea_objeto", "pone en la ficha IX un objeto del tipo C, dibujo B, en la posicion de IY + H (x) y L (y)"),
    (2, 0x8372): ("suma_3000", "suma 0x30 a los puntos"),
    (2, 0x83E9): ("alterna_piezas", "cada A cuadros pinta en el fondo la pieza HL o la DE, por turnos"),
    (2, 0x9085): ("tocado", "si le da un disparo (p00:5AF8 con la caja HL) cuenta un golpe; con mas de A, explota (tipo 0x1D): acarreo"),
    (2, 0x90AD): ("tocado_1c", "como p02:9085, pero al explotar pasa al tipo 0x1C"),
    (2, 0x90B1): ("tocado_1d", "como p02:9085, pero al explotar pasa al tipo 0x1D"),
    (2, 0x9915): ("cuenta_c", "sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)"),
    (2, 0x9921): ("cuenta_d", "lo mismo con la cuenta IY+0D (p02:9915 con IY + 1)"),
    (0, 0x5AF8): ("le_da_un_disparo", "acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY"),
    (2, 0x9FFA): ("pon_figura", "pone la figura HL (dy, dx, dibujo) en la ficha IY y en la de debajo (IY+10, dibujo + 4)"),
    (3, 0xA01A): ("pon_figura_4", "como p02:9FFA y ademas las dos fichas siguientes (IY+20 e IY+30)"),
    (3, 0xA0E4): ("rutina_banco_14", "llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia"),
    (3, 0xA0FF): ("explota", "la ficha IY pasa a ser una explosion (tipo 0x0B)"),
    (0, 0x5CB6): ("paso_de_direccion", "el paso en x y en y de la direccion IY+8 (32 direcciones)"),
    (0, 0x5C75): ("velocidad", "la velocidad A del objeto IY"),
    (0, 0x5C53): ("avanza", "mueve la ficha IY un paso en su direccion"),
    (0, 0x5D1D): ("hacia_el_jugador", "A = la direccion desde la ficha IY hasta el jugador"),
    (0, 0x5A68): ("toca_al_jugador", "acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)"),
    (0, 0x5A5A): ("toca_al_jugador_2", "como p00:5A68 con otro dano"),
    (3, 0xA869): ("espera_c", "cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar"),
    (3, 0xA871): ("espera_c_b", "cada A cuadros (IY+0C) el estado B; acarreo al llegar"),
    (3, 0xA879): ("espera_d", "cada A cuadros (la cuenta IY+0D) el estado siguiente; acarreo al llegar"),
    (3, 0xA881): ("espera_d_b", "cada A cuadros (IY+0D) el estado B; acarreo al llegar"),
    (3, 0xA889): ("libera_4", "libera la ficha IY y las tres siguientes (fuera de la pantalla)"),
    (3, 0xA8A9): ("libera_2", "libera la ficha IY y la de debajo"),
    (3, 0xA8BD): ("libera", "libera la ficha IY (a cero, y fuera de la pantalla)"),
    (3, 0xA7B9): ("dentro_o_fuera", "si la ficha IY sale de la pantalla la libera; acarreo si sigue dentro"),
    (3, 0xA7D5): ("dentro_o_fuera_2", "lo mismo, liberando dos fichas"),
    (3, 0xA7F1): ("dentro_o_fuera_4", "lo mismo con el suelo en 0xA7 (o B), liberando cuatro fichas"),
    (3, 0xB5C6): ("casilla_bajo", "A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)"),
    (3, 0xB4FA): ("hay_suelo", "acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)"),
    (3, 0xB4C3): ("choca_derecha", "acarreo si a la derecha del jugador hay pared (dibujos por debajo de 3)"),
    (3, 0xB52B): ("choca_izquierda", "acarreo si a la izquierda del jugador hay pared"),
    (3, 0xB3A2): ("paso_de_andar", "A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)"),
    (3, 0xBD1F): ("pinta_pieza_en", "pinta la pieza DE en la casilla HL (de 0xC300) con 0xE093 a 1"),
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
    0xE500: ("las fichas de los objetos de la fase (16 bytes)", "p00:5DF8, p02:8063"),
    0xE18B: ("los blancos de la sala que quedan (bases 3D)", "p00:52B4, p03:AFD4"),
    0xE207: ("la pausa (bit 0)", "p00:4EC8"),
    0xE2BF: ("la cuenta de demostraciones (cual toca)", "p00:4203, p00:4277"),
    0xE000: ("1 en una partida de verdad, 0 en la demostracion", "p00:41F6, p00:4234"),
    0xE037: ("los puntos (BCD; el marcador anade 00)", "p00:44FD, p00:5F4C"),
    0xE094: ("1 mientras dura la fase", "p00:4304, p00:4322"),
    0xE183: ("sin vidas: se acaba la partida", "p00:4335, p03:AF3B"),
    0xE184: ("fase superada (1; 2 ya contada)", "p00:432E, p00:4446"),
    0xE1C0: ("cuenta de cuadros (la sube la interrupcion)", "p00:4E47"),
    0xE300: ("las 32 fichas de objeto de 16 bytes (las 4 primeras, el jugador)", "p00:4BBB"),
}
RAM16 = {}

# La ficha del jugador: IX = 0xE320 (p00:42A0), el estado que va detras de sus
# sprites (los registros 0-3 de 0xE300). Los tramos de p03 en los que corre con
# IX en ella sin cargarlo: la rutina del jugador, p03:AE38-B3AE.
CAMPOS_JUGADOR = {
    -0x07: "1 si el jugador ha entrado en el pasillo (bases 3D; p03:AFE2, p03:B0FF)",
    -0x05: "la direccion del empujon del ultimo golpe (p03:AEDE)",
    -0x02: "el parpadeo del jugador (bit 0: sin sprites este cuadro, p00:4B8C)",
    -0x01: "1: ningun sprite en pantalla (p00:4B86)",
    0x05: "la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)",
    0x06: "la fase del salto del jugador (0 en el suelo, 1 subiendo, 2 bajando; p03:B61F)",
    0x07: "la altura del salto del jugador (sube hasta 0x20; p03:B670, p03:B67E)",
    0x19: "hacia donde dispara el jugador (la direccion de la palanca; p03:B7E4)",
    0x0F: "hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123)",
    0x0A: "la y del jugador (p03:B176)",
    0x0B: "la x del jugador (p03:B17A; medida jugando)",
    0x0C: "el dibujo de arriba del jugador (p00:4B54)",
    0x0D: "el dibujo de abajo del jugador (p00:4B6D)",
}
# Los 32 registros de sprite de 0xE300: p00:4BBB copia sus tres primeros bytes
# a la tabla de atributos.
CAMPOS_SPRITE = {0x00: "la y del sprite", 0x01: "la x del sprite", 0x02: "el dibujo del sprite"}
FICHAS = (((0xE320,), {3: ((0xAE38, 0xB3AE),)}, CAMPOS_JUGADOR),
          (tuple(0xE300 + 16 * k for k in range(32) if k != 2), {}, CAMPOS_SPRITE))
