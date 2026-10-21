# Under the hood

## Getting started

This repository does not include the game. It includes the tools that, from your own image of the cartridge, rebuild the commented listing, reassemble it and check that the ROM comes out **byte for byte**.

### What you need

- The image of *Contra* (RC-762), 131,072 bytes, in the root, named `contra.rom`. Its sha256: `f823346e745203ff87dd2a00a414c729a5556e42332489219538d169395ea62a`.
- `make`, `python3` and the `pasmo` assembler.
- For the images and the music, Python with PIL, numpy and lameenc; for the checks, openMSX.

### What to run

    make               # trace, generate the listing, reassemble and run the tests
    make verify        # the sixteen banks against the ROM
    make densidad      # how many instructions carry a comment
    make sanity        # the budget: not a single unassigned byte
    python tools/mapas.py docs/imagenes
    python tools/musica.py todas docs/audio

`make verify` must say `OK: la ROM entera reproducible byte a byte`.

### Where everything is

- `src/contra_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, the comments and the data blocks of each bank. The listing is generated from here.
- `tools/ejecuta.py`: the cartridge really running (Z80, mapper, V9938 and the BIOS calls it uses), which all the images come from.
- `tools/fases.py` and `tools/mapas.py`: the screens and the maps; `tools/anima.py`, `tools/jefes.py`, `tools/armas.py` and `tools/secuencias.py`: the animations; `tools/sprites.py`: the enemies; `tools/textos.py`: the texts; `tools/musica.py`: the music.
- `tools/cobertura.py`: 75 scripted games that record which instructions run and which bytes the code reads; the data is declared from them (`tools/bloques.py`, `tools/lectores.py`).
- `tools/omsx_vram.tcl` and `tools/omsx_psg.tcl`: the openMSX probes everything is checked with.

### The images

Everything comes from **running the cartridge**: each screen is drawn by its own routine with the V9938 commands the program issues, and the animations are the game frame by frame, with the sprites as the V9938 draws them. The screen page has been checked against openMSX's VRAM: the first screen of every stage, the title, the demo, the ending and the weapon menu. The sprites cannot be checked the same way: the game draws lots with the Z80's R register (`ld a,r`), and two runs do not produce the same enemies.

## The cartridge

### The machine

An MSX2: the V9938 in SCREEN 5 (256 x 212, 16 colours), the PSG and the SCC that the cartridge itself carries. The screen is page 0 of the VRAM; the drawings of each stage are loaded into page 1 with the HMMC command (`p00:47BE`) and copied from there, 8 x 8 at a time, with HMMM (`p00:484E`, `p00:486E`). The sprite attributes are at 0x7600 and their colours, line by line, at 0x7400.

### The mapper

Konami's with SCC: sixteen 8 KB banks. Bank 0 is fixed at 0x4000 and bank 3 at 0xA000; 0x6000 is set by `p00:4F78` and `p00:4F7B` (each stage's graphics and data) and 0x8000 by `p00:453A` (2 for the game, 5 for the sound, 12 for the ending, the stage labels and the demos).

### The interrupt

INIT (`p00:402E`) prepares the RAM, sets SCREEN 5 and installs the H.KEYI hook (`p00:4BD2`): the whole game runs in the interrupt, with banks 1 and 2, and then the sound, with 4 and 5. The main program only waits for the stage to end (`p00:4322`) and loads the next one.

### The sound

The engine in bank 4 drives three PSG channels and the SCC ones; there are 60 sounds, with their headers at `p04:6E12`, and the scores live in bank 5. It is the same engine as *King's Valley II*'s, so the comments from that listing have been brought here with `tools/porta.py`, which only carries one over if every address it mentions has its counterpart in this cartridge.

### The RAM

The stage is at `0xE020`, the section (the screen of the stage's list) at `0xE022`, the lives at `0xE021`, the energy at `0xE2C9` and the weapon at `0xE032`. The 32 slots of 16 bytes at `0xE300` are the player (the first four) and the objects. The screen map, 32 x 24 cells, is at `0xC300`, and the sound engine uses memory from `0xC000`.

### The other cartridge

The *Game Master 2*: see [Curiosities](CURIOSITIES.html).

## The code

### The figures

**100 %** of the 131,072 bytes is explained: 25,069 of code and 106,003 of data. The six banks with code have 1,487 routines, and 4,496 of their 10,998 instructions carry a comment: **40.9 %**, with no routine below 10 %.

Data is declared because something reads it: a reader that walks its format, an instruction that points to it or one of the 75 games of `tools/cobertura.py`. The little that nothing reads (leftover code, lists of stages that use another bank, pieces with no screen) is declared as such, with what is in it.

### Where everything is

- bank 0: the interrupt, the banks, graphics loading, the title, the pause, the controls, the *Game Master 2* and the common routines (collisions, movement, score);
- bank 2: the objects: enemies, bosses, capsules;
- bank 3: the player, the bases, the screen builder (`p03:BB3C`) and the weapon menu;
- bank 4: the sound;
- bank 12: the ending, each stage's label, the demos and the texts;
- bank 14: data for some stages and a routine for the bases' creatures;
- banks 1, 5-11, 13 and 15: data only (graphics, scores and stages).

### The names

The names of the routines and of the RAM are in `tools/anotaciones.py`, and `tools/anota.py` carries them to every call and every access in the listing.
