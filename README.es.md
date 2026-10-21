# Contra - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **Contra** (魂斗羅; Konami, 1989, RC-762) para MSX2: un MegaROM de 128 KB con el mapper de Konami con SCC, dieciséis bancos de 8 KB.

- **100 %** del binario explicado: 25.069 bytes de código y 106.003 de datos con nombre, ni un byte sin asignar.
- **40,9 %** del listado comentado, 1.487 rutinas, ninguna por debajo del 10 % de comentarios.
- El listado se reensambla en la ROM original **byte a byte**.
- Las diecinueve fases y la que no se juega, los mapas de las cuatro bases en 3D, el jugador y sus armas, los enemigos, los jefes, la demostración y el final están **pintados por el propio cartucho**, no capturados, y cotejados con la VRAM de openMSX; la música sale de ejecutar su propio motor de sonido.

La web: <https://antxiko.github.io/Contra-disassembly/es/>
(en inglés: <https://antxiko.github.io/Contra-disassembly/>).

## Reproducirlo

La imagen del cartucho no se distribuye. Pon la tuya en la raíz como `contra.rom` (sha256 `f823346e...`) y ejecuta `make`. El detalle, en [POR DENTRO](docs/es/POR-DENTRO.md).

## Legal

El juego es de Konami y de sus titulares. La licencia de `LICENSE` cubre solo las herramientas, los comentarios, el análisis y la documentación de aquí. Mira [AVISO-LEGAL.md](AVISO-LEGAL.md).
