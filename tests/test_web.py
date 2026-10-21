"""La web: las cifras de la portada son las del listado, no se nombra otro
juego de la serie y no falta ninguna imagen."""
import os
import re
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DOCS = os.path.join(RAIZ, "docs")
sys.path.insert(0, os.path.join(RAIZ, "tools"))
import contenido_web as C     # noqa: E402

# Los otros juegos de la serie. King's Valley II se nombra donde se cuenta que el
# motor de sonido es el mismo (MOTOR); el Game Master 2 es el cartucho con el
# que se graba la partida, y no es de la serie.
OTROS_JUEGOS = ("Parodius", "Salamander", "Valley", "Usas", "Galious", "Nemesis",
                "Metal Gear", "Goemon", "Shalom", "Knightmare", "Rastan",
                "Synthesizer", "Pennant", "Dunk Shot", "Vampire Killer", "Hinotori",
                "Q*bert", "King Kong", "Circus", "Magical Tree", "Comic Bakery",
                "TwinBee", "F1 Spirit", "Gradius", "Fighter", "Ranger", "Jaguar")
MOTOR = ("LA-MUSICA.md", "POR-DENTRO.md", "THE-MUSIC.md", "UNDER-THE-HOOD.md")


def paginas():
    out = []
    for carpeta in (DOCS, os.path.join(DOCS, "es")):
        if os.path.isdir(carpeta):
            out += [os.path.join(carpeta, f) for f in sorted(os.listdir(carpeta))
                    if f.endswith(".md")]
    return out


class TestWeb(unittest.TestCase):
    def test_la_suma_de_bytes_da_el_cartucho(self):
        self.assertEqual(C.CODIGO + C.DATOS, 131072)

    def test_las_cifras_de_la_portada_son_las_del_listado(self):
        r = subprocess.run([sys.executable, os.path.join(RAIZ, "tools", "densidad_total.py")],
                           capture_output=True, text=True, cwd=RAIZ)
        m = re.search(r"TOTAL (\d+) instrucciones, (\d+) comentarios, .*flojas (\d+) de (\d+)",
                      r.stdout)
        self.assertIsNotNone(m, r.stdout[-300:])
        self.assertEqual((int(m.group(1)), int(m.group(2)), int(m.group(4))),
                         (C.INSTRUCCIONES, C.COMENTARIOS, C.RUTINAS))
        self.assertEqual(int(m.group(3)), 0)

    def test_no_se_nombra_otro_juego_de_la_serie(self):
        for p in paginas():
            txt = open(p, encoding="utf-8").read()
            for j in OTROS_JUEGOS:
                if j == "Valley" and os.path.basename(p) in MOTOR and "King's Valley II" in txt:
                    continue
                self.assertNotIn(j, txt, "%s nombra %s" % (p, j))

    def test_no_falta_ninguna_imagen(self):
        for p in paginas():
            base = os.path.dirname(p)
            for ruta in re.findall(r"\]\(([^)]+\.(?:png|gif))\)", open(p, encoding="utf-8").read()):
                self.assertTrue(os.path.exists(os.path.join(base, ruta)), "%s: %s" % (p, ruta))

    def test_las_musicas_estan(self):
        for p in paginas():
            base = os.path.dirname(p)
            for ruta in re.findall(r'src="([^"?]+\.mp3)', open(p, encoding="utf-8").read()):
                self.assertTrue(os.path.exists(os.path.join(base, ruta)), "%s: %s" % (p, ruta))


if __name__ == "__main__":
    unittest.main()
