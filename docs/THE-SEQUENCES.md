# The sequences

They are all the cartridge run frame by frame, and every screen has been checked against openMSX's VRAM: identical byte for byte.

## The logo and the title

Konami's logo and the title, 魂斗羅 (*Contra*), with its tune (0x02). When the tune ends with nothing pressed, a demo starts (`p00:41F9`).

![The logo and the title](imagenes/secuencia_logo.gif)

![The title](imagenes/titulo.png)

## The demos

There are three, one after the other: stage 1, stage 4 (HELL FALL) and stage 6 (HOMICIDE CENSOR NO.2) (`p00:4245-4253`). The controls come from a recording in the ROM (`p12:9C00`, `p12:9D60` and `p12:9EC0`), and the player has one life and a single point of energy, so the demo ends at the first hit (`p00:423A`). During the demo, F5 mutes the music or turns it back on (`p00:4E50`).

![The first demo](imagenes/secuencia_demo.gif)

## The ending

When the last boss is destroyed, the palette fades out in 16 steps (`p12:9407`), the screen stays black and the text comes out in blocks, appearing and disappearing, while stage 1's tune plays (`p12:9400`; the text is in [The texts](THE-TEXTS.html)). Then, the logo again.

![The ending](imagenes/secuencia_final.gif)

The text ends leaving the door open: *are the aliens really destroyed... or not?*
