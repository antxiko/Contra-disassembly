# Los enemigos

Los enemigos de cada fase, **una fila por fase** (con el número que sale en pantalla), sacados jugando todas las fases y todos sus tramos (`tools/sprites.py`). De cada tipo de objeto (la rutina de `p02:8000` que lo mueve) van los dos primeros dibujos que salen **con la paleta de la fase ya puesta** (la de `p00:4652`, no la del fundido de entrada), pintados como los pinta el V9938: sprites de 16 x 16 y, cuando dos van seguidos con el bit CC, sus colores sumados. Cada figura va en una casilla del mismo tamaño, apoyada abajo.

Muchos enemigos no son sprites: las torretas, los cañones y los núcleos se pintan en el fondo (`p02:8400`) y se ven en [Las fases](LAS-FASES.html) y en [Los jefes](LOS-JEFES.html). Por eso las fases 3, 12 y 15, tres de las paredes de los jefes, no tienen fila: todo lo que dispara en ellas es del fondo. Las balas del jugador y los demás tipos que no son enemigos (la lista `NO_ENEMIGOS` de `tools/sprites.py`) no salen; las cápsulas sí.

![Los enemigos de cada fase](../imagenes/enemigos.png)
