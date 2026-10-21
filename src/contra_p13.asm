; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 13 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS listas_de_fase: 20 punteros, uno por fase, a la lista de pantallas de
;   cada fase (p03:BB82: 0x6000 + 2 x 0xE020); en este banco valen los de las
;   fases 2, 5, 10, 12, 13, 15 (p03:BAE4); lo leen p03:BB8B (40 bytes)
;   0x6000..0x6028  (40 bytes)
DATA_listas_de_fase:
	defw 060ebh,06080h,06087h,06089h,06089h,06092h,06094h,06094h	; 6000
	defw 06094h,06094h,06094h,0609dh,060a9h,060abh,060b4h,060c4h	; 6010
	defw 060c6h,060d1h,060d9h,060e2h	; 6020  -> DATA_lista_ajena_60C6 DATA_lista_ajena_60D1 DATA_lista_ajena_60D9 DATA_lista_ajena_60E2

; ----------------------------------------------------------------------
; DATOS leido_6028: 88 bytes que lee 0x4832 al jugar (medido ejecutando el
;   cartucho, tools/cobertura.py; el tamano es lo que se lee seguido); lo leen
;   0x4832 (88 bytes)
;   0x6028..0x6080  (88 bytes)
DATA_leido_6028:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6028  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,09fh,067h,000h,0ffh,000h,0ffh,000h,0ffh	; 6038  .........g......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6048  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6058  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6068  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6078  ........

; ----------------------------------------------------------------------
; DATOS lista_ajena_6080: una lista de pantallas (4B 4C 4D 4E 4F 50 y el 0 que
;   la acaba) a la que apunta, en este banco, la fase 1, que se juega con otro
;   (p03:BAE4): no la lee nadie; lo leen nadie (7 bytes)
;   0x6080..0x6087  (7 bytes)
DATA_lista_ajena_6080:
	defb 04bh,04ch,04dh,04eh,04fh,050h,000h	; 6080

; ----------------------------------------------------------------------
; DATOS lista_fase_02: la lista de pantallas de la fase 2: 2E y el 0 que la
;   acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo leen
;   p03:BB92 (2 bytes)
;   0x6087..0x6089  (2 bytes)
DATA_lista_fase_02:
	defb 02eh,000h	; 6087

; ----------------------------------------------------------------------
; DATOS lista_ajena_6089: una lista de pantallas (51 52 53 54 55 56 57 58 y el
;   0 que la acaba) a la que apunta, en este banco, la fase 3, 4, que se juega
;   con otro (p03:BAE4): no la lee nadie; lo leen nadie (9 bytes)
;   0x6089..0x6092  (9 bytes)
DATA_lista_ajena_6089:
	defb 051h,052h,053h,054h,055h,056h,057h,058h,000h	; 6089  QRSTUVWX.

; ----------------------------------------------------------------------
; DATOS lista_fase_05: la lista de pantallas de la fase 5: 2F y el 0 que la
;   acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo leen
;   p03:BB92 (2 bytes)
;   0x6092..0x6094  (2 bytes)
DATA_lista_fase_05:
	defb 02fh,000h	; 6092

; ----------------------------------------------------------------------
; DATOS lista_fase_10: la lista de pantallas de la fase 10: 38 37 36 35 34 33
;   32 31 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x6094..0x609d  (9 bytes)
DATA_lista_fase_10:
	defb 038h,037h,036h,035h,034h,033h,032h,031h,000h	; 6094  87654321.

; ----------------------------------------------------------------------
; DATOS lista_ajena_609D: una lista de pantallas (59 5A 5B 5C 5D 5E 5F 60 61
;   62 63 y el 0 que la acaba) a la que apunta, en este banco, la fase 11, que
;   se juega con otro (p03:BAE4): no la lee nadie; lo leen nadie (12 bytes)
;   0x609d..0x60a9  (12 bytes)
DATA_lista_ajena_609D:
	defb 059h,05ah,05bh,05ch,05dh,05eh,05fh,060h,061h,062h,063h,000h	; 609d  YZ[\]^_`abc.

; ----------------------------------------------------------------------
; DATOS lista_fase_12: la lista de pantallas de la fase 12: 30 y el 0 que la
;   acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo leen
;   p03:BB92 (2 bytes)
;   0x60a9..0x60ab  (2 bytes)
DATA_lista_fase_12:
	defb 030h,000h	; 60a9

; ----------------------------------------------------------------------
; DATOS lista_fase_13: la lista de pantallas de la fase 13: 40 3F 3E 3D 3C 3B
;   3A 39 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x60ab..0x60b4  (9 bytes)
DATA_lista_fase_13:
	defb 040h,03fh,03eh,03dh,03ch,03bh,03ah,039h,000h	; 60ab  @?>=<.:9.

; ----------------------------------------------------------------------
; DATOS lista_ajena_60B4: una lista de pantallas (64 65 66 67 68 69 6A 6B 6C
;   6D 6E 6F 70 71 72 y el 0 que la acaba) a la que apunta, en este banco, la
;   fase 14, que se juega con otro (p03:BAE4): no la lee nadie; lo leen nadie
;   (16 bytes)
;   0x60b4..0x60c4  (16 bytes)
DATA_lista_ajena_60B4:
	defb 064h,065h,066h,067h,068h,069h,06ah,06bh,06ch,06dh,06eh,06fh,070h,071h,072h,000h	; 60b4  defghijklmnopqr.

; ----------------------------------------------------------------------
; DATOS lista_fase_15: la lista de pantallas de la fase 15: 8A y el 0 que la
;   acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo leen
;   p03:BB92 (2 bytes)
;   0x60c4..0x60c6  (2 bytes)
DATA_lista_fase_15:
	defb 08ah,000h	; 60c4

; ----------------------------------------------------------------------
; DATOS lista_ajena_60C6: una lista de pantallas (4A 49 48 47 46 45 44 43 42
;   41 y el 0 que la acaba) a la que apunta, en este banco, la fase 16, que se
;   juega con otro (p03:BAE4): no la lee nadie; lo leen nadie (11 bytes)
;   0x60c6..0x60d1  (11 bytes)
DATA_lista_ajena_60C6:
	defb 04ah,049h,048h,047h,046h,045h,044h,043h,042h,041h,000h	; 60c6  JIHGFEDCBA.

; ----------------------------------------------------------------------
; DATOS lista_ajena_60D1: una lista de pantallas (79 78 77 76 75 74 73 y el 0
;   que la acaba) a la que apunta, en este banco, la fase 17, que se juega con
;   otro (p03:BAE4): no la lee nadie; lo leen nadie (8 bytes)
;   0x60d1..0x60d9  (8 bytes)
DATA_lista_ajena_60D1:
	defb 079h,078h,077h,076h,075h,074h,073h,000h	; 60d1  yxwvuts.

; ----------------------------------------------------------------------
; DATOS lista_ajena_60D9: una lista de pantallas (7A 7B 7C 7D 7E 7F 80 81 y el
;   0 que la acaba) a la que apunta, en este banco, la fase 18, que se juega
;   con otro (p03:BAE4): no la lee nadie; lo leen nadie (9 bytes)
;   0x60d9..0x60e2  (9 bytes)
DATA_lista_ajena_60D9:
	defb 07ah,07bh,07ch,07dh,07eh,07fh,080h,081h,000h	; 60d9  z{|}~....

; ----------------------------------------------------------------------
; DATOS lista_ajena_60E2: una lista de pantallas (82 83 84 85 86 87 88 89 y el
;   0 que la acaba) a la que apunta, en este banco, la fase 19, que se juega
;   con otro (p03:BAE4): no la lee nadie; lo leen nadie (9 bytes)
;   0x60e2..0x60eb  (9 bytes)
DATA_lista_ajena_60E2:
	defb 082h,083h,084h,085h,086h,087h,088h,089h,000h	; 60e2  .........

; ----------------------------------------------------------------------
; DATOS lista_ajena_60EB: una lista de pantallas (01 01 02 03 04 05 06 07 09
;   0A y el 0 que la acaba) a la que apunta, en este banco, la fase 0, que se
;   juega con otro (p03:BAE4): no la lee nadie; lo leen nadie (11 bytes)
;   0x60eb..0x60f6  (11 bytes)
DATA_lista_ajena_60EB:
	defb 001h,001h,002h,003h,004h,005h,006h,007h,009h,00ah,000h	; 60eb  ...........

; ----------------------------------------------------------------------
; DATOS leido_60F6: 102 bytes que lee 0x4832 al jugar (medido ejecutando el
;   cartucho, tools/cobertura.py; el tamano es lo que se lee seguido); lo leen
;   0x4832 (102 bytes)
;   0x60f6..0x615c  (102 bytes)
DATA_leido_60F6:
	defb 00bh,00ch,00dh,00eh,00fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 60f6  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6106  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6116  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6126  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6136  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6146  ................
	defb 000h,000h,000h,000h,000h,000h	; 6156

; ----------------------------------------------------------------------
; DATOS pantallas_13: los punteros a las ordenes de las pantallas 0x2E-0x8A
;   (p03:BB95: 0x6100 + 2 x pantalla); las 41 42 43 44 45 46 47 48 49 4A 4B 4C
;   4D 4E 4F 50 51 52 53 54 55 56 57 58 59 5A 5B 5C 5D 5E 5F 60 61 62 63 64 65
;   66 67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 7B 7C 7D 7E
;   7F 80 81 82 83 84 85 86 87 88 89 no estan en ninguna lista de fase; lo
;   leen p03:BB9F (186 bytes)
;   0x615c..0x6216  (186 bytes)
DATA_pantallas_13:
	defw 07037h,07118h,07201h,06845h,068a8h,06921h,069bch,06a33h	; 615c
	defw 06abeh,06b53h,06be0h,06c75h,06ca6h,06cf7h,06da0h,06e31h	; 616c
	defw 06eb6h,06f27h,06f90h,00000h,00000h,00000h,00000h,00000h	; 617c
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 618c
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 619c
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61ac
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61bc
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61cc
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61dc
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61ec
	defw 00000h,00000h,00000h,00000h,00000h,00000h,00000h,00000h	; 61fc
	defw 00000h,00000h,00000h,00000h,06fdbh	; 620c

; ----------------------------------------------------------------------
; DATOS pantallas_13_a_cero: 5 punteros a 0 detras de los de la pantalla 0x8A:
;   la tabla de p03:BB95 sigue, pero en este banco no hay mas pantallas; lo
;   leen p03:BB9F (10 bytes)
;   0x6216..0x6220  (10 bytes)
DATA_pantallas_13_a_cero:
	defw 00000h,00000h,00000h,00000h,00000h	; 6216

; ----------------------------------------------------------------------
; DATOS pieza_6220: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 2E 2F
;   8A (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6220..0x6224  (4 bytes)
DATA_pieza_6220:
	defb 001h,001h,001h	; 6220
	defb 0ffh	; 6223

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6224: 5 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (56 bytes)
;   0x6224..0x625c  (56 bytes)
DATA_piezas_sueltas_6224:
	defb 000h,001h,004h,008h,009h,00ah,00bh,000h,001h,001h,004h,000h,001h,004h,00ch,00dh	; 6224  ................
	defb 00eh,00fh,000h,004h,004h,050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah	; 6234  .....PQRSTUVWXYZ
	defb 05bh,05ch,05dh,05eh,000h,000h,004h,004h,0f0h,0f1h,0f2h,0f3h,0f4h,0f5h,0f6h,0f7h	; 6244  [\]^............
	defb 0f8h,0f9h,0fah,0fbh,0fch,0fdh,0feh,000h	; 6254  ........

; ----------------------------------------------------------------------
; DATOS pieza_625C: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 2E
;   (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x625c..0x6260  (4 bytes)
DATA_pieza_625C:
	defb 001h,001h,001h	; 625c
	defb 0ffh	; 625f

; ----------------------------------------------------------------------
; DATOS pieza_6260: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 2F 31 32 33 34 35 37 38 39
;   3A (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6260..0x6264  (4 bytes)
DATA_pieza_6260:
	defb 000h,001h,001h	; 6260
	defb 001h	; 6263

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6264: 2 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (13 bytes)
;   0x6264..0x6271  (13 bytes)
DATA_piezas_sueltas_6264:
	defb 000h,003h,002h,0dbh,0dbh,043h,04bh,047h,04fh,040h,001h,001h,04eh	; 6264  .....CKGO@..N

; ----------------------------------------------------------------------
; DATOS pieza_6271: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (7 bytes)
;   0x6271..0x6278  (7 bytes)
DATA_pieza_6271:
	defb 040h,004h,001h	; 6271
	defb 0c1h,0c5h,0c9h	; 6274
	defb 0cdh	; 6277

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6278: 3 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (54 bytes)
;   0x6278..0x62ae  (54 bytes)
DATA_piezas_sueltas_6278:
	defb 000h,003h,001h,027h,02bh,02fh,040h,007h,003h,0c2h,0c3h,0f3h,0c6h,000h,0fbh,000h	; 6278  ...'+/@.........
	defb 000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h,0f7h,040h,007h	; 6288  ..............@.
	defb 003h,0f2h,0cah,0cbh,0fbh,000h,0cfh,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h	; 6298  ................
	defb 0fbh,000h,000h,0fbh,000h,000h	; 62a8

; ----------------------------------------------------------------------
; DATOS pieza_62AE: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x62ae..0x62b5  (7 bytes)
DATA_pieza_62AE:
	defb 040h,002h,002h	; 62ae
	defb 0e0h,0e1h,0e4h	; 62b1
	defb 0e5h	; 62b4

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_62B5: 17 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (221 bytes)
;   0x62b5..0x6392  (221 bytes)
DATA_piezas_sueltas_62B5:
	defb 000h,002h,004h,0f8h,0f9h,0f2h,0f3h,0fch,0fdh,0f6h,0f7h,000h,004h,002h,010h,011h	; 62b5  ................
	defb 014h,015h,018h,019h,01ch,01dh,000h,004h,002h,0c2h,0c3h,0c6h,0c7h,0cah,0cbh,0ceh	; 62c5  ................
	defb 0cfh,000h,002h,002h,0c4h,0c5h,0c8h,0c9h,000h,004h,002h,0cch,0cdh,0cch,0cdh,0ceh	; 62d5  ................
	defb 0cfh,0cch,0cdh,000h,004h,004h,082h,082h,082h,082h,08dh,08dh,08dh,08dh,07ch,061h	; 62e5  ..............|a
	defb 061h,061h,0c0h,0c1h,0c0h,0c1h,000h,004h,002h,08ah,000h,08dh,08eh,061h,0f2h,0c0h	; 62f5  aa...........a..
	defb 0f6h,000h,004h,002h,0f0h,0f1h,0f4h,0f5h,0f8h,0f9h,0fch,0fdh,000h,001h,003h,0adh	; 6305  ................
	defb 0aeh,0afh,000h,003h,003h,005h,006h,007h,009h,00ah,00bh,00dh,00eh,00fh,000h,007h	; 6315  ................
	defb 002h,040h,041h,044h,045h,048h,049h,04ch,049h,042h,043h,046h,047h,04ah,04bh,000h	; 6325  .@ADEHILIBCFGJK.
	defb 004h,003h,050h,051h,052h,054h,055h,056h,058h,059h,05ah,05ch,05dh,05eh,000h,002h	; 6335  ..PQRTUVXYZ\]^..
	defb 002h,053h,05bh,057h,05fh,000h,004h,003h,054h,055h,056h,058h,059h,05ah,05ch,05dh	; 6345  .S[W_...TUVXYZ\]
	defb 05eh,04dh,04eh,04fh,001h,004h,002h,060h,061h,064h,065h,068h,069h,06ch,06dh,001h	; 6355  ^MNO...`adehilm.
	defb 004h,002h,062h,063h,066h,067h,06ah,06bh,06eh,06fh,000h,004h,008h,0c0h,0c1h,0c2h	; 6365  ..bcfgjkno......
	defb 0c3h,0d0h,0d1h,0d2h,0d3h,0c4h,0c5h,0c6h,0c7h,0d4h,0d5h,0d6h,0d7h,0c8h,0c9h,0cah	; 6375  ................
	defb 0cbh,0d8h,0d9h,0dah,0dbh,0cch,0cdh,0ceh,0cfh,0dch,0ddh,0deh,0dfh	; 6385  .............

; ----------------------------------------------------------------------
; DATOS pieza_6392: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 31 32 33 34 35 36 37 38 39
;   3A (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6392..0x63a5  (19 bytes)
DATA_pieza_6392:
	defb 000h,004h,004h	; 6392
	defb 010h,011h,012h	; 6395
	defb 013h,014h,015h	; 6398
	defb 016h,017h,018h	; 639b
	defb 019h,01ah,01bh	; 639e
	defb 01ch,01dh,01eh	; 63a1
	defb 01fh	; 63a4

; ----------------------------------------------------------------------
; DATOS pieza_63A5: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 31 32 33 34 35 36 37 38 3B
;   3C (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x63a5..0x63b0  (11 bytes)
DATA_pieza_63A5:
	defb 000h,004h,002h	; 63a5
	defb 028h,029h,02ch	; 63a8
	defb 02dh,020h,021h	; 63ab
	defb 024h,025h	; 63ae

; ----------------------------------------------------------------------
; DATOS pieza_63B0: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 31 32 33 34 35 36 37 38 3B
;   3C (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x63b0..0x63bb  (11 bytes)
DATA_pieza_63B0:
	defb 000h,004h,002h	; 63b0
	defb 02ah,02bh,02eh	; 63b3
	defb 02fh,022h,023h	; 63b6
	defb 026h,027h	; 63b9

; ----------------------------------------------------------------------
; DATOS pieza_63BB: una pieza de 4 x 7 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 31 32 33 34 35 36 37 38 39
;   3A (p03:BC2F/BBEE); lo leen p03:BC5C (31 bytes)
;   0x63bb..0x63da  (31 bytes)
DATA_pieza_63BB:
	defb 000h,004h,007h	; 63bb
	defb 030h,031h,032h	; 63be
	defb 033h,040h,041h	; 63c1
	defb 042h,034h,035h	; 63c4
	defb 036h,037h,044h	; 63c7
	defb 045h,046h,038h	; 63ca
	defb 039h,03ah,03bh	; 63cd
	defb 048h,049h,04ah	; 63d0
	defb 000h,03dh,03eh	; 63d3
	defb 03fh,04ch,000h	; 63d6
	defb 000h	; 63d9

; ----------------------------------------------------------------------
; DATOS pieza_63DA: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 34 35 37 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (19 bytes)
;   0x63da..0x63ed  (19 bytes)
DATA_pieza_63DA:
	defb 000h,004h,004h	; 63da
	defb 010h,011h,012h	; 63dd
	defb 013h,014h,015h	; 63e0
	defb 016h,017h,018h	; 63e3
	defb 019h,09ah,09bh	; 63e6
	defb 01ch,01dh,09eh	; 63e9
	defb 09fh	; 63ec

; ----------------------------------------------------------------------
; DATOS pieza_63ED: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 36 38 3D 3F
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x63ed..0x6400  (19 bytes)
DATA_pieza_63ED:
	defb 000h,004h,004h	; 63ed
	defb 098h,099h,012h	; 63f0
	defb 013h,09ch,09dh	; 63f3
	defb 016h,017h,018h	; 63f6
	defb 019h,01ah,01dh	; 63f9
	defb 01ch,01dh,01eh	; 63fc
	defb 01fh	; 63ff

; ----------------------------------------------------------------------
; DATOS pieza_6400: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 34 35 37 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (7 bytes)
;   0x6400..0x6407  (7 bytes)
DATA_pieza_6400:
	defb 000h,002h,002h	; 6400
	defb 02ah,02bh,02eh	; 6403
	defb 02fh	; 6406

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6407: 8 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (146 bytes)
;   0x6407..0x6499  (146 bytes)
DATA_piezas_sueltas_6407:
	defb 000h,002h,002h,028h,029h,02ch,02dh,000h,002h,002h,060h,061h,064h,065h,000h,004h	; 6407  ...(),-...`ade..
	defb 001h,063h,067h,06bh,06fh,000h,004h,001h,062h,066h,06ah,06eh,000h,003h,003h,070h	; 6417  .cgko...bfjn...p
	defb 071h,072h,074h,075h,076h,078h,079h,07ah,000h,005h,007h,070h,071h,071h,071h,071h	; 6427  qrtuvxyz...pqqqq
	defb 071h,072h,074h,075h,075h,075h,075h,075h,076h,074h,075h,075h,075h,075h,075h,076h	; 6437  qrtuuuuuvtuuuuuv
	defb 074h,075h,075h,075h,075h,075h,076h,078h,079h,079h,079h,079h,079h,07ah,000h,007h	; 6447  tuuuuuvxyyyyyz..
	defb 008h,053h,05bh,000h,000h,000h,000h,057h,053h,000h,000h,056h,000h,000h,05ah,000h	; 6457  .S[....WS..V..Z.
	defb 000h,000h,000h,000h,05bh,057h,000h,000h,000h,000h,000h,000h,057h,05bh,000h,000h	; 6467  ....[W......W[..
	defb 000h,000h,000h,05ah,000h,000h,056h,000h,000h,000h,057h,000h,000h,000h,000h,05bh	; 6477  ...Z..V...W....[
	defb 000h,051h,000h,000h,000h,000h,000h,000h,051h,000h,006h,001h,05dh,05dh,052h,05dh	; 6487  .Q......Q...]]R]
	defb 05dh,05dh	; 6497

; ----------------------------------------------------------------------
; DATOS pieza_6499: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 31 32 33 34 35 36 37 38 39
;   3A (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6499..0x64ac  (19 bytes)
DATA_pieza_6499:
	defb 000h,004h,004h	; 6499
	defb 080h,081h,082h	; 649c
	defb 083h,084h,085h	; 649f
	defb 086h,087h,088h	; 64a2
	defb 089h,08ah,08bh	; 64a5
	defb 08ch,08dh,08eh	; 64a8
	defb 08fh	; 64ab

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_64AC: 7 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (42 bytes)
;   0x64ac..0x64d6  (42 bytes)
DATA_piezas_sueltas_64AC:
	defb 000h,002h,002h,090h,091h,094h,095h,000h,002h,002h,096h,097h,092h,093h,000h,002h	; 64ac  ................
	defb 002h,096h,097h,092h,093h,000h,002h,001h,055h,003h,000h,002h,001h,054h,058h,000h	; 64bc  ........U....TX.
	defb 002h,001h,05ch,003h,000h,003h,001h,051h,000h,053h	; 64cc  ..\....Q.S

; ----------------------------------------------------------------------
; DATOS pieza_64D6: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 33 36 38 3E
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x64d6..0x64e9  (19 bytes)
DATA_pieza_64D6:
	defb 000h,004h,004h	; 64d6
	defb 010h,011h,0b2h	; 64d9
	defb 0b3h,014h,015h	; 64dc
	defb 0b6h,0b7h,018h	; 64df
	defb 019h,01ah,01bh	; 64e2
	defb 01ch,01dh,01eh	; 64e5
	defb 01fh	; 64e8

; ----------------------------------------------------------------------
; DATOS pieza_64E9: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 33 36 38 3B 3C 3E
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x64e9..0x64f0  (7 bytes)
DATA_pieza_64E9:
	defb 000h,002h,002h	; 64e9
	defb 022h,023h,026h	; 64ec
	defb 027h	; 64ef

; ----------------------------------------------------------------------
; DATOS pieza_64F0: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 36 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x64f0..0x6503  (19 bytes)
DATA_pieza_64F0:
	defb 000h,004h,004h	; 64f0
	defb 010h,011h,012h	; 64f3
	defb 013h,014h,015h	; 64f6
	defb 016h,017h,0b0h	; 64f9
	defb 0b1h,01ah,01bh	; 64fc
	defb 0b4h,0b5h,01eh	; 64ff
	defb 01fh	; 6502

; ----------------------------------------------------------------------
; DATOS pieza_6503: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 36 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x6503..0x650a  (7 bytes)
DATA_pieza_6503:
	defb 000h,002h,002h	; 6503
	defb 028h,029h,02ch	; 6506
	defb 02dh	; 6509

; ----------------------------------------------------------------------
; DATOS pieza_650A: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 36 38 3B 3C 3D 3F
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x650a..0x6511  (7 bytes)
DATA_pieza_650A:
	defb 000h,002h,002h	; 650a
	defb 020h,021h,024h	; 650d
	defb 025h	; 6510

; ----------------------------------------------------------------------
; DATOS pieza_6511: una pieza de 3 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 39 3A 3B 3C 3D 3E 3F 40
;   (p03:BC2F/BBEE); lo leen p03:BC5C (9 bytes)
;   0x6511..0x651a  (9 bytes)
DATA_pieza_6511:
	defb 000h,003h,002h	; 6511
	defb 04eh,04fh,068h	; 6514
	defb 069h,06ch,06dh	; 6517

; ----------------------------------------------------------------------
; DATOS pieza_651A: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 3B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x651a..0x6521  (7 bytes)
DATA_pieza_651A:
	defb 000h,002h,002h	; 651a
	defb 04eh,05fh,06ch	; 651d
	defb 06dh	; 6520

; ----------------------------------------------------------------------
; DATOS pieza_6521: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 3B 3C (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x6521..0x6528  (7 bytes)
DATA_pieza_6521:
	defb 000h,002h,002h	; 6521
	defb 05eh,04fh,06ch	; 6524
	defb 06dh	; 6527

; ----------------------------------------------------------------------
; DATOS pieza_6528: una pieza de 2 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 39 3A 3B 3C 3D 3E 3F
;   (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x6528..0x6533  (11 bytes)
DATA_pieza_6528:
	defb 000h,002h,004h	; 6528
	defb 0b8h,0b9h,0bah	; 652b
	defb 0bbh,0bch,0bdh	; 652e
	defb 0beh,0bfh	; 6531

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6533: 3 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (20 bytes)
;   0x6533..0x6547  (20 bytes)
DATA_piezas_sueltas_6533:
	defb 000h,007h,001h,053h,05dh,052h,05dh,05dh,05dh,051h,040h,002h,001h,09ch,09dh,040h	; 6533  ...S]R]]]Q@....@
	defb 002h,001h,09eh,09fh	; 6543

; ----------------------------------------------------------------------
; DATOS pieza_6547: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 31 32 33 34 35 36
;   37 (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6547..0x654b  (4 bytes)
DATA_pieza_6547:
	defb 000h,001h,001h	; 6547
	defb 002h	; 654a

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_654B: 6 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (109 bytes)
;   0x654b..0x65b8  (109 bytes)
DATA_piezas_sueltas_654B:
	defb 000h,008h,008h,070h,071h,072h,073h,080h,081h,082h,083h,074h,075h,076h,077h,084h	; 654b  ...pqrs....tuvw.
	defb 085h,086h,087h,078h,079h,07ah,07bh,088h,089h,08ah,08bh,07ch,07dh,07eh,07fh,08ch	; 655b  ...xyz{....|}~..
	defb 08dh,08eh,08fh,090h,091h,092h,093h,0a0h,0a1h,0a2h,000h,094h,095h,096h,097h,0a4h	; 656b  ................
	defb 0a5h,000h,000h,000h,099h,09ah,09bh,0a8h,000h,000h,000h,000h,09dh,09eh,09fh,0ach	; 657b  ................
	defb 000h,000h,000h,040h,004h,003h,0a0h,0a1h,0a2h,0a4h,0a5h,0a6h,0a8h,0a9h,0aah,0ach	; 658b  ...@............
	defb 0adh,0aeh,040h,004h,003h,0a3h,0b0h,0b1h,0a7h,0b4h,0b5h,0abh,0b8h,0b9h,0afh,0bch	; 659b  ..@.............
	defb 0bdh,040h,001h,001h,0d0h,040h,001h,001h,0d5h,040h,001h,001h,0d1h	; 65ab  .@...@...@...

; ----------------------------------------------------------------------
; DATOS pieza_65B8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 8A (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65b8..0x65bc  (4 bytes)
DATA_pieza_65B8:
	defb 040h,001h,001h	; 65b8
	defb 0d4h	; 65bb

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65BC: 11 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (44 bytes)
;   0x65bc..0x65e8  (44 bytes)
DATA_piezas_sueltas_65BC:
	defb 040h,001h,001h,0d2h,040h,001h,001h,0d7h,040h,001h,001h,0d3h,040h,001h,001h,0d6h	; 65bc  @...@...@...@...
	defb 040h,001h,001h,093h,040h,001h,001h,097h,040h,001h,001h,0dah,040h,001h,001h,0deh	; 65cc  @...@...@...@...
	defb 040h,001h,001h,0d8h,040h,001h,001h,0d9h,040h,001h,001h,0dch	; 65dc  @...@...@...

; ----------------------------------------------------------------------
; DATOS pieza_65E8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x65e8..0x65ec  (4 bytes)
DATA_pieza_65E8:
	defb 040h,001h,001h	; 65e8
	defb 0ddh	; 65eb

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65EC: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (4 bytes)
;   0x65ec..0x65f0  (4 bytes)
DATA_piezas_sueltas_65EC:
	defb 040h,001h,001h,0efh	; 65ec

; ----------------------------------------------------------------------
; DATOS pieza_65F0: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 30 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65f0..0x65f4  (4 bytes)
DATA_pieza_65F0:
	defb 040h,001h,001h	; 65f0
	defb 0e2h	; 65f3

; ----------------------------------------------------------------------
; DATOS pieza_65F4: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 30 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65f4..0x65f8  (4 bytes)
DATA_pieza_65F4:
	defb 040h,001h,001h	; 65f4
	defb 0e6h	; 65f7

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65F8: 2 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (8 bytes)
;   0x65f8..0x6600  (8 bytes)
DATA_piezas_sueltas_65F8:
	defb 040h,001h,001h,0e3h,040h,001h,001h,0ebh	; 65f8  @...@...

; ----------------------------------------------------------------------
; DATOS pieza_6600: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x6600..0x6604  (4 bytes)
DATA_pieza_6600:
	defb 040h,001h,001h	; 6600
	defb 0e7h	; 6603

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6604: 13 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (239 bytes)
;   0x6604..0x66f3  (239 bytes)
DATA_piezas_sueltas_6604:
	defb 040h,001h,001h,0dbh,040h,002h,002h,0f8h,0f9h,0fch,0fdh,040h,001h,001h,0f1h,040h	; 6604  @...@......@...@
	defb 004h,001h,073h,077h,07bh,07fh,040h,004h,001h,083h,087h,08bh,08fh,000h,004h,004h	; 6614  ..sw{.@.........
	defb 0a0h,0a1h,0a2h,0a3h,0a4h,0a5h,0a6h,0a7h,0a8h,0a9h,0aah,0abh,0ach,0adh,0aeh,0afh	; 6624  ................
	defb 040h,005h,005h,093h,0efh,0efh,0efh,0efh,000h,093h,0efh,0efh,0efh,000h,000h,093h	; 6634  @...............
	defb 0efh,0efh,000h,000h,000h,093h,0efh,000h,000h,000h,000h,093h,040h,005h,005h,0efh	; 6644  ............@...
	defb 0efh,0efh,0efh,0dah,0efh,0efh,0efh,0dah,000h,0efh,0efh,0dah,000h,000h,0efh,0dah	; 6654  ................
	defb 000h,000h,000h,0dah,000h,000h,000h,000h,040h,007h,007h,000h,000h,000h,000h,000h	; 6664  ........@.......
	defb 000h,097h,000h,000h,000h,000h,000h,097h,0d4h,000h,000h,000h,000h,097h,0efh,0efh	; 6674  ................
	defb 000h,000h,000h,097h,0d4h,0d4h,0d4h,000h,000h,097h,0efh,0efh,0efh,0efh,000h,097h	; 6684  ................
	defb 0efh,0efh,0efh,0efh,0efh,097h,0efh,0efh,0efh,0efh,0efh,0efh,040h,007h,007h,0deh	; 6694  ............@...
	defb 000h,000h,000h,000h,000h,000h,0d4h,0deh,000h,000h,000h,000h,000h,0efh,0efh,0deh	; 66a4  ................
	defb 000h,000h,000h,000h,0d4h,0d4h,0d4h,0deh,000h,000h,000h,0efh,0efh,0efh,0efh,0deh	; 66b4  ................
	defb 000h,000h,0efh,0efh,0efh,0efh,0efh,0deh,000h,0efh,0efh,0efh,0efh,0efh,0efh,0deh	; 66c4  ................
	defb 040h,001h,009h,0dbh,0d0h,0dbh,0dbh,0dbh,0d0h,0dbh,0d0h,0d2h,040h,001h,009h,0d7h	; 66d4  @...........@...
	defb 0d5h,0dbh,0d5h,0dbh,0dbh,0dbh,0d5h,0dbh,000h,002h,002h,0f0h,077h,073h,0f5h	; 66e4  ............ws.

; ----------------------------------------------------------------------
; DATOS pieza_66F3: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 8A
;   (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x66f3..0x66f7  (4 bytes)
DATA_pieza_66F3:
	defb 001h,001h,001h	; 66f3
	defb 0ffh	; 66f6

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_66F7: 8 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (47 bytes)
;   0x66f7..0x6726  (47 bytes)
DATA_piezas_sueltas_66F7:
	defb 000h,002h,002h,07fh,0f1h,0f4h,07bh,000h,001h,002h,0fah,0fbh,040h,002h,002h,0e8h	; 66f7  ......{.....@...
	defb 0e9h,0ech,0edh,040h,001h,006h,04eh,0f1h,0f1h,0f1h,0f1h,04fh,040h,001h,004h,04eh	; 6707  ...@..N....O@..N
	defb 0f1h,0f1h,04fh,000h,001h,001h,077h,000h,001h,001h,07fh,000h,001h,001h,07dh	; 6717  ..O...w.......}

; ----------------------------------------------------------------------
; DATOS pieza_6726: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x6726..0x672a  (4 bytes)
DATA_pieza_6726:
	defb 040h,001h,001h	; 6726
	defb 0f2h	; 6729

; ----------------------------------------------------------------------
; DATOS pieza_672A: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x672a..0x672e  (4 bytes)
DATA_pieza_672A:
	defb 040h,001h,001h	; 672a
	defb 0f3h	; 672d

; ----------------------------------------------------------------------
; DATOS pieza_672E: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x672e..0x6732  (4 bytes)
DATA_pieza_672E:
	defb 040h,001h,001h	; 672e
	defb 0f6h	; 6731

; ----------------------------------------------------------------------
; DATOS pieza_6732: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x6732..0x6736  (4 bytes)
DATA_pieza_6732:
	defb 040h,001h,001h	; 6732
	defb 0f7h	; 6735

; ----------------------------------------------------------------------
; DATOS pieza_6736: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x6736..0x673a  (4 bytes)
DATA_pieza_6736:
	defb 040h,001h,001h	; 6736
	defb 0fbh	; 6739

; ----------------------------------------------------------------------
; DATOS pieza_673A: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x673a..0x673e  (4 bytes)
DATA_pieza_673A:
	defb 040h,001h,001h	; 673a
	defb 0c7h	; 673d

; ----------------------------------------------------------------------
; DATOS pieza_673E: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (7 bytes)
;   0x673e..0x6745  (7 bytes)
DATA_pieza_673E:
	defb 040h,002h,002h	; 673e
	defb 0cah,0cbh,000h	; 6741
	defb 0cfh	; 6744

; ----------------------------------------------------------------------
; DATOS pieza_6745: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (7 bytes)
;   0x6745..0x674c  (7 bytes)
DATA_pieza_6745:
	defb 040h,002h,002h	; 6745
	defb 0c2h,0c3h,0c6h	; 6748
	defb 000h	; 674b

; ----------------------------------------------------------------------
; DATOS pieza_674C: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x674c..0x6750  (4 bytes)
DATA_pieza_674C:
	defb 040h,001h,001h	; 674c
	defb 0fah	; 674f

; ----------------------------------------------------------------------
; DATOS pieza_6750: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x6750..0x6754  (4 bytes)
DATA_pieza_6750:
	defb 040h,001h,001h	; 6750
	defb 0feh	; 6753

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6754: 2 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (218 bytes)
;   0x6754..0x682e  (218 bytes)
DATA_piezas_sueltas_6754:
	defb 000h,009h,008h,000h,000h,00ch,00dh,00eh,00fh,000h,000h,000h,000h,010h,011h,012h	; 6754  ................
	defb 013h,000h,000h,000h,000h,014h,015h,016h,017h,000h,000h,000h,000h,018h,019h,01ah	; 6764  ................
	defb 01bh,000h,000h,000h,000h,01ch,01dh,01eh,01fh,000h,000h,020h,021h,022h,023h,030h	; 6774  ........... !"#0
	defb 031h,032h,033h,024h,025h,026h,027h,034h,035h,036h,037h,028h,029h,02ah,02bh,038h	; 6784  123$%&'4567()*+8
	defb 039h,03ah,03bh,02ch,02dh,02eh,02fh,03ch,03dh,03eh,03fh,000h,007h,014h,040h,041h	; 6794  9:.,-./<=>?...@A
	defb 042h,043h,050h,051h,052h,053h,080h,081h,082h,083h,0a0h,0a1h,0a2h,0a3h,0c0h,0c1h	; 67a4  BCPQRS..........
	defb 0c2h,0c3h,044h,045h,046h,047h,054h,055h,056h,057h,084h,085h,086h,087h,0a4h,0a5h	; 67b4  ..DEFGTUVW......
	defb 0a6h,0a7h,0c4h,0c5h,0c6h,0c7h,048h,049h,04ah,04bh,058h,059h,05ah,05bh,088h,089h	; 67c4  ......HIJKXYZ[..
	defb 08ah,08bh,0a8h,0a9h,0aah,0abh,0c8h,0c9h,0cah,0cbh,04ch,04dh,04eh,04fh,05ch,05dh	; 67d4  ..........LMNO\]
	defb 05eh,05fh,08ch,08dh,08eh,08fh,0ach,0adh,0aeh,0afh,0cch,0cdh,0ceh,0cfh,060h,061h	; 67e4  ^_............`a
	defb 062h,063h,070h,071h,072h,073h,090h,091h,092h,093h,0b0h,0b1h,0b2h,0b3h,0d0h,0d1h	; 67f4  bcpqrs..........
	defb 0d2h,0d3h,064h,065h,066h,067h,074h,075h,076h,077h,094h,095h,096h,097h,0b4h,0b5h	; 6804  ..defgtuvw......
	defb 0b6h,0b7h,0d4h,0d5h,0d6h,0d7h,068h,069h,06ah,06bh,078h,079h,07ah,07bh,098h,099h	; 6814  ......hijkxyz{..
	defb 09ah,09bh,0b8h,0b9h,0bah,0bbh,0d8h,0d9h,0dah,0dbh	; 6824  ..........

; ----------------------------------------------------------------------
; DATOS pieza_682E: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 8A (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x682e..0x6841  (19 bytes)
DATA_pieza_682E:
	defb 000h,004h,004h	; 682e
	defb 03bh,081h,083h	; 6831
	defb 0a0h,083h,0a0h	; 6834
	defb 03bh,081h,03bh	; 6837
	defb 081h,083h,0a0h	; 683a
	defb 03fh,085h,087h	; 683d
	defb 0a4h	; 6840

; ----------------------------------------------------------------------
; DATOS pieza_6841: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 8A
;   (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6841..0x6845  (4 bytes)
DATA_pieza_6841:
	defb 001h,001h,001h	; 6841
	defb 0f1h	; 6844

; ----------------------------------------------------------------------
; DATOS ordenes_31_6845: las ordenes de pieza de la pantalla 0x31 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (97 bytes)
;   0x6845..0x68a6  (97 bytes)
DATA_ordenes_31_6845:
	defb 000h,001h,017h,01eh,099h,064h,008h,001h,004h,01eh,0bbh,063h,090h,004h,0bbh,063h	; 6845  .....d.....c...c
	defb 010h,012h,004h,00dh,0bbh,063h,008h,001h,001h,01eh,060h,062h,010h,004h,001h,007h	; 6855  .....c....`b....
	defb 060h,062h,010h,012h,001h,00dh,060h,062h,000h,001h,017h,004h,092h,063h,000h,005h	; 6865  `b....`b.....c..
	defb 017h,002h,0b0h,063h,000h,01bh,017h,004h,092h,063h,000h,019h,017h,002h,0a5h,063h	; 6875  ...c.....c.....c
	defb 084h,001h,0bbh,063h,084h,018h,0bbh,063h,004h,006h,013h,001h,047h,065h,004h,019h	; 6885  ...c...c....Ge..
	defb 013h,001h,047h,065h,004h,001h,001h,007h,047h,065h,004h,018h,001h,007h,047h,065h	; 6895  ..Ge....Ge....Ge
	defb 0ffh	; 68a5

; ----------------------------------------------------------------------
; DATOS objetos_31: los 0 objetos de la pantalla 0x31: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x68a6..0x68a7  (1 bytes)
DATA_objetos_31:
	defb 0ffh	; 68a6

; ----------------------------------------------------------------------
; DATOS sprites_31: los 0 grupos de sprites de la pantalla 0x31: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x68a7..0x68a8  (1 bytes)
DATA_sprites_31:
	defb 0ffh	; 68a7

; ----------------------------------------------------------------------
; DATOS ordenes_32_68A8: las ordenes de pieza de la pantalla 0x32 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (107 bytes)
;   0x68a8..0x6913  (107 bytes)
DATA_ordenes_32_68A8:
	defb 000h,001h,017h,01eh,099h,064h,009h,00bh,004h,00eh,0bbh,063h,007h,001h,004h,01eh	; 68a8  .....d.....c....
	defb 0bbh,063h,08ch,00dh,0bbh,063h,093h,008h,0bbh,063h,011h,005h,004h,00eh,0bbh,063h	; 68b8  .c...c...c.....c
	defb 007h,001h,001h,01eh,060h,062h,00ch,00dh,001h,007h,060h,062h,011h,005h,001h,00eh	; 68c8  ....`b....`b....
	defb 060h,062h,000h,001h,017h,004h,092h,063h,000h,005h,017h,002h,0b0h,063h,000h,019h	; 68d8  `b.....c.....c..
	defb 017h,002h,0a5h,063h,000h,01bh,017h,004h,092h,063h,084h,001h,0bbh,063h,084h,018h	; 68e8  ...c.....c...c..
	defb 0bbh,063h,004h,006h,013h,001h,047h,065h,004h,019h,013h,001h,047h,065h,004h,001h	; 68f8  .c....Ge....Ge..
	defb 001h,007h,047h,065h,004h,018h,001h,007h,047h,065h,0ffh	; 6908  ..Ge....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_32: los 2 objetos de la pantalla 0x32: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6913..0x691c  (9 bytes)
DATA_objetos_32:
	defb 006h,000h,00fh,016h	; 6913
	defb 00ah,000h,00ch,008h	; 6917
	defb 0ffh	; 691b

; ----------------------------------------------------------------------
; DATOS sprites_32: los 1 grupos de sprites de la pantalla 0x32: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x691c..0x6921  (5 bytes)
DATA_sprites_32:
	defb 019h,000h,050h,070h	; 691c
	defb 0ffh	; 6920

; ----------------------------------------------------------------------
; DATOS ordenes_33_6921: las ordenes de pieza de la pantalla 0x33 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (141 bytes)
;   0x6921..0x69ae  (141 bytes)
DATA_ordenes_33_6921:
	defb 000h,001h,017h,01eh,099h,064h,089h,012h,0bbh,063h,007h,001h,004h,01eh,0bbh,063h	; 6921  .....d...c.....c
	defb 093h,012h,0bbh,063h,007h,001h,001h,01eh,060h,062h,013h,012h,001h,007h,060h,062h	; 6931  ...c....`b....`b
	defb 000h,001h,017h,004h,092h,063h,00ch,005h,00bh,004h,092h,063h,010h,009h,007h,004h	; 6941  .....c.....c....
	defb 092h,063h,088h,005h,0d6h,064h,08ch,009h,0d6h,064h,000h,005h,008h,002h,0b0h,063h	; 6951  .c...d...d.....c
	defb 010h,00dh,007h,002h,0b0h,063h,08ah,009h,0e9h,064h,08eh,00dh,0e9h,064h,000h,019h	; 6961  .....c...d...d..
	defb 017h,002h,0a5h,063h,000h,01bh,017h,004h,092h,063h,084h,001h,0bbh,063h,084h,018h	; 6971  ...c.....c...c..
	defb 0bbh,063h,004h,019h,013h,001h,047h,065h,004h,006h,013h,001h,047h,065h,00ah,007h	; 6981  .c....Ge....Ge..
	defb 00dh,004h,047h,065h,00eh,00bh,009h,004h,047h,065h,007h,007h,006h,005h,047h,065h	; 6991  ..Ge....Ge....Ge
	defb 004h,001h,001h,007h,047h,065h,004h,018h,001h,007h,047h,065h,0ffh	; 69a1  ....Ge....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_33: los 1 objetos de la pantalla 0x33: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x69ae..0x69b3  (5 bytes)
DATA_objetos_33:
	defb 006h,000h,011h,007h	; 69ae
	defb 0ffh	; 69b2

; ----------------------------------------------------------------------
; DATOS sprites_33: los 2 grupos de sprites de la pantalla 0x33: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x69b3..0x69bc  (9 bytes)
DATA_sprites_33:
	defb 001h,000h,050h,068h	; 69b3
	defb 001h,000h,078h,098h	; 69b7
	defb 0ffh	; 69bb

; ----------------------------------------------------------------------
; DATOS ordenes_34_69BC: las ordenes de pieza de la pantalla 0x34 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (101 bytes)
;   0x69bc..0x6a21  (101 bytes)
DATA_ordenes_34_69BC:
	defb 000h,001h,017h,01eh,099h,064h,087h,011h,0bbh,063h,00eh,005h,004h,00eh,0bbh,063h	; 69bc  .....d...c.....c
	defb 007h,011h,001h,007h,060h,062h,00eh,005h,001h,00eh,060h,062h,000h,001h,017h,008h	; 69cc  ....`b....`b....
	defb 092h,063h,080h,009h,092h,063h,084h,009h,0dah,063h,080h,00dh,0b0h,063h,084h,00dh	; 69dc  .c...c...c...c..
	defb 000h,064h,008h,009h,00fh,002h,0b0h,063h,000h,019h,017h,002h,0a5h,063h,000h,01bh	; 69ec  .d.....c.....c..
	defb 017h,004h,092h,063h,084h,018h,0bbh,063h,085h,001h,0bbh,063h,004h,018h,013h,001h	; 69fc  ...c...c...c....
	defb 047h,065h,005h,001h,004h,00eh,0bbh,063h,005h,00ah,012h,001h,047h,065h,004h,018h	; 6a0c  Ge.....c....Ge..
	defb 001h,017h,047h,065h,0ffh	; 6a1c

; ----------------------------------------------------------------------
; DATOS objetos_34: los 2 objetos de la pantalla 0x34: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6a21..0x6a2a  (9 bytes)
DATA_objetos_34:
	defb 006h,000h,009h,007h	; 6a21
	defb 006h,000h,011h,007h	; 6a25
	defb 0ffh	; 6a29

; ----------------------------------------------------------------------
; DATOS sprites_34: los 2 grupos de sprites de la pantalla 0x34: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6a2a..0x6a33  (9 bytes)
DATA_sprites_34:
	defb 001h,000h,000h,050h	; 6a2a
	defb 008h,000h,030h,010h	; 6a2e
	defb 0ffh	; 6a32

; ----------------------------------------------------------------------
; DATOS ordenes_35_6A33: las ordenes de pieza de la pantalla 0x35 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (133 bytes)
;   0x6a33..0x6ab8  (133 bytes)
DATA_ordenes_35_6A33:
	defb 000h,001h,017h,01eh,099h,064h,085h,012h,0bbh,063h,08ah,00eh,0bbh,063h,013h,005h	; 6a33  .....d...c...c..
	defb 004h,015h,0bbh,063h,011h,001h,004h,01eh,0bbh,063h,011h,001h,001h,01eh,060h,062h	; 6a43  ...c.....c....`b
	defb 00ah,00eh,001h,007h,060h,062h,005h,012h,001h,007h,060h,062h,000h,001h,017h,004h	; 6a53  ....`b....`b....
	defb 092h,063h,000h,005h,008h,004h,092h,063h,088h,005h,0dah,063h,000h,009h,008h,002h	; 6a63  .c.....c...c....
	defb 0b0h,063h,088h,009h,000h,064h,00ch,005h,00bh,002h,0b0h,063h,000h,019h,017h,002h	; 6a73  .c...d.....c....
	defb 0a5h,063h,000h,01bh,017h,004h,092h,063h,084h,001h,0bbh,063h,084h,018h,0bbh,063h	; 6a83  .c.....c...c...c
	defb 004h,019h,013h,001h,047h,065h,008h,006h,00fh,001h,047h,065h,004h,001h,001h,007h	; 6a93  ....Ge....Ge....
	defb 047h,065h,004h,018h,001h,007h,047h,065h,004h,007h,007h,001h,047h,065h,009h,005h	; 6aa3  Ge....Ge....Ge..
	defb 001h,003h,047h,065h,0ffh	; 6ab3

; ----------------------------------------------------------------------
; DATOS objetos_35: los 1 objetos de la pantalla 0x35: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x6ab8..0x6abd  (5 bytes)
DATA_objetos_35:
	defb 014h,0f8h,001h,016h	; 6ab8
	defb 0ffh	; 6abc

; ----------------------------------------------------------------------
; DATOS sprites_35: los 0 grupos de sprites de la pantalla 0x35: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6abd..0x6abe  (1 bytes)
DATA_sprites_35:
	defb 0ffh	; 6abd

; ----------------------------------------------------------------------
; DATOS ordenes_36_6ABE: las ordenes de pieza de la pantalla 0x36 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (119 bytes)
;   0x6abe..0x6b35  (119 bytes)
DATA_ordenes_36_6ABE:
	defb 000h,001h,017h,01eh,099h,064h,000h,001h,017h,004h,092h,063h,000h,005h,017h,002h	; 6abe  .....d.....c....
	defb 0b0h,063h,090h,005h,0d6h,064h,014h,005h,003h,004h,092h,063h,092h,009h,0e9h,064h	; 6ace  .c...d.....c...d
	defb 014h,009h,003h,002h,0b0h,063h,000h,019h,017h,002h,0a5h,063h,000h,01bh,017h,004h	; 6ade  .....c.....c....
	defb 092h,063h,084h,017h,0edh,063h,088h,017h,092h,063h,08ch,017h,0f0h,064h,086h,015h	; 6aee  .c...c...c...d..
	defb 00ah,065h,088h,015h,0a5h,063h,08ch,015h,003h,065h,084h,001h,0bbh,063h,084h,018h	; 6afe  .e...c...e...c..
	defb 0bbh,063h,004h,006h,013h,001h,047h,065h,012h,007h,005h,004h,047h,065h,004h,019h	; 6b0e  .c....Ge....Ge..
	defb 013h,001h,047h,065h,006h,015h,008h,004h,047h,065h,004h,001h,001h,007h,047h,065h	; 6b1e  ..Ge....Ge....Ge
	defb 004h,018h,001h,007h,047h,065h,0ffh	; 6b2e

; ----------------------------------------------------------------------
; DATOS objetos_36: los 3 objetos de la pantalla 0x36: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6b35..0x6b42  (13 bytes)
DATA_objetos_36:
	defb 006h,000h,013h,005h	; 6b35
	defb 006h,000h,007h,017h	; 6b39
	defb 006h,000h,00ah,017h	; 6b3d
	defb 0ffh	; 6b41

; ----------------------------------------------------------------------
; DATOS sprites_36: los 4 grupos de sprites de la pantalla 0x36: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (17 bytes)
;   0x6b42..0x6b53  (17 bytes)
DATA_sprites_36:
	defb 01bh,000h,058h,070h	; 6b42
	defb 001h,000h,003h,010h	; 6b46
	defb 001h,000h,003h,0a0h	; 6b4a
	defb 019h,000h,060h,050h	; 6b4e
	defb 0ffh	; 6b52

; ----------------------------------------------------------------------
; DATOS ordenes_37_6B53: las ordenes de pieza de la pantalla 0x37 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (123 bytes)
;   0x6b53..0x6bce  (123 bytes)
DATA_ordenes_37_6B53:
	defb 000h,001h,017h,01eh,099h,064h,085h,011h,0bbh,063h,087h,007h,0bbh,063h,00dh,00bh	; 6b53  .....d...c...c..
	defb 004h,00eh,0bbh,063h,00bh,001h,004h,01eh,0bbh,063h,093h,009h,0bbh,063h,093h,00dh	; 6b63  ...c.....c...c..
	defb 0bbh,063h,005h,011h,001h,007h,060h,062h,007h,007h,001h,007h,060h,062h,00bh,001h	; 6b73  .c....`b....`b..
	defb 001h,01eh,060h,062h,013h,009h,001h,00bh,060h,062h,000h,001h,017h,004h,092h,063h	; 6b83  ..`b....`b.....c
	defb 080h,005h,0dah,063h,080h,009h,000h,064h,004h,005h,013h,002h,0b0h,063h,000h,019h	; 6b93  ...c...d.....c..
	defb 017h,002h,0a5h,063h,000h,01bh,017h,004h,092h,063h,084h,001h,0bbh,063h,084h,018h	; 6ba3  ...c.....c...c..
	defb 0bbh,063h,004h,006h,013h,001h,047h,065h,004h,019h,013h,001h,047h,065h,004h,001h	; 6bb3  .c....Ge....Ge..
	defb 001h,007h,047h,065h,004h,018h,001h,007h,047h,065h,0ffh	; 6bc3  ..Ge....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_37: los 2 objetos de la pantalla 0x37: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6bce..0x6bd7  (9 bytes)
DATA_objetos_37:
	defb 006h,001h,00fh,009h	; 6bce
	defb 006h,001h,00fh,011h	; 6bd2
	defb 0ffh	; 6bd6

; ----------------------------------------------------------------------
; DATOS sprites_37: los 2 grupos de sprites de la pantalla 0x37: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6bd7..0x6be0  (9 bytes)
DATA_sprites_37:
	defb 001h,000h,058h,068h	; 6bd7
	defb 008h,000h,030h,010h	; 6bdb
	defb 0ffh	; 6bdf

; ----------------------------------------------------------------------
; DATOS ordenes_38_6BE0: las ordenes de pieza de la pantalla 0x38 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (127 bytes)
;   0x6be0..0x6c5f  (127 bytes)
DATA_ordenes_38_6BE0:
	defb 000h,001h,017h,01eh,099h,064h,004h,00eh,004h,00eh,0bbh,063h,00ah,001h,004h,01eh	; 6be0  .....d.....c....
	defb 0bbh,063h,004h,00eh,001h,00eh,060h,062h,00ah,001h,001h,01eh,047h,065h,000h,001h	; 6bf0  .c....`b....Ge..
	defb 017h,004h,092h,063h,000h,005h,017h,002h,0b0h,063h,090h,005h,0d6h,064h,092h,009h	; 6c00  ...c.....c...d..
	defb 0e9h,064h,014h,005h,003h,004h,092h,063h,014h,009h,003h,002h,0b0h,063h,000h,019h	; 6c10  .d.....c.....c..
	defb 017h,002h,0a5h,063h,000h,01bh,017h,004h,092h,063h,090h,017h,0edh,063h,092h,015h	; 6c20  ...c.....c...c..
	defb 00ah,065h,014h,017h,003h,004h,092h,063h,014h,015h,003h,002h,0a5h,063h,084h,001h	; 6c30  .e.....c.....c..
	defb 0bbh,063h,084h,017h,0bbh,063h,004h,006h,013h,001h,047h,065h,004h,019h,013h,001h	; 6c40  .c...c....Ge....
	defb 047h,065h,004h,001h,001h,007h,047h,065h,004h,017h,001h,008h,047h,065h,0ffh	; 6c50  Ge....Ge....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_38: los 5 objetos de la pantalla 0x38: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x6c5f..0x6c74  (21 bytes)
DATA_objetos_38:
	defb 006h,000h,00ch,008h	; 6c5f
	defb 006h,000h,010h,00bh	; 6c63
	defb 006h,000h,010h,013h	; 6c67
	defb 006h,000h,00ch,016h	; 6c6b
	defb 017h,000h,00fh,00eh	; 6c6f
	defb 0ffh	; 6c73

; ----------------------------------------------------------------------
; DATOS sprites_38: los 0 grupos de sprites de la pantalla 0x38: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6c74..0x6c75  (1 bytes)
DATA_sprites_38:
	defb 0ffh	; 6c74

; ----------------------------------------------------------------------
; DATOS ordenes_39_6C75: las ordenes de pieza de la pantalla 0x39 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (47 bytes)
;   0x6c75..0x6ca4  (47 bytes)
DATA_ordenes_39_6C75:
	defb 000h,001h,017h,01eh,099h,064h,088h,005h,0bbh,063h,007h,001h,004h,00eh,0bbh,063h	; 6c75  .....d...c.....c
	defb 00dh,001h,002h,01eh,028h,065h,00fh,001h,008h,01eh,092h,063h,014h,001h,003h,01eh	; 6c85  ....(e.....c....
	defb 011h,065h,00dh,001h,001h,01eh,047h,065h,007h,001h,001h,00eh,060h,062h,0ffh	; 6c95  .e....Ge....`b.

; ----------------------------------------------------------------------
; DATOS objetos_39: los 0 objetos de la pantalla 0x39: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x6ca4..0x6ca5  (1 bytes)
DATA_objetos_39:
	defb 0ffh	; 6ca4

; ----------------------------------------------------------------------
; DATOS sprites_39: los 0 grupos de sprites de la pantalla 0x39: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6ca5..0x6ca6  (1 bytes)
DATA_sprites_39:
	defb 0ffh	; 6ca5

; ----------------------------------------------------------------------
; DATOS ordenes_3A_6CA6: las ordenes de pieza de la pantalla 0x3A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (63 bytes)
;   0x6ca6..0x6ce5  (63 bytes)
DATA_ordenes_3A_6CA6:
	defb 000h,001h,017h,01eh,099h,064h,086h,004h,0bbh,063h,088h,017h,0bbh,063h,005h,001h	; 6ca6  .....d...c...c..
	defb 004h,00eh,0bbh,063h,007h,013h,004h,00ch,0bbh,063h,00dh,001h,002h,01eh,028h,065h	; 6cb6  ...c.....c....(e
	defb 00fh,001h,008h,01eh,092h,063h,014h,001h,003h,01eh,011h,065h,00dh,001h,001h,01eh	; 6cc6  .....c.....e....
	defb 047h,065h,005h,001h,001h,00eh,060h,062h,007h,013h,001h,00ch,060h,062h,0ffh	; 6cd6  Ge....`b....`b.

; ----------------------------------------------------------------------
; DATOS objetos_3A: los 3 objetos de la pantalla 0x3A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6ce5..0x6cf2  (13 bytes)
DATA_objetos_3A:
	defb 014h,001h,001h,002h	; 6ce5
	defb 006h,000h,007h,007h	; 6ce9
	defb 006h,000h,010h,012h	; 6ced
	defb 0ffh	; 6cf1

; ----------------------------------------------------------------------
; DATOS sprites_3A: los 1 grupos de sprites de la pantalla 0x3A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x6cf2..0x6cf7  (5 bytes)
DATA_sprites_3A:
	defb 01ch,000h,09ch,068h	; 6cf2
	defb 0ffh	; 6cf6

; ----------------------------------------------------------------------
; DATOS ordenes_3B_6CF7: las ordenes de pieza de la pantalla 0x3B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (151 bytes)
;   0x6cf7..0x6d8e  (151 bytes)
DATA_ordenes_3B_6CF7:
	defb 000h,001h,017h,01eh,099h,064h,087h,00dh,0bbh,063h,086h,018h,0bbh,063h,005h,015h	; 6cf7  .....d...c...c..
	defb 004h,00ah,0bbh,063h,005h,001h,002h,008h,028h,065h,085h,009h,0e9h,064h,007h,001h	; 6d07  ...c....(e...d..
	defb 010h,008h,092h,063h,007h,009h,010h,002h,0b0h,063h,08dh,008h,00ah,065h,00fh,008h	; 6d17  ...c.....c...e..
	defb 008h,002h,0a5h,063h,00dh,00ah,002h,008h,028h,065h,08dh,012h,0e9h,064h,00fh,00ah	; 6d27  ...c....(e...d..
	defb 008h,008h,092h,063h,00fh,012h,008h,002h,0b0h,063h,08dh,018h,00ah,065h,00fh,018h	; 6d37  ...c.....c...e..
	defb 008h,002h,0a5h,063h,00fh,01ah,008h,005h,092h,063h,00dh,01ah,002h,005h,028h,065h	; 6d47  ...c.....c....(e
	defb 014h,001h,003h,01eh,011h,065h,013h,001h,002h,005h,011h,065h,093h,006h,01ah,065h	; 6d57  .....e.....e...e
	defb 093h,014h,021h,065h,093h,016h,01ah,065h,005h,001h,001h,00ah,060h,062h,00dh,008h	; 6d67  ..!e...e....`b..
	defb 001h,00ch,047h,065h,007h,00dh,001h,007h,060h,062h,005h,015h,001h,00ah,060h,062h	; 6d77  ..Ge....`b....`b
	defb 00dh,018h,001h,007h,047h,065h,0ffh	; 6d87

; ----------------------------------------------------------------------
; DATOS objetos_3B: los 2 objetos de la pantalla 0x3B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6d8e..0x6d97  (9 bytes)
DATA_objetos_3B:
	defb 00ah,000h,007h,004h	; 6d8e
	defb 014h,001h,001h,002h	; 6d92
	defb 0ffh	; 6d96

; ----------------------------------------------------------------------
; DATOS sprites_3B: los 2 grupos de sprites de la pantalla 0x3B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6d97..0x6da0  (9 bytes)
DATA_sprites_3B:
	defb 01ch,000h,09ch,068h	; 6d97
	defb 01ch,000h,09ch,0b0h	; 6d9b
	defb 0ffh	; 6d9f

; ----------------------------------------------------------------------
; DATOS ordenes_3C_6DA0: las ordenes de pieza de la pantalla 0x3C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (123 bytes)
;   0x6da0..0x6e1b  (123 bytes)
DATA_ordenes_3C_6DA0:
	defb 000h,001h,017h,01eh,099h,064h,085h,001h,028h,065h,085h,005h,0e9h,064h,007h,001h	; 6da0  .....d..(e...d..
	defb 010h,004h,092h,063h,007h,005h,010h,002h,0b0h,063h,085h,010h,00ah,065h,005h,012h	; 6db0  ...c.....c...e..
	defb 002h,00dh,028h,065h,007h,010h,010h,002h,0a5h,063h,007h,012h,010h,00dh,092h,063h	; 6dc0  ..(e.....c.....c
	defb 08dh,011h,00ah,065h,00dh,013h,002h,008h,028h,065h,08dh,01bh,0e9h,064h,00fh,011h	; 6dd0  ...e....(e...d..
	defb 008h,002h,0a5h,063h,00fh,013h,008h,008h,092h,063h,00fh,01bh,008h,002h,0b0h,063h	; 6de0  ...c.....c.....c
	defb 014h,001h,003h,01eh,011h,065h,093h,007h,021h,065h,013h,009h,002h,005h,011h,065h	; 6df0  .....e..!e.....e
	defb 093h,00eh,011h,065h,093h,01dh,021h,065h,005h,001h,001h,006h,060h,062h,005h,010h	; 6e00  ...e..!e....`b..
	defb 001h,00fh,060h,062h,00dh,011h,001h,00ch,047h,065h,0ffh	; 6e10  ..`b....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_3C: los 3 objetos de la pantalla 0x3C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6e1b..0x6e28  (13 bytes)
DATA_objetos_3C:
	defb 006h,000h,011h,008h	; 6e1b
	defb 006h,000h,011h,00eh	; 6e1f
	defb 006h,000h,00bh,017h	; 6e23
	defb 0ffh	; 6e27

; ----------------------------------------------------------------------
; DATOS sprites_3C: los 2 grupos de sprites de la pantalla 0x3C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6e28..0x6e31  (9 bytes)
DATA_sprites_3C:
	defb 01ch,000h,09ch,058h	; 6e28
	defb 01bh,000h,060h,060h	; 6e2c
	defb 0ffh	; 6e30

; ----------------------------------------------------------------------
; DATOS ordenes_3D_6E31: las ordenes de pieza de la pantalla 0x3D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (107 bytes)
;   0x6e31..0x6e9c  (107 bytes)
DATA_ordenes_3D_6E31:
	defb 000h,001h,017h,01eh,099h,064h,086h,005h,0bbh,063h,005h,001h,004h,00eh,0bbh,063h	; 6e31  .....d...c.....c
	defb 08dh,00dh,00ah,065h,00fh,00dh,008h,002h,0a5h,063h,00dh,00fh,002h,008h,028h,065h	; 6e41  ...e.....c....(e
	defb 00fh,00fh,008h,010h,092h,063h,08bh,017h,0edh,063h,087h,019h,0a5h,063h,085h,019h	; 6e51  .....c...c...c..
	defb 00ah,065h,085h,01bh,028h,065h,007h,01bh,008h,004h,092h,063h,014h,001h,003h,01eh	; 6e61  .e..(e.....c....
	defb 011h,065h,091h,001h,0bbh,063h,005h,001h,001h,00eh,060h,062h,011h,001h,001h,008h	; 6e71  .e...c....`b....
	defb 047h,065h,00dh,00dh,001h,00bh,047h,065h,005h,019h,001h,006h,047h,065h,006h,019h	; 6e81  Ge....Ge....Ge..
	defb 005h,001h,047h,065h,00bh,018h,001h,002h,047h,065h,0ffh	; 6e91  ..Ge....Ge.

; ----------------------------------------------------------------------
; DATOS objetos_3D: los 4 objetos de la pantalla 0x3D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6e9c..0x6ead  (17 bytes)
DATA_objetos_3D:
	defb 006h,000h,00fh,006h	; 6e9c
	defb 006h,000h,005h,015h	; 6ea0
	defb 00ah,000h,009h,010h	; 6ea4
	defb 014h,001h,001h,002h	; 6ea8
	defb 0ffh	; 6eac

; ----------------------------------------------------------------------
; DATOS sprites_3D: los 2 grupos de sprites de la pantalla 0x3D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6ead..0x6eb6  (9 bytes)
DATA_sprites_3D:
	defb 01ch,000h,09ch,050h	; 6ead
	defb 01ch,000h,09ch,0a8h	; 6eb1
	defb 0ffh	; 6eb5

; ----------------------------------------------------------------------
; DATOS ordenes_3E_6EB6: las ordenes de pieza de la pantalla 0x3E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (99 bytes)
;   0x6eb6..0x6f19  (99 bytes)
DATA_ordenes_3E_6EB6:
	defb 000h,001h,017h,01eh,099h,064h,087h,013h,0bbh,063h,006h,011h,004h,00eh,0bbh,063h	; 6eb6  .....d...c.....c
	defb 005h,00dh,004h,012h,0bbh,063h,009h,001h,002h,008h,028h,065h,089h,009h,0e9h,064h	; 6ec6  .....c....(e...d
	defb 00bh,001h,00ch,008h,092h,063h,08bh,009h,0d6h,064h,00fh,009h,008h,00ch,092h,063h	; 6ed6  .....c...d.....c
	defb 00dh,00dh,002h,008h,028h,065h,08dh,015h,0e9h,064h,00fh,015h,008h,002h,0b0h,063h	; 6ee6  ....(e...d.....c
	defb 014h,001h,003h,01eh,011h,065h,091h,018h,0bbh,063h,005h,00dh,001h,012h,060h,062h	; 6ef6  .....e...c....`b
	defb 009h,001h,001h,00ah,047h,065h,00dh,00bh,001h,00ch,047h,065h,011h,018h,001h,007h	; 6f06  ....Ge....Ge....
	defb 047h,065h,0ffh	; 6f16

; ----------------------------------------------------------------------
; DATOS objetos_3E: los 1 objetos de la pantalla 0x3E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x6f19..0x6f1e  (5 bytes)
DATA_objetos_3E:
	defb 014h,001h,003h,002h	; 6f19
	defb 0ffh	; 6f1d

; ----------------------------------------------------------------------
; DATOS sprites_3E: los 2 grupos de sprites de la pantalla 0x3E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6f1e..0x6f27  (9 bytes)
DATA_sprites_3E:
	defb 01ch,000h,09ch,050h	; 6f1e
	defb 01ch,000h,09ch,090h	; 6f22
	defb 0ffh	; 6f26

; ----------------------------------------------------------------------
; DATOS ordenes_3F_6F27: las ordenes de pieza de la pantalla 0x3F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (83 bytes)
;   0x6f27..0x6f7a  (83 bytes)
DATA_ordenes_3F_6F27:
	defb 000h,001h,017h,01eh,099h,064h,08fh,001h,0bbh,063h,089h,015h,00ah,065h,009h,017h	; 6f27  .....d...c...e..
	defb 002h,008h,028h,065h,08bh,013h,0edh,063h,00bh,017h,004h,008h,092h,063h,08dh,009h	; 6f37  ..(e...c.....c..
	defb 00ah,065h,00dh,00bh,002h,008h,028h,065h,00fh,009h,008h,002h,0a5h,063h,00fh,00bh	; 6f47  .e....(e.....c..
	defb 008h,014h,092h,063h,014h,001h,003h,01eh,011h,065h,00fh,001h,001h,007h,047h,065h	; 6f57  ...c.....e....Ge
	defb 00dh,009h,001h,00ch,047h,065h,00bh,014h,001h,003h,047h,065h,009h,015h,001h,00ah	; 6f67  ....Ge....Ge....
	defb 047h,065h,0ffh	; 6f77

; ----------------------------------------------------------------------
; DATOS objetos_3F: los 3 objetos de la pantalla 0x3F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6f7a..0x6f87  (13 bytes)
DATA_objetos_3F:
	defb 006h,000h,008h,00bh	; 6f7a
	defb 006h,000h,010h,012h	; 6f7e
	defb 014h,001h,009h,002h	; 6f82
	defb 0ffh	; 6f86

; ----------------------------------------------------------------------
; DATOS sprites_3F: los 2 grupos de sprites de la pantalla 0x3F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6f87..0x6f90  (9 bytes)
DATA_sprites_3F:
	defb 01ch,000h,09ch,080h	; 6f87
	defb 008h,000h,030h,010h	; 6f8b
	defb 0ffh	; 6f8f

; ----------------------------------------------------------------------
; DATOS ordenes_40_6F90: las ordenes de pieza de la pantalla 0x40 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (49 bytes)
;   0x6f90..0x6fc1  (49 bytes)
DATA_ordenes_40_6F90:
	defb 000h,001h,017h,01eh,099h,064h,010h,00ah,004h,015h,0bbh,063h,00fh,007h,004h,018h	; 6f90  .....d.....c....
	defb 0bbh,063h,014h,001h,003h,01eh,011h,065h,000h,001h,017h,004h,092h,063h,000h,005h	; 6fa0  .c.....e.....c..
	defb 017h,002h,0b0h,063h,000h,006h,017h,001h,047h,065h,00fh,007h,001h,018h,047h,065h	; 6fb0  ...c....Ge....Ge
	defb 0ffh	; 6fc0

; ----------------------------------------------------------------------
; DATOS objetos_40: los 4 objetos de la pantalla 0x40: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6fc1..0x6fd2  (17 bytes)
DATA_objetos_40:
	defb 006h,000h,005h,00ch	; 6fc1
	defb 006h,000h,005h,017h	; 6fc5
	defb 017h,000h,003h,00fh	; 6fc9
	defb 014h,000h,000h,008h	; 6fcd
	defb 0ffh	; 6fd1

; ----------------------------------------------------------------------
; DATOS sprites_40: los 2 grupos de sprites de la pantalla 0x40: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6fd2..0x6fdb  (9 bytes)
DATA_sprites_40:
	defb 01ch,000h,09ch,070h	; 6fd2
	defb 01ch,000h,09ch,0c0h	; 6fd6
	defb 0ffh	; 6fda

; ----------------------------------------------------------------------
; DATOS ordenes_8A_6FDB: las ordenes de pieza de la pantalla 0x8A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (43 bytes)
;   0x6fdb..0x7006  (43 bytes)
DATA_ordenes_8A_6FDB:
	defb 000h,001h,017h,01eh,02ch,070h,014h,001h,003h,01eh,0b8h,065h,012h,001h,002h,01eh	; 6fdb  ....,p.....e....
	defb 0f3h,066h,011h,001h,001h,01eh,041h,068h,016h,001h,001h,01eh,047h,065h,000h,001h	; 6feb  .f....Ah....Ge..
	defb 004h,01eh,02eh,068h,003h,008h,003h,011h,020h,062h,0ffh	; 6ffb  ...h.... b.

; ----------------------------------------------------------------------
; DATOS objetos_8A: los 9 objetos de la pantalla 0x8A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (37 bytes)
;   0x7006..0x702b  (37 bytes)
DATA_objetos_8A:
	defb 012h,000h,003h,00fh	; 7006
	defb 005h,000h,00ch,009h	; 700a
	defb 005h,000h,00ch,00dh	; 700e
	defb 005h,000h,00ch,011h	; 7012
	defb 005h,000h,00ch,015h	; 7016
	defb 005h,000h,008h,009h	; 701a
	defb 005h,000h,008h,00dh	; 701e
	defb 005h,000h,008h,011h	; 7022
	defb 005h,000h,008h,015h	; 7026
	defb 0ffh	; 702a

; ----------------------------------------------------------------------
; DATOS sprites_8A: los 0 grupos de sprites de la pantalla 0x8A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x702b..0x702c  (1 bytes)
DATA_sprites_8A:
	defb 0ffh	; 702b

; ----------------------------------------------------------------------
; DATOS pieza_702C: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2E 2F 30 8A
;   (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x702c..0x7037  (11 bytes)
DATA_pieza_702C:
	defb 040h,004h,002h	; 702c
	defb 030h,031h,034h	; 702f
	defb 035h,038h,039h	; 7032
	defb 03ch,03dh	; 7035

; ----------------------------------------------------------------------
; DATOS ordenes_2E_7037: las ordenes de pieza de la pantalla 0x2E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (187 bytes)
;   0x7037..0x70f2  (187 bytes)
DATA_ordenes_2E_7037:
	defb 000h,001h,017h,01eh,02ch,070h,012h,001h,005h,01eh,0e8h,065h,012h,001h,002h,01eh	; 7037  ....,p.....e....
	defb 000h,066h,015h,001h,001h,01eh,000h,066h,00ah,006h,004h,002h,03eh,067h,087h,004h	; 7047  .f.....f....>g..
	defb 026h,067h,008h,004h,006h,001h,036h,067h,08eh,004h,02eh,067h,00eh,005h,001h,017h	; 7057  &g....6g...g....
	defb 03ah,067h,08eh,01ch,032h,067h,008h,01ch,006h,001h,036h,067h,087h,01ch,02ah,067h	; 7067  :g..2g....6g..*g
	defb 00ah,019h,004h,002h,045h,067h,00ah,001h,001h,005h,03ah,067h,00bh,008h,001h,011h	; 7077  ....Eg....:g....
	defb 03ah,067h,00ah,01bh,001h,004h,03ah,067h,087h,006h,03eh,067h,087h,019h,045h,067h	; 7087  :g....:g..>g..Eg
	defb 08ch,005h,02eh,067h,002h,005h,00ah,001h,036h,067h,081h,005h,026h,067h,001h,006h	; 7097  ...g....6g..&g..
	defb 001h,015h,03ah,067h,081h,01bh,02ah,067h,002h,01bh,00ah,001h,036h,067h,08ch,01bh	; 70a7  ..:g..*g....6g..
	defb 032h,067h,007h,008h,004h,011h,071h,062h,00ch,008h,004h,011h,071h,062h,010h,001h	; 70b7  2g....qb....qb..
	defb 002h,01eh,0aeh,062h,016h,001h,001h,01eh,047h,065h,094h,003h,050h,067h,000h,003h	; 70c7  ...b....Ge..Pg..
	defb 014h,001h,04ch,067h,094h,01dh,050h,067h,000h,01dh,014h,001h,04ch,067h,003h,008h	; 70d7  ..Lg..Pg....Lg..
	defb 003h,011h,05ch,062h,003h,008h,003h,011h,020h,062h,0ffh	; 70e7  ..\b.... b.

; ----------------------------------------------------------------------
; DATOS objetos_2E: los 9 objetos de la pantalla 0x2E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (37 bytes)
;   0x70f2..0x7117  (37 bytes)
DATA_objetos_2E:
	defb 004h,000h,00ch,009h	; 70f2
	defb 004h,000h,00ch,00dh	; 70f6
	defb 004h,000h,00ch,011h	; 70fa
	defb 004h,000h,00ch,015h	; 70fe
	defb 005h,000h,007h,009h	; 7102
	defb 005h,000h,007h,00dh	; 7106
	defb 005h,000h,007h,011h	; 710a
	defb 005h,000h,007h,015h	; 710e
	defb 012h,000h,003h,00fh	; 7112
	defb 0ffh	; 7116

; ----------------------------------------------------------------------
; DATOS sprites_2E: los 0 grupos de sprites de la pantalla 0x2E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7117..0x7118  (1 bytes)
DATA_sprites_2E:
	defb 0ffh	; 7117

; ----------------------------------------------------------------------
; DATOS ordenes_2F_7118: las ordenes de pieza de la pantalla 0x2F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (195 bytes)
;   0x7118..0x71db  (195 bytes)
DATA_ordenes_2F_7118:
	defb 000h,001h,017h,01eh,02ch,070h,012h,001h,005h,01eh,0e8h,065h,012h,001h,002h,01eh	; 7118  ....,p.....e....
	defb 000h,066h,015h,001h,001h,01eh,000h,066h,087h,00ch,03eh,067h,007h,008h,001h,004h	; 7128  .f.....f..>g....
	defb 03ah,067h,087h,007h,02eh,067h,001h,007h,006h,001h,036h,067h,080h,007h,026h,067h	; 7138  :g...g....6g..&g
	defb 000h,008h,001h,011h,03ah,067h,080h,019h,02ah,067h,001h,019h,006h,001h,036h,067h	; 7148  ....:g..*g....6g
	defb 087h,019h,032h,067h,087h,013h,045h,067h,007h,015h,001h,004h,03ah,067h,085h,005h	; 7158  ..2g..Eg....:g..
	defb 026h,067h,005h,006h,001h,015h,03ah,067h,085h,01bh,02ah,067h,006h,005h,009h,001h	; 7168  &g....:g..*g....
	defb 036h,067h,006h,01bh,009h,001h,036h,067h,08fh,005h,02eh,067h,00fh,006h,001h,006h	; 7178  6g....6g...g....
	defb 03ah,067h,08fh,00ch,03eh,067h,08fh,013h,045h,067h,00fh,015h,001h,006h,03ah,067h	; 7188  :g..>g..Eg....:g
	defb 08fh,01bh,032h,067h,08bh,006h,03eh,067h,00bh,001h,001h,005h,03ah,067h,08bh,019h	; 7198  ..2g..>g....:g..
	defb 045h,067h,00bh,01bh,001h,004h,03ah,067h,006h,00eh,004h,005h,071h,062h,00ah,008h	; 71a8  Eg....:g....qb..
	defb 004h,011h,071h,062h,00eh,00eh,004h,005h,071h,062h,016h,001h,001h,01eh,047h,065h	; 71b8  ..qb....qb....Ge
	defb 00bh,001h,001h,005h,060h,062h,00bh,01bh,001h,004h,060h,062h,001h,008h,004h,011h	; 71c8  ....`b....`b....
	defb 020h,062h,0ffh	; 71d8

; ----------------------------------------------------------------------
; DATOS objetos_2F: los 9 objetos de la pantalla 0x2F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (37 bytes)
;   0x71db..0x7200  (37 bytes)
DATA_objetos_2F:
	defb 005h,000h,006h,00fh	; 71db
	defb 005h,000h,00eh,00fh	; 71df
	defb 004h,000h,00ah,009h	; 71e3
	defb 004h,000h,00ah,00dh	; 71e7
	defb 004h,000h,00ah,011h	; 71eb
	defb 004h,000h,00ah,015h	; 71ef
	defb 00dh,000h,001h,00eh	; 71f3
	defb 014h,00dh,006h,002h	; 71f7
	defb 014h,00eh,006h,01eh	; 71fb
	defb 0ffh	; 71ff

; ----------------------------------------------------------------------
; DATOS sprites_2F: los 0 grupos de sprites de la pantalla 0x2F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7200..0x7201  (1 bytes)
DATA_sprites_2F:
	defb 0ffh	; 7200

; ----------------------------------------------------------------------
; DATOS ordenes_30_7201: las ordenes de pieza de la pantalla 0x30 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (191 bytes)
;   0x7201..0x72c0  (191 bytes)
DATA_ordenes_30_7201:
	defb 000h,001h,017h,01eh,02ch,070h,000h,001h,017h,006h,0f2h,072h,000h,019h,017h,006h	; 7201  ....,p.....r....
	defb 0f2h,072h,010h,001h,002h,01eh,000h,066h,012h,001h,002h,01eh,000h,066h,014h,001h	; 7211  .r.....f.....f..
	defb 003h,01eh,0e8h,065h,015h,001h,001h,01eh,000h,066h,092h,00bh,0f0h,065h,093h,00ah	; 7221  ...e.....f...e..
	defb 0f0h,065h,094h,009h,0f0h,065h,096h,007h,0f0h,065h,014h,001h,001h,007h,000h,066h	; 7231  .e...e...e.....f
	defb 016h,001h,001h,006h,000h,066h,092h,014h,0f4h,065h,093h,015h,0f4h,065h,094h,016h	; 7241  .....f...e...e..
	defb 0f4h,065h,095h,017h,0f4h,065h,096h,018h,0f4h,065h,014h,017h,001h,008h,000h,066h	; 7251  .e...e...e.....f
	defb 016h,019h,001h,006h,000h,066h,008h,001h,001h,004h,03ah,067h,088h,005h,03eh,067h	; 7261  .....f....:g..>g
	defb 08ch,00ah,036h,067h,08dh,00ah,02eh,067h,00dh,00bh,001h,003h,03ah,067h,08dh,00eh	; 7271  ..6g...g....:g..
	defb 02ah,067h,00eh,00eh,002h,001h,036h,067h,08dh,011h,026h,067h,00eh,011h,002h,001h	; 7281  *g....6g..&g....
	defb 036h,067h,00dh,012h,001h,003h,03ah,067h,08dh,015h,032h,067h,08ch,015h,036h,067h	; 7291  6g....:g..2g..6g
	defb 088h,019h,045h,067h,008h,01bh,001h,004h,03ah,067h,008h,007h,004h,012h,071h,062h	; 72a1  ..Eg....:g....qb
	defb 016h,001h,001h,01eh,047h,065h,094h,008h,000h,066h,095h,008h,0f0h,065h,0ffh	; 72b1  ....Ge...f...e.

; ----------------------------------------------------------------------
; DATOS objetos_30: los 12 objetos de la pantalla 0x30: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (49 bytes)
;   0x72c0..0x72f1  (49 bytes)
DATA_objetos_30:
	defb 006h,000h,004h,005h	; 72c0
	defb 006h,000h,006h,005h	; 72c4
	defb 006h,000h,004h,019h	; 72c8
	defb 006h,000h,006h,019h	; 72cc
	defb 005h,000h,008h,008h	; 72d0
	defb 005h,000h,008h,00ch	; 72d4
	defb 005h,000h,008h,011h	; 72d8
	defb 005h,000h,008h,015h	; 72dc
	defb 023h,000h,002h,008h	; 72e0
	defb 023h,000h,002h,00ch	; 72e4
	defb 023h,000h,002h,011h	; 72e8
	defb 023h,000h,002h,015h	; 72ec
	defb 0ffh	; 72f0

; ----------------------------------------------------------------------
; DATOS sprites_30: los 0 grupos de sprites de la pantalla 0x30: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x72f1..0x72f2  (1 bytes)
DATA_sprites_30:
	defb 0ffh	; 72f1

; ----------------------------------------------------------------------
; DATOS pieza_72F2: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 30 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x72f2..0x72fd  (11 bytes)
DATA_pieza_72F2:
	defb 040h,004h,002h	; 72f2
	defb 032h,033h,036h	; 72f5
	defb 037h,03ah,03bh	; 72f8
	defb 03eh,03fh	; 72fb

; ----------------------------------------------------------------------
; DATOS leido_72FD: 3331 bytes que lee 0x4832 al jugar (medido ejecutando el
;   cartucho, tools/cobertura.py; el tamano es lo que se lee seguido); lo leen
;   0x4832 (3331 bytes)
;   0x72fd..0x8000  (3331 bytes)
DATA_leido_72FD:
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 72fd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 730d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 731d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 732d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 733d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 734d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 735d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 736d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 737d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 738d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 739d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 73ad  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 73bd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 73cd  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 73dd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 73ed  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 73fd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 740d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 741d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 742d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 743d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 744d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 745d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 746d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 747d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 748d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 749d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 74ad  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 74bd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 74cd  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 74dd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 74ed  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 74fd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 750d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 751d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 752d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 753d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 754d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 755d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 756d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 757d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 758d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 759d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 75ad  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 75bd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 75cd  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 75dd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 75ed  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 75fd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 760d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 761d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 762d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 763d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 764d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 765d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 766d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 767d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 768d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 769d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 76ad  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 76bd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 76cd  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 76dd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 76ed  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 76fd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 770d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 771d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 772d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 773d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 774d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 775d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 776d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 777d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 778d  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 779d  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 77ad  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 77bd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 77cd  ................
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 77dd  ................
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 77ed  ................
	defb 000h,0ffh,000h,044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h	; 77fd  ...DDDDDDA......
	defb 011h,014h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h	; 780d  ..DDDDDD........
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h	; 781d  DDDDDDDDD.......
	defb 011h,014h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h	; 782d  ..DDA........DDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h	; 783d  DDDDDDDDDDDB""""
	defb 022h,022h,022h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h	; 784d  """DDDDDDD""""""
	defb 022h,022h,044h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h	; 785d  ""DDDDDDDDD"""""
	defb 022h,022h,022h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,022h,024h	; 786d  """DDDB""""""""$
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h	; 787d  DDDDDDDDDA......
	defb 011h,014h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,011h	; 788d  ..DDDDDA........
	defb 044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h	; 789d  DDDDDDDD........
	defb 044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h,044h	; 78ad  DDDDA........DDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h	; 78bd  DDDDDDDDDDDB""""
	defb 022h,022h,022h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h	; 78cd  """DDDDDDB""""""
	defb 022h,024h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h	; 78dd  "$DDDDDDDD""""""
	defb 022h,022h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h,024h	; 78ed  ""DDDDB"""""""$$
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h	; 78fd  DDDDDDDDD.......
	defb 011h,044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h	; 790d  .DDDDDDA........
	defb 044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h	; 791d  DDDDDDD........D
	defb 044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h,044h	; 792d  DDDDA........DDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h	; 793d  DDDDDDDDDDD"""""
	defb 022h,022h,022h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h	; 794d  """DDDDDDB""""""
	defb 022h,024h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h	; 795d  "$DDDDDDD"""""""
	defb 022h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h,044h	; 796d  "DDDDDB"""""""$D
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h	; 797d  DDDDDDDDD.......
	defb 011h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,014h	; 798d  .DDDDDD.........
	defb 044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h	; 799d  DDDDDDA........D
	defb 044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h,044h	; 79ad  DDDD........DDDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h	; 79bd  DDDDDDDDDDD"""""
	defb 022h,022h,022h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h	; 79cd  """DDDDDD"""""""
	defb 022h,044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h	; 79dd  "DDDDDDDB"""""""
	defb 024h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,044h,044h	; 79ed  $DDDDD""""""""DD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h	; 79fd  DDDDDDDDD.......
	defb 011h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,011h,044h	; 7a0d  .DDDDDA........D
	defb 044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h	; 7a1d  DDDDDD........DD
	defb 044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h,044h	; 7a2d  DDDD........DDDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h	; 7a3d  DDDDDDDDDDD"""""
	defb 022h,022h,022h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h	; 7a4d  """DDDDDB"""""""
	defb 024h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h	; 7a5d  $DDDDDDD""""""""
	defb 044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,044h,044h	; 7a6d  DDDDDD""""""""DD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h	; 7a7d  DDDDDDDDA.......
	defb 014h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h	; 7a8d  .DDDDD........DD
	defb 044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h	; 7a9d  DDDDDA........DD
	defb 044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h,044h	; 7aad  DDDD........DDDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h	; 7abd  DDDDDDDDDDB"""""
	defb 022h,022h,024h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h	; 7acd  ""$DDDDD""""""""
	defb 044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h	; 7add  DDDDDDDB"""""""$
	defb 044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,044h,044h	; 7aed  DDDDDD""""""""DD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h	; 7afd  DDDDDDDDA.......
	defb 014h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h	; 7b0d  .DDDD........DDD
	defb 044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h	; 7b1d  DDDDD.........DD
	defb 044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h,044h,044h	; 7b2d  DDDA........DDDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h	; 7b3d  DDDDDDDDDDB"""""
	defb 022h,022h,024h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,044h	; 7b4d  ""$DDDD""""""""D
	defb 044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,024h	; 7b5d  DDDDDDD""""""""$
	defb 044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h,044h,044h	; 7b6d  DDDDDB"""""""$DD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h	; 7b7d  DDDDDDDD........
	defb 014h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h,044h	; 7b8d  .DDA........DDDD
	defb 044h,044h,044h,044h,044h,011h,011h,011h,011h,011h,011h,011h,011h,044h,044h,044h	; 7b9d  DDDDD........DDD
	defb 044h,044h,044h,041h,011h,011h,011h,011h,011h,011h,011h,014h,044h,044h,044h,044h	; 7bad  DDDA........DDDD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h	; 7bbd  DDDDDDDDDD""""""
	defb 022h,022h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h,044h,044h	; 7bcd  ""DDDB"""""""$DD
	defb 044h,044h,044h,044h,044h,044h,044h,022h,022h,022h,022h,022h,022h,022h,022h,044h	; 7bdd  DDDDDDD""""""""D
	defb 044h,044h,044h,044h,044h,042h,022h,022h,022h,022h,022h,022h,022h,024h,044h,044h	; 7bed  DDDDDB"""""""$DD
	defb 044h,044h,044h,044h,044h,044h,044h,044h,033h,033h,044h,044h,043h,033h,033h,044h	; 7bfd  DDDDDDDD33DDC33D
	defb 043h,033h,033h,044h,044h,044h,043h,033h,034h,033h,033h,034h,044h,043h,033h,034h	; 7c0d  C33DDDC34334DC34
	defb 044h,044h,044h,033h,044h,044h,044h,043h,033h,033h,033h,044h,044h,033h,033h,044h	; 7c1d  DDD3DDDC333DD33D
	defb 044h,044h,033h,033h,033h,034h,033h,033h,044h,043h,033h,043h,033h,034h,044h,043h	; 7c2d  DD333433DC3C34DC
	defb 033h,044h,044h,033h,034h,044h,044h,043h,033h,033h,034h,044h,044h,033h,033h,033h	; 7c3d  3DD34DDC334DD333
	defb 033h,044h,043h,033h,034h,044h,033h,033h,044h,033h,034h,033h,033h,043h,033h,034h	; 7c4d  3DC34D33D3433C34
	defb 044h,033h,033h,033h,034h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7c5d  D3334DDDDDDDDDDD
	defb 044h,044h,044h,044h,044h,043h,033h,034h,044h,044h,044h,044h,044h,044h,044h,000h	; 7c6d  DDDDDC34DDDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,044h,033h,033h,044h,044h,033h,033h,034h,043h	; 7c7d  ...DDDDD33DD334C
	defb 033h,033h,033h,044h,044h,044h,043h,033h,034h,043h,033h,034h,044h,043h,033h,034h	; 7c8d  333DDDC34C34DC34
	defb 044h,044h,044h,033h,033h,044h,044h,043h,033h,033h,033h,044h,044h,033h,033h,044h	; 7c9d  DDD33DDC333DD33D
	defb 044h,043h,033h,033h,033h,044h,033h,033h,044h,043h,033h,043h,033h,034h,044h,033h	; 7cad  DC333D33DC3C34D3
	defb 033h,044h,044h,033h,034h,044h,044h,043h,033h,033h,034h,044h,044h,033h,033h,033h	; 7cbd  3DD34DDC334DD333
	defb 033h,044h,043h,033h,034h,044h,033h,033h,044h,033h,034h,033h,034h,043h,033h,034h	; 7ccd  3DC34D33D3434C34
	defb 044h,033h,033h,033h,034h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7cdd  D3334DDDDDDDDDDD
	defb 044h,044h,044h,044h,044h,034h,044h,043h,044h,044h,044h,044h,044h,044h,044h,000h	; 7ced  DDDDD4DCDDDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,043h,033h,034h,044h,043h,033h,033h,044h,033h	; 7cfd  ...DDDDC34DC33D3
	defb 033h,034h,044h,044h,044h,044h,043h,033h,034h,043h,033h,034h,044h,043h,033h,034h	; 7d0d  34DDDDC34C34DC34
	defb 044h,044h,043h,033h,033h,034h,044h,033h,033h,033h,033h,044h,043h,033h,034h,044h	; 7d1d  DDC334D3333DC34D
	defb 044h,033h,033h,033h,033h,044h,033h,033h,044h,043h,033h,043h,033h,034h,043h,033h	; 7d2d  D3333D33DC3C34C3
	defb 033h,033h,033h,033h,034h,044h,044h,033h,033h,033h,034h,044h,043h,033h,033h,033h	; 7d3d  33334DD3334DC333
	defb 034h,044h,033h,033h,034h,044h,033h,033h,044h,033h,033h,033h,044h,043h,033h,034h	; 7d4d  4D334D33D333DC34
	defb 044h,033h,033h,033h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7d5d  D333DDDDDDDDDDDD
	defb 044h,044h,044h,044h,043h,043h,033h,044h,034h,044h,044h,044h,044h,044h,044h,000h	; 7d6d  DDDDCC3D4DDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,043h,033h,034h,044h,033h,033h,034h,043h,033h	; 7d7d  ...DDDDC34D334C3
	defb 033h,044h,044h,044h,044h,044h,033h,033h,044h,043h,033h,033h,044h,043h,033h,034h	; 7d8d  3DDDDD33DC33DC34
	defb 044h,044h,043h,043h,033h,034h,044h,033h,033h,043h,033h,044h,043h,033h,034h,044h	; 7d9d  DDCC34D33C3DC34D
	defb 044h,033h,034h,033h,033h,043h,033h,034h,044h,043h,033h,033h,033h,044h,043h,033h	; 7dad  D3433C34DC333DC3
	defb 033h,033h,033h,033h,034h,044h,044h,033h,033h,043h,034h,044h,043h,033h,043h,033h	; 7dbd  33334DD33C4DC3C3
	defb 034h,044h,033h,033h,034h,043h,033h,034h,044h,033h,033h,033h,044h,033h,033h,044h	; 7dcd  4D334C34D333D33D
	defb 043h,033h,034h,033h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7ddd  C343DDDDDDDDDDDD
	defb 044h,044h,044h,044h,043h,043h,044h,034h,034h,044h,044h,044h,044h,044h,044h,000h	; 7ded  DDDDCCD44DDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,043h,033h,034h,043h,033h,033h,044h,033h,033h	; 7dfd  ...DDDDC34C33D33
	defb 034h,044h,044h,044h,044h,044h,033h,033h,044h,043h,033h,033h,044h,043h,033h,034h	; 7e0d  4DDDDD33DC33DC34
	defb 044h,044h,033h,043h,033h,034h,044h,033h,033h,043h,033h,044h,043h,033h,034h,044h	; 7e1d  DD3C34D33C3DC34D
	defb 043h,033h,034h,033h,034h,043h,033h,034h,044h,043h,033h,033h,033h,044h,033h,033h	; 7e2d  C3434C34DC333D33
	defb 033h,033h,033h,033h,034h,044h,044h,033h,033h,043h,034h,044h,033h,033h,043h,033h	; 7e3d  33334DD33C4D33C3
	defb 034h,044h,033h,033h,034h,043h,033h,034h,044h,033h,033h,034h,044h,033h,033h,044h	; 7e4d  4D334C34D334D33D
	defb 043h,033h,034h,033h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7e5d  C343DDDDDDDDDDDD
	defb 044h,044h,044h,044h,043h,043h,033h,044h,034h,044h,044h,044h,044h,044h,044h,000h	; 7e6d  DDDDCC3D4DDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,033h,033h,044h,033h,033h,034h,044h,033h,033h	; 7e7d  ...DDDD33D334D33
	defb 034h,044h,044h,044h,044h,044h,033h,033h,044h,044h,033h,033h,044h,043h,033h,033h	; 7e8d  4DDDDD33DD33DC33
	defb 044h,043h,033h,043h,033h,034h,043h,033h,034h,043h,033h,044h,033h,033h,044h,044h	; 7e9d  DC3C34C34C3D33DD
	defb 033h,033h,044h,033h,044h,043h,033h,034h,044h,043h,033h,033h,033h,043h,033h,034h	; 7ead  33D3DC34DC333C34
	defb 044h,044h,043h,033h,034h,044h,043h,033h,034h,033h,034h,044h,033h,034h,033h,033h	; 7ebd  DDC34DC3434D3433
	defb 044h,043h,033h,033h,034h,043h,033h,034h,044h,033h,033h,034h,044h,033h,033h,044h	; 7ecd  DC334C34D334D33D
	defb 043h,033h,034h,034h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7edd  C344DDDDDDDDDDDD
	defb 044h,044h,044h,044h,043h,043h,044h,034h,034h,044h,044h,044h,044h,044h,044h,000h	; 7eed  DDDDCCD44DDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,033h,033h,043h,033h,033h,044h,044h,033h,033h	; 7efd  ...DDDD33C33DD33
	defb 044h,044h,044h,044h,044h,043h,033h,034h,044h,044h,033h,033h,034h,044h,033h,033h	; 7f0d  DDDDDC34DD334D33
	defb 033h,033h,033h,043h,033h,034h,043h,033h,034h,043h,033h,044h,033h,033h,044h,044h	; 7f1d  333C34C34C3D33DD
	defb 033h,034h,044h,034h,044h,033h,033h,044h,044h,043h,033h,033h,034h,043h,033h,034h	; 7f2d  34D4D33DDC334C34
	defb 044h,044h,043h,033h,034h,044h,043h,033h,034h,033h,034h,043h,033h,034h,033h,033h	; 7f3d  DDC34DC3434C3433
	defb 044h,043h,033h,033h,034h,033h,033h,044h,044h,033h,033h,044h,043h,033h,034h,044h	; 7f4d  DC33433DD33DC34D
	defb 033h,033h,044h,034h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7f5d  33D4DDDDDDDDDDDD
	defb 044h,044h,044h,044h,044h,034h,044h,043h,044h,044h,044h,044h,044h,044h,044h,000h	; 7f6d  DDDDD4DCDDDDDDD.
	defb 000h,000h,000h,044h,044h,044h,044h,033h,033h,033h,033h,034h,044h,043h,033h,033h	; 7f7d  ...DDDD33334DC33
	defb 044h,044h,044h,044h,044h,043h,033h,034h,044h,044h,033h,033h,034h,044h,044h,033h	; 7f8d  DDDDDC34DD334DD3
	defb 033h,033h,034h,043h,033h,034h,043h,033h,034h,043h,033h,044h,033h,033h,044h,043h	; 7f9d  334C34C34C3D33DC
	defb 033h,034h,044h,044h,044h,033h,033h,044h,044h,043h,033h,033h,034h,033h,033h,044h	; 7fad  34DDD33DDC33433D
	defb 044h,044h,043h,033h,034h,044h,043h,033h,034h,033h,034h,043h,033h,044h,033h,033h	; 7fbd  DDC34DC3434C3D33
	defb 044h,043h,033h,033h,034h,033h,033h,044h,044h,033h,033h,044h,043h,033h,034h,044h	; 7fcd  DC33433DD33DC34D
	defb 033h,033h,044h,034h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h,044h	; 7fdd  33D4DDDDDDDDDDDD
	defb 044h,044h,044h,044h,044h,043h,033h,034h,044h,044h,044h,044h,044h,044h,044h,000h	; 7fed  DDDDDC34DDDDDDD.
	defb 000h,000h,000h	; 7ffd
