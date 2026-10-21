#!/usr/bin/env python3
"""Las secuencias del cartucho como animaciones, ejecutando el programa
(tools/ejecuta.py):

  logo     el logotipo de Konami y el titulo, desde el arranque (sin tocar nada)
  titulo   el titulo quieto (un PNG): el cuadro 370 desde el arranque, igual
           byte a byte a la pagina visible de openMSX con el titulo
  demo     la primera demostracion (fase 0, la grabacion de p12:9C00)
  final    el final: con la fase 19 en marcha (la partida esperando en
           p00:4322), se hace lo que hace el ultimo jefe al caer (p02:8915) y
           el juego sigue solo: pasa a la fase 20 (p00:449F), y de ahi al final
           (p00:44D8): la musica 0x03, el fundido y el texto de p12:9400

Uso: secuencias.py <logo|titulo|demo|final> <salida>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import anima                      # noqa: E402
import fases                      # noqa: E402
from ejecuta import Partida       # noqa: E402


def graba(m, cuadros, cada=3, desde=0):
    ims = []
    for k in range(cuadros):
        m.cuadros(1)
        if k >= desde and k % cada == 0:
            ims.append(m.foto().copy())
    return ims


def main(argv):
    if len(argv) < 3:
        sys.exit(__doc__)
    que, salida = argv[1], argv[2]
    if que == "logo":
        m = Partida(fases.ROM)
        m.arranca_cartucho(0x402E)
        m.apunta = False
        ims = graba(m, 700, 3, 200)
    elif que == "titulo":
        m = Partida(fases.ROM)
        m.arranca_cartucho(0x402E)
        m.apunta = False
        m.cuadros(371)
        im = m.foto()
        im.save(salida)
        # y el rotulo solo (las lineas 56-111 tienen los kanji), al triple
        bb = im.crop((0, 56, 256, 112)).getbbox()
        solo = im.crop((bb[0] - 8, 48, bb[2] + 8, 120))
        solo.resize((solo.width * 3, solo.height * 3), 0).save(salida.replace(".png", "_solo.png"))
        print("titulo -> %s" % salida)
        return
    elif que == "demo":
        m = Partida(fases.ROM)
        m.arranca_cartucho(0x402E)
        m.apunta = False
        m.cuadros(740)
        ims = graba(m, 900, 3)
    elif que == "final":
        m = anima.partida(19)
        m.apunta = False

        def mando(m):
            m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        m.cuadros(fases.PULSA + 300, cada=mando)
        # la partida espera en p00:4322-4326 a que acabe la fase; se hace lo
        # que hace el ultimo jefe al caer (p02:8915-8933): 0xE094 = 0,
        # 0xE5C7 = 0, fase superada (0xE184 = 1) y la musica 0x0F. El juego
        # sigue solo: recoge las fichas (p00:4909), pasa a la fase 20
        # (p00:449F) y entra en el final (p00:44D8)
        for _ in range(200000):
            if 0x4322 <= m.pc <= 0x4326:
                break
            m.paso()
        m.mem[0xE094] = m.mem[0xE5C7] = 0
        m.mem[0xE184] = 1
        m.sp = (m.sp - 2) & 0xFFFF                  # call p00:5052 con A = 0x0F
        m.mem[m.sp], m.mem[m.sp + 1] = m.pc & 0xFF, m.pc >> 8
        m.pc, m.a = 0x5052, 0x0F
        ims = graba(m, 60 * 60, 4)
    else:
        sys.exit(__doc__)
    anima.guarda_gif(ims, salida, cada=3 if que != "final" else 4)
    print("%s: %d cuadros -> %s" % (que, len(ims), salida))


if __name__ == "__main__":
    main(sys.argv)
