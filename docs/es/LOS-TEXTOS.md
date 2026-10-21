# Los textos

Todos los textos están en inglés, con la letra de 8 x 8 del cartucho, que está en la página 0 de la VRAM a partir de la línea 0xD8: 0x00-0x09 las cifras, 0x10 el espacio, 0x11-0x2A la A-Z, 0x0A ©, 0x0B una flecha y 0x2B-0x31 `/ . - " ! ? '`. Cada byte de una cadena es el número de su dibujo, y la cadena acaba en 0xFF (`p00:48D3`). Las imágenes están **dibujadas desde los bytes de la ROM** con esa letra (`tools/textos.py`).

## El marcador

`p00:4632-4651` y `p00:4508`.

![El marcador](../imagenes/textos_marcador.png)

## El título y el fin de la partida

`p00:502B-5050`.

![El título](../imagenes/textos_titulo.png)

## Las armas y la pausa

`p00:53AF-53EA`.

![Las armas](../imagenes/textos_armas.png)

## Grabar y cargar

Los avisos de grabar y cargar la partida en el *Game Master 2* (`p00:53EB-54C9`), con dos erratas del cartucho: FILE ALREADY EXIT y UNFORMATED.

![Grabar y cargar](../imagenes/textos_grabar.png)

## Los nombres de las fases

La tabla `p12:974C`: veinte punteros, uno por fase, también la que el juego se salta (TRAP HANGAR). MAGMA AREA sale dos veces.

![Los nombres de las fases](../imagenes/textos_fases.png)

## El final

`p12:9622-974B`.

![El texto del final](../imagenes/textos_final.png)

    WELL DONE!
    YOU HAVE COMPLETED YOUR MISSION.
    YOU HAVE SUCCESSFULLY FOILED RED FALCON'S WICKED PLAN " ARMAGEDDON "
    NOW WE CAN LIVE AT PEACE AGAIN.
    ...BUT A TERRIBLE DOUBT REMAINS. ARE THE ALIENS REALLY DESTROYED ...OR NOT ?
    THIS IS A DIRE POSSIBILITY WHICH MUST BE INVESTIGATED BEFORE IT'S TOO LATE.

¡Bien hecho! Has cumplido tu misión. Has desbaratado el malvado plan «Armagedón» de Red Falcon. Ya podemos volver a vivir en paz. ...Pero queda una duda terrible: ¿de verdad están destruidos los alienígenas... o no? Es una posibilidad grave, y hay que investigarla antes de que sea tarde.
