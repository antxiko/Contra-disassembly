# Por dentro

## Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu propia imagen del cartucho, vuelven a montar el listado comentado, lo reensamblan y comprueban que sale la ROM **byte a byte**.

### Lo que hace falta

- La imagen de *Contra* (RC-762), 131.072 bytes, en la raíz con el nombre `contra.rom`. Su sha256: `f823346e745203ff87dd2a00a414c729a5556e42332489219538d169395ea62a`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes y la música, Python con PIL, numpy y lameenc; para los cotejos, openMSX.

### Lo que se ejecuta

    make               # traza, genera el listado, reensambla y pasa los tests
    make verify        # los dieciséis bancos contra la ROM
    make densidad      # cuántas instrucciones llevan comentario
    make sanity        # el presupuesto: ni un byte sin asignar
    python tools/mapas.py docs/imagenes
    python tools/musica.py todas docs/audio

`make verify` tiene que decir `OK: la ROM entera reproducible byte a byte`.

### Dónde está cada cosa

- `src/contra_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de cada banco. El listado se genera desde aquí.
- `tools/ejecuta.py`: el cartucho ejecutado de verdad (Z80, mapper, V9938 y la BIOS que usa), del que salen las imágenes.
- `tools/fases.py` y `tools/mapas.py`: las pantallas y los mapas; `tools/anima.py`, `tools/jefes.py`, `tools/armas.py` y `tools/secuencias.py`: las animaciones; `tools/sprites.py`: los enemigos; `tools/textos.py`: los textos; `tools/musica.py`: la música.
- `tools/cobertura.py`: 75 partidas jugadas por guion que apuntan qué instrucciones corren y qué bytes lee el código; con ellas se declaran los datos (`tools/bloques.py`, `tools/lectores.py`).
- `tools/omsx_vram.tcl` y `tools/omsx_psg.tcl`: las sondas de openMSX con las que se coteja todo.

### Las imágenes

Todo sale de **ejecutar el cartucho**: cada pantalla la pinta su propia rutina con las órdenes del V9938 que da el programa, y las animaciones son la partida cuadro a cuadro, con los sprites como los pinta el V9938. La página de la pantalla se ha cotejado con la VRAM de openMSX: la primera pantalla de cada fase, el título, la demostración, el final y el menú de armas. Los sprites no se pueden cotejar igual: el juego echa a suertes con el registro R del Z80 (`ld a,r`), y en dos ejecuciones no salen los mismos enemigos.

## El cartucho

### La máquina

Un MSX2: el V9938 en SCREEN 5 (256 x 212, 16 colores), el PSG y el SCC que lleva el propio cartucho. La pantalla es la página 0 de la VRAM; los dibujos de cada fase se cargan en la página 1 con la orden HMMC (`p00:47BE`) y de ahí se copian, de 8 x 8 en 8 x 8, con HMMM (`p00:484E`, `p00:486E`). Los atributos de sprite están en 0x7600 y sus colores, línea a línea, en 0x7400.

### El mapper

Es el de Konami con SCC: dieciséis bancos de 8 KB. El 0 está fijo en 0x4000 y el 3 en 0xA000; 0x6000 lo cambian `p00:4F78` y `p00:4F7B` (los gráficos y los datos de cada fase) y 0x8000 `p00:453A` (el 2 para el juego, el 5 para el sonido, el 12 para el final, los rótulos y las demostraciones).

### La interrupción

INIT (`p00:402E`) prepara la RAM, pone SCREEN 5 e instala el gancho H.KEYI (`p00:4BD2`): todo el juego corre en la interrupción, con los bancos 1 y 2, y luego el sonido, con el 4 y el 5. El programa principal solo espera a que la fase se acabe (`p00:4322`) y carga la siguiente.

### El sonido

El motor del banco 4 lleva tres canales del PSG y los del SCC; hay 60 sonidos, con su cabecera en `p04:6E12`, y las partituras van en el banco 5. Es el mismo motor de *King's Valley II*, así que los comentarios de su listado se han traído aquí con `tools/porta.py`, que los lleva solo si cada dirección que citan tiene su pareja en este cartucho.

### La RAM

La fase está en `0xE020`, el tramo (la pantalla de la lista de la fase) en `0xE022`, las vidas en `0xE021`, la energía en `0xE2C9` y el arma en `0xE032`. Las 32 fichas de 16 bytes de `0xE300` son el jugador (las cuatro primeras) y los objetos. El mapa de la pantalla, 32 x 24 casillas, va en `0xC300`, y el motor de sonido usa desde `0xC000`.

### El otro cartucho

El *Game Master 2*: ver [Curiosidades](CURIOSIDADES.html).

## El código

### Las cifras

El **100 %** de los 131.072 bytes está explicado: 25.069 de código y 106.003 de datos. Los seis bancos con código tienen 1.487 rutinas, y 4.496 de sus 10.998 instrucciones llevan comentario: el **40,9 %**, sin ninguna rutina por debajo del 10 %.

Los datos se declaran porque algo los lee: un lector que recorre su formato, una instrucción que los apunta o una de las 75 partidas de `tools/cobertura.py`. Lo poco que no lee nada (restos de código, listas de fases que usan otro banco, piezas sin pantalla) está declarado así, con lo que hay dentro.

### Dónde está cada cosa

- banco 0: la interrupción, los bancos, la carga de gráficos, el título, la pausa, los mandos, el *Game Master 2* y las rutinas comunes (choques, pasos, puntos);
- banco 2: los objetos: enemigos, jefes, cápsulas;
- banco 3: el jugador, las bases, el constructor de pantallas (`p03:BB3C`) y el menú de armas;
- banco 4: el sonido;
- banco 12: el final, el rótulo de cada fase, las demostraciones y los textos;
- banco 14: los datos de unas fases y una rutina de los bichos de las bases;
- bancos 1, 5-11, 13 y 15: solo datos (gráficos, partituras y fases).

### Los nombres

Los nombres de las rutinas y de la RAM están en `tools/anotaciones.py`, y `tools/anota.py` los lleva a cada llamada y a cada acceso del listado.

## Código compartido con otros cartuchos de Konami

Este desensamblado se ha comparado, instrucción por instrucción, con
todos los demás de Konami de la serie. Cuenta un bloque cuando las
mismas instrucciones, al menos seis desde una etiqueta hasta su `ret`
o su salto sin condición, están en los dos cartuchos; las direcciones
no se miran, porque cambian de un cartucho a otro. De los otros 57,
**13** tienen al menos un bloque en común con este; estos son los
que más comparten:

| Cartucho | Bloques | Instrucciones | Por ejemplo (aquí = allí) |
|---|---:|---:|---|
| [King's Valley II](https://antxiko.github.io/KingsValley2-disassembly/es/) | 66 | 1.277 | p04:6CED |
| [The Pro Yakyuu Gekitotsu Pennant Race](https://antxiko.github.io/PennantRace-disassembly/es/) | 56 | 1.007 | p04:6516 = `nota_empieza` |
| [Parodius](https://antxiko.github.io/Parodius-disassembly/es/) | 53 | 1.010 | p04:679B = `orden` |
| [Salamander - Operation X](https://antxiko.github.io/Salamander-disassembly/es/) | 50 | 941 | `lee_tabla` (p00:51B8) = `byte_de_tabla` |
| [Nemesis 3 - The Eve of Destruction](https://antxiko.github.io/Nemesis3-disassembly/es/) | 46 | 805 | `lee_tabla` (p00:51B8) = `lee_byte` |
| [F-1 Spirit — The Way to Formula 1](https://antxiko.github.io/F1Spirit-disassembly/es/) | 39 | 738 | p04:6412 = `NOTA_CRUDA` |
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/es/) | 36 | 570 | p04:68A0 = `orden_eb` |
| [Nemesis 2](https://antxiko.github.io/Nemesis2-disassembly/es/) | 26 | 467 | `lee_tabla` (p00:51B8) = `byte_a` |
| [Shalom: Knightmare III](https://antxiko.github.io/Shalom-disassembly/es/) | 24 | 328 | p04:68A0 = `orden_eb` |
| [Konami’s Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/es/) | 23 | 295 | p04:6B08 = `sonido_envolvente` |

La matriz entera, los 58 cartuchos entre sí, está en
[Las rutinas](https://antxiko.github.io/MSX-disassembly-database/es/LAS-RUTINAS.html) de la base de datos de la
serie, con el método y el programa que la mide.
