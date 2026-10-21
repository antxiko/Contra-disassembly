# Contra - commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **Contra** (魂斗羅; Konami, 1989, RC-762) for the MSX2: a 128 KB MegaROM with Konami's SCC mapper, sixteen 8 KB banks.

- **100 %** of the binary explained: 25,069 bytes of code and 106,003 of named data, not a single unassigned byte.
- **40.9 %** of the listing commented, 1,487 routines, none below 10 % comments.
- The listing reassembles into the original ROM **byte for byte**.
- The nineteen stages and the one that is never played, the maps of the four 3D bases, the player and his weapons, the enemies, the bosses, the demo and the ending are **drawn by the cartridge itself**, not captured, and checked against openMSX's VRAM; the music comes from running its own sound engine.

The website: <https://antxiko.github.io/Contra-disassembly/>
(in Spanish: <https://antxiko.github.io/Contra-disassembly/es/>).

## Reproducing it

The cartridge image is not distributed. Put yours in the root as `contra.rom` (sha256 `f823346e...`) and run `make`. The details, in [UNDER THE HOOD](docs/UNDER-THE-HOOD.md).

## Legal

The game belongs to Konami and its rights holders. The licence in `LICENSE` only covers the tools, the comments, the analysis and the documentation here. See [LEGAL-NOTICE.md](LEGAL-NOTICE.md).
