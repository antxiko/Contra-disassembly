# Las fases

**Diecinueve fases** seguidas: ocho que se recorren de lado, cuatro de subir o bajar, cuatro bases en 3D ([Las bases](LAS-BASES.html)) y, después de cada base, la pared de su jefe. Al acabar la 19 sale el final y el juego vuelve al título. En la ROM hay una vigésima, TRAP HANGAR, con nombre, pantallas y música, que el juego se salta siempre ([Curiosidades](CURIOSIDADES.html)).

Contra no tiene scroll: va **por pantallas**. Al salir por un borde se pinta la siguiente de la lista de la fase (`p03:B58B`). Los mapas están **pintados por el propio cartucho**: cada pantalla la construye su rutina (`p03:BB3C`), ejecutada fuera del emulador, y se ponen en el orden en que el juego pasa de una a otra. La primera pantalla de cada fase se ha cotejado con la VRAM de openMSX: en ocho (la 1, 2, 4, 5, 6, 8, 9 y 11), las 176 líneas iguales byte a byte; en las demás cambian las torretas y otras piezas que la rutina de cada objeto pinta encima del fondo (`p02:8400`), que el mapa no lleva.

Los clips son la partida ejecutada cuadro a cuadro, con el jugador yendo hacia donde va la fase y disparando.

## Fase 1: ASPHALT JUNGLE

La jungla, con el río debajo. Ocho pantallas hacia la derecha; al final, la muralla de la base.

![El mapa de la fase 1](../imagenes/fase_00.png)

![La fase 1 en marcha](../imagenes/clip_00.gif)

## Fase 2: 1ST UNDERPASS

La primera base en 3D ([Las bases](LAS-BASES.html)).

## Fase 3: HOMICIDE CENSOR NO.1

La pared del jefe de la primera base: una sola pantalla.

![La fase 3](../imagenes/fase_02.png)

![La fase 3 en marcha](../imagenes/clip_02.gif)

## Fase 4: HELL FALL

Una cascada, hacia arriba. Ocho pantallas; arriba del todo, la puerta con la cabeza.

![El mapa de la fase 4](../imagenes/fase_03.png)

![La fase 4 en marcha](../imagenes/clip_03.gif)

## Fase 5: 2ND UNDERPASS

La segunda base ([Las bases](LAS-BASES.html)).

## Fase 6: HOMICIDE CENSOR NO.2

La pared del jefe de la segunda base.

![La fase 6](../imagenes/fase_05.png)

![La fase 6 en marcha](../imagenes/clip_05.gif)

## Fase 7: TUNDRA AREA

Bosque nevado y rocas, con un tanque. Ocho pantallas hacia la derecha; al final, un soldado gigante.

![El mapa de la fase 7](../imagenes/fase_06.png)

![La fase 7 en marcha](../imagenes/clip_06.gif)

## Fase 8: ENERGY ZONE

Tuberías y cintas. Siete pantallas hacia la derecha; al final, otra vez el soldado gigante.

![El mapa de la fase 8](../imagenes/fase_07.png)

![La fase 8 en marcha](../imagenes/clip_07.gif)

## Fase 9: ALIEN ZONE

Carne alienígena. Ocho pantallas hacia la derecha; al final, un corazón.

![El mapa de la fase 9](../imagenes/fase_09.png)

![La fase 9 en marcha](../imagenes/clip_09.gif)

## Fase 10: CAVERN

Una cueva, hacia abajo. Ocho pantallas; abajo del todo, un núcleo en la roca.

![El mapa de la fase 10](../imagenes/fase_10.png)

![La fase 10 en marcha](../imagenes/clip_10.gif)

## Fase 11: 1ST UNDER MAZE

La tercera base ([Las bases](LAS-BASES.html)).

## Fase 12: HOMICIDE CENSOR NO.3

La pared del jefe de la tercera base.

![La fase 12](../imagenes/fase_12.png)

![La fase 12 en marcha](../imagenes/clip_12.gif)

## Fase 13: MAGMA AREA

Roca y lava, hacia la izquierda. Ocho pantallas; a la izquierda del todo, un núcleo.

![El mapa de la fase 13](../imagenes/fase_13.png)

![La fase 13 en marcha](../imagenes/clip_13.gif)

## Fase 14: 2ND UNDER MAZE

La cuarta base ([Las bases](LAS-BASES.html)).

## Fase 15: HOMICIDE CENSOR NO.4

La pared del jefe de la cuarta base.

![La fase 15](../imagenes/fase_15.png)

![La fase 15 en marcha](../imagenes/clip_15.gif)

## Fase 16: UNDERGROUND FALL

Otra cueva, hacia abajo. Diez pantallas; abajo, un núcleo.

![El mapa de la fase 16](../imagenes/fase_16.png)

![La fase 16 en marcha](../imagenes/clip_16.gif)

## Fase 17: MAGMA AREA

Otra vez roca y lava, con otro mapa. Siete pantallas hacia la izquierda.

![El mapa de la fase 17](../imagenes/fase_17.png)

![La fase 17 en marcha](../imagenes/clip_17.gif)

## Fase 18: UNDERGROUND FORTRESS

Escaleras y pasarelas, hacia arriba. Ocho pantallas; arriba, un núcleo.

![El mapa de la fase 18](../imagenes/fase_18.png)

![La fase 18 en marcha](../imagenes/clip_18.gif)

## Fase 19: VICIOUS SPACE

La guarida. Ocho pantallas hacia la derecha; al final, el último jefe.

![El mapa de la fase 19](../imagenes/fase_19.png)

![La fase 19 en marcha](../imagenes/clip_19.gif)

## TRAP HANGAR

La que el juego se salta. Sus seis pantallas son la misma ([Curiosidades](CURIOSIDADES.html)).

![Las seis pantallas de TRAP HANGAR](../imagenes/fase_08.png)
