# El jugador y las armas

## Los mandos

- Andar y apuntar: los cursores o el mando (GTSTCK 0 y 1, `p00:4F5F-4F6F`).
- Disparar: el espacio o el botón 1 del mando (`p00:4F02-4F0D`).
- Saltar: M, N o el botón 2 (`p00:4F38-4F44`). Soltando el botón pronto, el salto es más corto (`p03:B65D`).
- F1: pausa. En la pausa, S graba la partida y L la carga, con el *Game Master 2* ([Curiosidades](CURIOSIDADES.html)).

## Vidas y energía

Se empieza con **tres vidas** (`p00:4261`) y la barra LIFE llena: **16** de energía (`0xE2C9`, `p00:4266`). Cada golpe empuja al jugador y, al acabar el empujón, le quita la energía que diga lo que le ha dado (`p03:AF01`). Sin energía se pierde una vida, y con ella las armas y las cápsulas (`p03:AF44`).

## Las cápsulas

Las cuatro primeras cápsulas que se cogen en una partida (`0xE030`, `p00:4C77`) mejoran al jugador:

- la 1.ª y la 2.ª, **más deprisa** (`0xE033`): con una se mueve todos los cuadros, y no uno de cada dos (`p03:AE75`); con dos, un poco más (`p03:B1F2`);
- la 3.ª y la 4.ª, **saltos más altos** (`0xE031`, las tablas `p03:B777` y `p03:B797`);
- con cualquiera de ellas, cada golpe quita **dos menos** (`p03:AF05`).

## El menú de armas

Hay otra cápsula, la de dibujo 0x2C, que **abre el menú de armas** (`p02:958D`, `p03:BEAC`): arriba y abajo mueven la flecha y el botón de salto elige.

![El menú de armas](../imagenes/menu_armas.png)

Lo que sale en el menú depende de la fase (`p00:513A-5160`, `p03:BEE3`):

| Arma | Desde la fase |
|---|---|
| MACHINE GUN | 1 |
| REAR GUN | 4 (HELL FALL) |
| LASER GUN | 7 (TUNDRA AREA) |
| FIRE GUN | 7 |
| NORMAL GUN | 1 |

Los clips: la fase 1 con cada arma, disparando hacia delante y en diagonal.

### NORMAL GUN

![NORMAL GUN](../imagenes/arma_0.gif)

### MACHINE GUN

![MACHINE GUN](../imagenes/arma_3.gif)

### REAR GUN

![REAR GUN](../imagenes/arma_5.gif)

### LASER GUN

![LASER GUN](../imagenes/arma_1.gif)

### FIRE GUN

![FIRE GUN](../imagenes/arma_2.gif)

La LASER GUN solo tiene dos disparos a la vez (`p03:B990`). En las bases, todas menos la NORMAL GUN disparan la bala de la MACHINE GUN (`p03:B9C3`).
