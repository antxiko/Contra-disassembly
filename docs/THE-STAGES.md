# The stages

**Nineteen stages** in a row: eight you cross sideways, four that go up or down, four 3D bases ([The bases](THE-BASES.html)) and, after each base, the wall of its boss. After stage 19 comes the ending and the game goes back to the title. The ROM holds a twentieth, TRAP HANGAR, with a name, screens and music, which the game always skips ([Curiosities](CURIOSITIES.html)).

Contra does not scroll: it goes **screen by screen**. Leaving through an edge draws the next one in the stage's list (`p03:B58B`). The maps are **drawn by the cartridge itself**: each screen is built by its own routine (`p03:BB3C`), run outside the emulator, and they are laid out in the order the game goes from one to the next. The first screen of every stage has been checked against openMSX's VRAM: in eight (1, 2, 4, 5, 6, 8, 9 and 11) all 176 lines are identical byte for byte; in the rest, what changes are the turrets and other pieces that each object's routine draws over the background (`p02:8400`), which the map does not include.

The clips are the game run frame by frame, with the player heading the way the stage goes and firing.

## Stage 1: ASPHALT JUNGLE

The jungle, with the river below. Eight screens to the right; at the end, the base's wall.

![The map of stage 1](imagenes/fase_00.png)

![Stage 1 running](imagenes/clip_00.gif)

## Stage 2: 1ST UNDERPASS

The first 3D base ([The bases](THE-BASES.html)).

## Stage 3: HOMICIDE CENSOR NO.1

The wall of the first base's boss: a single screen.

![Stage 3](imagenes/fase_02.png)

![Stage 3 running](imagenes/clip_02.gif)

## Stage 4: HELL FALL

A waterfall, going up. Eight screens; at the very top, the gate with the head.

![The map of stage 4](imagenes/fase_03.png)

![Stage 4 running](imagenes/clip_03.gif)

## Stage 5: 2ND UNDERPASS

The second base ([The bases](THE-BASES.html)).

## Stage 6: HOMICIDE CENSOR NO.2

The wall of the second base's boss.

![Stage 6](imagenes/fase_05.png)

![Stage 6 running](imagenes/clip_05.gif)

## Stage 7: TUNDRA AREA

Snowy forest and rocks, with a tank. Eight screens to the right; at the end, a giant soldier.

![The map of stage 7](imagenes/fase_06.png)

![Stage 7 running](imagenes/clip_06.gif)

## Stage 8: ENERGY ZONE

Pipes and conveyors. Seven screens to the right; at the end, the giant soldier again.

![The map of stage 8](imagenes/fase_07.png)

![Stage 8 running](imagenes/clip_07.gif)

## Stage 9: ALIEN ZONE

Alien flesh. Eight screens to the right; at the end, a heart.

![The map of stage 9](imagenes/fase_09.png)

![Stage 9 running](imagenes/clip_09.gif)

## Stage 10: CAVERN

A cave, going down. Eight screens; at the very bottom, a core in the rock.

![The map of stage 10](imagenes/fase_10.png)

![Stage 10 running](imagenes/clip_10.gif)

## Stage 11: 1ST UNDER MAZE

The third base ([The bases](THE-BASES.html)).

## Stage 12: HOMICIDE CENSOR NO.3

The wall of the third base's boss.

![Stage 12](imagenes/fase_12.png)

![Stage 12 running](imagenes/clip_12.gif)

## Stage 13: MAGMA AREA

Rock and lava, going left. Eight screens; at the far left, a core.

![The map of stage 13](imagenes/fase_13.png)

![Stage 13 running](imagenes/clip_13.gif)

## Stage 14: 2ND UNDER MAZE

The fourth base ([The bases](THE-BASES.html)).

## Stage 15: HOMICIDE CENSOR NO.4

The wall of the fourth base's boss.

![Stage 15](imagenes/fase_15.png)

![Stage 15 running](imagenes/clip_15.gif)

## Stage 16: UNDERGROUND FALL

Another cave, going down. Ten screens; at the bottom, a core.

![The map of stage 16](imagenes/fase_16.png)

![Stage 16 running](imagenes/clip_16.gif)

## Stage 17: MAGMA AREA

Rock and lava again, with a different map. Seven screens to the left.

![The map of stage 17](imagenes/fase_17.png)

![Stage 17 running](imagenes/clip_17.gif)

## Stage 18: UNDERGROUND FORTRESS

Ladders and walkways, going up. Eight screens; at the top, a core.

![The map of stage 18](imagenes/fase_18.png)

![Stage 18 running](imagenes/clip_18.gif)

## Stage 19: VICIOUS SPACE

The lair. Eight screens to the right; at the end, the last boss.

![The map of stage 19](imagenes/fase_19.png)

![Stage 19 running](imagenes/clip_19.gif)

## TRAP HANGAR

The one the game skips. Its six screens are the same one ([Curiosities](CURIOSITIES.html)).

![The six screens of TRAP HANGAR](imagenes/fase_08.png)
