#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

jekyll.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui.

Todas las cifras de aqui estan medidas sobre este cartucho, con las
herramientas de tools/: CODIGO y DATOS los imprime tools/presupuesto.py
(make sanity) y RUTINAS, INSTRUCCIONES y COMENTARIOS los da
tools/densidad_total.py.
"""

NOMBRE = "Contra"
CATALOGO = "RC-762"
ANIO = 1989
REPOSITORIO = "https://github.com/antxiko/Contra-disassembly"

CODIGO = 25069
DATOS = 106003
RUTINAS = 1487
INSTRUCCIONES = 10998
COMENTARIOS = 4496

BANCOS_CON_CODIGO = ("00", "02", "03", "04", "12", "14")


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


PIE_LEGAL = {
    "es": "<em>Contra</em> (魂斗羅) lo public&oacute; Konami para MSX2 en 1989; su "
          "n&uacute;mero de cat&aacute;logo es RC-762 y son 128 KB. Todos los derechos "
          "sobre el juego siguen siendo de sus titulares. Este trabajo es de "
          "preservaci&oacute;n, estudio y documentaci&oacute;n, y la imagen del cartucho "
          "no se distribuye.",
    "en": "<em>Contra</em> (魂斗羅) was published by Konami for the MSX2 in 1989; its "
          "catalogue number is RC-762 and it is 128 KB. All rights in the game remain "
          "with their holders. This is preservation, study and documentation work, and "
          "the cartridge image is not distributed.",
}

PORTADA = {
    "es": dict(
        titulo="Contra - desensamblado comentado",
        claim="Las diecinueve fases enteras y la que el juego se salta, las cuatro bases "
              "en 3D con la ruta hasta su n&uacute;cleo, el jugador con todas sus armas, los "
              "enemigos, los jefes, las demostraciones y el final animados, la partida "
              "grabada en el <em>Game Master 2</em> y la m&uacute;sica sacada de su "
              "propio motor.",
        ficha=["Konami - <b>(c) Konami 1989</b>",
               "Cartucho <b>RC-762</b>, MegaROM de 128 KB (Konami con SCC)",
               "<b>MSX2</b>", "Volcado <b>f823346e...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Los mapas, los jefes, los "
              "enemigos y los letreros los <b>pinta el propio cartucho</b>, ejecutado "
              "fuera del emulador con sus propias &oacute;rdenes del V9938, y se han "
              "cotejado con la VRAM de openMSX; las animaciones son la partida "
              "ejecutada cuadro a cuadro.",
    ),
    "en": dict(
        titulo="Contra - commented disassembly",
        claim="All nineteen stages in full and the one the game skips, the four 3D bases "
              "with the route to their core, the player with every weapon, the enemies, "
              "the bosses, the demos and the ending animated, the game saved on the "
              "<em>Game Master 2</em> and the music taken from its own engine.",
        ficha=["Konami - <b>(c) Konami 1989</b>",
               "Cartridge <b>RC-762</b>, 128 KB MegaROM (Konami with SCC)",
               "<b>MSX2</b>", "Dump <b>f823346e...</b>"],
        aviso="<b>There are no screenshots here.</b> The maps, the bosses, the enemies "
              "and the labels are <b>drawn by the cartridge itself</b>, run outside the "
              "emulator with its own V9938 commands, and checked against openMSX's VRAM; "
              "the animations are the game run frame by frame.",
    ),
}

# Los tres bloques: el juego | curiosidades | por dentro.
# (en, es, titulo en, titulo es, que hay en, que hay es)
PAGINAS = [
    [("THE-STAGES.html", "LAS-FASES.html", "The stages", "Las fases",
      "the nineteen stages, every map whole and a clip of each",
      "las diecinueve fases, cada mapa entero y un clip de cada una"),
     ("THE-BASES.html", "LAS-BASES.html", "The bases", "Las bases",
      "the four 3D bases: how you get around and the route to the core",
      "las cuatro bases en 3D: c&oacute;mo se anda y la ruta hasta el n&uacute;cleo"),
     ("THE-PLAYER.html", "EL-JUGADOR.html", "The player", "El jugador",
      "controls, lives, capsules, the weapon menu and every weapon firing",
      "los mandos, las vidas, las c&aacute;psulas, el men&uacute; y cada arma disparando"),
     ("THE-ENEMIES.html", "LOS-ENEMIGOS.html", "The enemies", "Los enemigos",
      "the enemies of every stage, with its palette",
      "los enemigos de cada fase, con su paleta"),
     ("THE-BOSSES.html", "LOS-JEFES.html", "The bosses", "Los jefes",
      "the boss of every stage, animated",
      "el jefe de cada fase, animado"),
     ("THE-SEQUENCES.html", "LAS-SECUENCIAS.html", "The sequences", "Las secuencias",
      "the logo, the title, the demos and the ending, animated",
      "el logotipo, el t&iacute;tulo, las demostraciones y el final, animados"),
     ("THE-MUSIC.html", "LA-MUSICA.html", "The music", "La m&uacute;sica",
      "the 11 tunes, from its own sound engine",
      "las 11 m&uacute;sicas, de su propio motor de sonido"),
     ("THE-TEXTS.html", "LOS-TEXTOS.html", "The texts", "Los textos",
      "every text of the cartridge, in its own lettering",
      "todos los textos del cartucho, con su propia letra")],
    [("CURIOSITIES.html", "CURIOSIDADES.html", "Curiosities", "Curiosidades",
      "the stage that is skipped, the hidden weapons, the Game Master 2, what is still open",
      "la fase que se salta, las armas ocultas, el Game Master 2, lo que queda abierto")],
    [("UNDER-THE-HOOD.html", "POR-DENTRO.html", "Under the hood", "Por dentro",
      "rebuilding the ROM, the mapper, the interrupt, the RAM and the code",
      "rehacer la ROM, el mapper, la interrupci&oacute;n, la RAM y el c&oacute;digo")],
]

# Repositorio nuevo: no hay paginas viejas que redirigir.
VIEJAS = {}

LOGOTIPO = "titulo_solo.png"
