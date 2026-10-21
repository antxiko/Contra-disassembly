#!/usr/bin/env python3
"""Lo que se ha MEDIDO del cartucho, clavado para que no se deshaga solo.

Estas comprobaciones necesitan la ROM, y si no esta **fallan**: no se saltan.
Un test que se salta no comprueba nada y en verde daria la impresion
contraria. Quien clone esto sin poner su copia del cartucho vera fallar este
fichero con un mensaje que dice exactamente que falta.

Cada una corresponde a una afirmacion de la web o de las notas, y todas leen
el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

from paginas import ORG, OTRO_SLOT   # noqa: E402

ROM = os.path.join(RAIZ, "contra.rom")
SHA = "f823346e745203ff87dd2a00a414c729a5556e42332489219538d169395ea62a"

FALTA = ("falta contra.rom en la raiz del repo. Son los 131.072 bytes de "
         "Contra (Konami, RC-762, 1989, MSX2) y no se distribuyen aqui: pon tu "
         "copia. El sha256 tiene que ser %s" % SHA)


def leer_rom():
    if not os.path.exists(ROM):
        raise AssertionError(FALTA)
    with open(ROM, "rb") as f:
        return f.read()


def b(rom, banco, a, n=1):
    """n bytes del banco en la direccion a (con su org)."""
    o = banco * 0x2000 + (a - ORG[banco])
    return rom[o:o + n]


class Cartucho(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.rom = leer_rom()

    def test_es_la_misma_rom(self):
        self.assertEqual(len(self.rom), 131072)
        self.assertEqual(hashlib.sha256(self.rom).hexdigest(), SHA)

    def test_cabecera_ab(self):
        """0x4000 'AB', INIT 0x402E y los otros tres vectores a cero."""
        self.assertEqual(self.rom[0:2], b"AB")
        self.assertEqual(self.rom[2] | (self.rom[3] << 8), 0x402E)
        self.assertEqual(self.rom[4:10], bytes(6))

    def test_segunda_cabecera_del_game_master(self):
        """0x4010: 'CD', 0x07 y 0x62, o sea RC-762."""
        self.assertEqual(self.rom[0x10:0x14], b"CDb")

    def test_mapper_konami_con_scc(self):
        """Escrituras a 0x5000, 0x7000, 0x9000 y 0xB000, y ni una a 0x6000."""
        for reg in (0x5000, 0x7000, 0x9000, 0xB000):
            self.assertIn(bytes([0x32, reg & 0xFF, reg >> 8]), self.rom)
        self.assertNotIn(bytes([0x32, 0x00, 0x60]), self.rom)

    def test_0x8000_y_0xa000_solo_en_otro_cartucho(self):
        """Las dos escrituras a 0x8000 y 0xA000 (p00:4DDF y 4DE7) van detras
        del ENASLT (`ld h,0x80 / ... / call 0x0024`) que pone en 0x8000 la
        ranura de 0xE209."""
        sitios = set()
        for reg in (0x8000, 0xA000):
            i = self.rom.find(bytes([0x32, reg & 0xFF, reg >> 8]))
            while i >= 0:
                sitios.add((i // 0x2000, ORG[i // 0x2000] + i % 0x2000))
                i = self.rom.find(bytes([0x32, reg & 0xFF, reg >> 8]), i + 1)
        self.assertEqual(sitios, OTRO_SLOT)
        self.assertEqual(b(self.rom, 0, 0x4DCF, 2), bytes([0x26, 0x80]))
        self.assertEqual(b(self.rom, 0, 0x4DD2, 6), bytes([0x3A, 0x09, 0xE2, 0xCD, 0x24, 0x00]))

    def test_regla_banco_org(self):
        """tools/reconocimiento.py: toda escritura con banco conocido lo pone en
        la ranura que dice tools/paginas.py (exit 0), y no queda ningun banco
        sin seleccionar."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ROM],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertEqual(r.returncode, 0, r.stdout)
        self.assertIn("OK: la regla banco -> org", r.stdout)
        self.assertIn("bancos que NINGUNA escritura selecciona: \n", r.stdout)

    def test_rutinas_de_banco(self):
        """p00:4F78/4F7B escriben A en 0x7000 y en 0xE202; p00:453A en 0xE203
        y en 0x9000. Las tres vuelven con A intacto."""
        self.assertEqual(b(self.rom, 0, 0x4F78, 10), bytes([
            0x32, 0x17, 0xE0, 0x32, 0x00, 0x70, 0x32, 0x02, 0xE2, 0xC9]))
        self.assertEqual(b(self.rom, 0, 0x453A, 7), bytes([
            0x32, 0x03, 0xE2, 0x32, 0x00, 0x90, 0xC9]))

    def test_bancos_fijos_0_y_3(self):
        """INIT: `xor a / ld (0x5000),a / inc a / call 4F7B / inc a /
        call 453A / inc a / ld (0xB000),a`: 0, 1, 2 y 3."""
        self.assertEqual(b(self.rom, 0, 0x4082, 16), bytes([
            0xAF, 0x32, 0x00, 0x50, 0x3C, 0xCD, 0x7B, 0x4F, 0x3C, 0xCD, 0x3A,
            0x45, 0x3C, 0x32, 0x00, 0xB0]))
        self.assertEqual((ORG[0], ORG[3]), (0x4000, 0xA000))

    def test_tablas_de_bancos_por_fase(self):
        """p00:4666 (dos por fase) y p03:BAE4 (uno por fase): 20 fases; detras
        de cada una empieza codigo."""
        t = b(self.rom, 0, 0x4666, 40)
        self.assertTrue(all(ORG[x] == 0x6000 for x in t))
        self.assertEqual(b(self.rom, 0, 0x467A + 20, 3), bytes([0x21, 0xBE, 0x46]))
        t = b(self.rom, 3, 0xBAE4, 20)
        self.assertEqual(set(t), {13, 14, 15})
        self.assertEqual(b(self.rom, 3, 0xBAF8, 5), bytes([0x3E, 0x0E, 0xCD, 0x78, 0x4F]))

    def test_gancho_de_interrupcion(self):
        """INIT engancha 0x4BD2 en H.KEYI (0xFD9A)."""
        self.assertEqual(b(self.rom, 0, 0x40E3, 11), bytes([
            0x21, 0xD2, 0x4B, 0x22, 0x9B, 0xFD, 0x3E, 0xC3, 0x32, 0x9A, 0xFD]))

    def test_despachador(self):
        """p03:A03E `ld e,(iy+5) / pop hl / rlc e / ld d,0 / add hl,de /
        ld e,(hl) / inc hl / ld d,(hl) / ex de,hl / jp (hl)`."""
        self.assertEqual(b(self.rom, 3, 0xA03E, 14), bytes([
            0xFD, 0x5E, 0x05, 0xE1, 0xCB, 0x03, 0x16, 0x00, 0x19, 0x5E, 0x23,
            0x56, 0xEB, 0xE9]))


if __name__ == "__main__":
    unittest.main()
