# Los enemigos

Cada objeto del juego es una ficha de 16 bytes en `0xE300` (el jugador son las cuatro primeras) con un **tipo** (`IY+4`): el número de la rutina que lo mueve, de la tabla `p02:8000`. La hoja junta lo que se ha visto de cada tipo jugando **todas las fases y todos sus tramos** (`tools/sprites.py`), con los sprites como los pinta el V9938: cada uno de 16 x 16 y, cuando dos van seguidos con el bit CC, sus colores sumados. Una fila por tipo; un mismo tipo puede llevar dibujos distintos en cada fase.

Muchos enemigos no son sprites: las torretas, los cañones y los núcleos se pintan en el fondo (`p02:8400`), y se ven en [Las fases](LAS-FASES.html) y en [Los jefes](LOS-JEFES.html).

![Los enemigos, por tipo](../imagenes/enemigos.png)

Las balas del jugador y los demás tipos que no son enemigos (la lista `NO_ENEMIGOS` de `tools/sprites.py`) no salen en la hoja.
