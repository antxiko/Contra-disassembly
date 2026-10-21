#!/usr/bin/env python3
"""Campana de ejecucion: el cartucho jugado por guion (tools/anima.py) en
todas sus partes, apuntando que instrucciones corren y que bytes de la ROM lee
el codigo y quien los lee (tools/ejecuta.py).

Lo ejecutado es codigo DE VERDAD (lo ha corrido el Z80 con el banco que habia
puesto) y sirve de semilla al trazado; lo leido, con la instruccion que lo
lee, es la prueba de que un bloque de datos lo usa el programa.

Escenarios (cada uno una partida nueva):
  titulo     el logo, el titulo y la demostracion (sin tocar nada)
  fN         la fase N desde su primer tramo, 40 s de partida
  fN_tT      la fase N desde el tramo T (el del jefe, o cada sala de las bases)
  gameover   la fase 0 sin rellenar las vidas, hasta el GAME OVER
  final      la fase 19 desde el ultimo tramo, 90 s (el ultimo jefe y el final)
  f8...      la fase 8, que el juego se salta, cargada a mano

Uso: cobertura.py corre <escenario> ...     (los anade a work/cobertura.json)
     cobertura.py todos
     cobertura.py resumen
"""
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import anima       # noqa: E402
import fases       # noqa: E402
import mapas       # noqa: E402

RAIZ = os.path.dirname(AQUI)
SALIDA = os.path.join(RAIZ, "work", "cobertura.json")


def escenarios():
    out = ["titulo"]
    for f in fases.FASES:
        out.append("f%d" % f)
        n = len(fases.lista(f)[2])
        if f in mapas.TRES_D:
            out += ["f%d_t%d" % (f, t) for t in range(1, n)]
        elif n > 1:
            # el tramo del jefe: el ultimo hacia donde va la fase
            fin = 0 if f in (10, 13, 16, 17) else n - 1
            out.append("f%d_t%d" % (f, fin))
    # la fase 8 (TRAP HANGAR): el juego se la salta (p00:449A), pero sus datos
    # estan; se carga poniendo 0xE020 = 8, como las demas
    out += ["f8"] + ["f8_t%d" % t for t in range(1, len(fases.lista(8)[2]))]
    out += ["gameover", "final"]
    return out


def corre(nombre):
    from ejecuta import Partida
    if nombre == "titulo":
        m = Partida(fases.ROM)
        m.arranca_cartucho(0x402E)
        m.cuadros(3000)
        return m
    vidas = nombre != "gameover"
    segundos = 90 if nombre == "final" else 40
    if nombre == "gameover":
        f, tramo, segundos = 0, None, 120
    elif nombre == "final":
        f, tramo = 19, len(fases.lista(19)[2]) - 1
    else:
        partes = nombre[1:].split("_t")
        f = int(partes[0])
        tramo = int(partes[1]) if len(partes) > 1 else None
    m = anima.partida(f, tramo)
    n = [0]

    def mando(m):
        n[0] += 1
        m.teclas = {8: 0xFE} if fases.PULSA <= m.cuadro < fases.PULSA + 6 else {}
        if vidas:
            m.mem[anima.VIDAS] = 3
            m.mem[anima.ENERGIA] = 0x10
        if m.cuadro < fases.PULSA + 60:
            m.palanca, m.botones = {}, set()
            return
        d = anima.HACIA.get(f, 3)
        if f in mapas.TRES_D:
            # en las bases: barrer disparando, entrar (arriba) y salir a un lado
            k = n[0] % 600
            d = (3 if (k // 60) % 2 else 7) if k < 480 else (1 if k < 520 else 3)
        m.palanca = {1: d} if d else {}
        m.botones = {1} | ({3} if n[0] % 45 < 8 else set())
    m.cuadros(fases.PULSA + 160 + segundos * 60, cada=mando)
    return m


def carga():
    if os.path.exists(SALIDA):
        return json.load(open(SALIDA))
    return {"hechos": [], "ejecutado": [], "lector": {}}


def guarda(d):
    json.dump(d, open(SALIDA, "w"))


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "resumen":
        d = carga()
        print("escenarios: %d; instrucciones distintas: %d; bytes leidos: %d" % (
            len(d["hechos"]), len(d["ejecutado"]), len(d["lector"])))
        return
    que = escenarios() if argv[1] == "todos" else argv[2:]
    d = carga()
    ej = set(tuple(x) for x in d["ejecutado"])
    for nom in que:
        if nom in d["hechos"]:
            continue
        m = corre(nom)
        ej |= {(b, pc) for b, pc in m.ejecutado if b is not None}
        for (b, a), pc in m.lector.items():
            d["lector"].setdefault("%d:%d" % (b, a), pc)
        d["hechos"].append(nom)
        d["ejecutado"] = sorted(ej)
        guarda(d)
        print("%s: %d instrucciones, %d bytes leidos (acumulado)" % (
            nom, len(ej), len(d["lector"])), flush=True)


if __name__ == "__main__":
    main(sys.argv)
