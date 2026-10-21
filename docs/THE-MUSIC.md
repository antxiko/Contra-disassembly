# The music

The cartridge's **11 tunes**, taken **by running its own sound engine** outside the emulator (`tools/musica.py`), as MP3. Music only; no sound effects.

The engine (bank 4) is the same as *King's Valley II*'s: 1,680 of its 1,681 instructions match, and the comments were brought over from that listing ([Under the hood](UNDER-THE-HOOD.html)). It plays through the PSG and the cartridge's SCC.

All of them have been checked against what the cartridge really writes to the PSG and the SCC in openMSX, frame by frame: the seven stage tunes, 0x0E and 0x10, **identical in full**; 0x02 in its first 229 frames (of 323), and 0x0F in 289 (of 458).

### 0x02 The title screen

*Requested by `p00:41D4`, after writing PUSH SPACE KEY.*

<audio controls preload="none" src="audio/musica_02.mp3?v=d240cec6"></audio>

### 0x03 Asphalt Jungle, Cavern and Underground Fortress (stages 1, 10 and 18); also the ending

*Requested by `p00:4316` with the table `p00:4356` (0x09, stage 18's, is the same: its header points to the same scores), and `p00:44EB` for the ending.*

<audio controls preload="none" src="audio/musica_03.mp3?v=91c20038"></audio>

### 0x04 The bases: Underpass and Under Maze (stages 2, 5, 11 and 14)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_04.mp3?v=b1ad4e6e"></audio>

### 0x05 Homicide Censor, the base boss walls (stages 3, 6, 12 and 15)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_05.mp3?v=57366b87"></audio>

### 0x06 Hell Fall and Underground Fall (stages 4 and 16)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_06.mp3?v=6d7cc0e4"></audio>

### 0x07 Tundra Area (stage 7)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_07.mp3?v=8befde19"></audio>

### 0x08 Energy Zone and Magma Area (stages 8, 13 and 17)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_08.mp3?v=9d877691"></audio>

### 0x0A Alien Zone and Vicious Space (stages 9 and 19)

*Requested by `p00:4316`, with the table `p00:4356`.*

<audio controls preload="none" src="audio/musica_0A.mp3?v=03516919"></audio>

### 0x0E Boss destroyed

*Requested by `p02:892B`.*

<audio controls preload="none" src="audio/musica_0E.mp3?v=757c3c21"></audio>

### 0x0F The last boss destroyed (stage 19)

*Requested by `p02:8931`.*

<audio controls preload="none" src="audio/musica_0F.mp3?v=dd432ed4"></audio>

### 0x10 Game over

*Requested by `p00:441E`, after writing GAME OVER.*

<audio controls preload="none" src="audio/musica_10.mp3?v=c9c5f20b"></audio>
