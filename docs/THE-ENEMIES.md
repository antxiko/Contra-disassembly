# The enemies

The enemies of each stage, **one row per stage** (with the number shown on screen), taken by playing every stage and every section (`tools/sprites.py`). For each type of object (the routine at `p02:8000` that moves it) come the first two drawings seen **with the stage's palette already set** (the one from `p00:4652`, not the one of the fade-in), drawn as the V9938 draws them: 16 x 16 sprites and, when two in a row have the CC bit, their colours added together. Each figure sits in a cell of the same size, resting on the bottom.

Many enemies are not sprites: the turrets, the cannons and the cores are drawn into the background (`p02:8400`) and can be seen in [The stages](THE-STAGES.html) and in [The bosses](THE-BOSSES.html). That is why stages 3, 12 and 15, three of the boss walls, have no row: everything that fires there is part of the background. The player's bullets and the other types that are not enemies (the `NO_ENEMIGOS` list in `tools/sprites.py`) are left out; the capsules are in.

![The enemies of each stage](imagenes/enemigos.png)
