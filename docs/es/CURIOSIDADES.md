# Curiosidades

## TRAP HANGAR, la fase que no se juega

La tabla de fases tiene veinte, pero al acabar la 8 (ENERGY ZONE) el juego se salta la siguiente y pasa a la 9 (`p00:449A`). El número que sale en pantalla no deja hueco: hasta la 8 es la fase más uno, y desde la 9 la propia fase (`p00:4576`).

La que falta se llama **TRAP HANGAR** (`p12:97FA`) y tiene sus bancos de gráficos (`p00:4666`), su música (la 0x09, la misma que la 0x03) y una lista de seis pantallas (de la 0x1F a la 0x24). Pero las seis apuntan a **las mismas órdenes**, `p14:7D76`, que son el fondo con el que empiezan las pantallas 0x25 y 0x26 de ALIEN ZONE (las dos abren con `FE 76 7D`) ([Las fases](LAS-FASES.html)). Puesta a mano en openMSX (`0xE020` = 8), la pantalla se queda en negro.

## El menú de armas no está en la pausa

F1 solo pone PAUSE. El menú de armas lo abre una cápsula, la de dibujo 0x2C (`p02:958D`), medido en el emulador ([El jugador](EL-JUGADOR.html)).

## Armas que el menú no da

El arma está en `0xE032`. Aparte de ponerla a 0 al empezar y al perder una vida, solo la escribe el menú (`p03:BF82`), con la tabla `p03:BFAB`: 0 NORMAL, 3 MACHINE, 5 REAR, 1 LASER y 2 FIRE. Aun así, el disparo tiene casos para las armas 6 y 7: como la LASER, solo dos disparos a la vez (`p03:B990`), y en las bases, una bala distinta hacia el fondo (`p03:B9FE`). Con ninguna fila del menú se llega a ellas, ni a la 4.

## Salas a las que no se llega

En las bases hay salas que **ninguna puerta lleva**: la 3 de la fase 2, la 2 y la 6 de la 5, la 2 y la 7 de la 11, y seis de las catorce de la 14. Tienen pantalla y objetos ([Las bases](LAS-BASES.html)).

## La última base pide más

En la primera sala de las bases se entra en el pasillo sin romper nada. En la de la 14, no: hay que romper los blancos (`p03:AFC7-AFD8`).

## La fase 19, dos veces

Al romper un jefe, el juego mira si la fase es la 19 para poner la música del último jefe. Lo mira dos veces seguidas, con la misma comparación (`p02:8923` y `p02:8927`).

## La partida en el Game Master 2

Al arrancar, Contra busca en cada ranura un cartucho con una Y en 0x4010 (`p00:4D9E`): el *Game Master 2*. Si está, en la pausa la tecla S graba la partida en su SRAM, en un fichero que se llama CONTRA (`p00:4D1A`; órdenes 0x0A y 0x0B de su `p04:8000`), y la L la carga: la fase en marcha se da por superada y se pasa a la grabada (`p00:4D03`). Se graban las vidas, la fase, la energía y la pantalla (`0xE03A-0xE03E`); en las bases, la pantalla no se usa: se empieza en la primera sala (`p00:44B9`).

Contra lee el error que le devuelve el *Game Master 2* (`p00:4D6A`) y saca su mensaje. Medido en openMSX con la SRAM sin formatear: S responde UNFORMATED.

## Dos erratas

Dos de los mensajes de grabar dicen FILE ALREADY EXIT y UNFORMATED ([Los textos](LOS-TEXTOS.html)).

## La música, una vez más

La música 0x09, la de la fase 18 (y la de TRAP HANGAR), es la 0x03: su cabecera (`p04:6F08`) apunta a las mismas partituras que la de la 0x03 (`p04:6EB4`).

## Lo que queda abierto

- Por qué TRAP HANGAR se queda en negro, y si llegó a tener pantallas propias.
- Qué hacen las armas 4, 6 y 7.
- En qué fases sale la cápsula del menú de armas.
- La grabación en el *Game Master 2* con la SRAM formateada: sin probar.
