# Aviso legal y atribución

*(Also available [in English](LEGAL-NOTICE.md).)*

## De quién es cada cosa

**El juego no es nuestro.** *Contra* (魂斗羅) lo publicó **Konami** para MSX2 en 1989; su número de catálogo es **RC-762** y son 128 KB. Todos los derechos sobre el juego siguen siendo de sus titulares.

**Lo que sí es nuestro** son las herramientas de este repositorio, los comentarios del listado, el análisis y la documentación. Eso se publica con la licencia de `LICENSE`.

## Qué hay en este repositorio

Los ficheros `src/contra_pNN.asm` son el desensamblado comentado de los dieciséis bancos del cartucho. Se publican para la **preservación, el estudio y la documentación** de un título que es parte de la historia del software del MSX.

La imagen del cartucho (`.rom`) **no** se distribuye aquí. Quien quiera volver a montar el listado tiene que poner la suya, y el `Makefile` comprueba su sha256 antes de hacer nada.

Las imágenes de `docs/imagenes/` no son ilustraciones traídas de fuera ni capturas: las pinta el propio cartucho, ejecutado fuera del emulador, y se cotejan con la VRAM de openMSX.

## En qué se apoya

Todo lo que se afirma aquí sale de leer este binario, y cada afirmación lleva su evidencia al lado: la instrucción que lee un dato o la tabla que cierra donde tiene que cerrar. Lo que no está cerrado se dice que no lo está.

## Si eres uno de los autores

Si trabajaste en *Contra* o tienes derechos sobre el juego, y preferirías que este material no estuviera publicado, **dilo y se retira, sin discusión**. La intención de este trabajo es justo la contraria de perjudicarte: es dejar constancia de cómo se hizo.
