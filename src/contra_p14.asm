; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 14 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS listas_de_fase: 20 punteros, uno por fase, a la lista de pantallas de
;   cada fase (p03:BB82: 0x6000 + 2 x 0xE020); en este banco valen los de las
;   fases 0, 3, 6, 7, 8, 9 (p03:BAE4); lo leen p03:BB8B (40 bytes)
;   0x6000..0x6028  (40 bytes)
DATA_listas_de_fase:
	defw 060b1h,06080h,06080h,06082h,0608bh,0608bh,0608dh,06096h	; 6000
	defw 0609fh,060a6h,060afh,060afh,060afh,060b1h,060b1h,060b1h	; 6010
	defw 060b1h,060b1h,060b1h,060b1h	; 6020  -> DATA_lista_fase_00 DATA_lista_fase_00 DATA_lista_fase_00 DATA_lista_fase_00

; ----------------------------------------------------------------------
; DATOS sin_lector_6028: 24 bytes sin formato de pieza, lista ni orden (24 a
;   0x00 o 0xFF y 12 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (24 bytes)
;   0x6028..0x6040  (24 bytes)
DATA_sin_lector_6028:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6028  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6038  ........

; ----------------------------------------------------------------------
; DATOS ordenes_titulo: el puntero a las ordenes del titulo (p03:BB98 con HL =
;   0x6040 y A = 0xE023, que es 0: 0x6040 + 2 x 0xE023); lo leen p03:BB9F (2
;   bytes)
;   0x6040..0x6042  (2 bytes)
DATA_ordenes_titulo:
	defw 06931h	; 6040  -> DATA_ordenes_01_6931

; ----------------------------------------------------------------------
; DATOS sin_lector_6042: 62 bytes sin formato de pieza, lista ni orden (52 a
;   0x00 o 0xFF y 31 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (62 bytes)
;   0x6042..0x6080  (62 bytes)
DATA_sin_lector_6042:
	defb 010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,07fh,008h	; 6042  ................
	defb 0ffh,02ch,0ffh,000h,0ffh,000h,0ffh,000h,0efh,000h,0ffh,000h,0ffh,010h,000h,0ffh	; 6052  .,..............
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 6062  ................
	defb 0ffh,011h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,000h	; 6072  ..............

; ----------------------------------------------------------------------
; DATOS lista_ajena_6080: una lista de pantallas (2E y el 0 que la acaba) a la
;   que apunta, en este banco, la fase 1, 2, que se juega con otro (p03:BAE4):
;   no la lee nadie; lo leen nadie (2 bytes)
;   0x6080..0x6082  (2 bytes)
DATA_lista_ajena_6080:
	defb 02eh,000h	; 6080

; ----------------------------------------------------------------------
; DATOS lista_fase_03: la lista de pantallas de la fase 3: 08 09 0A 0B 0C 0D
;   0E 2D y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x6082..0x608b  (9 bytes)
DATA_lista_fase_03:
	defb 008h,009h,00ah,00bh,00ch,00dh,00eh,02dh,000h	; 6082  .......-.

; ----------------------------------------------------------------------
; DATOS lista_ajena_608B: una lista de pantallas (2F y el 0 que la acaba) a la
;   que apunta, en este banco, la fase 4, 5, que se juega con otro (p03:BAE4):
;   no la lee nadie; lo leen nadie (2 bytes)
;   0x608b..0x608d  (2 bytes)
DATA_lista_ajena_608B:
	defb 02fh,000h	; 608b

; ----------------------------------------------------------------------
; DATOS lista_fase_06: la lista de pantallas de la fase 6: 0F 10 11 12 13 14
;   15 16 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x608d..0x6096  (9 bytes)
DATA_lista_fase_06:
	defb 00fh,010h,011h,012h,013h,014h,015h,016h,000h	; 608d  .........

; ----------------------------------------------------------------------
; DATOS lista_fase_07: la lista de pantallas de la fase 7: 17 18 19 1A 1B 1C
;   1D y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (8 bytes)
;   0x6096..0x609e  (8 bytes)
DATA_lista_fase_07:
	defb 017h,018h,019h,01ah,01bh,01ch,01dh,000h	; 6096  ........

; ----------------------------------------------------------------------
; DATOS sin_lector_609E: 1 bytes sin formato de pieza, lista ni orden (1 a
;   0x00 o 0xFF y 0 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (1 bytes)
;   0x609e..0x609f  (1 bytes)
DATA_sin_lector_609E:
	defb 000h	; 609e

; ----------------------------------------------------------------------
; DATOS lista_fase_08: la lista de pantallas de la fase 8: 1F 20 21 22 23 24 y
;   el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo
;   leen p03:BB92 (7 bytes)
;   0x609f..0x60a6  (7 bytes)
DATA_lista_fase_08:
	defb 01fh,020h,021h,022h,023h,024h,000h	; 609f

; ----------------------------------------------------------------------
; DATOS lista_fase_09: la lista de pantallas de la fase 9: 25 26 27 28 29 2A
;   29 2C y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x60a6..0x60af  (9 bytes)
DATA_lista_fase_09:
	defb 025h,026h,027h,028h,029h,02ah,029h,02ch,000h	; 60a6  %&'()*),.

; ----------------------------------------------------------------------
; DATOS lista_ajena_60AF: una lista de pantallas (30 y el 0 que la acaba) a la
;   que apunta, en este banco, la fase 10, 11, 12, que se juega con otro
;   (p03:BAE4): no la lee nadie; lo leen nadie (2 bytes)
;   0x60af..0x60b1  (2 bytes)
DATA_lista_ajena_60AF:
	defb 030h,000h	; 60af

; ----------------------------------------------------------------------
; DATOS lista_fase_00: la lista de pantallas de la fase 0: 00 01 02 03 04 05
;   06 07 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x60b1..0x60ba  (9 bytes)
DATA_lista_fase_00:
	defb 000h,001h,002h,003h,004h,005h,006h,007h,000h	; 60b1  .........

; ----------------------------------------------------------------------
; DATOS sin_lector_60BA: 70 bytes sin formato de pieza, lista ni orden (36 a
;   0x00 o 0xFF y 35 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (70 bytes)
;   0x60ba..0x6100  (70 bytes)
DATA_sin_lector_60BA:
	defb 0afh,000h,06fh,000h,06fh,000h,000h,0afh,000h,00fh,000h,06fh,000h,06fh,000h,0efh	; 60ba  ..o.o......o.o..
	defb 000h,06fh,000h,06fh,000h,02fh,0efh,000h,0efh,042h,0efh,000h,07fh,000h,06fh,000h	; 60ca  .o.o./...B....o.
	defb 0afh,000h,0efh,000h,06fh,000h,000h,0ffh,000h,0efh,000h,0efh,000h,0afh,000h,07fh	; 60da  ....o...........
	defb 000h,0afh,000h,03fh,000h,0efh,0ffh,000h,06fh,000h,0efh,000h,0efh,000h,07fh,000h	; 60ea  ...?....o.......
	defb 0afh,000h,0efh,000h,07fh,000h	; 60fa

; ----------------------------------------------------------------------
; DATOS pantallas_14: los punteros a las ordenes de las pantallas 0x00-0x2D
;   (p03:BB95: 0x6100 + 2 x pantalla); las 1E 2B no estan en ninguna lista de
;   fase; lo leen p03:BB9F (92 bytes)
;   0x6100..0x615c  (92 bytes)
DATA_pantallas_14:
	defw 069cdh,06a4eh,06aefh,06b9ch,06c35h,06ce0h,06db5h,06e86h	; 6100
	defw 06faah,07044h,070b6h,07130h,071f0h,07272h,07308h,07457h	; 6110
	defw 074a6h,074e7h,07538h,075b1h,07663h,0766dh,07677h,07b00h	; 6120
	defw 07b35h,07b8ah,07bedh,07c46h,07cadh,07cfeh,07d29h,07d76h	; 6130
	defw 07d76h,07d76h,07d76h,07d76h,07d76h,07d95h,07dafh,07dcbh	; 6140
	defw 07de5h,07e1fh,07e61h,07eadh,07eb0h,0739ch	; 6150

; ----------------------------------------------------------------------
; DATOS pantallas_14_a_cero: 3 punteros a 0 detras de los de la pantalla 0x2D:
;   la tabla de p03:BB95 sigue, pero en este banco no hay mas pantallas; lo
;   leen p03:BB9F (6 bytes)
;   0x615c..0x6162  (6 bytes)
DATA_pantallas_14_a_cero:
	defw 00000h,00000h,00000h	; 615c

; ----------------------------------------------------------------------
; DATOS pieza_6162: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 00 01
;   02 03 04 05 06 07 08 0C (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6162..0x6175  (19 bytes)
DATA_pieza_6162:
	defb 001h,004h,004h	; 6162
	defb 060h,061h,062h	; 6165
	defb 063h,064h,065h	; 6168
	defb 066h,067h,068h	; 616b
	defb 069h,06ah,06bh	; 616e
	defb 06ch,06dh,06eh	; 6171
	defb 06fh	; 6174

; ----------------------------------------------------------------------
; DATOS pieza_6175: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x6175..0x6188  (19 bytes)
DATA_pieza_6175:
	defb 000h,004h,004h	; 6175
	defb 010h,011h,012h	; 6178
	defb 013h,014h,015h	; 617b
	defb 016h,017h,018h	; 617e
	defb 019h,01ah,01bh	; 6181
	defb 01ch,01dh,01eh	; 6184
	defb 01fh	; 6187

; ----------------------------------------------------------------------
; DATOS pieza_6188: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 07 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x6188..0x619b  (19 bytes)
DATA_pieza_6188:
	defb 000h,004h,004h	; 6188
	defb 030h,031h,032h	; 618b
	defb 033h,034h,035h	; 618e
	defb 036h,037h,038h	; 6191
	defb 039h,03ah,03bh	; 6194
	defb 03ch,03dh,03eh	; 6197
	defb 03fh	; 619a

; ----------------------------------------------------------------------
; DATOS pieza_619B: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 02 03 04 05 07 08
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x619b..0x61a2  (7 bytes)
DATA_pieza_619B:
	defb 000h,004h,001h	; 619b
	defb 0b3h,0b7h,0bbh	; 619e
	defb 0bfh	; 61a1

; ----------------------------------------------------------------------
; DATOS pieza_61A2: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 02 03 04 05 06 07 08
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x61a2..0x61a9  (7 bytes)
DATA_pieza_61A2:
	defb 000h,004h,001h	; 61a2
	defb 083h,087h,08bh	; 61a5
	defb 08fh	; 61a8

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_61A9: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (15 bytes)
;   0x61a9..0x61b8  (15 bytes)
DATA_piezas_sueltas_61A9:
	defb 000h,004h,003h,0b0h,0b1h,0b2h,0b4h,0b5h,0b6h,0b8h,0b9h,0bah,0bch,0bdh,0beh	; 61a9  ...............

; ----------------------------------------------------------------------
; DATOS pieza_61B8: una pieza de 3 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 05 06
;   (p03:BC2F/BBEE); lo leen p03:BC5C (15 bytes)
;   0x61b8..0x61c7  (15 bytes)
DATA_pieza_61B8:
	defb 000h,003h,004h	; 61b8
	defb 0e0h,0e1h,0e2h	; 61bb
	defb 0e3h,0e4h,0e5h	; 61be
	defb 0e6h,0e7h,0e8h	; 61c1
	defb 0e9h,0eah,0ebh	; 61c4

; ----------------------------------------------------------------------
; DATOS pieza_61C7: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 04 05 06 07 2D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x61c7..0x61ce  (7 bytes)
DATA_pieza_61C7:
	defb 000h,002h,002h	; 61c7
	defb 0d8h,0d9h,0dch	; 61ca
	defb 0ddh	; 61cd

; ----------------------------------------------------------------------
; DATOS pieza_61CE: una pieza de 1 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 04 05 06 07 2D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x61ce..0x61d3  (5 bytes)
DATA_pieza_61CE:
	defb 000h,001h,002h	; 61ce
	defb 0d0h,0d1h	; 61d1

; ----------------------------------------------------------------------
; DATOS pieza_61D3: una pieza de 1 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 04 05 06 07 2D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x61d3..0x61d8  (5 bytes)
DATA_pieza_61D3:
	defb 000h,001h,002h	; 61d3
	defb 0d2h,0d3h	; 61d6

; ----------------------------------------------------------------------
; DATOS pieza_61D8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 05 06
;   (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x61d8..0x61dc  (4 bytes)
DATA_pieza_61D8:
	defb 000h,001h,001h	; 61d8
	defb 0d4h	; 61db

; ----------------------------------------------------------------------
; DATOS pieza_61DC: una pieza de 1 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 05 06 07 2D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x61dc..0x61e3  (7 bytes)
DATA_pieza_61DC:
	defb 000h,001h,004h	; 61dc
	defb 008h,009h,00ah	; 61df
	defb 00bh	; 61e2

; ----------------------------------------------------------------------
; DATOS pieza_61E3: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 03 06 07 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (4 bytes)
;   0x61e3..0x61e7  (4 bytes)
DATA_pieza_61E3:
	defb 000h,001h,001h	; 61e3
	defb 004h	; 61e6

; ----------------------------------------------------------------------
; DATOS pieza_61E7: una pieza de 1 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 03 04 05 07 08 09 0A 0B 0C
;   0D (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x61e7..0x61ee  (7 bytes)
DATA_pieza_61E7:
	defb 000h,001h,004h	; 61e7
	defb 00ch,00dh,00eh	; 61ea
	defb 00fh	; 61ed

; ----------------------------------------------------------------------
; DATOS pieza_61EE: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 02 08 09 0A 0B 0C 0D 0E
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x61ee..0x6201  (19 bytes)
DATA_pieza_61EE:
	defb 000h,004h,004h	; 61ee
	defb 050h,051h,052h	; 61f1
	defb 053h,054h,055h	; 61f4
	defb 056h,057h,058h	; 61f7
	defb 059h,05ah,05bh	; 61fa
	defb 05ch,05dh,05eh	; 61fd
	defb 000h	; 6200

; ----------------------------------------------------------------------
; DATOS pieza_6201: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 04 05 06 07 09
;   0A (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6201..0x6214  (19 bytes)
DATA_pieza_6201:
	defb 000h,004h,004h	; 6201
	defb 0f0h,0f1h,0f2h	; 6204
	defb 0f3h,0f4h,0f5h	; 6207
	defb 0f6h,0f7h,0f8h	; 620a
	defb 0f9h,0fah,0fbh	; 620d
	defb 0fch,0fdh,0feh	; 6210
	defb 000h	; 6213

; ----------------------------------------------------------------------
; DATOS pieza_6214: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 07 0F
;   10 11 12 13 (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6214..0x6218  (4 bytes)
DATA_pieza_6214:
	defb 001h,001h,001h	; 6214
	defb 0ffh	; 6217

; ----------------------------------------------------------------------
; DATOS pieza_6218: una pieza de 1 x 1 dibujos del titulo (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x6218..0x621c  (4 bytes)
DATA_pieza_6218:
	defb 001h,001h,001h	; 6218
	defb 09fh	; 621b

; ----------------------------------------------------------------------
; DATOS pieza_621C: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 04 05 06 07 08
;   09 (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x621c..0x6220  (4 bytes)
DATA_pieza_621C:
	defb 000h,001h,001h	; 621c
	defb 001h	; 621f

; ----------------------------------------------------------------------
; DATOS pieza_6220: una pieza de 3 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 04 05 06
;   (p03:BC2F/BBEE); lo leen p03:BC5C (9 bytes)
;   0x6220..0x6229  (9 bytes)
DATA_pieza_6220:
	defb 000h,003h,002h	; 6220
	defb 0dbh,0dbh,043h	; 6223
	defb 04bh,047h,04fh	; 6226

; ----------------------------------------------------------------------
; DATOS pieza_6229: una pieza de 3 x 7 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 05 06 07
;   (p03:BC2F/BBEE); lo leen p03:BC5C (24 bytes)
;   0x6229..0x6241  (24 bytes)
DATA_pieza_6229:
	defb 000h,003h,007h	; 6229
	defb 0dbh,0dbh,0dbh	; 622c
	defb 0dbh,0dbh,0dbh	; 622f
	defb 0deh,04fh,047h	; 6232
	defb 04fh,047h,04fh	; 6235
	defb 047h,04fh,04bh	; 6238
	defb 043h,04bh,043h	; 623b
	defb 04bh,043h,04bh	; 623e

; ----------------------------------------------------------------------
; DATOS pieza_6241: una pieza de 3 x 7 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 04 06
;   (p03:BC2F/BBEE); lo leen p03:BC5C (24 bytes)
;   0x6241..0x6259  (24 bytes)
DATA_pieza_6241:
	defb 000h,003h,007h	; 6241
	defb 0dah,0dbh,0dbh	; 6244
	defb 0dbh,0dbh,0dbh	; 6247
	defb 0dbh,04fh,047h	; 624a
	defb 04fh,047h,04fh	; 624d
	defb 047h,04fh,04bh	; 6250
	defb 043h,04bh,043h	; 6253
	defb 04bh,043h,04bh	; 6256

; ----------------------------------------------------------------------
; DATOS pieza_6259: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 07 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x6259..0x6264  (11 bytes)
DATA_pieza_6259:
	defb 040h,004h,002h	; 6259
	defb 030h,031h,034h	; 625c
	defb 035h,038h,039h	; 625f
	defb 03ch,03dh	; 6262

; ----------------------------------------------------------------------
; DATOS pieza_6264: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 07 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x6264..0x626f  (11 bytes)
DATA_pieza_6264:
	defb 040h,004h,002h	; 6264
	defb 032h,033h,036h	; 6267
	defb 037h,03ah,03bh	; 626a
	defb 03eh,03fh	; 626d

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_626F: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (4 bytes)
;   0x626f..0x6273  (4 bytes)
DATA_piezas_sueltas_626F:
	defb 040h,001h,001h,04eh	; 626f

; ----------------------------------------------------------------------
; DATOS pieza_6273: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 07 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x6273..0x627a  (7 bytes)
DATA_pieza_6273:
	defb 040h,004h,001h	; 6273
	defb 0c1h,0c5h,0c9h	; 6276
	defb 0cdh	; 6279

; ----------------------------------------------------------------------
; DATOS pieza_627A: una pieza de 3 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 07 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (6 bytes)
;   0x627a..0x6280  (6 bytes)
DATA_pieza_627A:
	defb 000h,003h,001h	; 627a
	defb 027h,02bh,02fh	; 627d

; ----------------------------------------------------------------------
; DATOS pieza_6280: una pieza de 5 x 8 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (43 bytes)
;   0x6280..0x62ab  (43 bytes)
DATA_pieza_6280:
	defb 040h,005h,008h	; 6280
	defb 010h,011h,012h	; 6283
	defb 013h,020h,021h	; 6286
	defb 022h,023h,014h	; 6289
	defb 015h,016h,017h	; 628c
	defb 024h,025h,026h	; 628f
	defb 027h,018h,019h	; 6292
	defb 01ah,01bh,028h	; 6295
	defb 029h,02ah,02bh	; 6298
	defb 01ch,01dh,01eh	; 629b
	defb 01fh,02ch,02dh	; 629e
	defb 02eh,02fh,000h	; 62a1
	defb 000h,040h,041h	; 62a4
	defb 042h,043h,000h	; 62a7
	defb 000h	; 62aa

; ----------------------------------------------------------------------
; DATOS pieza_62AB: una pieza de 7 x 3 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (24 bytes)
;   0x62ab..0x62c3  (24 bytes)
DATA_pieza_62AB:
	defb 040h,007h,003h	; 62ab
	defb 0c2h,0c3h,0f3h	; 62ae
	defb 0c6h,000h,0fbh	; 62b1
	defb 000h,000h,0fbh	; 62b4
	defb 000h,000h,0fbh	; 62b7
	defb 000h,000h,0fbh	; 62ba
	defb 000h,000h,0fbh	; 62bd
	defb 000h,000h,0f7h	; 62c0

; ----------------------------------------------------------------------
; DATOS pieza_62C3: una pieza de 7 x 3 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (24 bytes)
;   0x62c3..0x62db  (24 bytes)
DATA_pieza_62C3:
	defb 040h,007h,003h	; 62c3
	defb 0f2h,0cah,0cbh	; 62c6
	defb 0fbh,000h,0cfh	; 62c9
	defb 0fbh,000h,000h	; 62cc
	defb 0fbh,000h,000h	; 62cf
	defb 0fbh,000h,000h	; 62d2
	defb 0fbh,000h,000h	; 62d5
	defb 0f6h,000h,000h	; 62d8

; ----------------------------------------------------------------------
; DATOS pieza_62DB: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 2D (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x62db..0x62e2  (7 bytes)
DATA_pieza_62DB:
	defb 040h,002h,002h	; 62db
	defb 0e0h,0e1h,0e4h	; 62de
	defb 0e5h	; 62e1

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_62E2: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (11 bytes)
;   0x62e2..0x62ed  (11 bytes)
DATA_piezas_sueltas_62E2:
	defb 000h,002h,004h,0f8h,0f9h,0f2h,0f3h,0fch,0fdh,0f6h,0f7h	; 62e2  ...........

; ----------------------------------------------------------------------
; DATOS pieza_62ED: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 08 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x62ed..0x62f4  (7 bytes)
DATA_pieza_62ED:
	defb 000h,002h,002h	; 62ed
	defb 043h,04bh,047h	; 62f0
	defb 04fh	; 62f3

; ----------------------------------------------------------------------
; DATOS pieza_62F4: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 0F 10 11 12 13 14
;   (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x62f4..0x62ff  (11 bytes)
DATA_pieza_62F4:
	defb 000h,004h,002h	; 62f4
	defb 010h,011h,014h	; 62f7
	defb 015h,018h,019h	; 62fa
	defb 01ch,01dh	; 62fd

; ----------------------------------------------------------------------
; DATOS pieza_62FF: una pieza de 5 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 11 12 13 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (8 bytes)
;   0x62ff..0x6307  (8 bytes)
DATA_pieza_62FF:
	defb 000h,005h,001h	; 62ff
	defb 033h,037h,03bh	; 6302
	defb 03fh,047h	; 6305

; ----------------------------------------------------------------------
; DATOS pieza_6307: una pieza de 5 x 6 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 0F 10 11 12 13 14
;   (p03:BC2F/BBEE); lo leen p03:BC5C (33 bytes)
;   0x6307..0x6328  (33 bytes)
DATA_pieza_6307:
	defb 000h,005h,006h	; 6307
	defb 020h,021h,022h	; 630a
	defb 023h,030h,031h	; 630d
	defb 024h,025h,026h	; 6310
	defb 027h,034h,035h	; 6313
	defb 028h,029h,02ah	; 6316
	defb 02bh,038h,039h	; 6319
	defb 02ch,02dh,02eh	; 631c
	defb 02fh,03ch,03dh	; 631f
	defb 040h,041h,042h	; 6322
	defb 043h,044h,045h	; 6325

; ----------------------------------------------------------------------
; DATOS pieza_6328: una pieza de 5 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 12 13 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (8 bytes)
;   0x6328..0x6330  (8 bytes)
DATA_pieza_6328:
	defb 000h,005h,001h	; 6328
	defb 032h,036h,03ah	; 632b
	defb 03eh,046h	; 632e

; ----------------------------------------------------------------------
; DATOS pieza_6330: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 0F 10 11 12 13 14
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6330..0x6343  (19 bytes)
DATA_pieza_6330:
	defb 000h,004h,004h	; 6330
	defb 0e0h,0e1h,0e2h	; 6333
	defb 0e3h,0e4h,0e5h	; 6336
	defb 0e6h,0e7h,0e8h	; 6339
	defb 0e9h,0eah,0ebh	; 633c
	defb 0ech,0ech,0ech	; 633f
	defb 0ech	; 6342

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6343: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (11 bytes)
;   0x6343..0x634e  (11 bytes)
DATA_piezas_sueltas_6343:
	defb 000h,004h,002h,04ah,04bh,04eh,04fh,0c4h,0c5h,0c8h,0c9h	; 6343  ...JKNO....

; ----------------------------------------------------------------------
; DATOS pieza_634E: una pieza de 7 x 8 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 18 19 1B (p03:BC2F/BBEE);
;   lo leen p03:BC5C (59 bytes)
;   0x634e..0x6389  (59 bytes)
DATA_pieza_634E:
	defb 000h,007h,008h	; 634e
	defb 081h,082h,082h	; 6351
	defb 082h,082h,08ah	; 6354
	defb 000h,000h,085h	; 6357
	defb 086h,08dh,08dh	; 635a
	defb 08dh,08dh,08eh	; 635d
	defb 000h,0b1h,0b2h	; 6360
	defb 0b3h,090h,091h	; 6363
	defb 092h,093h,089h	; 6366
	defb 0b5h,0b6h,0b7h	; 6369
	defb 0a0h,0a1h,0a2h	; 636c
	defb 0a3h,08bh,0b5h	; 636f
	defb 0bah,0bbh,0a4h	; 6372
	defb 0a5h,0a6h,0a7h	; 6375
	defb 08fh,0b5h,0bah	; 6378
	defb 0bfh,0a8h,0a9h	; 637b
	defb 0aah,0abh,000h	; 637e
	defb 0b5h,0bah,0bfh	; 6381
	defb 0a8h,0a9h,0aah	; 6384
	defb 0abh,000h	; 6387

; ----------------------------------------------------------------------
; DATOS pieza_6389: una pieza de 5 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 18 19 1A 1B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (23 bytes)
;   0x6389..0x63a0  (23 bytes)
DATA_pieza_6389:
	defb 000h,005h,004h	; 6389
	defb 082h,082h,082h	; 638c
	defb 082h,08dh,08dh	; 638f
	defb 08dh,08dh,090h	; 6392
	defb 091h,092h,093h	; 6395
	defb 094h,095h,096h	; 6398
	defb 097h,098h,099h	; 639b
	defb 09ah,09bh	; 639e

; ----------------------------------------------------------------------
; DATOS pieza_63A0: una pieza de 8 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 16 17 18 19 1A 1B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (35 bytes)
;   0x63a0..0x63c3  (35 bytes)
DATA_pieza_63A0:
	defb 000h,008h,004h	; 63a0
	defb 061h,061h,061h	; 63a3
	defb 07dh,061h,06eh	; 63a6
	defb 06eh,07ah,000h	; 63a9
	defb 07dh,07dh,07dh	; 63ac
	defb 000h,07dh,07dh	; 63af
	defb 078h,061h,07dh	; 63b2
	defb 06fh,07dh,000h	; 63b5
	defb 07dh,000h,07dh	; 63b8
	defb 000h,07dh,000h	; 63bb
	defb 07dh,07ch,06fh	; 63be
	defb 061h,06fh	; 63c1

; ----------------------------------------------------------------------
; DATOS pieza_63C3: una pieza de 8 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 16 18 19 1A 1B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (35 bytes)
;   0x63c3..0x63e6  (35 bytes)
DATA_pieza_63C3:
	defb 000h,008h,004h	; 63c3
	defb 061h,061h,061h	; 63c6
	defb 07dh,06eh,061h	; 63c9
	defb 06eh,07ah,066h	; 63cc
	defb 061h,06bh,07dh	; 63cf
	defb 000h,000h,078h	; 63d2
	defb 078h,061h,07ch	; 63d5
	defb 061h,061h,000h	; 63d8
	defb 000h,000h,000h	; 63db
	defb 000h,000h,000h	; 63de
	defb 000h,061h,061h	; 63e1
	defb 061h,061h	; 63e4

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_63E6: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (23 bytes)
;   0x63e6..0x63fd  (23 bytes)
DATA_piezas_sueltas_63E6:
	defb 000h,005h,004h,0d0h,0d1h,0d9h,0d2h,0d4h,0d5h,0d5h,0d6h,0d8h,0d5h,0d5h,0dah,0d8h	; 63e6  ................
	defb 0d5h,0d5h,0dah,0d8h,0d5h,0d5h,0dah	; 63f6

; ----------------------------------------------------------------------
; DATOS pieza_63FD: una pieza de 5 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 0F 10 11 12 13 14
;   (p03:BC2F/BBEE); lo leen p03:BC5C (13 bytes)
;   0x63fd..0x640a  (13 bytes)
DATA_pieza_63FD:
	defb 000h,005h,002h	; 63fd
	defb 011h,010h,015h	; 6400
	defb 014h,019h,018h	; 6403
	defb 01dh,01ch,01fh	; 6406
	defb 01eh	; 6409

; ----------------------------------------------------------------------
; DATOS pieza_640A: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 12 13 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x640a..0x641d  (19 bytes)
DATA_pieza_640A:
	defb 000h,004h,004h	; 640a
	defb 0e2h,0e3h,0e0h	; 640d
	defb 0e1h,0e6h,0e7h	; 6410
	defb 0e4h,0e5h,0eah	; 6413
	defb 0ebh,0e8h,0e9h	; 6416
	defb 0ech,0ech,0ech	; 6419
	defb 0ech	; 641c

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_641D: 3 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (33 bytes)
;   0x641d..0x643e  (33 bytes)
DATA_piezas_sueltas_641D:
	defb 000h,004h,002h,0c2h,0c3h,0c6h,0c7h,0cah,0cbh,0ceh,0cfh,000h,004h,002h,04ah,04bh	; 641d  ..............JK
	defb 04eh,04fh,0c4h,0c5h,0c8h,0c9h,000h,004h,002h,0cch,0cdh,0cch,0cdh,0ceh,0cfh,0cch	; 642d  NO..............
	defb 0cdh	; 643d

; ----------------------------------------------------------------------
; DATOS pieza_643E: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 16 17 18 19 1A 1B 1C 1D 1E
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x643e..0x6451  (19 bytes)
DATA_pieza_643E:
	defb 000h,004h,004h	; 643e
	defb 082h,082h,082h	; 6441
	defb 082h,08dh,08dh	; 6444
	defb 08dh,08dh,07ch	; 6447
	defb 061h,061h,061h	; 644a
	defb 0c0h,0c1h,0c0h	; 644d
	defb 0c1h	; 6450

; ----------------------------------------------------------------------
; DATOS pieza_6451: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 17 1E (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x6451..0x645c  (11 bytes)
DATA_pieza_6451:
	defb 000h,004h,002h	; 6451
	defb 08ah,000h,08dh	; 6454
	defb 08eh,061h,0f2h	; 6457
	defb 0c0h,0f6h	; 645a

; ----------------------------------------------------------------------
; DATOS pieza_645C: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 1C 1E (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x645c..0x6467  (11 bytes)
DATA_pieza_645C:
	defb 000h,004h,002h	; 645c
	defb 0f0h,0f1h,0f4h	; 645f
	defb 0f5h,0f8h,0f9h	; 6462
	defb 0fch,0fdh	; 6465

; ----------------------------------------------------------------------
; DATOS pieza_6467: una pieza de 1 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 16 17 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (6 bytes)
;   0x6467..0x646d  (6 bytes)
DATA_pieza_6467:
	defb 000h,001h,003h	; 6467
	defb 0adh,0aeh,0afh	; 646a

; ----------------------------------------------------------------------
; DATOS pieza_646D: una pieza de 3 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 28 29 2A 2C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (12 bytes)
;   0x646d..0x6479  (12 bytes)
DATA_pieza_646D:
	defb 000h,003h,003h	; 646d
	defb 005h,006h,007h	; 6470
	defb 009h,00ah,00bh	; 6473
	defb 00dh,00eh,00fh	; 6476

; ----------------------------------------------------------------------
; DATOS pieza_6479: una pieza de 7 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 29 2A 2C (p03:BC2F/BBEE);
;   lo leen p03:BC5C (17 bytes)
;   0x6479..0x648a  (17 bytes)
DATA_pieza_6479:
	defb 000h,007h,002h	; 6479
	defb 040h,041h,044h	; 647c
	defb 045h,048h,049h	; 647f
	defb 04ch,049h,042h	; 6482
	defb 043h,046h,047h	; 6485
	defb 04ah,04bh	; 6488

; ----------------------------------------------------------------------
; DATOS pieza_648A: una pieza de 4 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 1F 20 21 22 23 24
;   (p03:BC2F/BBEE); lo leen p03:BC5C (15 bytes)
;   0x648a..0x6499  (15 bytes)
DATA_pieza_648A:
	defb 000h,004h,003h	; 648a
	defb 050h,051h,052h	; 648d
	defb 054h,055h,056h	; 6490
	defb 058h,059h,05ah	; 6493
	defb 05ch,05dh,05eh	; 6496

; ----------------------------------------------------------------------
; DATOS pieza_6499: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 1F 20 21 22 23 24
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x6499..0x64a0  (7 bytes)
DATA_pieza_6499:
	defb 000h,002h,002h	; 6499
	defb 053h,05bh,057h	; 649c
	defb 05fh	; 649f

; ----------------------------------------------------------------------
; DATOS pieza_64A0: una pieza de 4 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 29 2A 2C (p03:BC2F/BBEE);
;   lo leen p03:BC5C (15 bytes)
;   0x64a0..0x64af  (15 bytes)
DATA_pieza_64A0:
	defb 000h,004h,003h	; 64a0
	defb 054h,055h,056h	; 64a3
	defb 058h,059h,05ah	; 64a6
	defb 05ch,05dh,05eh	; 64a9
	defb 04dh,04eh,04fh	; 64ac

; ----------------------------------------------------------------------
; DATOS pieza_64AF: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 1F 20
;   21 22 23 24 (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x64af..0x64ba  (11 bytes)
DATA_pieza_64AF:
	defb 001h,004h,002h	; 64af
	defb 060h,061h,064h	; 64b2
	defb 065h,068h,069h	; 64b5
	defb 06ch,06dh	; 64b8

; ----------------------------------------------------------------------
; DATOS pieza_64BA: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 1F 20
;   21 22 23 24 (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x64ba..0x64c5  (11 bytes)
DATA_pieza_64BA:
	defb 001h,004h,002h	; 64ba
	defb 062h,063h,066h	; 64bd
	defb 067h,06ah,06bh	; 64c0
	defb 06eh,06fh	; 64c3

; ----------------------------------------------------------------------
; DATOS pieza_64C5: una pieza de 4 x 8 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 25 26 27 28 29 2A 2C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (35 bytes)
;   0x64c5..0x64e8  (35 bytes)
DATA_pieza_64C5:
	defb 000h,004h,008h	; 64c5
	defb 0c0h,0c1h,0c2h	; 64c8
	defb 0c3h,0d0h,0d1h	; 64cb
	defb 0d2h,0d3h,0c4h	; 64ce
	defb 0c5h,0c6h,0c7h	; 64d1
	defb 0d4h,0d5h,0d6h	; 64d4
	defb 0d7h,0c8h,0c9h	; 64d7
	defb 0cah,0cbh,0d8h	; 64da
	defb 0d9h,0dah,0dbh	; 64dd
	defb 0cch,0cdh,0ceh	; 64e0
	defb 0cfh,0dch,0ddh	; 64e3
	defb 0deh,0dfh	; 64e6

; ----------------------------------------------------------------------
; DATOS pieza_64E8: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 18 1B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (5 bytes)
;   0x64e8..0x64ed  (5 bytes)
DATA_pieza_64E8:
	defb 000h,002h,001h	; 64e8
	defb 083h,087h	; 64eb

; ----------------------------------------------------------------------
; DATOS piezas_sin_orden_64ED: 25 pieza(s) seguidas (modo, alto, ancho y alto
;   x ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla; no lo lee nada: ni un puntero, ni una lista, orden o pieza,
;   ni las partidas de tools/cobertura.py; lo leen nadie (398 bytes)
;   0x64ed..0x667b  (398 bytes)
DATA_piezas_sin_orden_64ED:
	defb 000h,004h,002h,028h,029h,02ch,02dh,020h,021h,024h,025h,000h,004h,002h,02ah,02bh	; 64ed  ...(),- !$%...*+
	defb 02eh,02fh,022h,023h,026h,027h,000h,004h,007h,030h,031h,032h,033h,040h,041h,042h	; 64fd  ./"#&'...0123@AB
	defb 034h,035h,036h,037h,044h,045h,046h,038h,039h,03ah,03bh,048h,049h,04ah,000h,03dh	; 650d  4567DEF89:.HIJ.=
	defb 03eh,03fh,04ch,000h,000h,000h,004h,004h,010h,011h,012h,013h,014h,015h,016h,017h	; 651d  >?L.............
	defb 018h,019h,09ah,09bh,01ch,01dh,09eh,09fh,000h,004h,004h,098h,099h,012h,013h,09ch	; 652d  ................
	defb 09dh,016h,017h,018h,019h,01ah,01dh,01ch,01dh,01eh,01fh,000h,002h,002h,02ah,02bh	; 653d  ..............*+
	defb 02eh,02fh,000h,002h,002h,028h,029h,02ch,02dh,000h,002h,002h,060h,061h,064h,065h	; 654d  ./...(),-...`ade
	defb 000h,004h,001h,063h,067h,06bh,06fh,000h,004h,001h,062h,066h,06ah,06eh,000h,003h	; 655d  ...cgko...bfjn..
	defb 003h,070h,071h,072h,074h,075h,076h,078h,079h,07ah,000h,005h,007h,070h,071h,071h	; 656d  .pqrtuvxyz...pqq
	defb 071h,071h,071h,072h,074h,075h,075h,075h,075h,075h,076h,074h,075h,075h,075h,075h	; 657d  qqqrtuuuuuvtuuuu
	defb 075h,076h,074h,075h,075h,075h,075h,075h,076h,078h,079h,079h,079h,079h,079h,07ah	; 658d  uvtuuuuuvxyyyyyz
	defb 000h,007h,008h,053h,05bh,000h,000h,000h,000h,057h,053h,000h,000h,056h,000h,000h	; 659d  ...S[....WS..V..
	defb 05ah,000h,000h,000h,000h,000h,05bh,057h,000h,000h,000h,000h,000h,000h,05bh,057h	; 65ad  Z.....[W......[W
	defb 000h,000h,000h,000h,000h,05ah,000h,000h,056h,000h,000h,000h,057h,000h,000h,000h	; 65bd  .....Z..V...W...
	defb 000h,05bh,000h,051h,000h,000h,000h,000h,000h,000h,051h,000h,006h,001h,05dh,05dh	; 65cd  .[.Q......Q...]]
	defb 052h,05dh,05dh,05dh,000h,004h,004h,080h,081h,082h,083h,084h,085h,086h,087h,088h	; 65dd  R]]]............
	defb 089h,08ah,08bh,08ch,08dh,08eh,08fh,000h,002h,002h,090h,091h,094h,095h,000h,002h	; 65ed  ................
	defb 002h,096h,097h,092h,093h,000h,002h,002h,096h,097h,092h,093h,000h,002h,001h,055h	; 65fd  ...............U
	defb 003h,000h,002h,001h,054h,058h,000h,002h,001h,05ch,003h,000h,003h,001h,051h,000h	; 660d  ....TX...\....Q.
	defb 053h,000h,004h,004h,010h,011h,0b2h,0b3h,014h,015h,0b6h,0b7h,018h,019h,01ah,01bh	; 661d  S...............
	defb 01ch,01dh,01eh,01fh,000h,002h,002h,022h,023h,026h,027h,004h,004h,010h,011h,012h	; 662d  ......."#&'.....
	defb 013h,014h,015h,016h,017h,0b0h,0b1h,01ah,01bh,0b4h,0b5h,01eh,01fh,000h,002h,002h	; 663d  ................
	defb 028h,029h,02ch,02dh,000h,002h,002h,020h,021h,024h,025h,000h,003h,002h,04eh,04fh	; 664d  (),-... !$%...NO
	defb 068h,069h,06ch,06dh,000h,002h,002h,04eh,05fh,06ch,06dh,000h,002h,002h,05eh,04fh	; 665d  hilm...N_lm...^O
	defb 06ch,06dh,000h,002h,004h,0b8h,0b9h,0bah,0bbh,0bch,0bdh,0beh,0bfh,000h	; 666d  lm............

; ----------------------------------------------------------------------
; DATOS sin_lector_667B: 19 bytes sin formato de pieza, lista ni orden (0 a
;   0x00 o 0xFF y 1 acabados en 0xF) detras de las piezas de p14:64ED; no lo
;   lee nada: ni un puntero, ni una lista, orden o pieza, ni las partidas de
;   tools/cobertura.py; lo leen nadie (19 bytes)
;   0x667b..0x668e  (19 bytes)
DATA_sin_lector_667B:
	defb 007h,001h,053h,05dh,052h,05dh,05dh,05dh,051h,040h,002h,001h,09ch,09dh,040h,002h	; 667b  ..S]R]]]Q@....@.
	defb 001h,09eh,09fh	; 668b

; ----------------------------------------------------------------------
; DATOS pieza_668E: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 00 01 02 03 04 05 06 07 08
;   0F (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x668e..0x6692  (4 bytes)
DATA_pieza_668E:
	defb 000h,001h,001h	; 668e
	defb 002h	; 6691

; ----------------------------------------------------------------------
; DATOS pieza_6692: una pieza de 8 x 8 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 28 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (67 bytes)
;   0x6692..0x66d5  (67 bytes)
DATA_pieza_6692:
	defb 000h,008h,008h	; 6692
	defb 070h,071h,072h	; 6695
	defb 073h,080h,081h	; 6698
	defb 082h,083h,074h	; 669b
	defb 075h,076h,077h	; 669e
	defb 084h,085h,086h	; 66a1
	defb 087h,078h,079h	; 66a4
	defb 07ah,07bh,088h	; 66a7
	defb 089h,08ah,08bh	; 66aa
	defb 07ch,07dh,07eh	; 66ad
	defb 07fh,08ch,08dh	; 66b0
	defb 08eh,08fh,090h	; 66b3
	defb 091h,092h,093h	; 66b6
	defb 0a0h,0a1h,0a2h	; 66b9
	defb 000h,094h,095h	; 66bc
	defb 096h,097h,0a4h	; 66bf
	defb 0a5h,000h,000h	; 66c2
	defb 000h,099h,09ah	; 66c5
	defb 09bh,0a8h,000h	; 66c8
	defb 000h,000h,000h	; 66cb
	defb 09dh,09eh,09fh	; 66ce
	defb 0ach,000h,000h	; 66d1
	defb 000h	; 66d4

; ----------------------------------------------------------------------
; DATOS piezas_sin_orden_66D5: 39 pieza(s) seguidas (modo, alto, ancho y alto
;   x ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla; no lo lee nada: ni un puntero, ni una lista, orden o pieza,
;   ni las partidas de tools/cobertura.py; lo leen nadie (365 bytes)
;   0x66d5..0x6842  (365 bytes)
DATA_piezas_sin_orden_66D5:
	defb 040h,004h,003h,0a0h,0a1h,0a2h,0a4h,0a5h,0a6h,0a8h,0a9h,0aah,0ach,0adh,0aeh,040h	; 66d5  @..............@
	defb 004h,003h,0a3h,0b0h,0b1h,0a7h,0b4h,0b5h,0abh,0b8h,0b9h,0afh,0bch,0bdh,040h,001h	; 66e5  ..............@.
	defb 001h,0d0h,040h,001h,001h,0d5h,040h,001h,001h,0d1h,040h,001h,001h,0d4h,040h,001h	; 66f5  ..@...@...@...@.
	defb 001h,0d2h,040h,001h,001h,0d7h,040h,001h,001h,0d3h,040h,001h,001h,0d6h,040h,001h	; 6705  ..@...@...@...@.
	defb 001h,093h,040h,001h,001h,097h,040h,001h,001h,0dah,040h,001h,001h,0deh,040h,001h	; 6715  ..@...@...@...@.
	defb 001h,0d8h,040h,001h,001h,0d9h,040h,001h,001h,0dch,040h,001h,001h,0ddh,040h,001h	; 6725  ..@...@...@...@.
	defb 001h,0efh,040h,001h,001h,0e2h,040h,001h,001h,0e6h,040h,001h,001h,0e3h,040h,001h	; 6735  ..@...@...@...@.
	defb 001h,0ebh,040h,001h,001h,0e7h,040h,001h,001h,0dbh,040h,002h,002h,0f8h,0f9h,0fch	; 6745  ..@...@...@.....
	defb 0fdh,040h,001h,001h,0f1h,040h,004h,001h,073h,077h,07bh,07fh,040h,004h,001h,083h	; 6755  .@...@..sw{.@...
	defb 087h,08bh,08fh,000h,004h,004h,0a0h,0a1h,0a2h,0a3h,0a4h,0a5h,0a6h,0a7h,0a8h,0a9h	; 6765  ................
	defb 0aah,0abh,0ach,0adh,0aeh,0afh,040h,005h,005h,093h,0efh,0efh,0efh,0efh,000h,093h	; 6775  ......@.........
	defb 0efh,0efh,0efh,000h,000h,093h,0efh,0efh,000h,000h,000h,093h,0efh,000h,000h,000h	; 6785  ................
	defb 000h,093h,040h,005h,005h,0efh,0efh,0efh,0efh,0dah,0efh,0efh,0efh,0dah,000h,0efh	; 6795  ..@.............
	defb 0efh,0dah,000h,000h,0efh,0dah,000h,000h,000h,0dah,000h,000h,000h,000h,040h,007h	; 67a5  ..............@.
	defb 007h,000h,000h,000h,000h,000h,000h,097h,000h,000h,000h,000h,000h,097h,0d4h,000h	; 67b5  ................
	defb 000h,000h,000h,097h,0efh,0efh,000h,000h,000h,097h,0d4h,0d4h,0d4h,000h,000h,097h	; 67c5  ................
	defb 0efh,0efh,0efh,0efh,000h,097h,0efh,0efh,0efh,0efh,0efh,097h,0efh,0efh,0efh,0efh	; 67d5  ................
	defb 0efh,0efh,040h,007h,007h,0deh,000h,000h,000h,000h,000h,000h,0d4h,0deh,000h,000h	; 67e5  ..@.............
	defb 000h,000h,000h,0efh,0efh,0deh,000h,000h,000h,000h,0d4h,0d4h,0d4h,0deh,000h,000h	; 67f5  ................
	defb 000h,0efh,0efh,0efh,0efh,0deh,000h,000h,0efh,0efh,0efh,0efh,0efh,0efh,000h,0efh	; 6805  ................
	defb 0efh,0efh,0efh,0efh,0efh,0deh,040h,001h,009h,0dbh,0d0h,0dbh,0dbh,0dbh,0d0h,0dbh	; 6815  ......@.........
	defb 0d0h,0d2h,040h,001h,009h,0d7h,0d5h,0dbh,0d5h,0dbh,0dbh,0dbh,0d5h,0dbh,000h,002h	; 6825  ..@.............
	defb 002h,0f0h,077h,073h,0f5h,000h,001h,001h,07ch,000h,001h,001h,07fh	; 6835  ..ws....|....

; ----------------------------------------------------------------------
; DATOS sin_lector_6842: 239 bytes sin formato de pieza, lista ni orden (49 a
;   0x00 o 0xFF y 14 acabados en 0xF) detras de las piezas de p14:66D5; no lo
;   lee nada: ni un puntero, ni una lista, orden o pieza, ni las partidas de
;   tools/cobertura.py; lo leen nadie (239 bytes)
;   0x6842..0x6931  (239 bytes)
DATA_sin_lector_6842:
	defb 0f1h,0f4h,07bh,000h,001h,002h,0fah,0fbh,000h,002h,002h,0e8h,0e9h,0ech,0edh,040h	; 6842  ..{............@
	defb 001h,006h,04eh,0f1h,0f1h,0f1h,0f1h,04fh,040h,001h,004h,04eh,0f1h,0f1h,04fh,000h	; 6852  ..N....O@..N..O.
	defb 001h,001h,077h,000h,001h,001h,07fh,000h,001h,001h,07dh,040h,001h,001h,0f2h,040h	; 6862  ..w.......}@...@
	defb 001h,001h,0f3h,040h,001h,001h,0f6h,040h,001h,001h,0f7h,040h,001h,001h,0fbh,040h	; 6872  ...@...@...@...@
	defb 001h,001h,0c7h,040h,002h,002h,0cah,0cbh,000h,0cfh,040h,002h,002h,0c2h,0c3h,0c6h	; 6882  ...@......@.....
	defb 000h,040h,001h,001h,0fah,040h,001h,001h,0feh,000h,009h,008h,000h,000h,00ch,00dh	; 6892  .@...@..........
	defb 00eh,00fh,000h,000h,000h,000h,010h,011h,012h,013h,000h,000h,000h,000h,014h,015h	; 68a2  ................
	defb 016h,017h,000h,000h,000h,000h,018h,019h,01ah,01bh,000h,000h,000h,000h,01ch,01dh	; 68b2  ................
	defb 01eh,01fh,000h,000h,020h,021h,022h,023h,030h,031h,032h,033h,024h,025h,026h,027h	; 68c2  .... !"#0123$%&'
	defb 034h,035h,036h,037h,028h,029h,02ah,02bh,038h,039h,03ah,03bh,02ch,02dh,02eh,02fh	; 68d2  4567()*+89:.,-./
	defb 03ch,03dh,03eh,03fh,000h,009h,008h,000h,000h,06ch,06dh,06eh,06fh,000h,000h,000h	; 68e2  <=>?.....lmno...
	defb 000h,07ch,07dh,07eh,07fh,000h,000h,000h,000h,09ch,09dh,09eh,09fh,000h,000h,000h	; 68f2  .|}~............
	defb 000h,0bch,0bdh,0beh,0bfh,000h,000h,000h,000h,0dch,0ddh,0deh,0dfh,000h,000h,0f0h	; 6902  ................
	defb 0f1h,0f2h,0f3h,0e0h,0e1h,0e2h,0e3h,0f4h,0f5h,0f6h,0f7h,0e4h,0e5h,0e6h,0e7h,0f8h	; 6912  ................
	defb 0f9h,0fah,0fbh,0e8h,0e9h,0eah,0ebh,0fch,0fdh,0feh,00bh,0ech,0edh,0eeh,0efh	; 6922  ...............

; ----------------------------------------------------------------------
; DATOS ordenes_01_6931: las ordenes de pieza de la pantalla 0x101 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (11 bytes)
;   0x6931..0x693c  (11 bytes)
DATA_ordenes_01_6931:
	defb 000h,000h,01bh,020h,018h,062h,087h,007h,03eh,069h,0ffh	; 6931  ... .b..>i.

; ----------------------------------------------------------------------
; DATOS objetos_101: los 0 objetos de la pantalla 0x101: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x693c..0x693d  (1 bytes)
DATA_objetos_101:
	defb 0ffh	; 693c

; ----------------------------------------------------------------------
; DATOS sprites_101: los 0 grupos de sprites de la pantalla 0x101: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x693d..0x693e  (1 bytes)
DATA_sprites_101:
	defb 0ffh	; 693d

; ----------------------------------------------------------------------
; DATOS pieza_693E: una pieza de 7 x 20 dibujos del titulo (p03:BC2F/BBEE); lo
;   leen p03:BC5C (143 bytes)
;   0x693e..0x69cd  (143 bytes)
DATA_pieza_693E:
	defb 000h,007h,014h	; 693e
	defb 080h,081h,082h	; 6941
	defb 083h,090h,091h	; 6944
	defb 092h,000h,0c0h	; 6947
	defb 0c1h,0c2h,0c3h	; 694a
	defb 000h,0e0h,0e1h	; 694d
	defb 0e2h,0e3h,093h	; 6950
	defb 097h,0ach,084h	; 6953
	defb 085h,086h,087h	; 6956
	defb 094h,095h,096h	; 6959
	defb 000h,0c4h,0c5h	; 695c
	defb 0c6h,0c7h,000h	; 695f
	defb 0e4h,0e5h,0e6h	; 6962
	defb 0e7h,0adh,0aeh	; 6965
	defb 0afh,088h,089h	; 6968
	defb 08ah,08bh,098h	; 696b
	defb 099h,09eh,09bh	; 696e
	defb 0c8h,0c9h,0cah	; 6971
	defb 0cbh,000h,0e8h	; 6974
	defb 0e9h,0eah,0ebh	; 6977
	defb 0bdh,0beh,0bfh	; 697a
	defb 08ch,08dh,08eh	; 697d
	defb 08fh,09ch,09dh	; 6980
	defb 09eh,09fh,0cch	; 6983
	defb 0cdh,0ceh,0cfh	; 6986
	defb 09ah,0ech,0edh	; 6989
	defb 0eeh,0efh,0ddh	; 698c
	defb 0deh,0dfh,0a0h	; 698f
	defb 0a1h,0a2h,0a3h	; 6992
	defb 0b0h,0b1h,0b2h	; 6995
	defb 0b3h,0d0h,0d1h	; 6998
	defb 0d2h,0d3h,0fch	; 699b
	defb 0f0h,0f1h,0f2h	; 699e
	defb 0f3h,0fdh,0feh	; 69a1
	defb 0ffh,0a4h,0a5h	; 69a4
	defb 0a6h,0a7h,0b4h	; 69a7
	defb 0b5h,0b6h,0b7h	; 69aa
	defb 0d4h,000h,0d6h	; 69ad
	defb 0d7h,000h,0f4h	; 69b0
	defb 0f5h,0f6h,0f7h	; 69b3
	defb 0dch,0d5h,0d9h	; 69b6
	defb 0a8h,0a9h,0aah	; 69b9
	defb 0abh,0b8h,0b9h	; 69bc
	defb 0bah,000h,000h	; 69bf
	defb 000h,0dah,0dbh	; 69c2
	defb 000h,0f8h,0f9h	; 69c5
	defb 0fah,0fbh,0d8h	; 69c8
	defb 0bbh,0bch	; 69cb

; ----------------------------------------------------------------------
; DATOS ordenes_00_69CD: las ordenes de pieza de la pantalla 0x00 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (123 bytes)
;   0x69cd..0x6a48  (123 bytes)
DATA_ordenes_00_69CD:
	defb 00ah,001h,00bh,01eh,062h,061h,005h,001h,004h,01eh,0ceh,061h,009h,001h,001h,01eh	; 69cd  ....ba.....a....
	defb 0d3h,061h,004h,001h,002h,01eh,0c7h,061h,005h,002h,002h,008h,0c7h,061h,005h,014h	; 69dd  .a.....a.....a..
	defb 002h,00bh,0c7h,061h,082h,006h,0b8h,061h,084h,009h,0b8h,061h,002h,017h,003h,008h	; 69ed  ...a...a...a....
	defb 0b8h,061h,005h,007h,004h,001h,0d8h,061h,007h,00ah,002h,001h,0d8h,061h,005h,018h	; 69fd  .a.....a.....a..
	defb 004h,001h,0d8h,061h,005h,01ch,004h,001h,0d8h,061h,00ah,001h,001h,01eh,0dch,061h	; 6a0d  ...a.....a.....a
	defb 010h,010h,004h,008h,001h,062h,014h,001h,003h,01eh,020h,062h,092h,001h,029h,062h	; 6a1d  .....b.... b..)b
	defb 093h,008h,029h,062h,093h,018h,041h,062h,016h,001h,001h,01eh,08eh,066h,00ah,001h	; 6a2d  ..)b..Ab.....f..
	defb 001h,01eh,01ch,062h,010h,010h,001h,008h,01ch,062h,0ffh	; 6a3d  ...b.....b.

; ----------------------------------------------------------------------
; DATOS objetos_00: los 1 objetos de la pantalla 0x00: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x6a48..0x6a4d  (5 bytes)
DATA_objetos_00:
	defb 014h,000h,006h,01eh	; 6a48
	defb 0ffh	; 6a4c

; ----------------------------------------------------------------------
; DATOS sprites_00: los 0 grupos de sprites de la pantalla 0x00: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6a4d..0x6a4e  (1 bytes)
DATA_sprites_00:
	defb 0ffh	; 6a4d

; ----------------------------------------------------------------------
; DATOS ordenes_01_6A4E: las ordenes de pieza de la pantalla 0x01 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (147 bytes)
;   0x6a4e..0x6ae1  (147 bytes)
DATA_ordenes_01_6A4E:
	defb 00ah,001h,00bh,01eh,062h,061h,005h,001h,004h,01eh,0ceh,061h,009h,001h,001h,01eh	; 6a4e  ....ba.....a....
	defb 0d3h,061h,004h,001h,002h,01eh,0c7h,061h,005h,006h,002h,00ah,0c7h,061h,005h,014h	; 6a5e  .a.....a.....a..
	defb 002h,006h,0c7h,061h,086h,009h,0c7h,061h,002h,013h,003h,00ch,0b8h,061h,005h,014h	; 6a6e  ...a...a.....a..
	defb 004h,001h,0d8h,061h,005h,018h,004h,001h,0d8h,061h,005h,01ch,004h,001h,0d8h,061h	; 6a7e  ...a.....a.....a
	defb 084h,01ah,0b8h,061h,007h,01bh,002h,001h,0d8h,061h,00eh,00ah,004h,008h,001h,062h	; 6a8e  ...a.....a.....b
	defb 00ah,001h,001h,01eh,0dch,061h,014h,001h,003h,01eh,020h,062h,093h,009h,041h,062h	; 6a9e  .....a.... b..Ab
	defb 093h,010h,029h,062h,016h,001h,001h,01eh,01ch,062h,011h,017h,004h,008h,001h,062h	; 6aae  ..)b.....b.....b
	defb 091h,005h,001h,062h,00ah,001h,001h,01eh,01ch,062h,011h,005h,001h,004h,01ch,062h	; 6abe  ...b.....b.....b
	defb 00eh,00ah,001h,008h,01ch,062h,011h,017h,001h,008h,01ch,062h,016h,001h,001h,01eh	; 6ace  .....b.....b....
	defb 08eh,066h,0ffh	; 6ade

; ----------------------------------------------------------------------
; DATOS objetos_01: los 2 objetos de la pantalla 0x01: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6ae1..0x6aea  (9 bytes)
DATA_objetos_01:
	defb 00ah,000h,00ch,004h	; 6ae1
	defb 014h,000h,006h,01eh	; 6ae5
	defb 0ffh	; 6ae9

; ----------------------------------------------------------------------
; DATOS sprites_01: los 1 grupos de sprites de la pantalla 0x01: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x6aea..0x6aef  (5 bytes)
DATA_sprites_01:
	defb 008h,000h,040h,010h	; 6aea
	defb 0ffh	; 6aee

; ----------------------------------------------------------------------
; DATOS ordenes_02_6AEF: las ordenes de pieza de la pantalla 0x02 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (163 bytes)
;   0x6aef..0x6b92  (163 bytes)
DATA_ordenes_02_6AEF:
	defb 00ah,001h,00bh,008h,062h,061h,00ah,017h,00bh,008h,062h,061h,00ah,009h,00bh,001h	; 6aef  ....ba....ba....
	defb 0a2h,061h,00ah,016h,00bh,001h,09bh,061h,08ch,008h,0eeh,061h,08ch,014h,0eeh,061h	; 6aff  .a.....a...a...a
	defb 00bh,006h,004h,008h,0eeh,061h,00bh,012h,004h,008h,0eeh,061h,00ah,008h,004h,010h	; 6b0f  .....a.....a....
	defb 0eeh,061h,00ah,001h,001h,01eh,0dch,061h,005h,001h,004h,006h,0ceh,061h,009h,001h	; 6b1f  .a.....a.....a..
	defb 001h,006h,0d3h,061h,004h,001h,002h,006h,0c7h,061h,005h,002h,002h,006h,0c7h,061h	; 6b2f  ...a.....a.....a
	defb 005h,019h,004h,006h,0ceh,061h,009h,019h,001h,006h,0d3h,061h,004h,019h,001h,006h	; 6b3f  .....a.....a....
	defb 0c7h,061h,005h,018h,002h,007h,0c7h,061h,086h,01bh,0c7h,061h,014h,001h,003h,01eh	; 6b4f  .a.....a...a....
	defb 020h,062h,093h,002h,041h,062h,092h,009h,041h,062h,092h,010h,029h,062h,093h,017h	; 6b5f   b..Ab..Ab..)b..
	defb 029h,062h,090h,00eh,001h,062h,091h,001h,001h,062h,016h,001h,001h,01eh,08eh,066h	; 6b6f  )b...b...b.....f
	defb 00ah,001h,001h,01eh,01ch,062h,011h,001h,001h,004h,01ch,062h,010h,00eh,001h,004h	; 6b7f  .....b.....b....
	defb 01ch,062h,0ffh	; 6b8f

; ----------------------------------------------------------------------
; DATOS objetos_02: los 2 objetos de la pantalla 0x02: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x6b92..0x6b9b  (9 bytes)
DATA_objetos_02:
	defb 006h,000h,010h,019h	; 6b92
	defb 014h,000h,006h,01eh	; 6b96
	defb 0ffh	; 6b9a

; ----------------------------------------------------------------------
; DATOS sprites_02: los 0 grupos de sprites de la pantalla 0x02: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6b9b..0x6b9c  (1 bytes)
DATA_sprites_02:
	defb 0ffh	; 6b9b

; ----------------------------------------------------------------------
; DATOS ordenes_03_6B9C: las ordenes de pieza de la pantalla 0x03 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (139 bytes)
;   0x6b9c..0x6c27  (139 bytes)
DATA_ordenes_03_6B9C:
	defb 00ah,001h,00bh,004h,062h,061h,00ah,00bh,00bh,008h,062h,061h,00ah,019h,00bh,006h	; 6b9c  ....ba....ba....
	defb 062h,061h,00ah,005h,00bh,001h,0a2h,061h,00ah,00ah,00bh,001h,09bh,061h,00ah,013h	; 6bac  ba.....a.....a..
	defb 00bh,001h,0a2h,061h,00ah,018h,00bh,001h,09bh,061h,011h,00bh,004h,008h,001h,062h	; 6bbc  ...a.....a.....b
	defb 011h,019h,004h,006h,001h,062h,014h,001h,003h,01eh,020h,062h,013h,001h,002h,004h	; 6bcc  .....b.... b....
	defb 020h,062h,093h,004h,029h,062h,093h,012h,041h,062h,093h,013h,029h,062h,016h,001h	; 6bdc   b..)b..Ab..)b..
	defb 001h,01eh,08eh,066h,08ah,001h,0dch,061h,08ah,005h,0e3h,061h,00ah,00ah,001h,009h	; 6bec  ...f...a...a....
	defb 0e7h,061h,08ah,010h,0e7h,061h,00ah,018h,001h,007h,0e7h,061h,00ah,001h,001h,005h	; 6bfc  .a...a.....a....
	defb 01ch,062h,00ah,00ah,001h,00ah,01ch,062h,00ah,018h,001h,007h,01ch,062h,011h,00bh	; 6c0c  .b.....b.....b..
	defb 001h,008h,01ch,062h,011h,019h,001h,006h,01ch,062h,0ffh	; 6c1c  ...b.....b.

; ----------------------------------------------------------------------
; DATOS objetos_03: los 3 objetos de la pantalla 0x03: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6c27..0x6c34  (13 bytes)
DATA_objetos_03:
	defb 006h,000h,00eh,003h	; 6c27
	defb 006h,000h,00dh,01ch	; 6c2b
	defb 014h,000h,006h,01eh	; 6c2f
	defb 0ffh	; 6c33

; ----------------------------------------------------------------------
; DATOS sprites_03: los 0 grupos de sprites de la pantalla 0x03: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6c34..0x6c35  (1 bytes)
DATA_sprites_03:
	defb 0ffh	; 6c34

; ----------------------------------------------------------------------
; DATOS ordenes_04_6C35: las ordenes de pieza de la pantalla 0x04 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (153 bytes)
;   0x6c35..0x6cce  (153 bytes)
DATA_ordenes_04_6C35:
	defb 00ah,001h,00bh,01eh,062h,061h,006h,009h,004h,016h,062h,061h,086h,008h,09bh,061h	; 6c35  ....ba....ba...a
	defb 00ah,009h,00bh,001h,0a2h,061h,00ah,010h,00bh,001h,09bh,061h,00ah,019h,00bh,001h	; 6c45  .....a.....a....
	defb 0a2h,061h,00ah,001h,001h,008h,0e7h,061h,08ah,006h,0e7h,061h,00ah,00fh,001h,008h	; 6c55  .a.....a...a....
	defb 0e7h,061h,08ah,015h,0e7h,061h,006h,008h,001h,017h,0e7h,061h,011h,001h,004h,008h	; 6c65  .a...a.....a....
	defb 001h,062h,091h,017h,001h,062h,001h,009h,004h,016h,0ceh,061h,005h,009h,001h,016h	; 6c75  .b...b.....a....
	defb 0d3h,061h,000h,008h,002h,017h,0c7h,061h,001h,00ah,002h,015h,0c7h,061h,002h,014h	; 6c85  .a.....a.....a..
	defb 002h,006h,0c7h,061h,014h,001h,003h,01eh,020h,062h,093h,008h,041h,062h,013h,01ah	; 6c95  ...a.... b..Ab..
	defb 003h,005h,041h,062h,016h,001h,001h,01eh,08eh,066h,00ah,001h,001h,009h,01ch,062h	; 6ca5  ..Ab.....f.....b
	defb 00ah,00fh,001h,00ah,01ch,062h,006h,008h,001h,017h,01ch,062h,011h,001h,001h,008h	; 6cb5  .....b.....b....
	defb 01ch,062h,011h,017h,001h,004h,01ch,062h,0ffh	; 6cc5  .b.....b.

; ----------------------------------------------------------------------
; DATOS objetos_04: los 4 objetos de la pantalla 0x04: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6cce..0x6cdf  (17 bytes)
DATA_objetos_04:
	defb 006h,000h,00dh,006h	; 6cce
	defb 006h,000h,00fh,012h	; 6cd2
	defb 00ah,000h,00ah,00ch	; 6cd6
	defb 014h,000h,002h,01eh	; 6cda
	defb 0ffh	; 6cde

; ----------------------------------------------------------------------
; DATOS sprites_04: los 0 grupos de sprites de la pantalla 0x04: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6cdf..0x6ce0  (1 bytes)
DATA_sprites_04:
	defb 0ffh	; 6cdf

; ----------------------------------------------------------------------
; DATOS ordenes_05_6CE0: las ordenes de pieza de la pantalla 0x05 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (195 bytes)
;   0x6ce0..0x6da3  (195 bytes)
DATA_ordenes_05_6CE0:
	defb 00ah,001h,00bh,01eh,062h,061h,006h,001h,004h,010h,062h,061h,086h,011h,0a2h,061h	; 6ce0  ....ba....ba...a
	defb 00ah,008h,00bh,001h,09bh,061h,00eh,018h,007h,001h,09bh,061h,006h,001h,001h,010h	; 6cf0  .....a.....a....
	defb 0dch,061h,086h,00eh,0e7h,061h,00ah,008h,001h,017h,0e7h,061h,00eh,018h,001h,007h	; 6d00  .a...a.....a....
	defb 0e7h,061h,08fh,009h,001h,062h,091h,011h,001h,062h,001h,001h,004h,010h,0ceh,061h	; 6d10  .a...b...b.....a
	defb 005h,001h,001h,010h,0d3h,061h,000h,001h,002h,010h,0c7h,061h,001h,002h,002h,010h	; 6d20  .....a.....a....
	defb 0c7h,061h,002h,009h,002h,006h,0c7h,061h,001h,016h,008h,009h,0ceh,061h,009h,016h	; 6d30  .a.....a.....a..
	defb 001h,009h,0d3h,061h,000h,016h,002h,009h,0c7h,061h,001h,015h,002h,00ah,0c7h,061h	; 6d40  ...a.....a.....a
	defb 082h,01ah,0c7h,061h,082h,014h,0b8h,061h,005h,015h,004h,001h,0d8h,061h,084h,016h	; 6d50  ...a...a.....a..
	defb 0b8h,061h,007h,017h,002h,001h,0d8h,061h,014h,001h,003h,01eh,020h,062h,092h,001h	; 6d60  .a.....a.... b..
	defb 020h,062h,093h,009h,020h,062h,092h,002h,029h,062h,093h,00bh,029h,062h,016h,001h	; 6d70   b.. b..)b..)b..
	defb 001h,01eh,08eh,066h,006h,001h,001h,011h,01ch,062h,00ah,008h,001h,017h,01ch,062h	; 6d80  ...f.....b.....b
	defb 00eh,018h,001h,007h,01ch,062h,00fh,009h,001h,004h,01ch,062h,011h,011h,001h,004h	; 6d90  .....b.....b....
	defb 01ch,062h,0ffh	; 6da0

; ----------------------------------------------------------------------
; DATOS objetos_05: los 4 objetos de la pantalla 0x05: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6da3..0x6db4  (17 bytes)
DATA_objetos_05:
	defb 006h,000h,00ch,00eh	; 6da3
	defb 007h,000h,00bh,00ah	; 6da7
	defb 007h,000h,00dh,012h	; 6dab
	defb 014h,000h,006h,01eh	; 6daf
	defb 0ffh	; 6db3

; ----------------------------------------------------------------------
; DATOS sprites_05: los 0 grupos de sprites de la pantalla 0x05: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6db4..0x6db5  (1 bytes)
DATA_sprites_05:
	defb 0ffh	; 6db4

; ----------------------------------------------------------------------
; DATOS ordenes_06_6DB5: las ordenes de pieza de la pantalla 0x06 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (183 bytes)
;   0x6db5..0x6e6c  (183 bytes)
DATA_ordenes_06_6DB5:
	defb 00ah,001h,00bh,01eh,062h,061h,002h,001h,007h,01eh,0ceh,061h,001h,002h,001h,00ah	; 6db5  ....ba.....a....
	defb 0ceh,061h,001h,011h,001h,00ch,0ceh,061h,009h,001h,001h,01eh,0d3h,061h,000h,002h	; 6dc5  .a.....a.....a..
	defb 002h,00ah,0c7h,061h,000h,012h,002h,00dh,0c7h,061h,001h,001h,002h,01eh,0c7h,061h	; 6dd5  ...a.....a.....a
	defb 084h,00ah,0c7h,061h,083h,009h,0c7h,061h,082h,002h,0b8h,061h,005h,003h,004h,001h	; 6de5  ...a...a...a....
	defb 0d8h,061h,083h,005h,0b8h,061h,006h,006h,003h,001h,0d8h,061h,082h,00fh,0b8h,061h	; 6df5  .a...a.....a...a
	defb 005h,010h,004h,001h,0d8h,061h,083h,016h,0b8h,061h,006h,017h,003h,001h,0d8h,061h	; 6e05  .....a...a.....a
	defb 082h,018h,0b8h,061h,005h,019h,004h,001h,0d8h,061h,00ah,001h,001h,01eh,0dch,061h	; 6e15  ...a.....a.....a
	defb 00eh,00dh,007h,001h,0a2h,061h,00eh,001h,001h,00ch,0dch,061h,08eh,00dh,0e3h,061h	; 6e25  .....a.....a...a
	defb 011h,019h,004h,006h,001h,062h,014h,001h,003h,01eh,020h,062h,093h,00ch,041h,062h	; 6e35  .....b.... b..Ab
	defb 093h,013h,029h,062h,091h,011h,001h,062h,016h,001h,001h,01eh,08eh,066h,00ah,001h	; 6e45  ..)b...b.....f..
	defb 001h,01eh,01ch,062h,00eh,001h,001h,00dh,01ch,062h,011h,011h,001h,004h,01ch,062h	; 6e55  ...b.....b.....b
	defb 011h,019h,001h,006h,01ch,062h,0ffh	; 6e65

; ----------------------------------------------------------------------
; DATOS objetos_06: los 5 objetos de la pantalla 0x06: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x6e6c..0x6e81  (21 bytes)
DATA_objetos_06:
	defb 006h,000h,00ch,00fh	; 6e6c
	defb 006h,000h,00eh,016h	; 6e70
	defb 007h,000h,00dh,012h	; 6e74
	defb 007h,000h,00dh,01ah	; 6e78
	defb 014h,000h,006h,01eh	; 6e7c
	defb 0ffh	; 6e80

; ----------------------------------------------------------------------
; DATOS sprites_06: los 1 grupos de sprites de la pantalla 0x06: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x6e81..0x6e86  (5 bytes)
DATA_sprites_06:
	defb 008h,000h,030h,010h	; 6e81
	defb 0ffh	; 6e85

; ----------------------------------------------------------------------
; DATOS ordenes_07_6E86: las ordenes de pieza de la pantalla 0x07 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (235 bytes)
;   0x6e86..0x6f71  (235 bytes)
DATA_ordenes_07_6E86:
	defb 001h,001h,008h,012h,0ceh,061h,009h,00dh,008h,006h,0ceh,061h,009h,001h,001h,00ch	; 6e86  .....a.....a....
	defb 0d3h,061h,011h,00dh,001h,006h,0d3h,061h,00ah,001h,00dh,00ch,062h,061h,000h,001h	; 6e96  .a.....a....ba..
	defb 002h,012h,0c7h,061h,001h,002h,002h,011h,0c7h,061h,002h,001h,002h,004h,0c7h,061h	; 6ea6  ...a.....a.....a
	defb 083h,009h,0c7h,061h,085h,012h,0c7h,061h,086h,011h,0c7h,061h,004h,00ah,002h,004h	; 6eb6  ...a...a...a....
	defb 0c7h,061h,000h,013h,013h,008h,059h,062h,000h,01bh,017h,004h,064h,062h,012h,00dh	; 6ec6  .a....Yb....db..
	defb 005h,00eh,062h,061h,00ah,00dh,008h,001h,0a2h,061h,012h,008h,005h,001h,09bh,061h	; 6ed6  ..ba.....a.....a
	defb 012h,01bh,005h,001h,0a2h,061h,091h,001h,001h,062h,00ah,001h,001h,00ch,0dch,061h	; 6ee6  .....a...b.....a
	defb 08ah,00dh,0e3h,061h,012h,01ah,005h,001h,09bh,061h,012h,008h,001h,014h,0e7h,061h	; 6ef6  ...a.....a.....a
	defb 016h,009h,001h,007h,029h,062h,015h,004h,002h,007h,029h,062h,094h,001h,029h,062h	; 6f06  ....)b....)b..)b
	defb 08eh,015h,088h,061h,00eh,015h,004h,004h,08eh,066h,016h,001h,001h,00fh,08eh,066h	; 6f16  ...a.....f.....f
	defb 013h,010h,004h,001h,08eh,066h,008h,013h,003h,002h,014h,062h,008h,019h,003h,003h	; 6f26  .....f.....b....
	defb 014h,062h,000h,016h,004h,002h,014h,062h,08eh,014h,073h,062h,08eh,019h,073h,062h	; 6f36  .b.....b..sb..sb
	defb 080h,015h,073h,062h,080h,018h,073h,062h,088h,01bh,07ah,062h,00ah,001h,001h,00dh	; 6f46  ..sb..sb..zb....
	defb 01ch,062h,012h,008h,001h,014h,08eh,066h,011h,001h,001h,004h,01ch,062h,000h,01bh	; 6f56  .b.....f.....b..
	defb 017h,001h,08eh,066h,013h,008h,004h,001h,08eh,066h,0ffh	; 6f66  ...f.....f.

; ----------------------------------------------------------------------
; DATOS objetos_07: los 6 objetos de la pantalla 0x07: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (25 bytes)
;   0x6f71..0x6f8a  (25 bytes)
DATA_objetos_07:
	defb 006h,000h,00bh,00ah	; 6f71
	defb 007h,000h,006h,007h	; 6f75
	defb 001h,000h,008h,013h	; 6f79
	defb 001h,000h,008h,019h	; 6f7d
	defb 019h,000h,00eh,015h	; 6f81
	defb 014h,007h,001h,016h	; 6f85
	defb 0ffh	; 6f89

; ----------------------------------------------------------------------
; DATOS sprites_07: los 0 grupos de sprites de la pantalla 0x07: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6f8a..0x6f8b  (1 bytes)
DATA_sprites_07:
	defb 0ffh	; 6f8a

; ----------------------------------------------------------------------
; DATOS ordenes_08_6F8B: las ordenes de pieza compartidas que usa la pantalla
;   0x08 (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (31 bytes)
;   0x6f8b..0x6faa  (31 bytes)
DATA_ordenes_08_6F8B:
	defb 000h,001h,017h,01eh,0edh,062h,000h,001h,017h,008h,062h,061h,000h,017h,017h,008h	; 6f8b  .....b....ba....
	defb 062h,061h,000h,009h,017h,001h,0a2h,061h,000h,016h,017h,001h,09bh,061h,0ffh	; 6f9b  ba.....a.....a.

; ----------------------------------------------------------------------
; DATOS ordenes_08_6FAA: las ordenes de pieza de la pantalla 0x08 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (132 bytes)
;   0x6faa..0x702e  (132 bytes)
DATA_ordenes_08_6FAA:
	defb 0feh,08bh,06fh,093h,007h,0eeh,061h,093h,013h,0eeh,061h,012h,005h,004h,008h,0eeh	; 6faa  ..o...a...a.....
	defb 061h,012h,011h,004h,008h,0eeh,061h,011h,007h,004h,014h,0eeh,061h,011h,001h,001h	; 6fba  a.....a.....a...
	defb 01eh,0e7h,061h,08ch,007h,0eeh,061h,08dh,015h,0eeh,061h,00ch,012h,004h,008h,0eeh	; 6fca  ..a...a...a.....
	defb 061h,00ch,001h,001h,008h,0e7h,061h,08ch,007h,0e7h,061h,00ch,012h,001h,008h,0e7h	; 6fda  a.....a...a.....
	defb 061h,088h,014h,0eeh,061h,007h,00eh,004h,00ch,0eeh,061h,007h,00eh,001h,011h,0e7h	; 6fea  a...a.....a.....
	defb 061h,085h,007h,0eeh,061h,004h,002h,004h,00ch,0eeh,061h,004h,001h,001h,00ch,0e7h	; 6ffa  a...a.....a.....
	defb 061h,084h,00ah,0e7h,061h,011h,001h,001h,01eh,08eh,066h,00ch,001h,001h,00ah,01ch	; 700a  a...a.....f.....
	defb 062h,00ch,012h,001h,008h,01ch,062h,007h,00eh,001h,011h,01ch,062h,004h,001h,001h	; 701a  b.....b.....b...
	defb 00dh,01ch,062h,0ffh	; 702a

; ----------------------------------------------------------------------
; DATOS objetos_08: los 2 objetos de la pantalla 0x08: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x702e..0x7037  (9 bytes)
DATA_objetos_08:
	defb 007h,001h,008h,003h	; 702e
	defb 007h,000h,008h,016h	; 7032
	defb 0ffh	; 7036

; ----------------------------------------------------------------------
; DATOS sprites_08: los 3 grupos de sprites de la pantalla 0x08: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7037..0x7044  (13 bytes)
DATA_sprites_08:
	defb 001h,000h,008h,040h	; 7037
	defb 001h,000h,018h,0a8h	; 703b
	defb 008h,000h,040h,010h	; 703f
	defb 0ffh	; 7043

; ----------------------------------------------------------------------
; DATOS ordenes_09_7044: las ordenes de pieza de la pantalla 0x09 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (96 bytes)
;   0x7044..0x70a4  (96 bytes)
DATA_ordenes_09_7044:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,015h,001h,001h,01eh,0e7h,061h,090h	; 7044  ..o.....b.....a.
	defb 007h,0eeh,061h,090h,007h,0e7h,061h,00bh,001h,001h,008h,0e7h,061h,08bh,006h,0e7h	; 7054  ..a...a.....a...
	defb 061h,086h,015h,0eeh,061h,005h,013h,004h,008h,0eeh,061h,004h,011h,004h,008h,0eeh	; 7064  a...a.....a.....
	defb 061h,004h,011h,001h,00eh,0e7h,061h,082h,007h,0eeh,061h,001h,005h,004h,008h,0eeh	; 7074  a.....a...a.....
	defb 061h,000h,007h,004h,008h,0eeh,061h,015h,001h,001h,01eh,01ch,062h,010h,007h,001h	; 7084  a.....a.....b...
	defb 004h,01ch,062h,00bh,001h,001h,009h,01ch,062h,004h,011h,001h,00eh,01ch,062h,0ffh	; 7094  ..b.....b.....b.

; ----------------------------------------------------------------------
; DATOS objetos_09: los 2 objetos de la pantalla 0x09: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x70a4..0x70ad  (9 bytes)
DATA_objetos_09:
	defb 007h,000h,011h,01ah	; 70a4
	defb 007h,001h,007h,002h	; 70a8
	defb 0ffh	; 70ac

; ----------------------------------------------------------------------
; DATOS sprites_09: los 2 grupos de sprites de la pantalla 0x09: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x70ad..0x70b6  (9 bytes)
DATA_sprites_09:
	defb 01bh,000h,048h,068h	; 70ad
	defb 002h,000h,070h,080h	; 70b1
	defb 0ffh	; 70b5

; ----------------------------------------------------------------------
; DATOS ordenes_0A_70B6: las ordenes de pieza de la pantalla 0x0A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (100 bytes)
;   0x70b6..0x711a  (100 bytes)
DATA_ordenes_0A_70B6:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,093h,008h,0eeh,061h,012h,006h,004h	; 70b6  ..o.....b...a...
	defb 008h,0eeh,061h,011h,008h,004h,008h,0eeh,061h,010h,006h,004h,00ch,0eeh,061h,015h	; 70c6  ..a.....a.....a.
	defb 001h,001h,01eh,0e7h,061h,010h,001h,001h,010h,0e7h,061h,090h,00eh,0e7h,061h,08ch	; 70d6  ....a.....a...a.
	defb 016h,001h,062h,086h,006h,0eeh,061h,085h,008h,0eeh,061h,004h,006h,004h,008h,0eeh	; 70e6  ..b...a...a.....
	defb 061h,004h,001h,001h,00ch,0e7h,061h,084h,00ah,0e7h,061h,015h,001h,001h,01eh,01ch	; 70f6  a.....a...a.....
	defb 062h,010h,001h,001h,011h,01ch,062h,00ch,016h,001h,004h,01ch,062h,004h,001h,001h	; 7106  b.....b.....b...
	defb 00dh,01ch,062h,0ffh	; 7116

; ----------------------------------------------------------------------
; DATOS objetos_0A: los 2 objetos de la pantalla 0x0A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x711a..0x7123  (9 bytes)
DATA_objetos_0A:
	defb 007h,000h,011h,018h	; 711a
	defb 006h,000h,004h,019h	; 711e
	defb 0ffh	; 7122

; ----------------------------------------------------------------------
; DATOS sprites_0A: los 3 grupos de sprites de la pantalla 0x0A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7123..0x7130  (13 bytes)
DATA_sprites_0A:
	defb 001h,000h,020h,098h	; 7123
	defb 001h,000h,010h,040h	; 7127
	defb 01bh,000h,050h,090h	; 712b
	defb 0ffh	; 712f

; ----------------------------------------------------------------------
; DATOS ordenes_0B_7130: las ordenes de pieza de la pantalla 0x0B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (166 bytes)
;   0x7130..0x71d6  (166 bytes)
DATA_ordenes_0B_7130:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,092h,015h,0eeh,061h,011h,013h,004h	; 7130  ..o.....b...a...
	defb 008h,0eeh,061h,010h,011h,004h,008h,0eeh,061h,08dh,014h,0eeh,061h,00ch,012h,004h	; 7140  ..a.....a...a...
	defb 008h,0eeh,061h,00bh,010h,004h,008h,0eeh,061h,08bh,00eh,0eeh,061h,010h,011h,001h	; 7150  ..a.....a...a...
	defb 00eh,0e7h,061h,00bh,00eh,001h,011h,0e7h,061h,08eh,006h,0eeh,061h,00dh,004h,004h	; 7160  ..a.....a...a...
	defb 008h,0eeh,061h,00dh,004h,001h,008h,0e7h,061h,089h,001h,001h,062h,082h,007h,0eeh	; 7170  ..a.....a...b...
	defb 061h,001h,005h,004h,008h,0eeh,061h,084h,015h,0eeh,061h,082h,013h,0eeh,061h,001h	; 7180  a.....a...a...a.
	defb 011h,004h,008h,0eeh,061h,000h,007h,004h,010h,0eeh,061h,085h,008h,0eeh,061h,004h	; 7190  ....a.....a...a.
	defb 006h,004h,008h,0eeh,061h,004h,006h,001h,008h,0e7h,061h,015h,001h,001h,01eh,0e7h	; 71a0  ....a.....a.....
	defb 061h,015h,001h,001h,01eh,01ch,062h,010h,011h,001h,00eh,01ch,062h,00dh,004h,001h	; 71b0  a.....b.....b...
	defb 008h,01ch,062h,00bh,00eh,001h,011h,01ch,062h,009h,001h,001h,004h,01ch,062h,004h	; 71c0  ..b.....b.....b.
	defb 006h,001h,008h,01ch,062h,0ffh	; 71d0

; ----------------------------------------------------------------------
; DATOS objetos_0B: los 3 objetos de la pantalla 0x0B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x71d6..0x71e3  (13 bytes)
DATA_objetos_0B:
	defb 007h,000h,007h,017h	; 71d6
	defb 007h,000h,00ch,01ah	; 71da
	defb 00ah,000h,005h,003h	; 71de
	defb 0ffh	; 71e2

; ----------------------------------------------------------------------
; DATOS sprites_0B: los 3 grupos de sprites de la pantalla 0x0B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x71e3..0x71f0  (13 bytes)
DATA_sprites_0B:
	defb 001h,000h,008h,050h	; 71e3
	defb 002h,000h,050h,058h	; 71e7
	defb 002h,000h,080h,068h	; 71eb
	defb 0ffh	; 71ef

; ----------------------------------------------------------------------
; DATOS ordenes_0C_71F0: las ordenes de pieza de la pantalla 0x0C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (116 bytes)
;   0x71f0..0x7264  (116 bytes)
DATA_ordenes_0C_71F0:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,000h,001h,004h,01eh,062h,061h,088h	; 71f0  ..o.....b....ba.
	defb 007h,0eeh,061h,085h,007h,0eeh,061h,004h,005h,004h,008h,0eeh,061h,087h,015h,0eeh	; 7200  ..a...a.....a...
	defb 061h,085h,013h,0eeh,061h,004h,011h,004h,00ch,0eeh,061h,003h,007h,004h,018h,0eeh	; 7210  a...a.....a.....
	defb 061h,084h,001h,0e7h,061h,08ah,007h,0eeh,061h,009h,005h,004h,008h,0eeh,061h,009h	; 7220  a...a...a.....a.
	defb 005h,001h,008h,0e7h,061h,00eh,001h,004h,00ch,001h,062h,090h,00fh,001h,062h,015h	; 7230  ....a.....b...b.
	defb 001h,001h,01eh,0e7h,061h,015h,001h,001h,01eh,01ch,062h,00eh,001h,001h,00ch,01ch	; 7240  ....a.....b.....
	defb 062h,010h,00fh,001h,004h,01ch,062h,009h,005h,001h,008h,01ch,062h,004h,001h,001h	; 7250  b.....b.....b...
	defb 004h,01ch,062h,0ffh	; 7260

; ----------------------------------------------------------------------
; DATOS objetos_0C: los 3 objetos de la pantalla 0x0C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7264..0x7271  (13 bytes)
DATA_objetos_0C:
	defb 006h,000h,007h,01ah	; 7264
	defb 007h,001h,00ah,004h	; 7268
	defb 007h,000h,011h,018h	; 726c
	defb 0ffh	; 7270

; ----------------------------------------------------------------------
; DATOS sprites_0C: los 0 grupos de sprites de la pantalla 0x0C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7271..0x7272  (1 bytes)
DATA_sprites_0C:
	defb 0ffh	; 7271

; ----------------------------------------------------------------------
; DATOS ordenes_0D_7272: las ordenes de pieza de la pantalla 0x0D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (124 bytes)
;   0x7272..0x72ee  (124 bytes)
DATA_ordenes_0D_7272:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,082h,007h,0eeh,061h,001h,005h,004h	; 7272  ..o.....b...a...
	defb 008h,0eeh,061h,000h,007h,004h,008h,0eeh,061h,082h,015h,0eeh,061h,001h,013h,004h	; 7282  ..a.....a...a...
	defb 008h,0eeh,061h,000h,011h,004h,008h,0eeh,061h,085h,00eh,0eeh,061h,004h,00ch,004h	; 7292  ..a.....a...a...
	defb 008h,0eeh,061h,004h,00ch,001h,008h,0e7h,061h,08bh,011h,001h,062h,092h,007h,0eeh	; 72a2  ..a.....a...b...
	defb 061h,011h,005h,004h,008h,0eeh,061h,092h,013h,0eeh,061h,011h,011h,004h,008h,0eeh	; 72b2  a.....a...a.....
	defb 061h,010h,007h,004h,014h,0eeh,061h,010h,001h,001h,01eh,0e7h,061h,015h,001h,001h	; 72c2  a.....a.....a...
	defb 01eh,0e7h,061h,015h,001h,001h,01eh,01ch,062h,010h,001h,001h,01eh,01ch,062h,00bh	; 72d2  ..a.....b.....b.
	defb 011h,001h,004h,01ch,062h,004h,00ch,001h,008h,01ch,062h,0ffh	; 72e2  ....b.....b.

; ----------------------------------------------------------------------
; DATOS objetos_0D: los 4 objetos de la pantalla 0x0D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x72ee..0x72ff  (17 bytes)
DATA_objetos_0D:
	defb 006h,000h,001h,008h	; 72ee
	defb 006h,000h,012h,019h	; 72f2
	defb 007h,000h,00ch,019h	; 72f6
	defb 007h,001h,00ch,004h	; 72fa
	defb 0ffh	; 72fe

; ----------------------------------------------------------------------
; DATOS sprites_0D: los 2 grupos de sprites de la pantalla 0x0D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x72ff..0x7308  (9 bytes)
DATA_sprites_0D:
	defb 001h,000h,060h,050h	; 72ff
	defb 01bh,000h,050h,090h	; 7303
	defb 0ffh	; 7307

; ----------------------------------------------------------------------
; DATOS ordenes_0E_7308: las ordenes de pieza de la pantalla 0x0E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (130 bytes)
;   0x7308..0x738a  (130 bytes)
DATA_ordenes_0E_7308:
	defb 0feh,08bh,06fh,015h,001h,002h,01eh,001h,062h,015h,001h,001h,01eh,0e7h,061h,010h	; 7308  ..o.....b.....a.
	defb 001h,004h,008h,001h,062h,010h,019h,004h,006h,001h,062h,08bh,00eh,0eeh,061h,00ah	; 7318  ....b.....b...a.
	defb 00ch,004h,008h,0eeh,061h,009h,00ah,004h,00ch,0eeh,061h,086h,006h,0eeh,061h,085h	; 7328  ....a.....a...a.
	defb 008h,0eeh,061h,004h,006h,004h,008h,0eeh,061h,009h,00ah,001h,00ch,0e7h,061h,004h	; 7338  ..a.....a.....a.
	defb 001h,001h,00ch,0e7h,061h,084h,00ah,0e7h,061h,080h,007h,0eeh,061h,085h,015h,0eeh	; 7348  ....a...a...a...
	defb 061h,004h,013h,004h,008h,0eeh,061h,004h,013h,001h,00ch,0e7h,061h,015h,001h,001h	; 7358  a.....a.....a...
	defb 01eh,01ch,062h,010h,001h,001h,008h,01ch,062h,010h,018h,001h,006h,01ch,062h,009h	; 7368  ..b.....b.....b.
	defb 00ah,001h,00ch,01ch,062h,004h,001h,001h,00dh,01ch,062h,004h,013h,001h,00ch,01ch	; 7378  ....b.....b.....
	defb 062h,0ffh	; 7388

; ----------------------------------------------------------------------
; DATOS objetos_0E: los 3 objetos de la pantalla 0x0E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x738a..0x7397  (13 bytes)
DATA_objetos_0E:
	defb 006h,000h,005h,006h	; 738a
	defb 006h,000h,005h,019h	; 738e
	defb 007h,000h,00ch,01ah	; 7392
	defb 0ffh	; 7396

; ----------------------------------------------------------------------
; DATOS sprites_0E: los 1 grupos de sprites de la pantalla 0x0E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x7397..0x739c  (5 bytes)
DATA_sprites_0E:
	defb 01bh,000h,068h,060h	; 7397
	defb 0ffh	; 739b

; ----------------------------------------------------------------------
; DATOS ordenes_2D_739C: las ordenes de pieza de la pantalla 0x2D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (169 bytes)
;   0x739c..0x7445  (169 bytes)
DATA_ordenes_2D_739C:
	defb 013h,001h,004h,01eh,062h,061h,013h,001h,001h,01eh,0dch,061h,005h,00bh,00eh,00ah	; 739c  ....ba.....a....
	defb 059h,062h,005h,00fh,00eh,002h,064h,062h,007h,00ah,00ch,001h,073h,062h,00bh,009h	; 73ac  Yb....db....sb..
	defb 008h,001h,073h,062h,08fh,008h,073h,062h,007h,015h,00ch,001h,073h,062h,00bh,016h	; 73bc  ..sb..sb....sb..
	defb 008h,001h,073h,062h,08fh,017h,073h,062h,011h,00bh,002h,00ah,0dbh,062h,085h,008h	; 73cc  ..sb..sb.....b..
	defb 0c3h,062h,089h,007h,0c3h,062h,085h,015h,0abh,062h,089h,016h,0abh,062h,08dh,00eh	; 73dc  .b...b...b...b..
	defb 075h,061h,080h,00ch,080h,062h,00eh,001h,004h,004h,0ceh,061h,010h,005h,002h,002h	; 73ec  ua...b.....a....
	defb 0ceh,061h,012h,001h,001h,006h,0d3h,061h,00dh,001h,002h,006h,0c7h,061h,00eh,002h	; 73fc  .a.....a.....a..
	defb 002h,004h,0c7h,061h,08fh,006h,0c7h,061h,08fh,005h,0c7h,061h,010h,019h,002h,006h	; 740c  ...a...a...a....
	defb 0ceh,061h,00eh,01bh,002h,004h,0ceh,061h,012h,019h,001h,006h,0d3h,061h,00dh,01ah	; 741c  .a.....a.....a..
	defb 002h,005h,0c7h,061h,00eh,01bh,002h,004h,0c7h,061h,08fh,019h,0c7h,061h,08fh,01ch	; 742c  ...a.....a...a..
	defb 0c7h,061h,013h,001h,001h,01eh,01ch,062h,0ffh	; 743c  .a.....b.

; ----------------------------------------------------------------------
; DATOS objetos_2D: los 4 objetos de la pantalla 0x2D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7445..0x7456  (17 bytes)
DATA_objetos_2D:
	defb 010h,000h,008h,00dh	; 7445
	defb 019h,000h,00dh,00eh	; 7449
	defb 014h,000h,00fh,01eh	; 744d
	defb 014h,001h,00fh,002h	; 7451
	defb 0ffh	; 7455

; ----------------------------------------------------------------------
; DATOS sprites_2D: los 0 grupos de sprites de la pantalla 0x2D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7456..0x7457  (1 bytes)
DATA_sprites_2D:
	defb 0ffh	; 7456

; ----------------------------------------------------------------------
; DATOS ordenes_0F_7457: las ordenes de pieza de la pantalla 0x0F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (61 bytes)
;   0x7457..0x7494  (61 bytes)
DATA_ordenes_0F_7457:
	defb 00ch,001h,001h,01eh,014h,062h,004h,001h,004h,01eh,030h,063h,006h,001h,004h,01eh	; 7457  .....b....0c....
	defb 0f4h,062h,007h,001h,005h,01eh,0fdh,063h,00ch,001h,005h,01eh,007h,063h,00fh,001h	; 7467  .b.....c.....c..
	defb 004h,01eh,030h,063h,011h,001h,004h,01eh,0f4h,062h,012h,001h,004h,01eh,0fdh,063h	; 7477  ..0c.....b.....c
	defb 013h,001h,004h,01eh,0f4h,062h,00dh,001h,002h,01eh,08eh,066h,0ffh	; 7487  .....b.....f.

; ----------------------------------------------------------------------
; DATOS objetos_0F: los 4 objetos de la pantalla 0x0F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7494..0x74a5  (17 bytes)
DATA_objetos_0F:
	defb 00ah,000h,00dh,010h	; 7494
	defb 014h,000h,009h,01eh	; 7498
	defb 014h,001h,009h,001h	; 749c
	defb 014h,003h,003h,00fh	; 74a0
	defb 0ffh	; 74a4

; ----------------------------------------------------------------------
; DATOS sprites_0F: los 0 grupos de sprites de la pantalla 0x0F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x74a5..0x74a6  (1 bytes)
DATA_sprites_0F:
	defb 0ffh	; 74a5

; ----------------------------------------------------------------------
; DATOS ordenes_10_74A6: las ordenes de pieza de la pantalla 0x10 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (55 bytes)
;   0x74a6..0x74dd  (55 bytes)
DATA_ordenes_10_74A6:
	defb 00ch,001h,001h,01eh,014h,062h,007h,001h,004h,01eh,0f4h,062h,007h,001h,005h,01eh	; 74a6  .....b.....b....
	defb 0fdh,063h,00ch,001h,005h,01eh,007h,063h,00fh,001h,004h,01eh,030h,063h,011h,001h	; 74b6  .c.....c....0c..
	defb 004h,01eh,0f4h,062h,012h,001h,004h,01eh,0fdh,063h,013h,001h,004h,01eh,0f4h,062h	; 74c6  ...b.....c.....b
	defb 00dh,001h,002h,01eh,08eh,066h,0ffh	; 74d6

; ----------------------------------------------------------------------
; DATOS objetos_10: los 2 objetos de la pantalla 0x10: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x74dd..0x74e6  (9 bytes)
DATA_objetos_10:
	defb 00fh,000h,000h,00dh	; 74dd
	defb 014h,002h,009h,01eh	; 74e1
	defb 0ffh	; 74e5

; ----------------------------------------------------------------------
; DATOS sprites_10: los 0 grupos de sprites de la pantalla 0x10: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x74e6..0x74e7  (1 bytes)
DATA_sprites_10:
	defb 0ffh	; 74e6

; ----------------------------------------------------------------------
; DATOS ordenes_11_74E7: las ordenes de pieza de la pantalla 0x11 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (71 bytes)
;   0x74e7..0x752e  (71 bytes)
DATA_ordenes_11_74E7:
	defb 00ch,001h,001h,00fh,014h,062h,007h,001h,004h,00fh,0f4h,062h,007h,001h,005h,00fh	; 74e7  .....b.....b....
	defb 0fdh,063h,087h,009h,0ffh,062h,007h,00ah,005h,015h,007h,063h,00ch,001h,005h,01eh	; 74f7  .c...b.....c....
	defb 007h,063h,00fh,001h,004h,01eh,030h,063h,011h,001h,004h,01eh,0f4h,062h,012h,001h	; 7507  .c....0c.....b..
	defb 004h,01eh,0fdh,063h,013h,001h,004h,01eh,0f4h,062h,008h,009h,001h,016h,01ch,062h	; 7517  ...c.....b.....b
	defb 00dh,001h,002h,01eh,08eh,066h,0ffh	; 7527

; ----------------------------------------------------------------------
; DATOS objetos_11: los 2 objetos de la pantalla 0x11: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x752e..0x7537  (9 bytes)
DATA_objetos_11:
	defb 014h,003h,002h,01eh	; 752e
	defb 014h,000h,009h,01eh	; 7532
	defb 0ffh	; 7536

; ----------------------------------------------------------------------
; DATOS sprites_11: los 0 grupos de sprites de la pantalla 0x11: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7537..0x7538  (1 bytes)
DATA_sprites_11:
	defb 0ffh	; 7537

; ----------------------------------------------------------------------
; DATOS ordenes_12_7538: las ordenes de pieza de la pantalla 0x12 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (107 bytes)
;   0x7538..0x75a3  (107 bytes)
DATA_ordenes_12_7538:
	defb 008h,001h,004h,01eh,030h,063h,00ah,001h,004h,01eh,00ah,064h,00ch,001h,004h,01eh	; 7538  ....0c.....d....
	defb 030h,063h,00eh,001h,004h,01eh,0f4h,062h,00fh,001h,005h,01eh,0fdh,063h,014h,001h	; 7548  0c.....b.....c..
	defb 001h,01eh,014h,062h,00ch,001h,001h,007h,014h,062h,011h,001h,001h,007h,014h,062h	; 7558  ...b.....b.....b
	defb 014h,001h,003h,01eh,007h,063h,007h,001h,010h,006h,007h,063h,007h,007h,010h,001h	; 7568  .....c.....c....
	defb 028h,063h,008h,001h,001h,007h,01ch,062h,00dh,001h,008h,007h,08eh,066h,015h,001h	; 7578  (c.....b.....f..
	defb 001h,01eh,08eh,066h,08fh,00eh,0ffh,062h,08fh,00fh,007h,063h,08fh,015h,028h,063h	; 7588  ...f...b...c..(c
	defb 010h,00eh,001h,008h,01ch,062h,090h,00eh,020h,07fh,0ffh	; 7598  .....b.. ..

; ----------------------------------------------------------------------
; DATOS objetos_12: los 1 objetos de la pantalla 0x12: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x75a3..0x75a8  (5 bytes)
DATA_objetos_12:
	defb 014h,000h,011h,01eh	; 75a3
	defb 0ffh	; 75a7

; ----------------------------------------------------------------------
; DATOS sprites_12: los 2 grupos de sprites de la pantalla 0x12: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x75a8..0x75b1  (9 bytes)
DATA_sprites_12:
	defb 00fh,000h,090h,078h	; 75a8
	defb 008h,000h,030h,010h	; 75ac
	defb 0ffh	; 75b0

; ----------------------------------------------------------------------
; DATOS ordenes_13_75B1: las ordenes de pieza de la pantalla 0x13 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (123 bytes)
;   0x75b1..0x762c  (123 bytes)
DATA_ordenes_13_75B1:
	defb 008h,001h,004h,01eh,030h,063h,00ah,001h,004h,01eh,00ah,064h,00ch,001h,004h,01eh	; 75b1  ....0c.....d....
	defb 030h,063h,00eh,001h,004h,01eh,0f4h,062h,00fh,001h,005h,01eh,0fdh,063h,014h,00bh	; 75c1  0c.....b.....c..
	defb 001h,008h,014h,062h,011h,016h,001h,009h,014h,062h,014h,001h,003h,01eh,007h,063h	; 75d1  ...b.....b.....c
	defb 08fh,00bh,0ffh,062h,08fh,00ch,007h,063h,08fh,012h,028h,063h,00ch,016h,00bh,001h	; 75e1  ...b...c..(c....
	defb 0ffh,062h,00ch,017h,00bh,008h,007h,063h,011h,01ah,004h,005h,0f4h,062h,012h,015h	; 75f1  .b.....c.....b..
	defb 004h,00ah,0f4h,062h,013h,014h,004h,00bh,0f4h,062h,00dh,016h,001h,009h,08eh,066h	; 7601  ...b.....b.....f
	defb 015h,001h,001h,01eh,08eh,066h,00eh,016h,009h,001h,08eh,066h,010h,00bh,001h,008h	; 7611  .....f.....f....
	defb 01ch,062h,088h,017h,020h,07fh,090h,00eh,020h,07fh,0ffh	; 7621  .b.. ... ..

; ----------------------------------------------------------------------
; DATOS objetos_13: los 1 objetos de la pantalla 0x13: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x762c..0x7631  (5 bytes)
DATA_objetos_13:
	defb 014h,000h,009h,01eh	; 762c
	defb 0ffh	; 7630

; ----------------------------------------------------------------------
; DATOS sprites_13: los 3 grupos de sprites de la pantalla 0x13: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7631..0x763e  (13 bytes)
DATA_sprites_13:
	defb 00fh,000h,050h,0c0h	; 7631
	defb 00fh,000h,090h,078h	; 7635
	defb 008h,000h,030h,010h	; 7639
	defb 0ffh	; 763d

; ----------------------------------------------------------------------
; DATOS ordenes_14_763E: las ordenes de pieza compartidas que usa la pantalla
;   0x14 (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (37 bytes)
;   0x763e..0x7663  (37 bytes)
DATA_ordenes_14_763E:
	defb 00ch,001h,005h,01eh,007h,063h,00dh,001h,001h,01eh,08eh,066h,00fh,001h,004h,01eh	; 763e  .....c.....f....
	defb 030h,063h,011h,001h,004h,01eh,0f4h,062h,012h,001h,004h,01eh,0fdh,063h,013h,001h	; 764e  0c.....b.....c..
	defb 004h,01eh,0f4h,062h,0ffh	; 765e

; ----------------------------------------------------------------------
; DATOS ordenes_14_7663: las ordenes de pieza de la pantalla 0x14 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (4 bytes)
;   0x7663..0x7667  (4 bytes)
DATA_ordenes_14_7663:
	defb 0feh,03eh,076h,0ffh	; 7663

; ----------------------------------------------------------------------
; DATOS objetos_14: los 1 objetos de la pantalla 0x14: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7667..0x766c  (5 bytes)
DATA_objetos_14:
	defb 014h,005h,004h,016h	; 7667
	defb 0ffh	; 766b

; ----------------------------------------------------------------------
; DATOS sprites_14: los 0 grupos de sprites de la pantalla 0x14: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x766c..0x766d  (1 bytes)
DATA_sprites_14:
	defb 0ffh	; 766c

; ----------------------------------------------------------------------
; DATOS ordenes_15_766D: las ordenes de pieza de la pantalla 0x15 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (4 bytes)
;   0x766d..0x7671  (4 bytes)
DATA_ordenes_15_766D:
	defb 0feh,03eh,076h,0ffh	; 766d

; ----------------------------------------------------------------------
; DATOS objetos_15: los 1 objetos de la pantalla 0x15: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7671..0x7676  (5 bytes)
DATA_objetos_15:
	defb 014h,005h,004h,016h	; 7671
	defb 0ffh	; 7675

; ----------------------------------------------------------------------
; DATOS sprites_15: los 0 grupos de sprites de la pantalla 0x15: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7676..0x7677  (1 bytes)
DATA_sprites_15:
	defb 0ffh	; 7676

; ----------------------------------------------------------------------
; DATOS ordenes_16_7677: las ordenes de pieza de la pantalla 0x16 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (37 bytes)
;   0x7677..0x769c  (37 bytes)
DATA_ordenes_16_7677:
	defb 00fh,001h,008h,01eh,067h,064h,00ch,001h,004h,01eh,03eh,064h,00dh,001h,001h,01eh	; 7677  ....gd....>d....
	defb 08eh,066h,010h,001h,007h,00ch,0a0h,063h,010h,00dh,007h,008h,0c3h,063h,010h,015h	; 7687  .f.....c.....c..
	defb 007h,00ah,0a0h,063h,0ffh	; 7697

; ----------------------------------------------------------------------
; DATOS objetos_16: los 1 objetos de la pantalla 0x16: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x769c..0x76a1  (5 bytes)
DATA_objetos_16:
	defb 00eh,000h,004h,019h	; 769c
	defb 0ffh	; 76a0

; ----------------------------------------------------------------------
; DATOS sprites_16: los 0 grupos de sprites de la pantalla 0x16: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x76a1..0x76a2  (1 bytes)
DATA_sprites_16:
	defb 0ffh	; 76a1

; ----------------------------------------------------------------------
; DATOS sin_lector_76A2: 350 bytes sin formato de pieza, lista ni orden (228 a
;   0x00 o 0xFF y 175 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (350 bytes)
;   0x76a2..0x7800  (350 bytes)
DATA_sin_lector_76A2:
	defb 000h,02fh,000h,07fh,000h,06fh,000h,0efh,000h,02fh,000h,0efh,000h,0efh,0efh,000h	; 76a2  ./...o.../......
	defb 0efh,000h,0efh,000h,07fh,000h,0efh,000h,06fh,000h,0efh,000h,06fh,000h,000h,0efh	; 76b2  ........o...o...
	defb 000h,02fh,000h,07fh,000h,06fh,000h,0efh,000h,0efh,000h,06fh,000h,06fh,0efh,000h	; 76c2  ./...o.....o.o..
	defb 06fh,000h,06fh,000h,0efh,000h,0efh,000h,06fh,000h,06fh,000h,06fh,000h,000h,07fh	; 76d2  o.o.....o.o.o...
	defb 000h,0efh,000h,06fh,000h,0efh,000h,0efh,000h,0efh,000h,07fh,000h,06fh,0efh,000h	; 76e2  ...o.........o..
	defb 0efh,000h,0efh,000h,07fh,000h,06fh,000h,06fh,000h,0ffh,000h,0efh,000h,010h,0ffh	; 76f2  ......o.o.......
	defb 010h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 7702  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,010h,0ffh	; 7712  ................
	defb 000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,0ffh,000h	; 7722  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,000h,0ffh	; 7732  ................
	defb 000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,0ffh,000h	; 7742  ................
	defb 0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,014h,0ffh,000h,0ffh,000h,010h,0ffh	; 7752  ................
	defb 000h,0ffh,000h,0ffh,014h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,0ffh,000h	; 7762  ................
	defb 0ffh,010h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,010h,000h,06fh	; 7772  ...............o
	defb 000h,06fh,000h,0efh,000h,07fh,000h,0efh,000h,06fh,000h,0efh,000h,06fh,06fh,000h	; 7782  .o.......o...oo.
	defb 0efh,000h,06fh,000h,0efh,000h,0efh,000h,0ffh,000h,06fh,000h,06fh,000h,000h,07fh	; 7792  ..o.......o.o...
	defb 000h,07fh,000h,0ffh,000h,0efh,000h,0efh,000h,0ffh,000h,0ffh,000h,02fh,0efh,000h	; 77a2  ............./..
	defb 06fh,000h,07fh,000h,0ffh,000h,0ffh,000h,0efh,000h,0ffh,000h,0efh,000h,000h,0efh	; 77b2  o...............
	defb 000h,06fh,000h,06fh,000h,0efh,000h,07fh,000h,0afh,000h,0bfh,000h,0efh,0efh,000h	; 77c2  .o.o............
	defb 06fh,000h,0efh,000h,06fh,000h,07fh,000h,06fh,000h,07fh,000h,0efh,000h,000h,0efh	; 77d2  o...o...o.......
	defb 000h,06fh,000h,0ffh,000h,06fh,000h,0ffh,000h,0bfh,000h,07fh,000h,06fh,0ffh,000h	; 77e2  .o...o.......o..
	defb 0efh,000h,06fh,000h,02fh,000h,06fh,000h,07fh,000h,07fh,000h,0ffh,000h	; 77f2  ..o./.o.......

; ======================================================================
; CODIGO 0x7800..0x7877  (119 bytes)
; ======================================================================


L_7800:
	dec e			;7800   ; lo que pide E (p03:A0E4): 1 p14:7860, 2 p14:7937, 3 p14:7838, 4 p14:7820...
	jr z,L_7860		;7801
	dec e			;7803
	jp z,L_7937		;7804
	dec e			;7807
	jp z,L_7838		;7808
	dec e			;780b
	jp z,L_7820		;780c
	dec e			;780f   ; ...5 p14:7A11, 6 p14:7A66, 7 p14:7A87, 8 p14:7AA0; si no, nada
	jp z,L_7A11		;7810
	dec e			;7813
	jp z,L_7A66		;7814
	dec e			;7817
	jp z,L_7A87		;7818
	dec e			;781b
	jp z,L_7AA0		;781c
	ret			;781f
L_7820:
	call 09a24h		;7820   ; 4: el soldado que baja: guarda su posicion y sus colores (p03:A8D5)...
	ld bc,0a8d5h		;7823   ; sus colores
	call 05e45h		;7826   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld a,(iy+008h)		;7829   ; ...su paso (p00:5E40) y velocidad -2
	call 05cb6h		;782c   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	call 05e40h		;782f
	ld a,0feh		;7832   ; velocidad -2
	call 05c75h		;7834   ; velocidad: la velocidad A del objeto IY
	ret			;7837
L_7838:
	inc (iy+005h)		;7838   ; 3: el que se esconde, al salir: 4 mas abajo, espera al azar (8 a 0x3F)...
	call 09a24h		;783b
	ld a,(iy+00ah)		;783e   ; lee la y guardada del objeto (p02:9A24)
	add a,004h		;7841   ; 4 mas abajo
	ld (iy+00ah),a		;7843   ; guarda la y guardada del objeto (p02:9A24)
	ld a,r		;7846   ; espera al azar
	and 03fh		;7848
	set 3,a		;784a
	ld (iy+00dh),a		;784c   ; guarda la segunda cuenta del objeto (p02:9921)
	ld bc,0a8d5h		;784f   ; ...sus colores, su figura (p03:A92C) y la direccion -2
	call 05e31h		;7852
	ld hl,0a92ch		;7855
	call 09ffah		;7858   ; pon_figura: pone la figura HL (dy, dx, dibujo) en la ficha IY y en la de debajo (IY+10, dibujo + 4)
	ld (iy+008h),0feh		;785b
	ret			;785f
L_7860:
	ld a,(iy+001h)		;7860   ; 1: el que va a la izquierda por la base: uno a la izquierda por cuadro
	sub 001h		;7863
	cp 008h		;7865   ; al llegar al borde (x 8), fuera
	jp c,0a8a9h		;7867   ; libera_2: libera la ficha IY y la de debajo
	ld (iy+001h),a		;786a   ; guarda la x del objeto (p00:4BBB)
	ld a,(0e18bh)		;786d   ; sin blancos en la sala, fuera
	and a			;7870
	jp nz,0a8a9h		;7871   ; libera_2: libera la ficha IY y la de debajo
	call 0a03eh		;7874   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS tabla_7877: 5 destinos del despachador p00:A03E (call en p14:7874, el
;   indice en A): 7881, 78A7, 78C8, 78FC, 78F9; lo leen p14:7874 (10 bytes)
;   0x7877..0x7881  (10 bytes)
DATA_tabla_7877:
	defw 07881h,078a7h,078c8h,078fch,078f9h	; 7877

; ======================================================================
; CODIGO 0x7881..0x7931  (176 bytes)
; ======================================================================


L_7881:
	ld a,(iy+000h)		;7881   ; hasta donde baja: su y + 4 (IY+18)
	add a,004h		;7884
	ld (iy+018h),a		;7886
	inc (iy+005h)		;7889   ; sube el estado del objeto (p03:A03E)
	ld a,000h		;788c   ; hacia arriba (direccion 0), velocidad 4, dibujos 0x90 y 0x94, sus colores (p14:7935)
	ld (iy+008h),a		;788e
	call 05cb6h		;7891   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,004h		;7894
	call 05c75h		;7896   ; velocidad: la velocidad A del objeto IY
	ld (iy+002h),090h		;7899   ; el dibujo del objeto (p00:4BBB) = 0x90
	ld (iy+012h),094h		;789d
	ld bc,07935h		;78a1
	jp 05e31h		;78a4
L_78A7:
	call 05c53h		;78a7   ; avanza: mueve la ficha IY un paso en su direccion
	ld a,002h		;78aa   ; cada 2 cuadros frena hasta -6...
	call 09915h		;78ac   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_7914		;78af
	ld a,(iy+006h)		;78b1
	dec a			;78b4
	cp 0fah		;78b5
	jr z,L_78BB		;78b7
	jr L_78E3		;78b9
L_78BB:
	inc (iy+005h)		;78bb   ; ...y entonces hacia abajo (direccion 0x10)
	ld a,010h		;78be
	ld (iy+008h),a		;78c0
	call 05cb6h		;78c3   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	jr L_7914		;78c6
L_78C8:
	call 05c53h		;78c8   ; avanza: mueve la ficha IY un paso en su direccion
	ld a,002h		;78cb   ; cada 2 cuadros acelera...
	call 09915h		;78cd   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_7914		;78d0
	ld a,(iy+006h)		;78d2
	inc a			;78d5
	call 05c75h		;78d6   ; velocidad: la velocidad A del objeto IY
	ld a,(iy+000h)		;78d9   ; ...hasta su y de partida
	cp (iy+018h)		;78dc
	jr nc,L_78E8		;78df
	jr L_7914		;78e1
L_78E3:
	call 05c75h		;78e3   ; velocidad: la velocidad A del objeto IY
	jr L_7914		;78e6
L_78E8:
	ld a,r		;78e8   ; alli, a veces (uno de cada cuatro) se queda (estado 4); si no, otra vez
	and 003h		;78ea
	jr nz,L_78F4		;78ec
	ld (iy+005h),004h		;78ee   ; el estado del objeto (p03:A03E) = 0x04
	jr L_7914		;78f2
L_78F4:
	inc (iy+005h)		;78f4   ; sube el estado del objeto (p03:A03E)
	jr L_7914		;78f7
L_78F9:
	dec (iy+000h)		;78f9   ; sube y va a la izquierda, con el dibujo alternando 0x98 y 0xA0 cada 4 cuadros
L_78FC:
	dec (iy+001h)		;78fc   ; baja la x del objeto (p00:4BBB)
	inc (iy+00eh)		;78ff
	ld a,098h		;7902
	bit 2,(iy+00eh)		;7904
	jr z,L_790C		;7908
	ld a,0a0h		;790a
L_790C:
	ld (iy+002h),a		;790c   ; guarda el dibujo del objeto (p00:4BBB)
	add a,004h		;790f
	ld (iy+012h),a		;7911
L_7914:
	call 09abfh		;7914   ; la ficha de abajo, y si toca al jugador (p14:7931)...
	ld hl,07931h		;7917
	push hl			;791a
	call 05a61h		;791b
	pop hl			;791e
	call 05af8h		;791f   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;7922
	call 09ff5h		;7923   ; ...su figura rota y explota
	ld (iy+004h),00bh		;7926   ; el tipo del objeto (p02:8000, p02:8063) = 0x0B
	ld (iy+005h),000h		;792a   ; el estado del objeto (p03:A03E) = 0x00
	jp 0a8afh		;792e

; ----------------------------------------------------------------------
; DATOS caja_7931: una caja de choque (dy, alto, dx, ancho) que lee se_tocan
;   (p00:5BD5-5C10); el primer byte, medido jugando; lo leen p00:5BD5 (4
;   bytes)
;   0x7931..0x7935  (4 bytes)
DATA_caja_7931:
	defb 010h,010h,000h,010h	; 7931

; ----------------------------------------------------------------------
; DATOS leido_7935: 2 bytes que lee 0x5E48 al jugar (medido ejecutando el
;   cartucho, tools/cobertura.py; el tamano es lo que se lee seguido); lo leen
;   0x5E48 (2 bytes)
;   0x7935..0x7937  (2 bytes)
DATA_leido_7935:
	defb 00dh,067h	; 7935

; ======================================================================
; CODIGO 0x7937..0x7a0b  (212 bytes)
; ======================================================================


L_7937:
	ld a,(iy+005h)		;7937   ; 2: el bicho de la base: espera al azar (0x10 a 0x1F) y una direccion al azar (0x16 a 0x19)...
	and a			;793a
	jr nz,L_7976		;793b
	inc (iy+005h)		;793d   ; sube el estado del objeto (p03:A03E)
	call 09a24h		;7940
	ld a,r		;7943
	and 00fh		;7945
	add a,010h		;7947
	ld (iy+00dh),a		;7949   ; guarda la segunda cuenta del objeto (p02:9921)
	ld a,r		;794c
	and 003h		;794e
	add a,016h		;7950
	ld (iy+008h),a		;7952
	call 05cb6h		;7955   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld bc,07a0fh		;7958   ; ...sus colores (p14:7A0F)...
	call 05e31h		;795b
	ld c,0ffh		;795e   ; ...y si gira: a la izquierda (3 de cada 8), a la derecha (3) o nada (2)
	ld a,r		;7960
	and 007h		;7962
	cp 003h		;7964
	jr c,L_7970		;7966
	ld c,001h		;7968
	cp 006h		;796a
	jr c,L_7970		;796c
	ld c,000h		;796e
L_7970:
	sla c		;7970
	ld (iy+00eh),c		;7972
	ret			;7975
L_7976:
	ld a,(0e18bh)		;7976   ; sin blancos en la sala, fuera
	and a			;7979
	jp nz,0a8a9h		;797a   ; libera_2: libera la ficha IY y la de debajo
	call 05ccch		;797d   ; dos pasos por cuadro (p00:5CCC)
	call 05ccch		;7980   ; un_paso: mueve la ficha IY un punto en su direccion (IY+8, 32 direcciones, la tabla p00:5D0D)
	ld a,(iy+005h)		;7983   ; lee el estado del objeto (p03:A03E)
	cp 002h		;7986
	jr z,L_799C		;7988
	ld a,(0e022h)		;798a   ; cada 0x30 cuadros (0x50 en el tramo 2)...
	cp 002h		;798d
	jr z,L_7995		;798f
	ld a,030h		;7991
	jr L_7997		;7993
L_7995:
	ld a,050h		;7995
L_7997:
	call 0a869h		;7997   ; espera_c: cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar
	jr nc,L_79C1		;799a
L_799C:
	inc (iy+00ch)		;799c   ; ...y cada 8, gira un paso (mientras le quede la espera)
	ld a,(iy+00ch)		;799f   ; lee la cuenta del objeto (p02:9915)
	cp 008h		;79a2
	jr c,L_79C1		;79a4
	ld (iy+00ch),000h		;79a6   ; la cuenta del objeto (p02:9915) = 0x00
	ld a,(iy+00dh)		;79aa   ; lee la segunda cuenta del objeto (p02:9921)
	and a			;79ad
	jr z,L_79C1		;79ae
	dec (iy+00dh)		;79b0   ; baja la segunda cuenta del objeto (p02:9921)
	ld a,(iy+00eh)		;79b3
	add a,(iy+008h)		;79b6
	and 01fh		;79b9
	ld (iy+008h),a		;79bb
	call 05cb6h		;79be   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
L_79C1:
	inc (iy+01bh)		;79c1   ; su dibujo da la vuelta: de 0x58 a 0x78 de 8 en 8, despacio
	ld a,(iy+01bh)		;79c4
	srl a		;79c7
	and 018h		;79c9
	add a,058h		;79cb
	cp 080h		;79cd
	jr c,L_79D5		;79cf
	ld (iy+01bh),058h		;79d1
L_79D5:
	ld (iy+002h),a		;79d5   ; guarda el dibujo del objeto (p00:4BBB)
	add a,004h		;79d8
	ld (iy+012h),a		;79da
	call 09abfh		;79dd
	ld a,(iy+000h)		;79e0   ; fuera de la pantalla, fuera
	cp 0e8h		;79e3
	jr nc,L_79EC		;79e5
	cp 0a8h		;79e7
	jp nc,0a8a9h		;79e9   ; libera_2: libera la ficha IY y la de debajo
L_79EC:
	ld a,(iy+001h)		;79ec   ; lee la x del objeto (p00:4BBB)
	cp 004h		;79ef
	jp c,0a8a9h		;79f1   ; libera_2: libera la ficha IY y la de debajo
	cp 0f0h		;79f4
	jp nc,0a8a9h		;79f6   ; libera_2: libera la ficha IY y la de debajo
	ld hl,07a0bh		;79f9   ; si toca al jugador (p14:7A0B), explota
	push hl			;79fc
	call 05a5ah		;79fd   ; toca_al_jugador_2: como p00:5A68 con otro dano
	pop hl			;7a00
	call 05af8h		;7a01   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;7a04
	call 09ff5h		;7a05
	jp 0a0ffh		;7a08   ; explota: la ficha IY pasa a ser una explosion (tipo 0x0B)

; ----------------------------------------------------------------------
; DATOS caja_7A0B: una caja de choque (dy, alto, dx, ancho) que lee se_tocan
;   (p00:5BD5-5C10); el primer byte, medido jugando; lo leen p00:5BD5 (4
;   bytes)
;   0x7a0b..0x7a0f  (4 bytes)
DATA_caja_7A0B:
	defb 008h,008h,000h,010h	; 7a0b

; ----------------------------------------------------------------------
; DATOS leido_7A0F: 2 bytes que lee 0x5E48 al jugar (medido ejecutando el
;   cartucho, tools/cobertura.py; el tamano es lo que se lee seguido); lo leen
;   0x5E48 (2 bytes)
;   0x7a0f..0x7a11  (2 bytes)
DATA_leido_7A0F:
	defb 008h,062h	; 7a0f

; ======================================================================
; CODIGO 0x7a11..0x7ab1  (160 bytes)
; ======================================================================


L_7A11:
	ld a,(iy+003h)		;7a11   ; 5: la pieza que cae del techo: con IY+3 = 1, ya en el suelo
	cp 001h		;7a14
	jr z,L_7A46		;7a16
	ld a,010h		;7a18   ; cada 0x10 cuadros...
	call 09915h		;7a1a   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	ret nc			;7a1d
	ld (iy+005h),001h		;7a1e   ; el estado del objeto (p03:A03E) = 0x01
	ld a,(iy+00fh)		;7a22   ; ...su pieza en el fondo (p02:92CB o p02:92BA segun IY+0F)...
	and a			;7a25
	jr z,L_7A2D		;7a26
	ld de,092cbh		;7a28
	jr L_7A30		;7a2b
L_7A2D:
	ld de,092bah		;7a2d
L_7A30:
	call 08400h		;7a30   ; pinta_pieza: pinta en el fondo la pieza DE en la casilla de la ficha (IY+6/IY+7), con p03:BD1F
	ld a,020h		;7a33   ; ...una casilla mas abajo (0x20)...
	add a,(iy+006h)		;7a35
	ld (iy+006h),a		;7a38
	jr nc,L_7A40		;7a3b
	inc (iy+007h)		;7a3d
L_7A40:
	dec (iy+009h)		;7a40   ; ...IY+9 veces
	jr z,L_7A46		;7a43
	ret			;7a45
L_7A46:
	ld a,0e0h		;7a46   ; abajo: una casilla atras y fuera
	add a,(iy+006h)		;7a48
	ld (iy+006h),a		;7a4b
	ld (iy+004h),000h		;7a4e   ; el tipo del objeto (p02:8000, p02:8063) = 0x00
	ld a,(iy+00fh)		;7a52
	and a			;7a55
	ret z			;7a56
	ld de,092c4h		;7a57   ; con IY+0F, la pieza p02:92C4 y un 1 en la casilla 0x19F (p00:48C7)
	call 08400h		;7a5a   ; pinta_pieza: pinta en el fondo la pieza DE en la casilla de la ficha (IY+6/IY+7), con p03:BD1F
	ld h,001h		;7a5d
	ld l,09fh		;7a5f
	ld a,010h		;7a61
	jp 048c7h		;7a63
L_7A66:
	ld (iy+003h),003h		;7a66   ; 6: rota (IY+3 = 3, dibujo 4)...
	ld (iy+002h),004h		;7a6a   ; el dibujo del objeto (p00:4BBB) = 0x04
	ld hl,08d30h		;7a6e   ; ...la orden de p02:8D30 que borra su trozo de pantalla...
	ld de,0e0d0h		;7a71   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000bh		;7a74
	ldir		;7a77
	ld b,024h		;7a79
	call 0507bh		;7a7b   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	call 0813bh		;7a7e   ; ...0x50 puntos y dos destruidos mas
	call 08564h		;7a81
	jp 08564h		;7a84
L_7A87:
	ld iy,0e5d0h		;7a87   ; 7: un objeto del tipo 0x20 en 0xE5D0 con la cuenta 0x50...
	ld (iy+004h),020h		;7a8b   ; el tipo del objeto (p02:8000, p02:8063) = 0x20
	ld (iy+00ch),050h		;7a8f   ; la cuenta del objeto (p02:9915) = 0x50
	ld (iy+00dh),000h		;7a93   ; la segunda cuenta del objeto (p02:9921) = 0x00
	ld a,0ffh		;7a97   ; ...y 0xE5C2 y los blancos de la sala a 0xFF
	ld (0e5c2h),a		;7a99
	ld (0e18bh),a		;7a9c   ; guarda los blancos de la sala que quedan (bases 3D)
	ret			;7a9f
L_7AA0:
	ld (iy+004h),024h		;7aa0   ; 8: el tipo 0x24, dibujo 0x28, IY+14 = 0x0B
	ld (iy+005h),000h		;7aa4   ; el estado del objeto (p03:A03E) = 0x00
	ld (iy+002h),028h		;7aa8   ; el dibujo del objeto (p00:4BBB) = 0x28
	ld (iy+014h),00bh		;7aac
	ret			;7ab0

; ----------------------------------------------------------------------
; DATOS sin_lector_7AB1: 79 bytes sin formato de pieza, lista ni orden (46 a
;   0x00 o 0xFF y 38 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (79 bytes)
;   0x7ab1..0x7b00  (79 bytes)
DATA_sin_lector_7AB1:
	defb 000h,0efh,000h,06fh,000h,0ffh,000h,0efh,000h,0ffh,000h,0ffh,000h,0efh,000h,000h	; 7ab1  ...o............
	defb 06fh,000h,02fh,000h,06fh,000h,06fh,000h,0efh,000h,06fh,000h,07fh,000h,0efh,07fh	; 7ac1  o./.o.o...o.....
	defb 000h,02fh,000h,0efh,000h,06fh,000h,06fh,000h,0efh,000h,06fh,000h,0ffh,000h,000h	; 7ad1  ./...o.o...o....
	defb 0efh,000h,0efh,000h,0ffh,000h,06fh,000h,07fh,000h,0efh,000h,0efh,000h,06bh,0efh	; 7ae1  ......o.......k.
	defb 000h,06fh,000h,0efh,000h,0efh,000h,0efh,000h,0ffh,000h,06fh,000h,06fh,000h	; 7af1  .o.........o.o.

; ----------------------------------------------------------------------
; DATOS ordenes_17_7B00: las ordenes de pieza de la pantalla 0x17 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (47 bytes)
;   0x7b00..0x7b2f  (47 bytes)
DATA_ordenes_17_7B00:
	defb 014h,001h,003h,01eh,03eh,064h,015h,001h,001h,01eh,08eh,066h,010h,001h,007h,00ch	; 7b00  ....>d.....f....
	defb 067h,064h,00ch,001h,004h,00ch,03eh,064h,010h,001h,007h,00ch,0a0h,063h,08ch,00dh	; 7b10  gd....>d.....c..
	defb 051h,064h,00dh,001h,001h,00dh,08eh,066h,00eh,00ch,009h,001h,08eh,066h,0ffh	; 7b20  Qd.....f.....f.

; ----------------------------------------------------------------------
; DATOS objetos_17: los 1 objetos de la pantalla 0x17: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7b2f..0x7b34  (5 bytes)
DATA_objetos_17:
	defb 014h,000h,011h,01eh	; 7b2f
	defb 0ffh	; 7b33

; ----------------------------------------------------------------------
; DATOS sprites_17: los 0 grupos de sprites de la pantalla 0x17: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7b34..0x7b35  (1 bytes)
DATA_sprites_17:
	defb 0ffh	; 7b34

; ----------------------------------------------------------------------
; DATOS ordenes_18_7B35: las ordenes de pieza de la pantalla 0x18 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (67 bytes)
;   0x7b35..0x7b78  (67 bytes)
DATA_ordenes_18_7B35:
	defb 005h,00dh,008h,012h,0a0h,063h,080h,00fh,0a0h,063h,080h,013h,0c3h,063h,080h,017h	; 7b35  .....c...c...c..
	defb 0a0h,063h,080h,01bh,0c3h,063h,08eh,013h,04eh,063h,00eh,00ah,005h,00ch,089h,063h	; 7b45  .c...c..Nc.....c
	defb 091h,015h,0e8h,064h,08eh,007h,04eh,063h,014h,001h,003h,01eh,03eh,064h,00fh,009h	; 7b55  ...d..Nc....>d..
	defb 001h,010h,01ch,062h,015h,001h,001h,01eh,08eh,066h,08bh,011h,020h,07fh,091h,017h	; 7b65  ...b.....f.. ...
	defb 020h,07fh,0ffh	; 7b75

; ----------------------------------------------------------------------
; DATOS objetos_18: los 1 objetos de la pantalla 0x18: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7b78..0x7b7d  (5 bytes)
DATA_objetos_18:
	defb 014h,000h,011h,01eh	; 7b78
	defb 0ffh	; 7b7c

; ----------------------------------------------------------------------
; DATOS sprites_18: los 3 grupos de sprites de la pantalla 0x18: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7b7d..0x7b8a  (13 bytes)
DATA_sprites_18:
	defb 01ah,000h,05ah,064h	; 7b7d
	defb 00fh,000h,068h,090h	; 7b81
	defb 00fh,000h,098h,0c0h	; 7b85
	defb 0ffh	; 7b89

; ----------------------------------------------------------------------
; DATOS ordenes_19_7B8A: las ordenes de pieza de la pantalla 0x19 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (77 bytes)
;   0x7b8a..0x7bd7  (77 bytes)
DATA_ordenes_19_7B8A:
	defb 005h,001h,008h,00ch,0c3h,063h,000h,001h,008h,00ch,0a0h,063h,000h,00dh,008h,008h	; 7b8a  .....c.....c....
	defb 0c3h,063h,000h,015h,008h,00ah,0a0h,063h,008h,010h,005h,00fh,089h,063h,088h,00dh	; 7b9a  .c.....c.....c..
	defb 04eh,063h,00eh,00ah,005h,015h,089h,063h,08eh,007h,04eh,063h,014h,001h,003h,01eh	; 7baa  Nc.....c..Nc....
	defb 03eh,064h,015h,001h,001h,01eh,08eh,066h,00fh,009h,001h,016h,01ch,062h,009h,00fh	; 7bba  >d.....f.....b..
	defb 001h,010h,01ch,062h,091h,011h,020h,07fh,091h,011h,020h,07fh,0ffh	; 7bca  ...b.. ... ..

; ----------------------------------------------------------------------
; DATOS objetos_19: los 2 objetos de la pantalla 0x19: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x7bd7..0x7be0  (9 bytes)
DATA_objetos_19:
	defb 00ah,000h,004h,00fh	; 7bd7
	defb 014h,000h,00bh,01eh	; 7bdb
	defb 0ffh	; 7bdf

; ----------------------------------------------------------------------
; DATOS sprites_19: los 2 grupos de sprites de la pantalla 0x19: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x7be0..0x7be9  (9 bytes)
DATA_sprites_19:
	defb 00fh,000h,098h,090h	; 7be0
	defb 01ah,000h,03ch,054h	; 7be4
	defb 0ffh	; 7be8

; ----------------------------------------------------------------------
; DATOS sin_lector_7BE9: 4 bytes sin formato de pieza, lista ni orden (2 a
;   0x00 o 0xFF y 1 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (4 bytes)
;   0x7be9..0x7bed  (4 bytes)
DATA_sin_lector_7BE9:
	defb 000h,03ch,054h,0ffh	; 7be9

; ----------------------------------------------------------------------
; DATOS ordenes_1A_7BED: las ordenes de pieza de la pantalla 0x1A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (71 bytes)
;   0x7bed..0x7c34  (71 bytes)
DATA_ordenes_1A_7BED:
	defb 080h,001h,0c3h,063h,080h,005h,0a0h,063h,080h,009h,0c3h,063h,080h,00dh,0a0h,063h	; 7bed  ...c...c...c...c
	defb 080h,011h,0c3h,063h,000h,015h,008h,00ah,0a0h,063h,008h,001h,005h,01eh,089h,063h	; 7bfd  ...c.....c.....c
	defb 00eh,001h,005h,01eh,089h,063h,014h,001h,003h,01eh,03eh,064h,009h,001h,001h,01eh	; 7c0d  .....c....>d....
	defb 01ch,062h,00fh,001h,001h,01eh,01ch,062h,015h,001h,001h,01eh,08eh,066h,085h,013h	; 7c1d  .b.....b.....f..
	defb 020h,07fh,08bh,00eh,020h,07fh,0ffh	; 7c2d

; ----------------------------------------------------------------------
; DATOS objetos_1A: los 1 objetos de la pantalla 0x1A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7c34..0x7c39  (5 bytes)
DATA_objetos_1A:
	defb 014h,000h,011h,01eh	; 7c34
	defb 0ffh	; 7c38

; ----------------------------------------------------------------------
; DATOS sprites_1A: los 3 grupos de sprites de la pantalla 0x1A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7c39..0x7c46  (13 bytes)
DATA_sprites_1A:
	defb 00fh,000h,038h,0a0h	; 7c39
	defb 00fh,000h,068h,078h	; 7c3d
	defb 01ah,000h,013h,054h	; 7c41
	defb 0ffh	; 7c45

; ----------------------------------------------------------------------
; DATOS ordenes_1B_7C46: las ordenes de pieza de la pantalla 0x1B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (85 bytes)
;   0x7c46..0x7c9b  (85 bytes)
DATA_ordenes_1B_7C46:
	defb 005h,00fh,008h,008h,0a0h,063h,000h,001h,008h,00ch,0a0h,063h,080h,00dh,0c3h,063h	; 7c46  .....c.....c...c
	defb 080h,011h,0a0h,063h,080h,015h,0c3h,063h,088h,00ah,04eh,063h,008h,001h,005h,00ch	; 7c56  ...c...c..Nc....
	defb 089h,063h,08bh,00ch,0e8h,064h,009h,001h,001h,00fh,01ch,062h,08eh,00eh,04eh,063h	; 7c66  .c...d.....b..Nc
	defb 00eh,001h,005h,010h,089h,063h,091h,010h,0e8h,064h,00fh,001h,001h,013h,01ch,062h	; 7c76  .....c...d.....b
	defb 014h,001h,003h,01eh,03eh,064h,015h,001h,001h,01eh,08eh,066h,091h,007h,020h,07fh	; 7c86  ....>d.....f.. .
	defb 08bh,00bh,020h,07fh,0ffh	; 7c96

; ----------------------------------------------------------------------
; DATOS objetos_1B: los 1 objetos de la pantalla 0x1B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7c9b..0x7ca0  (5 bytes)
DATA_objetos_1B:
	defb 014h,000h,011h,01eh	; 7c9b
	defb 0ffh	; 7c9f

; ----------------------------------------------------------------------
; DATOS sprites_1B: los 3 grupos de sprites de la pantalla 0x1B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7ca0..0x7cad  (13 bytes)
DATA_sprites_1B:
	defb 00fh,000h,098h,040h	; 7ca0
	defb 00fh,000h,068h,060h	; 7ca4
	defb 01ah,000h,011h,03dh	; 7ca8
	defb 0ffh	; 7cac

; ----------------------------------------------------------------------
; DATOS ordenes_1C_7CAD: las ordenes de pieza de la pantalla 0x1C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (71 bytes)
;   0x7cad..0x7cf4  (71 bytes)
DATA_ordenes_1C_7CAD:
	defb 014h,001h,003h,01eh,03eh,064h,015h,001h,001h,01eh,08eh,066h,092h,011h,05ch,064h	; 7cad  ....>d.....f..\d
	defb 012h,013h,004h,00ch,03eh,064h,090h,011h,05ch,064h,010h,013h,004h,00ch,03eh,064h	; 7cbd  ....>d..\d....>d
	defb 011h,012h,001h,00dh,08eh,066h,012h,012h,005h,001h,08eh,066h,08eh,017h,05ch,064h	; 7ccd  .....f.....f..\d
	defb 00eh,019h,004h,006h,03eh,064h,08ch,017h,05ch,064h,00ch,019h,004h,006h,03eh,064h	; 7cdd  ....>d..\d....>d
	defb 00dh,018h,008h,007h,08eh,066h,0ffh	; 7ced

; ----------------------------------------------------------------------
; DATOS objetos_1C: los 1 objetos de la pantalla 0x1C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7cf4..0x7cf9  (5 bytes)
DATA_objetos_1C:
	defb 014h,000h,009h,01eh	; 7cf4
	defb 0ffh	; 7cf8

; ----------------------------------------------------------------------
; DATOS sprites_1C: los 1 grupos de sprites de la pantalla 0x1C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x7cf9..0x7cfe  (5 bytes)
DATA_sprites_1C:
	defb 008h,000h,030h,010h	; 7cf9
	defb 0ffh	; 7cfd

; ----------------------------------------------------------------------
; DATOS ordenes_1D_7CFE: las ordenes de pieza de la pantalla 0x1D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (37 bytes)
;   0x7cfe..0x7d23  (37 bytes)
DATA_ordenes_1D_7CFE:
	defb 014h,001h,003h,01eh,03eh,064h,012h,001h,004h,01eh,03eh,064h,010h,001h,004h,01eh	; 7cfe  ....>d....>d....
	defb 03eh,064h,00eh,001h,004h,01eh,03eh,064h,00ch,001h,004h,01eh,03eh,064h,00dh,001h	; 7d0e  >d....>d....>d..
	defb 002h,01eh,08eh,066h,0ffh	; 7d1e

; ----------------------------------------------------------------------
; DATOS objetos_1D: los 1 objetos de la pantalla 0x1D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7d23..0x7d28  (5 bytes)
DATA_objetos_1D:
	defb 00eh,000h,004h,019h	; 7d23
	defb 0ffh	; 7d27

; ----------------------------------------------------------------------
; DATOS sprites_1D: los 0 grupos de sprites de la pantalla 0x1D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d28..0x7d29  (1 bytes)
DATA_sprites_1D:
	defb 0ffh	; 7d28

; ----------------------------------------------------------------------
; DATOS ordenes_1E_7D29: las ordenes de pieza de la pantalla 0x1E (que no esta
;   en ninguna lista de fase) (p03:BBA2: forma corta con el bit 7, larga sin
;   el, 0xFE + puntero, 0xFF acaba); lo leen p03:BBA2 (75 bytes)
;   0x7d29..0x7d74  (75 bytes)
DATA_ordenes_1E_7D29:
	defb 014h,001h,003h,01eh,03eh,064h,015h,001h,001h,01eh,08eh,066h,012h,001h,004h,00ch	; 7d29  ....>d.....f....
	defb 03eh,064h,092h,00dh,051h,064h,010h,001h,004h,00ch,03eh,064h,090h,00dh,051h,064h	; 7d39  >d..Qd....>d..Qd
	defb 00eh,001h,004h,00ch,03eh,064h,08eh,00dh,051h,064h,00ch,001h,004h,00ch,03eh,064h	; 7d49  ....>d..Qd....>d
	defb 08ch,00dh,051h,064h,00dh,001h,00ah,00dh,08eh,066h,08ch,018h,05ch,064h,00ch,01ah	; 7d59  ..Qd.....f..\d..
	defb 004h,005h,03eh,064h,00dh,019h,001h,006h,01ch,062h,0ffh	; 7d69  ..>d.....b.

; ----------------------------------------------------------------------
; DATOS objetos_1E: los 0 objetos de la pantalla 0x1E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x7d74..0x7d75  (1 bytes)
DATA_objetos_1E:
	defb 0ffh	; 7d74

; ----------------------------------------------------------------------
; DATOS sprites_1E: los 0 grupos de sprites de la pantalla 0x1E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d75..0x7d76  (1 bytes)
DATA_sprites_1E:
	defb 0ffh	; 7d75

; ----------------------------------------------------------------------
; DATOS ordenes_1F_7D76: las ordenes de pieza de la pantalla 0x1F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (31 bytes)
;   0x7d76..0x7d95  (31 bytes)
DATA_ordenes_1F_7D76:
	defb 000h,001h,008h,01eh,0bah,064h,008h,001h,004h,01eh,0afh,064h,00ch,001h,00bh,01eh	; 7d76  .....d.....d....
	defb 0bah,064h,00fh,001h,002h,01eh,099h,064h,013h,001h,004h,01eh,08ah,064h,0ffh	; 7d86  .d.....d.....d.

; ----------------------------------------------------------------------
; DATOS ordenes_25_7D95: las ordenes de pieza de la pantalla 0x25 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); se
;   solapan 3 bloques: (objetos_1F 7D95-7DAE) (objetos_25 7DA9-7DAE); lo leen
;   p03:BBA2, p03:BD7F (25 bytes)
;   0x7d95..0x7dae  (25 bytes)
DATA_ordenes_25_7D95:
	defb 0feh,076h,07dh,010h,004h,004h,018h,0c5h,064h,093h,009h,0c5h,064h,010h,001h,001h	; 7d95  .v}.....d...d...
	defb 01eh,08eh,066h,0ffh,014h,000h,00ch,01eh,0ffh	; 7da5  ..f......

; ----------------------------------------------------------------------
; DATOS sprites_1F: los 0 grupos de sprites de la pantalla 0x1F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); se solapan 2 bloques: (sprites_25 7DAE-7DAF); lo leen
;   p03:BDE3 (1 bytes)
;   0x7dae..0x7daf  (1 bytes)
DATA_sprites_1F:
	defb 0ffh	; 7dae

; ----------------------------------------------------------------------
; DATOS ordenes_26_7DAF: las ordenes de pieza de la pantalla 0x26 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7daf..0x7dc5  (22 bytes)
DATA_ordenes_26_7DAF:
	defb 0feh,076h,07dh,090h,001h,0c5h,064h,090h,011h,0c5h,064h,093h,014h,0c5h,064h,010h	; 7daf  .v}...d...d...d.
	defb 001h,001h,01eh,08eh,066h,0ffh	; 7dbf

; ----------------------------------------------------------------------
; DATOS objetos_26: los 1 objetos de la pantalla 0x26: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7dc5..0x7dca  (5 bytes)
DATA_objetos_26:
	defb 014h,000h,00ch,01eh	; 7dc5
	defb 0ffh	; 7dc9

; ----------------------------------------------------------------------
; DATOS sprites_26: los 0 grupos de sprites de la pantalla 0x26: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7dca..0x7dcb  (1 bytes)
DATA_sprites_26:
	defb 0ffh	; 7dca

; ----------------------------------------------------------------------
; DATOS ordenes_27_7DCB: las ordenes de pieza de la pantalla 0x27 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (20 bytes)
;   0x7dcb..0x7ddf  (20 bytes)
DATA_ordenes_27_7DCB:
	defb 0feh,076h,07dh,010h,00ah,004h,010h,0c5h,064h,093h,00eh,0c5h,064h,010h,001h,001h	; 7dcb  .v}.....d...d...
	defb 01eh,08eh,066h,0ffh	; 7ddb

; ----------------------------------------------------------------------
; DATOS objetos_27: los 1 objetos de la pantalla 0x27: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7ddf..0x7de4  (5 bytes)
DATA_objetos_27:
	defb 014h,006h,00ah,01dh	; 7ddf
	defb 0ffh	; 7de3

; ----------------------------------------------------------------------
; DATOS sprites_27: los 0 grupos de sprites de la pantalla 0x27: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7de4..0x7de5  (1 bytes)
DATA_sprites_27:
	defb 0ffh	; 7de4

; ----------------------------------------------------------------------
; DATOS ordenes_28_7DE5: las ordenes de pieza de la pantalla 0x28 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (52 bytes)
;   0x7de5..0x7e19  (52 bytes)
DATA_ordenes_28_7DE5:
	defb 0feh,076h,07dh,090h,001h,0c5h,064h,010h,00dh,004h,010h,0c5h,064h,093h,005h,0c5h	; 7de5  .v}...d.....d...
	defb 064h,00ch,014h,003h,006h,06dh,064h,00dh,012h,003h,009h,06dh,064h,010h,001h,001h	; 7df5  d....md....md...
	defb 01eh,08eh,066h,00dh,013h,003h,007h,08eh,066h,00ch,015h,001h,004h,08eh,066h,080h	; 7e05  ..f.....f.....f.
	defb 017h,092h,066h,0ffh	; 7e15

; ----------------------------------------------------------------------
; DATOS objetos_28: los 1 objetos de la pantalla 0x28: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x7e19..0x7e1e  (5 bytes)
DATA_objetos_28:
	defb 011h,000h,004h,018h	; 7e19
	defb 0ffh	; 7e1d

; ----------------------------------------------------------------------
; DATOS sprites_28: los 0 grupos de sprites de la pantalla 0x28: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7e1e..0x7e1f  (1 bytes)
DATA_sprites_28:
	defb 0ffh	; 7e1e

; ----------------------------------------------------------------------
; DATOS ordenes_29_7E1F: las ordenes de pieza de la pantalla 0x29 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (56 bytes)
;   0x7e1f..0x7e57  (56 bytes)
DATA_ordenes_29_7E1F:
	defb 0feh,076h,07dh,000h,001h,004h,01eh,0a0h,064h,082h,006h,079h,064h,082h,007h,079h	; 7e1f  .v}.....d..yd..y
	defb 064h,081h,008h,079h,064h,081h,004h,079h,064h,001h,011h,007h,006h,079h,064h,083h	; 7e2f  d..yd..yd....yd.
	defb 012h,079h,064h,081h,009h,06dh,064h,010h,004h,004h,018h,0c5h,064h,093h,008h,06dh	; 7e3f  .yd..md.....d..m
	defb 064h,010h,001h,001h,01eh,08eh,066h,0ffh	; 7e4f  d.....f.

; ----------------------------------------------------------------------
; DATOS objetos_29: los 2 objetos de la pantalla 0x29: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x7e57..0x7e60  (9 bytes)
DATA_objetos_29:
	defb 016h,000h,000h,00eh	; 7e57
	defb 016h,000h,000h,019h	; 7e5b
	defb 0ffh	; 7e5f

; ----------------------------------------------------------------------
; DATOS sprites_29: los 0 grupos de sprites de la pantalla 0x29: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7e60..0x7e61  (1 bytes)
DATA_sprites_29:
	defb 0ffh	; 7e60

; ----------------------------------------------------------------------
; DATOS ordenes_2A_7E61: las ordenes de pieza de la pantalla 0x2A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (58 bytes)
;   0x7e61..0x7e9b  (58 bytes)
DATA_ordenes_2A_7E61:
	defb 0feh,076h,07dh,000h,001h,004h,01eh,0a0h,064h,000h,009h,007h,00ch,079h,064h,082h	; 7e61  .v}.....d....yd.
	defb 00ah,079h,064h,081h,00ch,079h,064h,082h,010h,079h,064h,083h,00dh,079h,064h,080h	; 7e71  .yd..yd..yd..yd.
	defb 00eh,06dh,064h,081h,013h,06dh,064h,090h,004h,0c5h,064h,093h,009h,0c5h,064h,090h	; 7e81  .md..md...d...d.
	defb 014h,0c5h,064h,010h,001h,001h,01eh,08eh,066h,0ffh	; 7e91  ..d.....f.

; ----------------------------------------------------------------------
; DATOS objetos_2A: los 4 objetos de la pantalla 0x2A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7e9b..0x7eac  (17 bytes)
DATA_objetos_2A:
	defb 016h,000h,000h,018h	; 7e9b
	defb 016h,000h,000h,01bh	; 7e9f
	defb 016h,000h,013h,008h	; 7ea3
	defb 016h,000h,013h,016h	; 7ea7
	defb 0ffh	; 7eab

; ----------------------------------------------------------------------
; DATOS sprites_2A: los 0 grupos de sprites de la pantalla 0x2A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7eac..0x7ead  (1 bytes)
DATA_sprites_2A:
	defb 0ffh	; 7eac

; ----------------------------------------------------------------------
; DATOS ordenes_2B_7EAD: las ordenes de pieza de la pantalla 0x2B (que no esta
;   en ninguna lista de fase) (p03:BBA2: forma corta con el bit 7, larga sin
;   el, 0xFE + puntero, 0xFF acaba); lo leen p03:BBA2 (1 bytes)
;   0x7ead..0x7eae  (1 bytes)
DATA_ordenes_2B_7EAD:
	defb 0ffh	; 7ead

; ----------------------------------------------------------------------
; DATOS objetos_2B: los 0 objetos de la pantalla 0x2B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x7eae..0x7eaf  (1 bytes)
DATA_objetos_2B:
	defb 0ffh	; 7eae

; ----------------------------------------------------------------------
; DATOS sprites_2B: los 0 grupos de sprites de la pantalla 0x2B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7eaf..0x7eb0  (1 bytes)
DATA_sprites_2B:
	defb 0ffh	; 7eaf

; ----------------------------------------------------------------------
; DATOS ordenes_2C_7EB0: las ordenes de pieza de la pantalla 0x2C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (82 bytes)
;   0x7eb0..0x7f02  (82 bytes)
DATA_ordenes_2C_7EB0:
	defb 0feh,076h,07dh,000h,001h,004h,01eh,0a0h,064h,081h,004h,079h,064h,082h,005h,079h	; 7eb0  .v}.....d..yd..y
	defb 064h,081h,007h,079h,064h,082h,008h,079h,064h,090h,005h,0c5h,064h,090h,011h,0c5h	; 7ec0  d..yd..yd...d...
	defb 064h,081h,019h,06dh,064h,091h,019h,06dh,064h,083h,01ah,06dh,064h,08eh,01ah,06dh	; 7ed0  d..md..md..md..m
	defb 064h,085h,01bh,06dh,064h,090h,01bh,06dh,064h,003h,01ch,00fh,003h,06dh,064h,002h	; 7ee0  d..md..md....md.
	defb 01dh,012h,002h,06dh,064h,010h,001h,001h,01eh,08eh,066h,000h,017h,017h,001h,08eh	; 7ef0  ...md.....f.....
	defb 066h,0ffh	; 7f00

; ----------------------------------------------------------------------
; DATOS objetos_2C: los 7 objetos de la pantalla 0x2C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (29 bytes)
;   0x7f02..0x7f1f  (29 bytes)
DATA_objetos_2C:
	defb 016h,000h,000h,00eh	; 7f02
	defb 016h,000h,000h,012h	; 7f06
	defb 016h,000h,013h,003h	; 7f0a
	defb 018h,000h,007h,017h	; 7f0e
	defb 00bh,000h,00eh,00fh	; 7f12
	defb 00bh,000h,00eh,012h	; 7f16
	defb 00bh,000h,00eh,015h	; 7f1a
	defb 0ffh	; 7f1e

; ----------------------------------------------------------------------
; DATOS sprites_2C: los 0 grupos de sprites de la pantalla 0x2C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7f1f..0x7f20  (1 bytes)
DATA_sprites_2C:
	defb 0ffh	; 7f1f

; ----------------------------------------------------------------------
; DATOS pieza_7F20: una pieza de 4 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 12 13 18 19 1A 1B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (15 bytes)
;   0x7f20..0x7f2f  (15 bytes)
DATA_pieza_7F20:
	defb 000h,004h,003h	; 7f20
	defb 00ch,000h,000h	; 7f23
	defb 005h,006h,007h	; 7f26
	defb 009h,00ah,00bh	; 7f29
	defb 00dh,00eh,00fh	; 7f2c

; ----------------------------------------------------------------------
; DATOS sin_lector_7F2F: 209 bytes sin formato de pieza, lista ni orden (137 a
;   0x00 o 0xFF y 104 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (209 bytes)
;   0x7f2f..0x8000  (209 bytes)
DATA_sin_lector_7F2F:
	defb 0ffh,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7f2f  ................
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,000h	; 7f3f  ................
	defb 0ffh,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh	; 7f4f  ................
	defb 010h,000h,0ffh,010h,0ffh,010h,0ffh,010h,0ffh,010h,0ffh,010h,0ffh,010h,0ffh,010h	; 7f5f  ................
	defb 0ffh,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7f6f  ................
	defb 010h,000h,0efh,000h,06fh,000h,0ffh,000h,06fh,000h,06fh,000h,06fh,000h,07fh,000h	; 7f7f  ....o...o.o.o...
	defb 02fh,0efh,000h,06fh,000h,06fh,000h,07fh,000h,0efh,000h,0ffh,000h,07fh,000h,06fh	; 7f8f  /..o.o.........o
	defb 000h,000h,0efh,000h,0efh,000h,07fh,000h,02fh,000h,0ffh,000h,0efh,000h,0ffh,000h	; 7f9f  ......../.......
	defb 06fh,0ffh,000h,0efh,000h,06fh,000h,07fh,000h,0ffh,000h,06fh,000h,0efh,000h,0efh	; 7faf  o....o.....o....
	defb 000h,000h,0efh,000h,06fh,000h,06fh,000h,0ffh,000h,07fh,000h,0afh,000h,07fh,000h	; 7fbf  ....o.o.........
	defb 06fh,0ffh,000h,0efh,000h,0efh,000h,0efh,000h,0afh,000h,06fh,000h,07fh,000h,0efh	; 7fcf  o..........o....
	defb 000h,000h,06fh,000h,0efh,000h,0efh,000h,06fh,000h,0efh,000h,0efh,000h,0efh,000h	; 7fdf  ..o.....o.......
	defb 0ffh,0ffh,000h,0fbh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0efh,000h,0efh,000h,0efh	; 7fef  ................
	defb 000h	; 7fff
