#!/usr/bin/env python3
"""Los bytes que lee el motor de sonido al tocar cada uno de los 61 sonidos
(p04:6E12), con la instruccion que los lee: se ejecuta el motor
(tools/motor_musica.py) apuntando las lecturas de la ROM (sin los bytes de la
propia instruccion), y se guarda en work/cobertura_sonidos.json con el mismo
formato que work/cobertura.json.

Uso: lee_sonidos.py [cuadros por sonido]
"""
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import motor_musica as M     # noqa: E402
import musica                # noqa: E402

N_SONIDOS = 0x3D


def main(argv):
    cuadros = int(argv[1]) if len(argv) > 1 else 3600
    rom = open(os.path.join(M.RAIZ, "contra.rom"), "rb").read()
    d = {"hechos": [], "ejecutado": [], "lector": {}}
    for n in range(1, N_SONIDOS):
        z = M.arranca(musica.CFG, rom, n)
        leido = {}
        lee = z._leer
        pc_actual = [0]
        una = z._una

        def _una():
            pc_actual[0] = z.pc
            una()

        def _leer(a, z=z, leido=leido, lee=lee):
            a &= 0xFFFF
            if 0x4000 <= a < 0xC000 and not pc_actual[0] <= a < pc_actual[0] + 4:
                b = z.bancos[a & 0xE000]
                leido.setdefault((b, a), pc_actual[0])
            return lee(a)
        z._una = _una
        z._leer = _leer
        for _ in range(cuadros):
            M.cuadro(z)
        for (b, a), pc in leido.items():
            d["lector"].setdefault("%d:%d" % (b, a), pc)
        print("sonido 0x%02X: %d bytes leidos" % (n, len(leido)), flush=True)
    d["hechos"].append("sonidos")
    json.dump(d, open(os.path.join(M.RAIZ, "work", "cobertura_sonidos.json"), "w"))


if __name__ == "__main__":
    main(sys.argv)
