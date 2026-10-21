# Curiosities

## TRAP HANGAR, the stage that is never played

The stage table has twenty, but after stage 8 (ENERGY ZONE) the game skips the next one and goes to 9 (`p00:449A`). The number on screen leaves no gap: up to 8 it is the stage plus one, and from 9 on the stage itself (`p00:4576`).

The missing one is called **TRAP HANGAR** (`p12:97FA`) and it has its graphics banks (`p00:4666`), its music (0x09, the same as 0x03) and a list of six screens (0x1F to 0x24). But all six point to **the same commands**, `p14:7D76`, which are the background that screens 0x25 and 0x26 of ALIEN ZONE begin with (both open with `FE 76 7D`) ([The stages](THE-STAGES.html)). Forced by hand in openMSX (`0xE020` = 8), the screen stays black.

## The weapon menu is not in the pause

F1 only shows PAUSE. The weapon menu is opened by a capsule, the one with drawing 0x2C (`p02:958D`), measured in the emulator ([The player](THE-PLAYER.html)).

## Weapons the menu does not give

The weapon is kept at `0xE032`. Apart from setting it to 0 at the start and when a life is lost, only the menu writes it (`p03:BF82`), with the table at `p03:BFAB`: 0 NORMAL, 3 MACHINE, 5 REAR, 1 LASER and 2 FIRE. Even so, the shooting code has cases for weapons 6 and 7: like the LASER, only two shots at a time (`p03:B990`), and in the bases, a different bullet towards the back (`p03:B9FE`). No row of the menu leads to them, nor to 4.

## Rooms you never reach

In the bases there are rooms **no door leads to**: room 3 of stage 2, rooms 2 and 6 of stage 5, rooms 2 and 7 of stage 11, and six of the fourteen of stage 14. They have their screen and objects ([The bases](THE-BASES.html)).

## The last base asks for more

In the first room of the bases you can enter the corridor without destroying anything. In stage 14's, you cannot: the targets must be destroyed (`p03:AFC7-AFD8`).

## Stage 19, twice

When a boss is destroyed, the game checks whether the stage is 19 to play the last boss's tune. It checks twice in a row, with the same comparison (`p02:8923` and `p02:8927`).

## The game on the Game Master 2

At boot, Contra looks in every slot for a cartridge with a Y at 0x4010 (`p00:4D9E`): the *Game Master 2*. If it is there, while paused the S key saves the game into its SRAM, in a file called CONTRA (`p00:4D1A`; commands 0x0A and 0x0B of its `p04:8000`), and L loads it: the stage in progress is cleared and the game moves to the saved one (`p00:4D03`). It saves the lives, the stage, the energy and the screen (`0xE03A-0xE03E`); in the bases the screen is not used: you start in the first room (`p00:44B9`).

Contra reads the error the *Game Master 2* returns (`p00:4D6A`) and shows its message. Measured in openMSX with the SRAM unformatted: S answers UNFORMATED.

## Two typos

Two of the saving messages say FILE ALREADY EXIT and UNFORMATED ([The texts](THE-TEXTS.html)).

## The music, once more

Tune 0x09, the one for stage 18 (and for TRAP HANGAR), is 0x03: its header (`p04:6F08`) points to the same scores as 0x03's (`p04:6EB4`).

## What is still open

- Why TRAP HANGAR stays black, and whether it ever had screens of its own.
- What weapons 4, 6 and 7 do.
- Which stages have the weapon menu capsule.
- Saving on the *Game Master 2* with the SRAM formatted: not tried.
