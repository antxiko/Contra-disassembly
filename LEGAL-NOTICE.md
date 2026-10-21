# Legal notice and attribution

*(También disponible [en castellano](AVISO-LEGAL.md).)*

## Who owns what

**The game is not ours.** *Contra* (魂斗羅) was published by **Konami** for the MSX2 in 1989; its catalogue number is **RC-762** and it is 128 KB. All rights in the game remain with their holders.

**What is ours** are the tools in this repository, the comments in the listing, the analysis and the documentation. That is published under the licence in `LICENSE`.

## What this repository contains

The files `src/contra_pNN.asm` are the commented disassembly of the cartridge's sixteen banks. They are published for the **preservation, study and documentation** of a title that is part of the history of MSX software.

The cartridge image (`.rom`) is **not** distributed here. Anyone who wants to rebuild the listing must supply their own, and the `Makefile` checks its sha256 before doing anything.

The images in `docs/imagenes/` are neither illustrations brought from elsewhere nor screenshots: they are drawn by the cartridge itself, run outside the emulator, and checked against openMSX's VRAM.

## What it is based on

Everything stated here comes from reading this binary, and every statement carries its evidence alongside: the instruction that reads a piece of data or the table that closes where it has to close. What is not settled is said not to be.

## If you are one of the authors

If you worked on *Contra* or hold rights in the game, and would rather this material were not published, **say so and it will be taken down, no questions asked**. The intention of this work is the very opposite of harming you: it is to leave a record of how it was made.
