# La música

Las **11 músicas** del cartucho, sacadas **ejecutando su propio motor de sonido** fuera del emulador (`tools/musica.py`), a MP3. Solo músicas; los efectos no.

El motor (banco 4) es el mismo de *King's Valley II*: casan 1.680 de sus 1.681 instrucciones, y sus comentarios se han traído de aquel listado ([Por dentro](POR-DENTRO.html)). Suena por el PSG y por el SCC del cartucho.

Todas están cotejadas con lo que el cartucho escribe de verdad en el PSG y el SCC en openMSX, cuadro a cuadro: las siete de las fases y la 0x0E y la 0x10, **iguales enteras**; la 0x02, en sus 229 primeros cuadros (de 323), y la 0x0F, en 289 (de 458).

### 0x02 El título

*La pide `p00:41D4`, tras escribir PUSH SPACE KEY.*

<audio controls preload="none" src="../audio/musica_02.mp3?v=d240cec6"></audio>

### 0x03 Asphalt Jungle, Cavern y Underground Fortress (fases 1, 10 y 18); también el final

*La pide `p00:4316` con la tabla `p00:4356` (la 0x09, la de la fase 18, es la misma: su cabecera apunta a las mismas partituras), y `p00:44EB` para el final.*

<audio controls preload="none" src="../audio/musica_03.mp3?v=91c20038"></audio>

### 0x04 Las bases: Underpass y Under Maze (fases 2, 5, 11 y 14)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_04.mp3?v=b1ad4e6e"></audio>

### 0x05 Homicide Censor, las paredes del jefe de la base (fases 3, 6, 12 y 15)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_05.mp3?v=57366b87"></audio>

### 0x06 Hell Fall y Underground Fall (fases 4 y 16)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_06.mp3?v=6d7cc0e4"></audio>

### 0x07 Tundra Area (fase 7)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_07.mp3?v=8befde19"></audio>

### 0x08 Energy Zone y Magma Area (fases 8, 13 y 17)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_08.mp3?v=9d877691"></audio>

### 0x0A Alien Zone y Vicious Space (fases 9 y 19)

*La pide `p00:4316`, con la tabla `p00:4356`.*

<audio controls preload="none" src="../audio/musica_0A.mp3?v=03516919"></audio>

### 0x0E Jefe destruido

*La pide `p02:892B`.*

<audio controls preload="none" src="../audio/musica_0E.mp3?v=757c3c21"></audio>

### 0x0F El último jefe destruido (fase 19)

*La pide `p02:8931`.*

<audio controls preload="none" src="../audio/musica_0F.mp3?v=dd432ed4"></audio>

### 0x10 Fin de la partida

*La pide `p00:441E`, tras escribir GAME OVER.*

<audio controls preload="none" src="../audio/musica_10.mp3?v=c9c5f20b"></audio>
