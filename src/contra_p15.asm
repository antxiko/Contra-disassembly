; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 15 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS listas_de_fase: 20 punteros, uno por fase, a la lista de pantallas de
;   cada fase (p03:BB82: 0x6000 + 2 x 0xE020); en este banco valen los de las
;   fases 1, 4, 11, 14, 16, 17, 18, 19 (p03:BAE4); lo leen p03:BB8B (40 bytes)
;   0x6000..0x6028  (40 bytes)
DATA_listas_de_fase:
	defw 060e5h,06080h,06087h,06087h,06087h,06090h,06090h,06090h	; 6000
	defw 06090h,06090h,06090h,06099h,060a5h,060a7h,060b0h,060c0h	; 6010
	defw 060c0h,060cbh,060d3h,060dch	; 6020  -> DATA_lista_fase_16 DATA_lista_fase_17 DATA_lista_fase_18 DATA_lista_fase_19

; ----------------------------------------------------------------------
; DATOS sin_lector_6028: 88 bytes sin formato de pieza, lista ni orden (81 a
;   0x00 o 0xFF y 43 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (88 bytes)
;   0x6028..0x6080  (88 bytes)
DATA_sin_lector_6028:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,028h,0ffh,000h,0ffh,000h	; 6028  ...........(....
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,05eh,067h,000h,0ffh,000h,0ffh,010h,0ffh	; 6038  ........^g......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,028h,0ffh,000h,0ffh,000h	; 6048  ...........(....
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6058  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,008h,0ffh,000h,0ffh,000h	; 6068  ................
	defb 0ffh,000h,0ffh,001h,0ffh,000h,0ffh,000h	; 6078  ........

; ----------------------------------------------------------------------
; DATOS lista_fase_01: la lista de pantallas de la fase 1: 4B 4C 4D 4E 4F 50 y
;   el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el final); lo
;   leen p03:BB92 (7 bytes)
;   0x6080..0x6087  (7 bytes)
DATA_lista_fase_01:
	defb 04bh,04ch,04dh,04eh,04fh,050h,000h	; 6080

; ----------------------------------------------------------------------
; DATOS lista_fase_04: la lista de pantallas de la fase 4: 51 52 53 54 55 56
;   57 58 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x6087..0x6090  (9 bytes)
DATA_lista_fase_04:
	defb 051h,052h,053h,054h,055h,056h,057h,058h,000h	; 6087  QRSTUVWX.

; ----------------------------------------------------------------------
; DATOS lista_ajena_6090: una lista de pantallas (38 37 36 35 34 33 32 31 y el
;   0 que la acaba) a la que apunta, en este banco, la fase 5, 6, 7, 8, 9, 10,
;   que se juega con otro (p03:BAE4): no la lee nadie; lo leen nadie (9 bytes)
;   0x6090..0x6099  (9 bytes)
DATA_lista_ajena_6090:
	defb 038h,037h,036h,035h,034h,033h,032h,031h,000h	; 6090  87654321.

; ----------------------------------------------------------------------
; DATOS lista_fase_11: la lista de pantallas de la fase 11: 59 5A 5B 5C 5D 5E
;   5F 60 61 62 63 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5
;   mira el final); lo leen p03:BB92 (12 bytes)
;   0x6099..0x60a5  (12 bytes)
DATA_lista_fase_11:
	defb 059h,05ah,05bh,05ch,05dh,05eh,05fh,060h,061h,062h,063h,000h	; 6099  YZ[\]^_`abc.

; ----------------------------------------------------------------------
; DATOS lista_ajena_60A5: una lista de pantallas (31 y el 0 que la acaba) a la
;   que apunta, en este banco, la fase 12, que se juega con otro (p03:BAE4):
;   no la lee nadie; lo leen nadie (2 bytes)
;   0x60a5..0x60a7  (2 bytes)
DATA_lista_ajena_60A5:
	defb 031h,000h	; 60a5

; ----------------------------------------------------------------------
; DATOS lista_ajena_60A7: una lista de pantallas (40 3F 3E 3D 3C 3B 3A 39 y el
;   0 que la acaba) a la que apunta, en este banco, la fase 13, que se juega
;   con otro (p03:BAE4): no la lee nadie; lo leen nadie (9 bytes)
;   0x60a7..0x60b0  (9 bytes)
DATA_lista_ajena_60A7:
	defb 040h,03fh,03eh,03dh,03ch,03bh,03ah,039h,000h	; 60a7  @?>=<.:9.

; ----------------------------------------------------------------------
; DATOS lista_fase_14: la lista de pantallas de la fase 14: 64 65 66 67 68 69
;   6A 6B 6C 6D 6E 6F 70 71 72 y el 0 que la acaba (p03:BB8F lee la del tramo;
;   p03:B5B5 mira el final); lo leen p03:BB92 (16 bytes)
;   0x60b0..0x60c0  (16 bytes)
DATA_lista_fase_14:
	defb 064h,065h,066h,067h,068h,069h,06ah,06bh,06ch,06dh,06eh,06fh,070h,071h,072h,000h	; 60b0  defghijklmnopqr.

; ----------------------------------------------------------------------
; DATOS lista_fase_16: la lista de pantallas de la fase 16: 4A 49 48 47 46 45
;   44 43 42 41 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira
;   el final); lo leen p03:BB92 (11 bytes)
;   0x60c0..0x60cb  (11 bytes)
DATA_lista_fase_16:
	defb 04ah,049h,048h,047h,046h,045h,044h,043h,042h,041h,000h	; 60c0  JIHGFEDCBA.

; ----------------------------------------------------------------------
; DATOS lista_fase_17: la lista de pantallas de la fase 17: 79 78 77 76 75 74
;   73 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (8 bytes)
;   0x60cb..0x60d3  (8 bytes)
DATA_lista_fase_17:
	defb 079h,078h,077h,076h,075h,074h,073h,000h	; 60cb  yxwvuts.

; ----------------------------------------------------------------------
; DATOS lista_fase_18: la lista de pantallas de la fase 18: 7A 7B 7C 7D 7E 7F
;   80 81 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x60d3..0x60dc  (9 bytes)
DATA_lista_fase_18:
	defb 07ah,07bh,07ch,07dh,07eh,07fh,080h,081h,000h	; 60d3  z{|}~....

; ----------------------------------------------------------------------
; DATOS lista_fase_19: la lista de pantallas de la fase 19: 82 83 84 85 86 87
;   88 89 y el 0 que la acaba (p03:BB8F lee la del tramo; p03:B5B5 mira el
;   final); lo leen p03:BB92 (9 bytes)
;   0x60dc..0x60e5  (9 bytes)
DATA_lista_fase_19:
	defb 082h,083h,084h,085h,086h,087h,088h,089h,000h	; 60dc  .........

; ----------------------------------------------------------------------
; DATOS lista_ajena_60E5: una lista de pantallas (01 01 02 03 04 05 06 07 09
;   0A y el 0 que la acaba) a la que apunta, en este banco, la fase 0, que se
;   juega con otro (p03:BAE4): no la lee nadie; lo leen nadie (11 bytes)
;   0x60e5..0x60f0  (11 bytes)
DATA_lista_ajena_60E5:
	defb 001h,001h,002h,003h,004h,005h,006h,007h,009h,00ah,000h	; 60e5  ...........

; ----------------------------------------------------------------------
; DATOS sin_lector_60F0: 146 bytes sin formato de pieza, lista ni orden (138 a
;   0x00 o 0xFF y 4 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (146 bytes)
;   0x60f0..0x6182  (146 bytes)
DATA_sin_lector_60F0:
	defb 00bh,00ch,00dh,00eh,00fh,000h,000h,000h,000h,000h,06fh,000h,0efh,000h,0bfh,000h	; 60f0  ..........o.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6100  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6110  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6120  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6130  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6140  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6150  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6160  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6170  ................
	defb 000h,000h	; 6180

; ----------------------------------------------------------------------
; DATOS pantallas_15: los punteros a las ordenes de las pantallas 0x41-0x89
;   (p03:BB95: 0x6100 + 2 x pantalla); lo leen p03:BB9F (146 bytes)
;   0x6182..0x6214  (146 bytes)
DATA_pantallas_15:
	defw 067edh,0688ah,0690fh,0698ch,06a0fh,06a80h,06af7h,06b92h	; 6182
	defw 06c0bh,06c82h,0783ah,07876h,07892h,078bch,078dch,07906h	; 6192
	defw 0792eh,07941h,07965h,0798fh,079b7h,079d7h,07a09h,07a33h	; 61a2
	defw 07a51h,07a64h,07a96h,07ab0h,07ad0h,07af2h,07b12h,07b44h	; 61b2
	defw 07b5ch,07b84h,07bb0h,07bd8h,07bfdh,07c25h,07c4dh,07c6fh	; 61c2
	defw 07c97h,07cb9h,07ce3h,07d13h,07d3dh,07d65h,07d87h,07db7h	; 61d2
	defw 07de3h,07e1fh,06d2bh,06d80h,06dc1h,06e7ah,06f03h,06f79h	; 61e2
	defw 06f9fh,06fd6h,0707ch,07162h,07256h,0733ch,073e2h,07488h	; 61f2
	defw 07553h,075c1h,075d5h,075f5h,0763bh,0769bh,0770dh,07769h	; 6202
	defw 07795h	; 6212  -> DATA_ordenes_89_7795

; ----------------------------------------------------------------------
; DATOS pantallas_15_a_cero: 6 punteros a 0 detras de los de la pantalla 0x89:
;   la tabla de p03:BB95 sigue, pero en este banco no hay mas pantallas; lo
;   leen p03:BB9F (12 bytes)
;   0x6214..0x6220  (12 bytes)
DATA_pantallas_15_a_cero:
	defw 00000h,00000h,00000h,00000h,00000h,00000h	; 6214

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6220: 6 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (60 bytes)
;   0x6220..0x625c  (60 bytes)
DATA_piezas_sueltas_6220:
	defb 000h,001h,004h,008h,009h,00ah,00bh,000h,001h,001h,004h,000h,001h,004h,00ch,00dh	; 6220  ................
	defb 00eh,00fh,000h,004h,004h,050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah	; 6230  .....PQRSTUVWXYZ
	defb 05bh,05ch,05dh,05eh,000h,000h,004h,004h,0f0h,0f1h,0f2h,0f3h,0f4h,0f5h,0f6h,0f7h	; 6240  [\]^............
	defb 0f8h,0f9h,0fah,0fbh,0fch,0fdh,0feh,000h,001h,001h,001h,0ffh	; 6250  ............

; ----------------------------------------------------------------------
; DATOS pieza_625C: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 43 44 45 46 47 48 49
;   4A (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x625c..0x6260  (4 bytes)
DATA_pieza_625C:
	defb 000h,001h,001h	; 625c
	defb 001h	; 625f

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6260: 6 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (74 bytes)
;   0x6260..0x62aa  (74 bytes)
DATA_piezas_sueltas_6260:
	defb 000h,003h,002h,0dbh,0dbh,043h,04bh,047h,04fh,040h,001h,001h,04eh,040h,004h,001h	; 6260  .....CKGO@..N@..
	defb 0c1h,0c5h,0c9h,0cdh,000h,003h,001h,027h,02bh,02fh,040h,007h,003h,0c2h,0c3h,0f3h	; 6270  .......'+/@.....
	defb 0c6h,000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h	; 6280  ................
	defb 000h,0f7h,040h,007h,003h,0f2h,0cah,0cbh,0fbh,000h,0cfh,0fbh,000h,000h,0fbh,000h	; 6290  ..@.............
	defb 000h,0fbh,000h,000h,0fbh,000h,000h,0fbh,000h,000h	; 62a0  ..........

; ----------------------------------------------------------------------
; DATOS pieza_62AA: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4D 4E 4F 50 53 54 55 56 57
;   5A (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x62aa..0x62b1  (7 bytes)
DATA_pieza_62AA:
	defb 040h,002h,002h	; 62aa
	defb 0e0h,0e1h,0e4h	; 62ad
	defb 0e5h	; 62b0

; ----------------------------------------------------------------------
; DATOS pieza_62B1: una pieza de 2 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B 4C 4D 4F 51 52 53 56 57
;   59 (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x62b1..0x62bc  (11 bytes)
DATA_pieza_62B1:
	defb 000h,002h,004h	; 62b1
	defb 0f8h,0f9h,0f2h	; 62b4
	defb 0f3h,0fch,0fdh	; 62b7
	defb 0f6h,0f7h	; 62ba

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_62BC: 8 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (87 bytes)
;   0x62bc..0x6313  (87 bytes)
DATA_piezas_sueltas_62BC:
	defb 000h,004h,002h,010h,011h,014h,015h,018h,019h,01ch,01dh,000h,004h,002h,0c2h,0c3h	; 62bc  ................
	defb 0c6h,0c7h,0cah,0cbh,0ceh,0cfh,000h,002h,002h,0c4h,0c5h,0c8h,0c9h,000h,004h,002h	; 62cc  ................
	defb 0cch,0cdh,0cch,0cdh,0ceh,0cfh,0cch,0cdh,000h,004h,004h,082h,082h,082h,082h,08dh	; 62dc  ................
	defb 08dh,08dh,08dh,07ch,061h,061h,061h,0c0h,0c1h,0c0h,0c1h,000h,004h,002h,08ah,000h	; 62ec  ...|aaa.........
	defb 08dh,08eh,061h,0f2h,0c0h,0f6h,000h,004h,002h,0f0h,0f1h,0f4h,0f5h,0f8h,0f9h,0fch	; 62fc  ..a.............
	defb 0fdh,000h,001h,003h,0adh,0aeh,0afh	; 630c

; ----------------------------------------------------------------------
; DATOS pieza_6313: una pieza de 3 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 83 84 85 86 87
;   (p03:BC2F/BBEE); lo leen p03:BC5C (12 bytes)
;   0x6313..0x631f  (12 bytes)
DATA_pieza_6313:
	defb 000h,003h,003h	; 6313
	defb 005h,006h,007h	; 6316
	defb 009h,00ah,00bh	; 6319
	defb 00dh,00eh,00fh	; 631c

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_631F: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (17 bytes)
;   0x631f..0x6330  (17 bytes)
DATA_piezas_sueltas_631F:
	defb 000h,007h,002h,040h,041h,044h,045h,048h,049h,04ch,049h,042h,043h,046h,047h,04ah	; 631f  ...@ADEHILIBCFGJ
	defb 04bh	; 632f

; ----------------------------------------------------------------------
; DATOS pieza_6330: una pieza de 4 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 82 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (15 bytes)
;   0x6330..0x633f  (15 bytes)
DATA_pieza_6330:
	defb 000h,004h,003h	; 6330
	defb 050h,051h,052h	; 6333
	defb 054h,055h,056h	; 6336
	defb 058h,059h,05ah	; 6339
	defb 05ch,05dh,05eh	; 633c

; ----------------------------------------------------------------------
; DATOS pieza_633F: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 84 85 86 87
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x633f..0x6346  (7 bytes)
DATA_pieza_633F:
	defb 000h,002h,002h	; 633f
	defb 053h,05bh,057h	; 6342
	defb 05fh	; 6345

; ----------------------------------------------------------------------
; DATOS pieza_6346: una pieza de 4 x 3 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 82 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (15 bytes)
;   0x6346..0x6355  (15 bytes)
DATA_pieza_6346:
	defb 000h,004h,003h	; 6346
	defb 054h,055h,056h	; 6349
	defb 058h,059h,05ah	; 634c
	defb 05ch,05dh,05eh	; 634f
	defb 04dh,04eh,04fh	; 6352

; ----------------------------------------------------------------------
; DATOS pieza_6355: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia con el color 0 transparente; la usan las pantallas 82
;   (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x6355..0x6360  (11 bytes)
DATA_pieza_6355:
	defb 001h,004h,002h	; 6355
	defb 060h,061h,064h	; 6358
	defb 065h,068h,069h	; 635b
	defb 06ch,06dh	; 635e

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6360: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (11 bytes)
;   0x6360..0x636b  (11 bytes)
DATA_piezas_sueltas_6360:
	defb 001h,004h,002h,062h,063h,066h,067h,06ah,06bh,06eh,06fh	; 6360  ...bcfgjkno

; ----------------------------------------------------------------------
; DATOS pieza_636B: una pieza de 4 x 8 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 84 85 86 87
;   (p03:BC2F/BBEE); lo leen p03:BC5C (35 bytes)
;   0x636b..0x638e  (35 bytes)
DATA_pieza_636B:
	defb 000h,004h,008h	; 636b
	defb 0c0h,0c1h,0c2h	; 636e
	defb 0c3h,0d0h,0d1h	; 6371
	defb 0d2h,0d3h,0c4h	; 6374
	defb 0c5h,0c6h,0c7h	; 6377
	defb 0d4h,0d5h,0d6h	; 637a
	defb 0d7h,0c8h,0c9h	; 637d
	defb 0cah,0cbh,0d8h	; 6380
	defb 0d9h,0dah,0dbh	; 6383
	defb 0cch,0cdh,0ceh	; 6386
	defb 0cfh,0dch,0ddh	; 6389
	defb 0deh,0dfh	; 638c

; ----------------------------------------------------------------------
; DATOS pieza_638E: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 44 45 46 47 48 49 4A
;   73 (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x638e..0x63a1  (19 bytes)
DATA_pieza_638E:
	defb 000h,004h,004h	; 638e
	defb 010h,011h,012h	; 6391
	defb 013h,014h,015h	; 6394
	defb 016h,017h,018h	; 6397
	defb 019h,01ah,01bh	; 639a
	defb 01ch,01dh,01eh	; 639d
	defb 01fh	; 63a0

; ----------------------------------------------------------------------
; DATOS pieza_63A1: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 47 48 49 4A 73 75 7A
;   7B (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x63a1..0x63ac  (11 bytes)
DATA_pieza_63A1:
	defb 000h,004h,002h	; 63a1
	defb 028h,029h,02ch	; 63a4
	defb 02dh,020h,021h	; 63a7
	defb 024h,025h	; 63aa

; ----------------------------------------------------------------------
; DATOS pieza_63AC: una pieza de 4 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 44 45 46 47 48 49 4A
;   75 (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x63ac..0x63b7  (11 bytes)
DATA_pieza_63AC:
	defb 000h,004h,002h	; 63ac
	defb 02ah,02bh,02eh	; 63af
	defb 02fh,022h,023h	; 63b2
	defb 026h,027h	; 63b5

; ----------------------------------------------------------------------
; DATOS pieza_63B7: una pieza de 4 x 7 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 43 44 45 46 47 48 49
;   4A (p03:BC2F/BBEE); lo leen p03:BC5C (31 bytes)
;   0x63b7..0x63d6  (31 bytes)
DATA_pieza_63B7:
	defb 000h,004h,007h	; 63b7
	defb 030h,031h,032h	; 63ba
	defb 033h,040h,041h	; 63bd
	defb 042h,034h,035h	; 63c0
	defb 036h,037h,044h	; 63c3
	defb 045h,046h,038h	; 63c6
	defb 039h,03ah,03bh	; 63c9
	defb 048h,049h,04ah	; 63cc
	defb 000h,03dh,03eh	; 63cf
	defb 03fh,04ch,000h	; 63d2
	defb 000h	; 63d5

; ----------------------------------------------------------------------
; DATOS pieza_63D6: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 42 43 45 47 7C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x63d6..0x63e9  (19 bytes)
DATA_pieza_63D6:
	defb 000h,004h,004h	; 63d6
	defb 010h,011h,012h	; 63d9
	defb 013h,014h,015h	; 63dc
	defb 016h,017h,018h	; 63df
	defb 019h,09ah,09bh	; 63e2
	defb 01ch,01dh,09eh	; 63e5
	defb 09fh	; 63e8

; ----------------------------------------------------------------------
; DATOS pieza_63E9: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 47 4A 76 77 7C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x63e9..0x63fc  (19 bytes)
DATA_pieza_63E9:
	defb 000h,004h,004h	; 63e9
	defb 098h,099h,012h	; 63ec
	defb 013h,09ch,09dh	; 63ef
	defb 016h,017h,018h	; 63f2
	defb 019h,01ah,01dh	; 63f5
	defb 01ch,01dh,01eh	; 63f8
	defb 01fh	; 63fb

; ----------------------------------------------------------------------
; DATOS pieza_63FC: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 42 43 45 47 7C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x63fc..0x6403  (7 bytes)
DATA_pieza_63FC:
	defb 000h,002h,002h	; 63fc
	defb 02ah,02bh,02eh	; 63ff
	defb 02fh	; 6402

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6403: 6 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (78 bytes)
;   0x6403..0x6451  (78 bytes)
DATA_piezas_sueltas_6403:
	defb 000h,002h,002h,028h,029h,02ch,02dh,000h,002h,002h,060h,061h,064h,065h,000h,004h	; 6403  ...(),-...`ade..
	defb 001h,063h,067h,06bh,06fh,000h,004h,001h,062h,066h,06ah,06eh,000h,003h,003h,070h	; 6413  .cgko...bfjn...p
	defb 071h,072h,074h,075h,076h,078h,079h,07ah,000h,005h,007h,070h,071h,071h,071h,071h	; 6423  qrtuvxyz...pqqqq
	defb 071h,072h,074h,075h,075h,075h,075h,075h,076h,074h,075h,075h,075h,075h,075h,076h	; 6433  qrtuuuuuvtuuuuuv
	defb 074h,075h,075h,075h,075h,075h,076h,078h,079h,079h,079h,079h,079h,07ah	; 6443  tuuuuuvxyyyyyz

; ----------------------------------------------------------------------
; DATOS pieza_6451: una pieza de 7 x 8 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7D 7E 7F
;   (p03:BC2F/BBEE); lo leen p03:BC5C (59 bytes)
;   0x6451..0x648c  (59 bytes)
DATA_pieza_6451:
	defb 000h,007h,008h	; 6451
	defb 053h,05bh,000h	; 6454
	defb 000h,000h,000h	; 6457
	defb 057h,053h,000h	; 645a
	defb 000h,056h,000h	; 645d
	defb 000h,05ah,000h	; 6460
	defb 000h,000h,000h	; 6463
	defb 000h,05bh,057h	; 6466
	defb 000h,000h,000h	; 6469
	defb 000h,000h,000h	; 646c
	defb 057h,05bh,000h	; 646f
	defb 000h,000h,000h	; 6472
	defb 000h,05ah,000h	; 6475
	defb 000h,056h,000h	; 6478
	defb 000h,000h,057h	; 647b
	defb 000h,000h,000h	; 647e
	defb 000h,05bh,000h	; 6481
	defb 051h,000h,000h	; 6484
	defb 000h,000h,000h	; 6487
	defb 000h,051h	; 648a

; ----------------------------------------------------------------------
; DATOS pieza_648C: una pieza de 6 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 80 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (9 bytes)
;   0x648c..0x6495  (9 bytes)
DATA_pieza_648C:
	defb 000h,006h,001h	; 648c
	defb 05dh,05dh,052h	; 648f
	defb 05dh,05dh,05dh	; 6492

; ----------------------------------------------------------------------
; DATOS pieza_6495: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 43 44 45 46 47 48 49
;   4A (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x6495..0x64a8  (19 bytes)
DATA_pieza_6495:
	defb 000h,004h,004h	; 6495
	defb 080h,081h,082h	; 6498
	defb 083h,084h,085h	; 649b
	defb 086h,087h,088h	; 649e
	defb 089h,08ah,08bh	; 64a1
	defb 08ch,08dh,08eh	; 64a4
	defb 08fh	; 64a7

; ----------------------------------------------------------------------
; DATOS pieza_64A8: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 80 81 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (7 bytes)
;   0x64a8..0x64af  (7 bytes)
DATA_pieza_64A8:
	defb 000h,002h,002h	; 64a8
	defb 090h,091h,094h	; 64ab
	defb 095h	; 64ae

; ----------------------------------------------------------------------
; DATOS pieza_64AF: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7B 7C 7D 7E 7F 80 81
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x64af..0x64b6  (7 bytes)
DATA_pieza_64AF:
	defb 000h,002h,002h	; 64af
	defb 096h,097h,092h	; 64b2
	defb 093h	; 64b5

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_64B6: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (7 bytes)
;   0x64b6..0x64bd  (7 bytes)
DATA_piezas_sueltas_64B6:
	defb 000h,002h,002h,096h,097h,092h,093h	; 64b6

; ----------------------------------------------------------------------
; DATOS pieza_64BD: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7B 7C 7D 7E 7F 80 81
;   (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x64bd..0x64c2  (5 bytes)
DATA_pieza_64BD:
	defb 000h,002h,001h	; 64bd
	defb 055h,003h	; 64c0

; ----------------------------------------------------------------------
; DATOS pieza_64C2: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7B 7D 7E 7F 80
;   (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x64c2..0x64c7  (5 bytes)
DATA_pieza_64C2:
	defb 000h,002h,001h	; 64c2
	defb 054h,058h	; 64c5

; ----------------------------------------------------------------------
; DATOS pieza_64C7: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7B 7D 7E 7F 80
;   (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x64c7..0x64cc  (5 bytes)
DATA_pieza_64C7:
	defb 000h,002h,001h	; 64c7
	defb 05ch,003h	; 64ca

; ----------------------------------------------------------------------
; DATOS pieza_64CC: una pieza de 3 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 7A 7B 7C 7D 7E 7F 80
;   (p03:BC2F/BBEE); lo leen p03:BC5C (6 bytes)
;   0x64cc..0x64d2  (6 bytes)
DATA_pieza_64CC:
	defb 000h,003h,001h	; 64cc
	defb 051h,000h,053h	; 64cf

; ----------------------------------------------------------------------
; DATOS pieza_64D2: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 43 44 48 4A 76 7D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x64d2..0x64e5  (19 bytes)
DATA_pieza_64D2:
	defb 000h,004h,004h	; 64d2
	defb 010h,011h,0b2h	; 64d5
	defb 0b3h,014h,015h	; 64d8
	defb 0b6h,0b7h,018h	; 64db
	defb 019h,01ah,01bh	; 64de
	defb 01ch,01dh,01eh	; 64e1
	defb 01fh	; 64e4

; ----------------------------------------------------------------------
; DATOS pieza_64E5: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 43 44 48 75 76 7D
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x64e5..0x64ec  (7 bytes)
DATA_pieza_64E5:
	defb 000h,002h,002h	; 64e5
	defb 022h,023h,026h	; 64e8
	defb 027h	; 64eb

; ----------------------------------------------------------------------
; DATOS pieza_64EC: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 42 43 73 7B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x64ec..0x64ff  (19 bytes)
DATA_pieza_64EC:
	defb 000h,004h,004h	; 64ec
	defb 010h,011h,012h	; 64ef
	defb 013h,014h,015h	; 64f2
	defb 016h,017h,0b0h	; 64f5
	defb 0b1h,01ah,01bh	; 64f8
	defb 0b4h,0b5h,01eh	; 64fb
	defb 01fh	; 64fe

; ----------------------------------------------------------------------
; DATOS pieza_64FF: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 42 43 73 7B
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x64ff..0x6506  (7 bytes)
DATA_pieza_64FF:
	defb 000h,002h,002h	; 64ff
	defb 028h,029h,02ch	; 6502
	defb 02dh	; 6505

; ----------------------------------------------------------------------
; DATOS pieza_6506: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 47 4A 75 76 77 7C
;   (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x6506..0x650d  (7 bytes)
DATA_pieza_6506:
	defb 000h,002h,002h	; 6506
	defb 020h,021h,024h	; 6509
	defb 025h	; 650c

; ----------------------------------------------------------------------
; DATOS pieza_650D: una pieza de 3 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 73 74 75 76 77 78
;   (p03:BC2F/BBEE); lo leen p03:BC5C (9 bytes)
;   0x650d..0x6516  (9 bytes)
DATA_pieza_650D:
	defb 000h,003h,002h	; 650d
	defb 04eh,04fh,068h	; 6510
	defb 069h,06ch,06dh	; 6513

; ----------------------------------------------------------------------
; DATOS pieza_6516: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 75 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x6516..0x651d  (7 bytes)
DATA_pieza_6516:
	defb 000h,002h,002h	; 6516
	defb 04eh,05fh,06ch	; 6519
	defb 06dh	; 651c

; ----------------------------------------------------------------------
; DATOS pieza_651D: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 75 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x651d..0x6524  (7 bytes)
DATA_pieza_651D:
	defb 000h,002h,002h	; 651d
	defb 05eh,04fh,06ch	; 6520
	defb 06dh	; 6523

; ----------------------------------------------------------------------
; DATOS pieza_6524: una pieza de 2 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4A 73 74 75 76 77 78
;   (p03:BC2F/BBEE); lo leen p03:BC5C (11 bytes)
;   0x6524..0x652f  (11 bytes)
DATA_pieza_6524:
	defb 000h,002h,004h	; 6524
	defb 0b8h,0b9h,0bah	; 6527
	defb 0bbh,0bch,0bdh	; 652a
	defb 0beh,0bfh	; 652d

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_652F: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (10 bytes)
;   0x652f..0x6539  (10 bytes)
DATA_piezas_sueltas_652F:
	defb 000h,007h,001h,053h,05dh,052h,05dh,05dh,05dh,051h	; 652f  ...S]R]]]Q

; ----------------------------------------------------------------------
; DATOS pieza_6539: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 84 85 86 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (5 bytes)
;   0x6539..0x653e  (5 bytes)
DATA_pieza_6539:
	defb 040h,002h,001h	; 6539
	defb 09ch,09dh	; 653c

; ----------------------------------------------------------------------
; DATOS pieza_653E: una pieza de 2 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 85 86 87 (p03:BC2F/BBEE);
;   lo leen p03:BC5C (5 bytes)
;   0x653e..0x6543  (5 bytes)
DATA_pieza_653E:
	defb 040h,002h,001h	; 653e
	defb 09eh,09fh	; 6541

; ----------------------------------------------------------------------
; DATOS pieza_6543: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 41 42 43 44 45 46 47 48 49
;   4A (p03:BC2F/BBEE); lo leen p03:BC5C (4 bytes)
;   0x6543..0x6547  (4 bytes)
DATA_pieza_6543:
	defb 000h,001h,001h	; 6543
	defb 002h	; 6546

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6547: 6 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (109 bytes)
;   0x6547..0x65b4  (109 bytes)
DATA_piezas_sueltas_6547:
	defb 000h,008h,008h,070h,071h,072h,073h,080h,081h,082h,083h,074h,075h,076h,077h,084h	; 6547  ...pqrs....tuvw.
	defb 085h,086h,087h,078h,079h,07ah,07bh,088h,089h,08ah,08bh,07ch,07dh,07eh,07fh,08ch	; 6557  ...xyz{....|}~..
	defb 08dh,08eh,08fh,090h,091h,092h,093h,0a0h,0a1h,0a2h,000h,094h,095h,096h,097h,0a4h	; 6567  ................
	defb 0a5h,000h,000h,000h,099h,09ah,09bh,0a8h,000h,000h,000h,000h,09dh,09eh,09fh,0ach	; 6577  ................
	defb 000h,000h,000h,040h,004h,003h,0a0h,0a1h,0a2h,0a4h,0a5h,0a6h,0a8h,0a9h,0aah,0ach	; 6587  ...@............
	defb 0adh,0aeh,040h,004h,003h,0a3h,0b0h,0b1h,0a7h,0b4h,0b5h,0abh,0b8h,0b9h,0afh,0bch	; 6597  ..@.............
	defb 0bdh,040h,001h,001h,0d0h,040h,001h,001h,0d5h,040h,001h,001h,0d1h	; 65a7  .@...@...@...

; ----------------------------------------------------------------------
; DATOS pieza_65B4: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65b4..0x65b8  (4 bytes)
DATA_pieza_65B4:
	defb 040h,001h,001h	; 65b4
	defb 0d4h	; 65b7

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65B8: 2 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (8 bytes)
;   0x65b8..0x65c0  (8 bytes)
DATA_piezas_sueltas_65B8:
	defb 040h,001h,001h,0d2h,040h,001h,001h,0d7h	; 65b8  @...@...

; ----------------------------------------------------------------------
; DATOS pieza_65C0: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65c0..0x65c4  (4 bytes)
DATA_pieza_65C0:
	defb 040h,001h,001h	; 65c0
	defb 0d3h	; 65c3

; ----------------------------------------------------------------------
; DATOS pieza_65C4: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65c4..0x65c8  (4 bytes)
DATA_pieza_65C4:
	defb 040h,001h,001h	; 65c4
	defb 0d6h	; 65c7

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65C8: 4 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (16 bytes)
;   0x65c8..0x65d8  (16 bytes)
DATA_piezas_sueltas_65C8:
	defb 040h,001h,001h,093h,040h,001h,001h,097h,040h,001h,001h,0dah,040h,001h,001h,0deh	; 65c8  @...@...@...@...

; ----------------------------------------------------------------------
; DATOS pieza_65D8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65d8..0x65dc  (4 bytes)
DATA_pieza_65D8:
	defb 040h,001h,001h	; 65d8
	defb 0d8h	; 65db

; ----------------------------------------------------------------------
; DATOS pieza_65DC: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65dc..0x65e0  (4 bytes)
DATA_pieza_65DC:
	defb 040h,001h,001h	; 65dc
	defb 0d9h	; 65df

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65E0: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (4 bytes)
;   0x65e0..0x65e4  (4 bytes)
DATA_piezas_sueltas_65E0:
	defb 040h,001h,001h,0dch	; 65e0

; ----------------------------------------------------------------------
; DATOS pieza_65E4: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65e4..0x65e8  (4 bytes)
DATA_pieza_65E4:
	defb 040h,001h,001h	; 65e4
	defb 0ddh	; 65e7

; ----------------------------------------------------------------------
; DATOS pieza_65E8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65e8..0x65ec  (4 bytes)
DATA_pieza_65E8:
	defb 040h,001h,001h	; 65e8
	defb 0efh	; 65eb

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_65EC: 2 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (8 bytes)
;   0x65ec..0x65f4  (8 bytes)
DATA_piezas_sueltas_65EC:
	defb 040h,001h,001h,0e2h,040h,001h,001h,0e6h	; 65ec  @...@...

; ----------------------------------------------------------------------
; DATOS pieza_65F4: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65f4..0x65f8  (4 bytes)
DATA_pieza_65F4:
	defb 040h,001h,001h	; 65f4
	defb 0e3h	; 65f7

; ----------------------------------------------------------------------
; DATOS pieza_65F8: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65f8..0x65fc  (4 bytes)
DATA_pieza_65F8:
	defb 040h,001h,001h	; 65f8
	defb 0ebh	; 65fb

; ----------------------------------------------------------------------
; DATOS pieza_65FC: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x65fc..0x6600  (4 bytes)
DATA_pieza_65FC:
	defb 040h,001h,001h	; 65fc
	defb 0e7h	; 65ff

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_6600: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (4 bytes)
;   0x6600..0x6604  (4 bytes)
DATA_piezas_sueltas_6600:
	defb 040h,001h,001h,0dbh	; 6600

; ----------------------------------------------------------------------
; DATOS pieza_6604: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4D 4E 4F 50 52 53 54 55 56
;   57 (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x6604..0x660b  (7 bytes)
DATA_pieza_6604:
	defb 040h,002h,002h	; 6604
	defb 0f8h,0f9h,0fch	; 6607
	defb 0fdh	; 660a

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_660B: 1 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (4 bytes)
;   0x660b..0x660f  (4 bytes)
DATA_piezas_sueltas_660B:
	defb 040h,001h,001h,0f1h	; 660b

; ----------------------------------------------------------------------
; DATOS pieza_660F: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x660f..0x6616  (7 bytes)
DATA_pieza_660F:
	defb 040h,004h,001h	; 660f
	defb 073h,077h,07bh	; 6612
	defb 07fh	; 6615

; ----------------------------------------------------------------------
; DATOS pieza_6616: una pieza de 4 x 1 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x6616..0x661d  (7 bytes)
DATA_pieza_6616:
	defb 040h,004h,001h	; 6616
	defb 083h,087h,08bh	; 6619
	defb 08fh	; 661c

; ----------------------------------------------------------------------
; DATOS pieza_661D: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 50 58 63 72
;   (p03:BC2F/BBEE); lo leen p03:BC5C (19 bytes)
;   0x661d..0x6630  (19 bytes)
DATA_pieza_661D:
	defb 000h,004h,004h	; 661d
	defb 0a0h,0a1h,0a2h	; 6620
	defb 0a3h,0a4h,0a5h	; 6623
	defb 0a6h,0a7h,0a8h	; 6626
	defb 0a9h,0aah,0abh	; 6629
	defb 0ach,0adh,0aeh	; 662c
	defb 0afh	; 662f

; ----------------------------------------------------------------------
; DATOS pieza_6630: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x6630..0x6643  (19 bytes)
DATA_pieza_6630:
	defb 040h,004h,004h	; 6630
	defb 093h,0efh,0efh	; 6633
	defb 0efh,000h,093h	; 6636
	defb 0efh,0efh,000h	; 6639
	defb 000h,093h,0efh	; 663c
	defb 000h,000h,000h	; 663f
	defb 093h	; 6642

; ----------------------------------------------------------------------
; DATOS pieza_6643: una pieza de 4 x 4 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (19 bytes)
;   0x6643..0x6656  (19 bytes)
DATA_pieza_6643:
	defb 040h,004h,004h	; 6643
	defb 0efh,0efh,0efh	; 6646
	defb 0dah,0efh,0efh	; 6649
	defb 0dah,000h,0efh	; 664c
	defb 0dah,000h,000h	; 664f
	defb 0dah,000h,000h	; 6652
	defb 000h	; 6655

; ----------------------------------------------------------------------
; DATOS pieza_6656: una pieza de 5 x 5 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (28 bytes)
;   0x6656..0x6672  (28 bytes)
DATA_pieza_6656:
	defb 040h,005h,005h	; 6656
	defb 000h,000h,000h	; 6659
	defb 000h,097h,000h	; 665c
	defb 000h,000h,097h	; 665f
	defb 0d4h,000h,000h	; 6662
	defb 097h,0efh,0efh	; 6665
	defb 000h,097h,0d4h	; 6668
	defb 0d4h,0d4h,097h	; 666b
	defb 0efh,0efh,0efh	; 666e
	defb 0efh	; 6671

; ----------------------------------------------------------------------
; DATOS pieza_6672: una pieza de 5 x 5 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (28 bytes)
;   0x6672..0x668e  (28 bytes)
DATA_pieza_6672:
	defb 040h,005h,005h	; 6672
	defb 0deh,000h,000h	; 6675
	defb 000h,000h,0d4h	; 6678
	defb 0deh,000h,000h	; 667b
	defb 000h,0efh,0efh	; 667e
	defb 0deh,000h,000h	; 6681
	defb 0d4h,0d4h,0d4h	; 6684
	defb 0deh,000h,0efh	; 6687
	defb 0efh,0efh,0efh	; 668a
	defb 0deh	; 668d

; ----------------------------------------------------------------------
; DATOS pieza_668E: una pieza de 1 x 8 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x668e..0x6699  (11 bytes)
DATA_pieza_668E:
	defb 040h,001h,008h	; 668e
	defb 0dbh,0d0h,0dbh	; 6691
	defb 0dbh,0d0h,0dbh	; 6694
	defb 0d0h,0d2h	; 6697

; ----------------------------------------------------------------------
; DATOS pieza_6699: una pieza de 1 x 8 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (11 bytes)
;   0x6699..0x66a4  (11 bytes)
DATA_pieza_6699:
	defb 040h,001h,008h	; 6699
	defb 0d7h,0d5h,0dbh	; 669c
	defb 0d5h,0dbh,0dbh	; 669f
	defb 0d5h,0dbh	; 66a2

; ----------------------------------------------------------------------
; DATOS pieza_66A4: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x66a4..0x66ab  (7 bytes)
DATA_pieza_66A4:
	defb 000h,002h,002h	; 66a4
	defb 004h,005h,006h	; 66a7
	defb 007h	; 66aa

; ----------------------------------------------------------------------
; DATOS pieza_66AB: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x66ab..0x66b2  (7 bytes)
DATA_pieza_66AB:
	defb 000h,002h,002h	; 66ab
	defb 0f0h,077h,073h	; 66ae
	defb 0f5h	; 66b1

; ----------------------------------------------------------------------
; DATOS pieza_66B2: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x66b2..0x66b6  (4 bytes)
DATA_pieza_66B2:
	defb 000h,001h,001h	; 66b2
	defb 07ch	; 66b5

; ----------------------------------------------------------------------
; DATOS pieza_66B6: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (7 bytes)
;   0x66b6..0x66bd  (7 bytes)
DATA_pieza_66B6:
	defb 000h,002h,002h	; 66b6
	defb 07fh,0f1h,0f4h	; 66b9
	defb 07bh	; 66bc

; ----------------------------------------------------------------------
; DATOS pieza_66BD: una pieza de 1 x 2 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B 4C 4D 4F 51 52 53 56 57
;   59 (p03:BC2F/BBEE); lo leen p03:BC5C (5 bytes)
;   0x66bd..0x66c2  (5 bytes)
DATA_pieza_66BD:
	defb 000h,001h,002h	; 66bd
	defb 0fah,0fbh	; 66c0

; ----------------------------------------------------------------------
; DATOS pieza_66C2: una pieza de 2 x 2 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 4C 4D 4E 4F 52 53 54 55 56
;   57 (p03:BC2F/BBEE); lo leen p03:BC5C (7 bytes)
;   0x66c2..0x66c9  (7 bytes)
DATA_pieza_66C2:
	defb 040h,002h,002h	; 66c2
	defb 0e8h,0e9h,0ech	; 66c5
	defb 0edh	; 66c8

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_66C9: 4 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (24 bytes)
;   0x66c9..0x66e1  (24 bytes)
DATA_piezas_sueltas_66C9:
	defb 040h,001h,006h,04eh,0f1h,0f1h,0f1h,0f1h,04fh,040h,001h,004h,04eh,0f1h,0f1h,04fh	; 66c9  @..N....O@..N..O
	defb 000h,001h,001h,077h,000h,001h,001h,07fh	; 66d9  ...w....

; ----------------------------------------------------------------------
; DATOS pieza_66E1: una pieza de 1 x 1 dibujos (alto, ancho) de la fila 0x00
;   de la hoja, copia normal; la usan las pantallas 4B (p03:BC2F/BBEE); lo
;   leen p03:BC5C (4 bytes)
;   0x66e1..0x66e5  (4 bytes)
DATA_pieza_66E1:
	defb 000h,001h,001h	; 66e1
	defb 07dh	; 66e4

; ----------------------------------------------------------------------
; DATOS piezas_sueltas_66E5: 12 pieza(s) seguidas (modo, alto, ancho y alto x
;   ancho dibujos, el formato de p03:BC2F) a las que no apunta ninguna orden
;   de pantalla: encajan justas en el hueco; lo leen nadie (264 bytes)
;   0x66e5..0x67ed  (264 bytes)
DATA_piezas_sueltas_66E5:
	defb 040h,001h,001h,0f2h,040h,001h,001h,0f3h,040h,001h,001h,0f6h,040h,001h,001h,0f7h	; 66e5  @...@...@...@...
	defb 040h,001h,001h,0fbh,040h,001h,001h,0c7h,040h,002h,002h,0cah,0cbh,000h,0cfh,040h	; 66f5  @...@...@......@
	defb 002h,002h,0c2h,0c3h,0c6h,000h,040h,001h,001h,0fah,040h,001h,001h,0feh,000h,009h	; 6705  ......@...@.....
	defb 008h,000h,000h,00ch,00dh,00eh,00fh,000h,000h,000h,000h,010h,011h,012h,013h,000h	; 6715  ................
	defb 000h,000h,000h,014h,015h,016h,017h,000h,000h,000h,000h,018h,019h,01ah,01bh,000h	; 6725  ................
	defb 000h,000h,000h,01ch,01dh,01eh,01fh,000h,000h,020h,021h,022h,023h,030h,031h,032h	; 6735  ......... !"#012
	defb 033h,024h,025h,026h,027h,034h,035h,036h,037h,028h,029h,02ah,02bh,038h,039h,03ah	; 6745  3$%&'4567()*+89:
	defb 03bh,02ch,02dh,02eh,02fh,03ch,03dh,03eh,03fh,000h,007h,014h,040h,041h,042h,043h	; 6755  .,-./<=>?...@ABC
	defb 050h,051h,052h,053h,080h,081h,082h,083h,0a0h,0a1h,0a2h,0a3h,0c0h,0c1h,0c2h,0c3h	; 6765  PQRS............
	defb 044h,045h,046h,047h,054h,055h,056h,057h,084h,085h,086h,087h,0a4h,0a5h,0a6h,0a7h	; 6775  DEFGTUVW........
	defb 0c4h,0c5h,0c6h,0c7h,048h,049h,04ah,04bh,058h,059h,05ah,05bh,088h,089h,08ah,08bh	; 6785  ....HIJKXYZ[....
	defb 0a8h,0a9h,0aah,0abh,0c8h,0c9h,0cah,0cbh,04ch,04dh,04eh,04fh,05ch,05dh,05eh,05fh	; 6795  ........LMNO\]^_
	defb 08ch,08dh,08eh,08fh,0ach,0adh,0aeh,0afh,0cch,0cdh,0ceh,0cfh,060h,061h,062h,063h	; 67a5  ............`abc
	defb 070h,071h,072h,073h,090h,091h,092h,093h,0b0h,0b1h,0b2h,0b3h,0d0h,0d1h,0d2h,0d3h	; 67b5  pqrs............
	defb 064h,065h,066h,067h,074h,075h,076h,077h,094h,095h,096h,097h,0b4h,0b5h,0b6h,0b7h	; 67c5  defgtuvw........
	defb 0d4h,0d5h,0d6h,0d7h,068h,069h,06ah,06bh,078h,079h,07ah,07bh,098h,099h,09ah,09bh	; 67d5  ....hijkxyz{....
	defb 0b8h,0b9h,0bah,0bbh,0d8h,0d9h,0dah,0dbh	; 67e5  ........

; ----------------------------------------------------------------------
; DATOS ordenes_41_67ED: las ordenes de pieza de la pantalla 0x41 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (147 bytes)
;   0x67ed..0x6880  (147 bytes)
DATA_ordenes_41_67ED:
	defb 000h,001h,017h,01eh,095h,064h,08ch,00bh,0b7h,063h,092h,00dh,0b7h,063h,000h,001h	; 67ed  .....d...c...c..
	defb 017h,004h,08eh,063h,000h,005h,008h,002h,0ach,063h,088h,005h,0d2h,064h,00ch,005h	; 67fd  ...c.....c...d..
	defb 00bh,004h,08eh,063h,08ah,009h,0e5h,064h,00ch,009h,00bh,002h,0ach,063h,08ah,015h	; 680d  ...c...d.....c..
	defb 006h,065h,00ch,015h,00bh,002h,0a1h,063h,088h,017h,0e9h,063h,00ch,017h,00bh,004h	; 681d  .e.....c...c....
	defb 08eh,063h,000h,019h,008h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,084h,001h	; 682d  .c.....c.....c..
	defb 0b7h,063h,084h,018h,0b7h,063h,004h,006h,006h,001h,043h,065h,00bh,00ah,00ch,001h	; 683d  .c...c....Ce....
	defb 043h,065h,00ah,007h,001h,004h,043h,065h,00bh,015h,00ch,001h,043h,065h,004h,019h	; 684d  Ce....Ce....Ce..
	defb 006h,001h,043h,065h,00ah,015h,001h,004h,043h,065h,00ch,00bh,001h,007h,05ch,062h	; 685d  ..Ce....Ce....\b
	defb 012h,00dh,001h,007h,05ch,062h,004h,001h,001h,007h,043h,065h,004h,018h,001h,007h	; 686d  ....\b....Ce....
	defb 043h,065h,0ffh	; 687d

; ----------------------------------------------------------------------
; DATOS objetos_41: los 0 objetos de la pantalla 0x41: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x6880..0x6881  (1 bytes)
DATA_objetos_41:
	defb 0ffh	; 6880

; ----------------------------------------------------------------------
; DATOS sprites_41: los 2 grupos de sprites de la pantalla 0x41: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6881..0x688a  (9 bytes)
DATA_sprites_41:
	defb 016h,000h,080h,080h	; 6881
	defb 008h,000h,030h,010h	; 6885
	defb 0ffh	; 6889

; ----------------------------------------------------------------------
; DATOS ordenes_42_688A: las ordenes de pieza de la pantalla 0x42 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (115 bytes)
;   0x688a..0x68fd  (115 bytes)
DATA_ordenes_42_688A:
	defb 000h,001h,017h,01eh,095h,064h,006h,00eh,004h,00eh,0b7h,063h,00dh,004h,004h,00eh	; 688a  .....d.....c....
	defb 0b7h,063h,014h,00eh,003h,00eh,0b7h,063h,006h,00eh,001h,00eh,05ch,062h,00dh,004h	; 689a  .c.....c....\b..
	defb 001h,00eh,05ch,062h,014h,00eh,001h,00eh,05ch,062h,000h,001h,017h,004h,08eh,063h	; 68aa  ..\b....\b.....c
	defb 080h,005h,0d6h,063h,080h,009h,0fch,063h,004h,005h,013h,002h,0ach,063h,080h,015h	; 68ba  ...c...c.....c..
	defb 0ffh,064h,080h,017h,0ech,064h,004h,019h,013h,002h,0a1h,063h,000h,01bh,017h,004h	; 68ca  .d...d.....c....
	defb 08eh,063h,084h,001h,0b7h,063h,084h,018h,0b7h,063h,004h,006h,013h,001h,043h,065h	; 68da  .c...c...c....Ce
	defb 004h,019h,013h,001h,043h,065h,004h,001h,001h,007h,043h,065h,004h,018h,001h,007h	; 68ea  ....Ce....Ce....
	defb 043h,065h,0ffh	; 68fa

; ----------------------------------------------------------------------
; DATOS objetos_42: los 1 objetos de la pantalla 0x42: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x68fd..0x6902  (5 bytes)
DATA_objetos_42:
	defb 014h,008h,000h,003h	; 68fd
	defb 0ffh	; 6901

; ----------------------------------------------------------------------
; DATOS sprites_42: los 3 grupos de sprites de la pantalla 0x42: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6902..0x690f  (13 bytes)
DATA_sprites_42:
	defb 017h,000h,010h,0a8h	; 6902
	defb 017h,000h,050h,058h	; 6906
	defb 017h,000h,050h,098h	; 690a
	defb 0ffh	; 690e

; ----------------------------------------------------------------------
; DATOS ordenes_43_690F: las ordenes de pieza de la pantalla 0x43 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (115 bytes)
;   0x690f..0x6982  (115 bytes)
DATA_ordenes_43_690F:
	defb 000h,001h,017h,01eh,095h,064h,006h,00bh,004h,00eh,0b7h,063h,005h,007h,004h,015h	; 690f  .....d.....c....
	defb 0b7h,063h,08ch,004h,0b7h,063h,00bh,001h,004h,00eh,0b7h,063h,00bh,015h,004h,00ah	; 691f  .c...c.....c....
	defb 0b7h,063h,013h,010h,004h,00fh,0b7h,063h,012h,00dh,004h,012h,0b7h,063h,080h,001h	; 692f  .c.....c.....c..
	defb 0d6h,063h,080h,005h,0fch,063h,091h,001h,0e5h,064h,093h,001h,0d2h,064h,095h,005h	; 693f  .c...c...d...d..
	defb 0e5h,064h,080h,019h,0ffh,064h,080h,01bh,0ech,064h,084h,01dh,0ffh,064h,005h,007h	; 694f  .d...d...d...d..
	defb 001h,015h,05ch,062h,00bh,001h,001h,00eh,05ch,062h,00bh,015h,001h,00ah,05ch,062h	; 695f  ..\b....\b....\b
	defb 012h,00dh,001h,012h,05ch,062h,011h,001h,006h,002h,043h,065h,015h,003h,002h,004h	; 696f  ....\b....Ce....
	defb 043h,065h,0ffh	; 697f

; ----------------------------------------------------------------------
; DATOS objetos_43: los 1 objetos de la pantalla 0x43: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x6982..0x6987  (5 bytes)
DATA_objetos_43:
	defb 014h,001h,000h,002h	; 6982
	defb 0ffh	; 6986

; ----------------------------------------------------------------------
; DATOS sprites_43: los 1 grupos de sprites de la pantalla 0x43: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x6987..0x698c  (5 bytes)
DATA_sprites_43:
	defb 001h,000h,060h,080h	; 6987
	defb 0ffh	; 698b

; ----------------------------------------------------------------------
; DATOS ordenes_44_698C: las ordenes de pieza de la pantalla 0x44 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (109 bytes)
;   0x698c..0x69f9  (109 bytes)
DATA_ordenes_44_698C:
	defb 000h,001h,017h,01eh,095h,064h,085h,00bh,0b7h,063h,004h,008h,004h,00eh,0b7h,063h	; 698c  .....d...c.....c
	defb 004h,008h,001h,00eh,05ch,062h,08ch,018h,0b7h,063h,00bh,00eh,004h,011h,0b7h,063h	; 699c  ....\b...c.....c
	defb 00bh,00eh,001h,011h,05ch,062h,013h,014h,004h,00bh,0b7h,063h,013h,014h,001h,00bh	; 69ac  ....\b.....c....
	defb 05ch,062h,000h,001h,017h,004h,08eh,063h,080h,005h,0ach,063h,084h,005h,0d2h,064h	; 69bc  \b.....c...c...d
	defb 008h,005h,00fh,004h,08eh,063h,086h,009h,0e5h,064h,008h,009h,00fh,002h,0ach,063h	; 69cc  .....c...d.....c
	defb 084h,001h,0b7h,063h,007h,00ah,010h,001h,043h,065h,004h,006h,013h,001h,043h,065h	; 69dc  ...c....Ce....Ce
	defb 006h,007h,001h,003h,043h,065h,004h,001h,001h,007h,043h,065h,0ffh	; 69ec  ....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_44: los 3 objetos de la pantalla 0x44: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x69f9..0x6a06  (13 bytes)
DATA_objetos_44:
	defb 00ch,000h,002h,018h	; 69f9
	defb 014h,00ah,007h,01eh	; 69fd
	defb 014h,00ah,007h,01eh	; 6a01
	defb 0ffh	; 6a05

; ----------------------------------------------------------------------
; DATOS sprites_44: los 2 grupos de sprites de la pantalla 0x44: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6a06..0x6a0f  (9 bytes)
DATA_sprites_44:
	defb 019h,000h,060h,058h	; 6a06
	defb 008h,000h,030h,010h	; 6a0a
	defb 0ffh	; 6a0e

; ----------------------------------------------------------------------
; DATOS ordenes_45_6A0F: las ordenes de pieza de la pantalla 0x45 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (87 bytes)
;   0x6a0f..0x6a66  (87 bytes)
DATA_ordenes_45_6A0F:
	defb 000h,001h,017h,01eh,095h,064h,08bh,007h,0b7h,063h,093h,007h,0b7h,063h,007h,00dh	; 6a0f  .....d...c...c..
	defb 004h,012h,0b7h,063h,00fh,00dh,004h,012h,0b7h,063h,007h,00dh,001h,012h,05ch,062h	; 6a1f  ...c.....c....\b
	defb 00bh,007h,001h,007h,05ch,062h,00fh,00dh,001h,012h,05ch,062h,013h,007h,001h,007h	; 6a2f  ....\b....\b....
	defb 05ch,062h,000h,001h,017h,004h,08eh,063h,080h,005h,0d6h,063h,004h,005h,013h,002h	; 6a3f  \b.....c...c....
	defb 0ach,063h,093h,002h,0fch,063h,084h,001h,0b7h,063h,004h,006h,013h,001h,043h,065h	; 6a4f  .c...c...c....Ce
	defb 004h,001h,001h,007h,043h,065h,0ffh	; 6a5f

; ----------------------------------------------------------------------
; DATOS objetos_45: los 3 objetos de la pantalla 0x45: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6a66..0x6a73  (13 bytes)
DATA_objetos_45:
	defb 006h,000h,011h,013h	; 6a66
	defb 006h,000h,011h,019h	; 6a6a
	defb 00ah,000h,00bh,010h	; 6a6e
	defb 0ffh	; 6a72

; ----------------------------------------------------------------------
; DATOS sprites_45: los 3 grupos de sprites de la pantalla 0x45: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6a73..0x6a80  (13 bytes)
DATA_sprites_45:
	defb 001h,000h,038h,048h	; 6a73
	defb 001h,000h,060h,0b0h	; 6a77
	defb 019h,000h,060h,080h	; 6a7b
	defb 0ffh	; 6a7f

; ----------------------------------------------------------------------
; DATOS ordenes_46_6A80: las ordenes de pieza de la pantalla 0x46 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (89 bytes)
;   0x6a80..0x6ad9  (89 bytes)
DATA_ordenes_46_6A80:
	defb 000h,001h,017h,01eh,095h,064h,006h,012h,004h,007h,0b7h,063h,005h,00eh,004h,00eh	; 6a80  .....d.....c....
	defb 0b7h,063h,009h,015h,004h,00ah,0b7h,063h,00eh,011h,004h,00eh,0b7h,063h,014h,00fh	; 6a90  .c.....c.....c..
	defb 003h,00fh,0b7h,063h,014h,00fh,001h,00fh,05ch,062h,00eh,011h,001h,00eh,05ch,062h	; 6aa0  ...c....\b....\b
	defb 009h,015h,001h,00ah,05ch,062h,005h,00eh,001h,011h,05ch,062h,000h,001h,017h,004h	; 6ab0  ....\b....\b....
	defb 08eh,063h,000h,005h,017h,002h,0ach,063h,084h,001h,0b7h,063h,004h,006h,013h,001h	; 6ac0  .c.....c...c....
	defb 043h,065h,004h,001h,001h,007h,043h,065h,0ffh	; 6ad0  Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_46: los 4 objetos de la pantalla 0x46: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6ad9..0x6aea  (17 bytes)
DATA_objetos_46:
	defb 00ch,000h,00bh,009h	; 6ad9
	defb 014h,00ah,001h,01eh	; 6add
	defb 014h,00ah,009h,01eh	; 6ae1
	defb 014h,00ah,010h,01eh	; 6ae5
	defb 0ffh	; 6ae9

; ----------------------------------------------------------------------
; DATOS sprites_46: los 3 grupos de sprites de la pantalla 0x46: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6aea..0x6af7  (13 bytes)
DATA_sprites_46:
	defb 019h,000h,058h,070h	; 6aea
	defb 019h,000h,090h,048h	; 6aee
	defb 019h,000h,090h,0c0h	; 6af2
	defb 0ffh	; 6af6

; ----------------------------------------------------------------------
; DATOS ordenes_47_6AF7: las ordenes de pieza de la pantalla 0x47 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (125 bytes)
;   0x6af7..0x6b74  (125 bytes)
DATA_ordenes_47_6AF7:
	defb 000h,001h,017h,01eh,095h,064h,006h,012h,004h,00dh,0b7h,063h,005h,00eh,004h,011h	; 6af7  .....d.....c....
	defb 0b7h,063h,08ch,008h,0b7h,063h,00bh,004h,004h,00eh,0b7h,063h,014h,005h,003h,01ah	; 6b07  .c...c.....c....
	defb 0b7h,063h,014h,005h,001h,01ah,05ch,062h,00bh,004h,001h,00eh,05ch,062h,005h,00eh	; 6b17  .c....\b....\b..
	defb 001h,011h,05ch,062h,080h,001h,08eh,063h,080h,005h,0ach,063h,084h,001h,0d6h,063h	; 6b27  ..\b...c...c...c
	defb 084h,005h,0fch,063h,088h,001h,0fch,063h,08bh,01dh,006h,065h,08dh,01bh,0e9h,063h	; 6b37  ...c...c...e...c
	defb 08fh,019h,006h,065h,011h,019h,006h,002h,0a1h,063h,011h,01bh,006h,004h,08eh,063h	; 6b47  ...e.....c.....c
	defb 084h,001h,0b7h,063h,006h,001h,004h,002h,043h,065h,00fh,019h,008h,006h,043h,065h	; 6b57  ...c....Ce....Ce
	defb 00bh,01dh,004h,002h,043h,065h,004h,001h,001h,007h,043h,065h,0ffh	; 6b67  ....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_47: los 4 objetos de la pantalla 0x47: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6b74..0x6b85  (17 bytes)
DATA_objetos_47:
	defb 00ah,000h,002h,009h	; 6b74
	defb 006h,000h,007h,00fh	; 6b78
	defb 006h,000h,001h,017h	; 6b7c
	defb 014h,000h,001h,01eh	; 6b80
	defb 0ffh	; 6b84

; ----------------------------------------------------------------------
; DATOS sprites_47: los 3 grupos de sprites de la pantalla 0x47: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6b85..0x6b92  (13 bytes)
DATA_sprites_47:
	defb 016h,000h,090h,038h	; 6b85
	defb 016h,000h,090h,068h	; 6b89
	defb 016h,000h,090h,0b0h	; 6b8d
	defb 0ffh	; 6b91

; ----------------------------------------------------------------------
; DATOS ordenes_48_6B92: las ordenes de pieza de la pantalla 0x48 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (95 bytes)
;   0x6b92..0x6bf1  (95 bytes)
DATA_ordenes_48_6B92:
	defb 000h,001h,017h,01eh,095h,064h,005h,004h,004h,015h,0b7h,063h,00fh,00bh,004h,00eh	; 6b92  .....d.....c....
	defb 0b7h,063h,005h,004h,001h,015h,05ch,062h,00fh,00bh,001h,00eh,05ch,062h,08ah,001h	; 6ba2  .c....\b....\b..
	defb 0e5h,064h,08ch,001h,0d2h,064h,08eh,005h,0e5h,064h,010h,001h,007h,004h,08eh,063h	; 6bb2  .d...d...d.....c
	defb 010h,005h,007h,002h,0ach,063h,000h,019h,017h,002h,0a1h,063h,000h,01bh,017h,004h	; 6bc2  .....c.....c....
	defb 08eh,063h,084h,018h,0b7h,063h,004h,019h,013h,001h,043h,065h,00eh,001h,009h,006h	; 6bd2  .c...c....Ce....
	defb 043h,065h,00ah,001h,004h,002h,043h,065h,004h,018h,001h,007h,043h,065h,0ffh	; 6be2  Ce....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_48: los 3 objetos de la pantalla 0x48: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6bf1..0x6bfe  (13 bytes)
DATA_objetos_48:
	defb 006h,000h,003h,005h	; 6bf1
	defb 006h,000h,003h,016h	; 6bf5
	defb 022h,000h,00fh,00fh	; 6bf9
	defb 0ffh	; 6bfd

; ----------------------------------------------------------------------
; DATOS sprites_48: los 3 grupos de sprites de la pantalla 0x48: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6bfe..0x6c0b  (13 bytes)
DATA_sprites_48:
	defb 017h,000h,008h,040h	; 6bfe
	defb 017h,000h,058h,098h	; 6c02
	defb 019h,000h,058h,040h	; 6c06
	defb 0ffh	; 6c0a

; ----------------------------------------------------------------------
; DATOS ordenes_49_6C0B: las ordenes de pieza de la pantalla 0x49 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (101 bytes)
;   0x6c0b..0x6c70  (101 bytes)
DATA_ordenes_49_6C0B:
	defb 000h,001h,017h,01eh,095h,064h,007h,009h,004h,00eh,0b7h,063h,006h,005h,004h,015h	; 6c0b  .....d.....c....
	defb 0b7h,063h,006h,005h,001h,015h,05ch,062h,08dh,008h,0b7h,063h,00dh,008h,001h,007h	; 6c1b  .c....\b...c....
	defb 05ch,062h,090h,012h,0b7h,063h,010h,012h,001h,007h,05ch,062h,000h,001h,017h,004h	; 6c2b  \b...c....\b....
	defb 08eh,063h,000h,005h,017h,002h,0ach,063h,000h,019h,017h,002h,0a1h,063h,000h,01bh	; 6c3b  .c.....c.....c..
	defb 017h,004h,08eh,063h,084h,001h,0b7h,063h,084h,018h,0b7h,063h,004h,006h,013h,001h	; 6c4b  ...c...c...c....
	defb 043h,065h,004h,019h,013h,001h,043h,065h,004h,001h,001h,007h,043h,065h,004h,018h	; 6c5b  Ce....Ce....Ce..
	defb 001h,007h,043h,065h,0ffh	; 6c6b

; ----------------------------------------------------------------------
; DATOS objetos_49: los 4 objetos de la pantalla 0x49: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6c70..0x6c81  (17 bytes)
DATA_objetos_49:
	defb 006h,000h,002h,016h	; 6c70
	defb 006h,000h,00ch,016h	; 6c74
	defb 014h,000h,000h,00ah	; 6c78
	defb 014h,00ah,000h,016h	; 6c7c
	defb 0ffh	; 6c80

; ----------------------------------------------------------------------
; DATOS sprites_49: los 0 grupos de sprites de la pantalla 0x49: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6c81..0x6c82  (1 bytes)
DATA_sprites_49:
	defb 0ffh	; 6c81

; ----------------------------------------------------------------------
; DATOS ordenes_4A_6C82: las ordenes de pieza de la pantalla 0x4A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (135 bytes)
;   0x6c82..0x6d09  (135 bytes)
DATA_ordenes_4A_6C82:
	defb 000h,001h,017h,01eh,095h,064h,084h,011h,0b7h,063h,088h,008h,0b7h,063h,08ah,011h	; 6c82  .....d...c...c..
	defb 0b7h,063h,000h,001h,017h,004h,08eh,063h,000h,005h,010h,002h,0ach,063h,090h,005h	; 6c92  .c.....c.....c..
	defb 0d2h,064h,000h,019h,010h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,090h,017h	; 6ca2  .d.....c.....c..
	defb 0e9h,063h,012h,009h,002h,00eh,024h,065h,014h,005h,003h,012h,08eh,063h,092h,015h	; 6cb2  .c....$e.....c..
	defb 006h,065h,014h,015h,003h,002h,0a1h,063h,012h,001h,001h,01eh,043h,065h,014h,017h	; 6cc2  .e.....c....Ce..
	defb 003h,004h,08eh,063h,084h,001h,0b7h,063h,084h,018h,0b7h,063h,004h,006h,013h,001h	; 6cd2  ...c...c...c....
	defb 043h,065h,004h,019h,013h,001h,043h,065h,004h,011h,001h,007h,05ch,062h,008h,008h	; 6ce2  Ce....Ce....\b..
	defb 001h,007h,05ch,062h,00ah,011h,001h,007h,05ch,062h,004h,001h,001h,007h,043h,065h	; 6cf2  ..\b....\b....Ce
	defb 004h,018h,001h,007h,043h,065h,0ffh	; 6d02

; ----------------------------------------------------------------------
; DATOS objetos_4A: los 3 objetos de la pantalla 0x4A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6d09..0x6d16  (13 bytes)
DATA_objetos_4A:
	defb 006h,000h,00eh,009h	; 6d09
	defb 006h,000h,00eh,013h	; 6d0d
	defb 017h,000h,00eh,00dh	; 6d11
	defb 0ffh	; 6d15

; ----------------------------------------------------------------------
; DATOS sprites_4A: los 5 grupos de sprites de la pantalla 0x4A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (21 bytes)
;   0x6d16..0x6d2b  (21 bytes)
DATA_sprites_4A:
	defb 019h,000h,018h,040h	; 6d16
	defb 019h,000h,030h,040h	; 6d1a
	defb 019h,000h,018h,0b0h	; 6d1e
	defb 019h,000h,030h,0b0h	; 6d22
	defb 019h,000h,040h,070h	; 6d26
	defb 0ffh	; 6d2a

; ----------------------------------------------------------------------
; DATOS ordenes_73_6D2B: las ordenes de pieza de la pantalla 0x73 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (67 bytes)
;   0x6d2b..0x6d6e  (67 bytes)
DATA_ordenes_73_6D2B:
	defb 000h,001h,017h,01eh,095h,064h,087h,004h,0b7h,063h,006h,001h,004h,00eh,0b7h,063h	; 6d2b  .....d...c.....c
	defb 006h,001h,001h,00eh,05ch,062h,00dh,001h,002h,01eh,024h,065h,00fh,001h,008h,01eh	; 6d3b  ....\b....$e....
	defb 08eh,063h,004h,01dh,013h,002h,0a1h,063h,00dh,001h,001h,01eh,043h,065h,080h,019h	; 6d4b  .c.....c....Ce..
	defb 0ffh,064h,080h,01bh,0ech,064h,014h,001h,003h,01eh,00dh,065h,000h,01dh,017h,001h	; 6d5b  .d...d.....e....
	defb 043h,065h,0ffh	; 6d6b

; ----------------------------------------------------------------------
; DATOS objetos_73: los 1 objetos de la pantalla 0x73: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x6d6e..0x6d73  (5 bytes)
DATA_objetos_73:
	defb 014h,001h,007h,002h	; 6d6e
	defb 0ffh	; 6d72

; ----------------------------------------------------------------------
; DATOS sprites_73: los 3 grupos de sprites de la pantalla 0x73: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6d73..0x6d80  (13 bytes)
DATA_sprites_73:
	defb 01ch,000h,09ch,030h	; 6d73
	defb 01ch,000h,09ch,068h	; 6d77
	defb 01ch,000h,09ch,090h	; 6d7b
	defb 0ffh	; 6d7f

; ----------------------------------------------------------------------
; DATOS ordenes_74_6D80: las ordenes de pieza de la pantalla 0x74 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (47 bytes)
;   0x6d80..0x6daf  (47 bytes)
DATA_ordenes_74_6D80:
	defb 000h,001h,017h,01eh,095h,064h,087h,014h,0b7h,063h,006h,011h,004h,00eh,0b7h,063h	; 6d80  .....d...c.....c
	defb 006h,011h,001h,00eh,05ch,062h,00dh,001h,002h,01eh,024h,065h,00fh,001h,008h,01eh	; 6d90  ....\b....$e....
	defb 08eh,063h,014h,001h,003h,01eh,00dh,065h,00dh,001h,001h,01eh,043h,065h,0ffh	; 6da0  .c.....e....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_74: los 4 objetos de la pantalla 0x74: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6daf..0x6dc0  (17 bytes)
DATA_objetos_74:
	defb 014h,001h,007h,002h	; 6daf
	defb 006h,000h,002h,005h	; 6db3
	defb 006h,000h,002h,00dh	; 6db7
	defb 006h,000h,00fh,00bh	; 6dbb
	defb 0ffh	; 6dbf

; ----------------------------------------------------------------------
; DATOS sprites_74: los 0 grupos de sprites de la pantalla 0x74: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x6dc0..0x6dc1  (1 bytes)
DATA_sprites_74:
	defb 0ffh	; 6dc0

; ----------------------------------------------------------------------
; DATOS ordenes_75_6DC1: las ordenes de pieza de la pantalla 0x75 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (163 bytes)
;   0x6dc1..0x6e64  (163 bytes)
DATA_ordenes_75_6DC1:
	defb 000h,001h,017h,01eh,095h,064h,086h,006h,006h,065h,006h,008h,002h,008h,024h,065h	; 6dc1  .....d...e....$e
	defb 086h,010h,0e5h,064h,008h,006h,00fh,002h,0a1h,063h,008h,008h,00fh,008h,08eh,063h	; 6dd1  ...d.....c.....c
	defb 008h,010h,00fh,002h,0ach,063h,086h,016h,006h,065h,006h,018h,002h,004h,024h,065h	; 6de1  .....c...e....$e
	defb 086h,01ch,0e5h,064h,008h,016h,00fh,002h,0a1h,063h,008h,018h,00fh,004h,08eh,063h	; 6df1  ...d.....c.....c
	defb 008h,01ch,00fh,002h,0ach,063h,00dh,001h,002h,008h,024h,065h,08dh,009h,0e5h,064h	; 6e01  .....c....$e...d
	defb 00fh,001h,008h,008h,08eh,063h,00fh,009h,008h,002h,0ach,063h,08dh,019h,006h,065h	; 6e11  .....c.....c...e
	defb 00dh,01bh,002h,004h,024h,065h,00fh,019h,008h,002h,0a1h,063h,00fh,01bh,008h,004h	; 6e21  ....$e.....c....
	defb 08eh,063h,014h,001h,003h,01eh,00dh,065h,093h,00bh,01dh,065h,013h,00eh,002h,00ah	; 6e31  .c.....e...e....
	defb 00dh,065h,092h,012h,01dh,065h,092h,014h,016h,065h,006h,006h,001h,00ch,05ch,062h	; 6e41  .e...e...e....\b
	defb 006h,016h,001h,008h,05ch,062h,00dh,001h,001h,00ah,043h,065h,00dh,019h,001h,006h	; 6e51  ....\b....Ce....
	defb 043h,065h,0ffh	; 6e61

; ----------------------------------------------------------------------
; DATOS objetos_75: los 3 objetos de la pantalla 0x75: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6e64..0x6e71  (13 bytes)
DATA_objetos_75:
	defb 006h,001h,009h,006h	; 6e64
	defb 006h,001h,002h,009h	; 6e68
	defb 014h,001h,009h,002h	; 6e6c
	defb 0ffh	; 6e70

; ----------------------------------------------------------------------
; DATOS sprites_75: los 2 grupos de sprites de la pantalla 0x75: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x6e71..0x6e7a  (9 bytes)
DATA_sprites_75:
	defb 01ch,000h,09ch,030h	; 6e71
	defb 008h,000h,030h,010h	; 6e75
	defb 0ffh	; 6e79

; ----------------------------------------------------------------------
; DATOS ordenes_76_6E7A: las ordenes de pieza de la pantalla 0x76 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (107 bytes)
;   0x6e7a..0x6ee5  (107 bytes)
DATA_ordenes_76_6E7A:
	defb 000h,001h,017h,01eh,095h,064h,085h,00fh,006h,065h,085h,011h,024h,065h,085h,015h	; 6e7a  .....d...e..$e..
	defb 0e5h,064h,087h,00dh,0e9h,063h,087h,011h,08eh,063h,087h,015h,0ach,063h,009h,001h	; 6e8a  .d...c...c...c..
	defb 002h,00ch,024h,065h,00bh,001h,004h,014h,08eh,063h,08bh,015h,0d2h,064h,00dh,019h	; 6e9a  ..$e.....c...d..
	defb 002h,006h,024h,065h,00fh,001h,008h,01eh,08eh,063h,014h,001h,003h,01eh,00dh,065h	; 6eaa  ..$e.....c.....e
	defb 009h,001h,001h,00fh,043h,065h,005h,00fh,001h,008h,043h,065h,00dh,017h,001h,008h	; 6eba  ....Ce....Ce....
	defb 043h,065h,006h,016h,008h,001h,043h,065h,005h,00fh,003h,001h,043h,065h,007h,00eh	; 6eca  Ce....Ce....Ce..
	defb 001h,003h,043h,065h,007h,00eh,003h,001h,043h,065h,0ffh	; 6eda  ..Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_76: los 4 objetos de la pantalla 0x76: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6ee5..0x6ef6  (17 bytes)
DATA_objetos_76:
	defb 006h,000h,005h,004h	; 6ee5
	defb 006h,000h,001h,010h	; 6ee9
	defb 00ah,000h,00ch,007h	; 6eed
	defb 014h,000h,005h,002h	; 6ef1
	defb 0ffh	; 6ef5

; ----------------------------------------------------------------------
; DATOS sprites_76: los 3 grupos de sprites de la pantalla 0x76: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6ef6..0x6f03  (13 bytes)
DATA_sprites_76:
	defb 01ch,000h,09ch,030h	; 6ef6
	defb 01ch,000h,09ch,090h	; 6efa
	defb 01ch,000h,09ch,0c0h	; 6efe
	defb 0ffh	; 6f02

; ----------------------------------------------------------------------
; DATOS ordenes_77_6F03: las ordenes de pieza de la pantalla 0x77 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (69 bytes)
;   0x6f03..0x6f48  (69 bytes)
DATA_ordenes_77_6F03:
	defb 000h,001h,017h,01eh,095h,064h,089h,017h,006h,065h,009h,019h,002h,006h,024h,065h	; 6f03  .....d...e....$e
	defb 08bh,015h,0e9h,063h,00bh,019h,004h,006h,08eh,063h,00dh,001h,002h,014h,024h,065h	; 6f13  ...c.....c....$e
	defb 00fh,001h,008h,01eh,08eh,063h,014h,001h,003h,01eh,00dh,065h,00dh,001h,001h,017h	; 6f23  .....c.....e....
	defb 043h,065h,009h,017h,001h,008h,043h,065h,00bh,017h,002h,001h,043h,065h,00ch,016h	; 6f33  Ce....Ce....Ce..
	defb 001h,001h,043h,065h,0ffh	; 6f43

; ----------------------------------------------------------------------
; DATOS objetos_77: los 3 objetos de la pantalla 0x77: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6f48..0x6f55  (13 bytes)
DATA_objetos_77:
	defb 006h,000h,002h,010h	; 6f48
	defb 006h,000h,00bh,00dh	; 6f4c
	defb 014h,009h,009h,002h	; 6f50
	defb 0ffh	; 6f54

; ----------------------------------------------------------------------
; DATOS sprites_77: los 1 grupos de sprites de la pantalla 0x77: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x6f55..0x6f5a  (5 bytes)
DATA_sprites_77:
	defb 008h,000h,030h,010h	; 6f55
	defb 0ffh	; 6f59

; ----------------------------------------------------------------------
; DATOS ordenes_78_6F5A: las ordenes de pieza compartidas que usa la pantalla
;   0x78 (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (31 bytes)
;   0x6f5a..0x6f79  (31 bytes)
DATA_ordenes_78_6F5A:
	defb 000h,001h,017h,01eh,095h,064h,00dh,001h,002h,01eh,024h,065h,00fh,001h,008h,01eh	; 6f5a  .....d....$e....
	defb 08eh,063h,014h,001h,003h,01eh,00dh,065h,00dh,001h,001h,01eh,043h,065h,0ffh	; 6f6a  .c.....e....Ce.

; ----------------------------------------------------------------------
; DATOS ordenes_78_6F79: las ordenes de pieza de la pantalla 0x78 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (4 bytes)
;   0x6f79..0x6f7d  (4 bytes)
DATA_ordenes_78_6F79:
	defb 0feh,05ah,06fh,0ffh	; 6f79

; ----------------------------------------------------------------------
; DATOS objetos_78: los 4 objetos de la pantalla 0x78: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x6f7d..0x6f8e  (17 bytes)
DATA_objetos_78:
	defb 006h,000h,004h,006h	; 6f7d
	defb 006h,000h,004h,012h	; 6f81
	defb 006h,000h,007h,00fh	; 6f85
	defb 014h,009h,009h,002h	; 6f89
	defb 0ffh	; 6f8d

; ----------------------------------------------------------------------
; DATOS sprites_78: los 4 grupos de sprites de la pantalla 0x78: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (17 bytes)
;   0x6f8e..0x6f9f  (17 bytes)
DATA_sprites_78:
	defb 01ch,000h,09ch,038h	; 6f8e
	defb 01ch,000h,09ch,058h	; 6f92
	defb 01ch,000h,09ch,080h	; 6f96
	defb 01ch,000h,09ch,0a0h	; 6f9a
	defb 0ffh	; 6f9e

; ----------------------------------------------------------------------
; DATOS ordenes_79_6F9F: las ordenes de pieza de la pantalla 0x79 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (4 bytes)
;   0x6f9f..0x6fa3  (4 bytes)
DATA_ordenes_79_6F9F:
	defb 0feh,05ah,06fh,0ffh	; 6f9f

; ----------------------------------------------------------------------
; DATOS objetos_79: los 3 objetos de la pantalla 0x79: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x6fa3..0x6fb0  (13 bytes)
DATA_objetos_79:
	defb 006h,000h,003h,008h	; 6fa3
	defb 006h,000h,003h,016h	; 6fa7
	defb 017h,000h,002h,00eh	; 6fab
	defb 0ffh	; 6faf

; ----------------------------------------------------------------------
; DATOS sprites_79: los 3 grupos de sprites de la pantalla 0x79: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x6fb0..0x6fbd  (13 bytes)
DATA_sprites_79:
	defb 01ch,000h,09ch,038h	; 6fb0
	defb 01ch,000h,09ch,058h	; 6fb4
	defb 01ch,000h,09ch,0b8h	; 6fb8
	defb 0ffh	; 6fbc

; ----------------------------------------------------------------------
; DATOS ordenes_7A_6FBD: las ordenes de pieza compartidas que usa la pantalla
;   0x7A (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (25 bytes)
;   0x6fbd..0x6fd6  (25 bytes)
DATA_ordenes_7A_6FBD:
	defb 000h,001h,017h,01eh,0a8h,064h,000h,009h,017h,001h,08ch,064h,000h,010h,017h,001h	; 6fbd  .....d.....d....
	defb 08ch,064h,000h,017h,017h,001h,08ch,064h,0ffh	; 6fcd  .d.....d.

; ----------------------------------------------------------------------
; DATOS ordenes_7A_6FD6: las ordenes de pieza de la pantalla 0x7A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (148 bytes)
;   0x6fd6..0x706a  (148 bytes)
DATA_ordenes_7A_6FD6:
	defb 0feh,0bdh,06fh,005h,001h,002h,00eh,0afh,064h,007h,013h,002h,00ah,0afh,064h,00dh	; 6fd6  ..o.....d.....d.
	defb 001h,002h,01eh,0afh,064h,015h,001h,002h,01eh,0afh,064h,004h,001h,002h,00dh,0bdh	; 6fe6  ....d.....d.....
	defb 064h,084h,00eh,0c7h,064h,086h,013h,0c2h,064h,006h,014h,002h,00ah,0bdh,064h,00ch	; 6ff6  d...d...d.....d.
	defb 001h,002h,01eh,0bdh,064h,014h,001h,002h,01eh,0bdh,064h,084h,009h,0cch,064h,086h	; 7006  ....d.....d...d.
	defb 017h,0cch,064h,08ch,009h,0cch,064h,08ch,010h,0cch,064h,08ch,017h,0cch,064h,08eh	; 7016  ..d...d...d...d.
	defb 009h,051h,064h,08eh,010h,051h,064h,000h,001h,017h,004h,08eh,063h,000h,005h,017h	; 7026  .Qd..Qd.....c...
	defb 002h,0ach,063h,000h,019h,017h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,005h	; 7036  ..c.....c.....c.
	defb 007h,001h,008h,05ch,062h,007h,013h,001h,006h,05ch,062h,00dh,007h,001h,012h,05ch	; 7046  ...\b....\b....\
	defb 062h,015h,007h,001h,012h,043h,065h,000h,006h,017h,001h,043h,065h,000h,019h,017h	; 7056  b....Ce....Ce...
	defb 001h,043h,065h,0ffh	; 7066

; ----------------------------------------------------------------------
; DATOS objetos_7A: los 1 objetos de la pantalla 0x7A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (5 bytes)
;   0x706a..0x706f  (5 bytes)
DATA_objetos_7A:
	defb 00ah,000h,007h,00ah	; 706a
	defb 0ffh	; 706e

; ----------------------------------------------------------------------
; DATOS sprites_7A: los 3 grupos de sprites de la pantalla 0x7A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x706f..0x707c  (13 bytes)
DATA_sprites_7A:
	defb 001h,000h,008h,058h	; 706f
	defb 001h,000h,048h,038h	; 7073
	defb 001h,000h,028h,0a8h	; 7077
	defb 0ffh	; 707b

; ----------------------------------------------------------------------
; DATOS ordenes_7B_707C: las ordenes de pieza de la pantalla 0x7B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (204 bytes)
;   0x707c..0x7148  (204 bytes)
DATA_ordenes_7B_707C:
	defb 0feh,0bdh,06fh,005h,001h,002h,00ah,0afh,064h,007h,00bh,002h,010h,0afh,064h,00dh	; 707c  ..o.....d.....d.
	defb 001h,002h,00eh,0afh,064h,015h,001h,002h,01eh,0afh,064h,004h,001h,002h,009h,0bdh	; 708c  ....d.....d.....
	defb 064h,084h,00ah,0c7h,064h,086h,00bh,0c2h,064h,006h,00ch,002h,00eh,0bdh,064h,00ch	; 709c  d...d...d.....d.
	defb 001h,002h,00dh,0bdh,064h,08ch,00eh,0c7h,064h,014h,001h,002h,01eh,0bdh,064h,005h	; 70ac  ....d...d.....d.
	defb 001h,001h,00ah,05ch,062h,007h,00bh,001h,012h,05ch,062h,00dh,001h,001h,00eh,05ch	; 70bc  ...\b....\b....\
	defb 062h,015h,001h,001h,01eh,05ch,062h,000h,001h,017h,004h,08eh,063h,000h,005h,017h	; 70cc  b....\b.....c...
	defb 002h,0ach,063h,000h,006h,017h,001h,043h,065h,080h,00dh,0ffh,064h,080h,00fh,0ech	; 70dc  ..c....Ce...d...
	defb 064h,084h,011h,0ffh,064h,080h,013h,08eh,063h,084h,013h,0ech,064h,088h,015h,0a1h	; 70ec  d...d...c...d...
	defb 063h,08ch,015h,0ffh,064h,000h,017h,00ch,004h,08eh,063h,08ch,017h,0ech,064h,010h	; 70fc  c...d.....c...d.
	defb 019h,007h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,000h,00dh,002h,005h,043h	; 710c  ....c.....c....C
	defb 065h,006h,015h,008h,006h,043h,065h,00eh,019h,009h,001h,043h,065h,000h,012h,006h	; 711c  e....Ce....Ce...
	defb 003h,043h,065h,084h,009h,0cch,064h,086h,010h,0cch,064h,08ch,009h,0cch,064h,094h	; 712c  .Ce...d...d...d.
	defb 009h,0cch,064h,094h,010h,0cch,064h,094h,017h,0cch,064h,0ffh	; 713c  ..d...d...d.

; ----------------------------------------------------------------------
; DATOS objetos_7B: los 3 objetos de la pantalla 0x7B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7148..0x7155  (13 bytes)
DATA_objetos_7B:
	defb 006h,000h,004h,014h	; 7148
	defb 006h,000h,004h,018h	; 714c
	defb 014h,000h,017h,00eh	; 7150
	defb 0ffh	; 7154

; ----------------------------------------------------------------------
; DATOS sprites_7B: los 3 grupos de sprites de la pantalla 0x7B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (13 bytes)
;   0x7155..0x7162  (13 bytes)
DATA_sprites_7B:
	defb 001h,000h,008h,048h	; 7155
	defb 001h,000h,048h,048h	; 7159
	defb 008h,000h,040h,010h	; 715d
	defb 0ffh	; 7161

; ----------------------------------------------------------------------
; DATOS ordenes_7C_7162: las ordenes de pieza de la pantalla 0x7C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (222 bytes)
;   0x7162..0x7240  (222 bytes)
DATA_ordenes_7C_7162:
	defb 0feh,0bdh,06fh,005h,001h,002h,01eh,0afh,064h,004h,001h,002h,01eh,0bdh,064h,00dh	; 7162  ..o.....d.....d.
	defb 001h,002h,01eh,0afh,064h,00ch,001h,002h,01eh,0bdh,064h,015h,001h,002h,01eh,0afh	; 7172  ....d.....d.....
	defb 064h,014h,001h,002h,01eh,0bdh,064h,084h,010h,0cch,064h,084h,017h,0cch,064h,08ch	; 7182  d.....d...d...d.
	defb 009h,0cch,064h,08ch,010h,0cch,064h,005h,001h,001h,01eh,05ch,062h,00dh,001h,001h	; 7192  ..d...d....\b...
	defb 01eh,05ch,062h,015h,001h,001h,01eh,05ch,062h,000h,001h,017h,004h,08eh,063h,000h	; 71a2  .\b....\b.....c.
	defb 005h,00ch,004h,08eh,063h,08ch,005h,0d6h,063h,010h,005h,007h,002h,0ach,063h,000h	; 71b2  ....c...c.....c.
	defb 009h,008h,004h,08eh,063h,088h,009h,0d6h,063h,08ch,009h,0fch,063h,000h,00dh,008h	; 71c2  ....c...c...c...
	defb 002h,0ach,063h,088h,00dh,0fch,063h,092h,00dh,006h,065h,014h,00dh,003h,002h,0a1h	; 71d2  ..c...c...e.....
	defb 063h,08eh,011h,006h,065h,090h,00fh,0e9h,063h,014h,00fh,003h,004h,08eh,063h,08ah	; 71e2  c...e...c.....c.
	defb 015h,006h,065h,08ch,013h,0e9h,063h,010h,013h,007h,004h,08eh,063h,000h,019h,008h	; 71f2  ..e...c.....c...
	defb 002h,0a1h,063h,088h,017h,0e9h,063h,00ch,017h,00bh,004h,08eh,063h,000h,01bh,017h	; 7202  ..c...c.....c...
	defb 004h,08eh,063h,000h,019h,017h,001h,043h,065h,00ah,015h,006h,006h,043h,065h,00dh	; 7212  ..c....Ce....Ce.
	defb 011h,007h,006h,043h,065h,012h,00dh,005h,006h,043h,065h,000h,00bh,00ah,004h,043h	; 7222  ...Ce....Ce....C
	defb 065h,00ah,007h,004h,004h,043h,065h,00eh,006h,009h,001h,043h,065h,0ffh	; 7232  e....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_7C: los 4 objetos de la pantalla 0x7C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7240..0x7251  (17 bytes)
DATA_objetos_7C:
	defb 006h,000h,005h,008h	; 7240
	defb 006h,000h,009h,008h	; 7244
	defb 006h,000h,006h,01bh	; 7248
	defb 014h,008h,001h,012h	; 724c
	defb 0ffh	; 7250

; ----------------------------------------------------------------------
; DATOS sprites_7C: los 1 grupos de sprites de la pantalla 0x7C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (5 bytes)
;   0x7251..0x7256  (5 bytes)
DATA_sprites_7C:
	defb 008h,000h,030h,010h	; 7251
	defb 0ffh	; 7255

; ----------------------------------------------------------------------
; DATOS ordenes_7D_7256: las ordenes de pieza de la pantalla 0x7D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (208 bytes)
;   0x7256..0x7326  (208 bytes)
DATA_ordenes_7D_7256:
	defb 0feh,0bdh,06fh,003h,00dh,002h,008h,0afh,064h,002h,00eh,002h,006h,0bdh,064h,082h	; 7256  ..o.....d.....d.
	defb 00dh,0c2h,064h,082h,014h,0c7h,064h,082h,010h,0cch,064h,007h,00dh,002h,010h,0afh	; 7266  ..d...d...d.....
	defb 064h,006h,00eh,002h,00eh,0bdh,064h,086h,00dh,0c2h,064h,086h,010h,0cch,064h,086h	; 7276  d.....d...d...d.
	defb 017h,0cch,064h,00dh,001h,002h,01eh,0afh,064h,00ch,001h,002h,01eh,0bdh,064h,08ch	; 7286  ..d.....d.....d.
	defb 009h,0cch,064h,08ch,010h,0cch,064h,08ch,017h,0cch,064h,015h,001h,002h,01eh,0afh	; 7296  ..d...d...d.....
	defb 064h,014h,001h,002h,01eh,0bdh,064h,08eh,009h,051h,064h,08eh,010h,051h,064h,003h	; 72a6  d.....d..Qd..Qd.
	defb 00dh,001h,008h,05ch,062h,007h,00dh,001h,00eh,05ch,062h,00dh,001h,001h,01eh,05ch	; 72b6  ...\b....\b....\
	defb 062h,015h,001h,001h,01eh,05ch,062h,000h,001h,017h,004h,08eh,063h,000h,005h,00ch	; 72c6  b....\b.....c...
	defb 002h,0ach,063h,08ch,005h,0d2h,064h,010h,005h,007h,004h,08eh,063h,08eh,009h,0e5h	; 72d6  ..c...d.....c...
	defb 064h,090h,009h,0d2h,064h,014h,009h,003h,004h,08eh,063h,092h,00dh,0e5h,064h,014h	; 72e6  d...d.....c...d.
	defb 00dh,003h,002h,0ach,063h,000h,019h,017h,002h,0a1h,063h,000h,01bh,017h,004h,08eh	; 72f6  ....c.....c.....
	defb 063h,000h,019h,017h,001h,043h,065h,000h,006h,017h,001h,043h,065h,00eh,007h,006h	; 7306  c....Ce....Ce...
	defb 004h,043h,065h,012h,00bh,005h,004h,043h,065h,00dh,001h,001h,009h,043h,065h,0ffh	; 7316  .Ce....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_7D: los 3 objetos de la pantalla 0x7D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7326..0x7333  (13 bytes)
DATA_objetos_7D:
	defb 006h,000h,003h,015h	; 7326
	defb 006h,001h,010h,011h	; 732a
	defb 014h,008h,001h,012h	; 732e
	defb 0ffh	; 7332

; ----------------------------------------------------------------------
; DATOS sprites_7D: los 2 grupos de sprites de la pantalla 0x7D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (9 bytes)
;   0x7333..0x733c  (9 bytes)
DATA_sprites_7D:
	defb 016h,000h,054h,040h	; 7333
	defb 016h,000h,054h,0a8h	; 7337
	defb 0ffh	; 733b

; ----------------------------------------------------------------------
; DATOS ordenes_7E_733C: las ordenes de pieza de la pantalla 0x7E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (148 bytes)
;   0x733c..0x73d0  (148 bytes)
DATA_ordenes_7E_733C:
	defb 0feh,0bdh,06fh,005h,001h,002h,012h,0afh,064h,004h,001h,002h,011h,0bdh,064h,084h	; 733c  ..o.....d.....d.
	defb 012h,0c7h,064h,084h,009h,0cch,064h,084h,010h,0cch,064h,009h,013h,002h,00ch,0afh	; 734c  ..d...d...d.....
	defb 064h,008h,014h,002h,00ah,0bdh,064h,088h,013h,0c2h,064h,088h,017h,0cch,064h,00dh	; 735c  d.....d...d...d.
	defb 001h,002h,012h,0afh,064h,00ch,001h,002h,011h,0bdh,064h,08ch,012h,0c7h,064h,08ch	; 736c  ....d.....d...d.
	defb 009h,0cch,064h,08ch,010h,0cch,064h,015h,001h,002h,01eh,0afh,064h,014h,001h,002h	; 737c  ..d...d.....d...
	defb 01eh,0bdh,064h,005h,001h,001h,012h,05ch,062h,009h,013h,001h,00ah,05ch,062h,00dh	; 738c  ..d....\b....\b.
	defb 001h,001h,012h,05ch,062h,015h,001h,001h,01eh,05ch,062h,08eh,009h,051h,064h,000h	; 739c  ...\b....\b..Qd.
	defb 001h,017h,004h,08eh,063h,000h,005h,017h,002h,0ach,063h,000h,006h,017h,001h,043h	; 73ac  ....c.....c....C
	defb 065h,000h,019h,017h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,000h,019h,017h	; 73bc  e.....c.....c...
	defb 001h,043h,065h,0ffh	; 73cc

; ----------------------------------------------------------------------
; DATOS objetos_7E: los 4 objetos de la pantalla 0x7E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x73d0..0x73e1  (17 bytes)
DATA_objetos_7E:
	defb 006h,000h,00bh,015h	; 73d0
	defb 006h,000h,009h,007h	; 73d4
	defb 006h,000h,011h,014h	; 73d8
	defb 014h,008h,001h,012h	; 73dc
	defb 0ffh	; 73e0

; ----------------------------------------------------------------------
; DATOS sprites_7E: los 0 grupos de sprites de la pantalla 0x7E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x73e1..0x73e2  (1 bytes)
DATA_sprites_7E:
	defb 0ffh	; 73e1

; ----------------------------------------------------------------------
; DATOS ordenes_7F_73E2: las ordenes de pieza de la pantalla 0x7F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (144 bytes)
;   0x73e2..0x7472  (144 bytes)
DATA_ordenes_7F_73E2:
	defb 0feh,0bdh,06fh,005h,013h,002h,00ah,0afh,064h,004h,014h,002h,009h,0bdh,064h,084h	; 73e2  ..o.....d.....d.
	defb 013h,0c2h,064h,007h,001h,002h,00eh,0afh,064h,006h,001h,002h,00dh,0bdh,064h,086h	; 73f2  ..d.....d.....d.
	defb 00eh,0c7h,064h,086h,009h,0cch,064h,084h,017h,0cch,064h,00dh,00dh,002h,010h,0afh	; 7402  ..d...d...d.....
	defb 064h,00ch,00eh,002h,00fh,0bdh,064h,08ch,00dh,0c2h,064h,08ch,010h,0cch,064h,08ch	; 7412  d.....d...d...d.
	defb 017h,0cch,064h,015h,001h,002h,01eh,0afh,064h,014h,001h,002h,01eh,0bdh,064h,08eh	; 7422  ..d.....d.....d.
	defb 010h,051h,064h,005h,013h,001h,00ah,05ch,062h,007h,001h,001h,00eh,05ch,062h,00dh	; 7432  .Qd....\b....\b.
	defb 00dh,001h,010h,05ch,062h,015h,001h,001h,01eh,05ch,062h,000h,001h,017h,004h,08eh	; 7442  ...\b....\b.....
	defb 063h,000h,005h,017h,002h,0ach,063h,000h,019h,017h,002h,0a1h,063h,000h,01bh,017h	; 7452  c.....c.....c...
	defb 004h,08eh,063h,000h,006h,017h,001h,043h,065h,000h,019h,017h,001h,043h,065h,0ffh	; 7462  ..c....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_7F: los 5 objetos de la pantalla 0x7F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7472..0x7487  (21 bytes)
DATA_objetos_7F:
	defb 006h,000h,001h,00bh	; 7472
	defb 006h,000h,001h,011h	; 7476
	defb 006h,000h,001h,015h	; 747a
	defb 00ah,000h,009h,00ah	; 747e
	defb 014h,008h,001h,012h	; 7482
	defb 0ffh	; 7486

; ----------------------------------------------------------------------
; DATOS sprites_7F: los 0 grupos de sprites de la pantalla 0x7F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7487..0x7488  (1 bytes)
DATA_sprites_7F:
	defb 0ffh	; 7487

; ----------------------------------------------------------------------
; DATOS ordenes_80_7488: las ordenes de pieza de la pantalla 0x80 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (185 bytes)
;   0x7488..0x7541  (185 bytes)
DATA_ordenes_80_7488:
	defb 000h,001h,017h,01eh,0a8h,064h,000h,00ah,017h,001h,08ch,064h,000h,015h,017h,001h	; 7488  .....d.....d....
	defb 08ch,064h,005h,013h,002h,00ah,0afh,064h,084h,013h,0c2h,064h,004h,014h,002h,009h	; 7498  .d.....d...d....
	defb 0bdh,064h,084h,015h,0cch,064h,00bh,013h,002h,00ah,0afh,064h,08ah,013h,0c2h,064h	; 74a8  .d...d.....d...d
	defb 00ah,014h,002h,009h,0bdh,064h,08ah,015h,0cch,064h,011h,013h,002h,00ah,0afh,064h	; 74b8  .....d...d.....d
	defb 090h,013h,0c2h,064h,010h,014h,002h,009h,0bdh,064h,090h,015h,0cch,064h,009h,001h	; 74c8  ...d.....d...d..
	defb 002h,00ch,0afh,064h,008h,001h,002h,00bh,0bdh,064h,088h,00ch,0c7h,064h,015h,001h	; 74d8  ...d.....d...d..
	defb 002h,01eh,0afh,064h,014h,001h,002h,01eh,0bdh,064h,005h,013h,001h,00ah,05ch,062h	; 74e8  ...d.....d....\b
	defb 00bh,013h,001h,00ah,05ch,062h,011h,013h,001h,00ah,05ch,062h,009h,001h,001h,00ch	; 74f8  ....\b....\b....
	defb 05ch,062h,015h,001h,001h,01eh,05ch,062h,000h,001h,017h,004h,08eh,063h,000h,005h	; 7508  \b....\b.....c..
	defb 017h,002h,0ach,063h,000h,006h,017h,001h,043h,065h,000h,019h,017h,002h,0a1h,063h	; 7518  ...c....Ce.....c
	defb 000h,01bh,017h,004h,08eh,063h,000h,019h,017h,001h,043h,065h,088h,00ah,0cch,064h	; 7528  .....c....Ce...d
	defb 094h,00ah,0cch,064h,094h,015h,0cch,064h,0ffh	; 7538  ...d...d.

; ----------------------------------------------------------------------
; DATOS objetos_80: los 4 objetos de la pantalla 0x80: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7541..0x7552  (17 bytes)
DATA_objetos_80:
	defb 006h,000h,002h,00bh	; 7541
	defb 006h,000h,002h,00eh	; 7545
	defb 006h,000h,002h,011h	; 7549
	defb 014h,008h,001h,012h	; 754d
	defb 0ffh	; 7551

; ----------------------------------------------------------------------
; DATOS sprites_80: los 0 grupos de sprites de la pantalla 0x80: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7552..0x7553  (1 bytes)
DATA_sprites_80:
	defb 0ffh	; 7552

; ----------------------------------------------------------------------
; DATOS ordenes_81_7553: las ordenes de pieza de la pantalla 0x81 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (61 bytes)
;   0x7553..0x7590  (61 bytes)
DATA_ordenes_81_7553:
	defb 000h,001h,017h,01eh,0a8h,064h,015h,001h,002h,01eh,0afh,064h,014h,001h,002h,01eh	; 7553  .....d.....d....
	defb 0bdh,064h,000h,001h,017h,004h,08eh,063h,000h,005h,017h,002h,0ach,063h,000h,019h	; 7563  .d.....c.....c..
	defb 017h,002h,0a1h,063h,000h,01bh,017h,004h,08eh,063h,015h,007h,001h,012h,05ch,062h	; 7573  ...c.....c....\b
	defb 000h,006h,017h,001h,043h,065h,000h,019h,017h,001h,043h,065h,0ffh	; 7583  ....Ce....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_81: los 7 objetos de la pantalla 0x81: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (29 bytes)
;   0x7590..0x75ad  (29 bytes)
DATA_objetos_81:
	defb 006h,000h,00dh,00dh	; 7590
	defb 006h,000h,00dh,011h	; 7594
	defb 005h,000h,004h,009h	; 7598
	defb 005h,000h,004h,014h	; 759c
	defb 017h,000h,004h,00eh	; 75a0
	defb 005h,000h,009h,00dh	; 75a4
	defb 005h,000h,009h,010h	; 75a8
	defb 0ffh	; 75ac

; ----------------------------------------------------------------------
; DATOS sprites_81: los 0 grupos de sprites de la pantalla 0x81: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x75ad..0x75ae  (1 bytes)
DATA_sprites_81:
	defb 0ffh	; 75ad

; ----------------------------------------------------------------------
; DATOS ordenes_82_75AE: las ordenes de pieza compartidas que usa la pantalla
;   0x82 (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (19 bytes)
;   0x75ae..0x75c1  (19 bytes)
DATA_ordenes_82_75AE:
	defb 000h,001h,017h,01eh,055h,063h,000h,001h,004h,01eh,046h,063h,013h,001h,004h,01eh	; 75ae  ....Uc....Fc....
	defb 030h,063h,0ffh	; 75be

; ----------------------------------------------------------------------
; DATOS ordenes_82_75C1: las ordenes de pieza de la pantalla 0x82 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (10 bytes)
;   0x75c1..0x75cb  (10 bytes)
DATA_ordenes_82_75C1:
	defb 0feh,0aeh,075h,013h,001h,001h,01eh,043h,065h,0ffh	; 75c1  ..u....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_82: los 2 objetos de la pantalla 0x82: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x75cb..0x75d4  (9 bytes)
DATA_objetos_82:
	defb 016h,000h,000h,012h	; 75cb
	defb 016h,000h,013h,019h	; 75cf
	defb 0ffh	; 75d3

; ----------------------------------------------------------------------
; DATOS sprites_82: los 0 grupos de sprites de la pantalla 0x82: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x75d4..0x75d5  (1 bytes)
DATA_sprites_82:
	defb 0ffh	; 75d4

; ----------------------------------------------------------------------
; DATOS ordenes_83_75D5: las ordenes de pieza de la pantalla 0x83 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x75d5..0x75e7  (18 bytes)
DATA_ordenes_83_75D5:
	defb 0feh,0aeh,075h,093h,011h,013h,063h,094h,013h,013h,063h,013h,001h,001h,01eh,043h	; 75d5  ..u...c...c....C
	defb 065h,0ffh	; 75e5

; ----------------------------------------------------------------------
; DATOS objetos_83: los 3 objetos de la pantalla 0x83: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x75e7..0x75f4  (13 bytes)
DATA_objetos_83:
	defb 016h,000h,000h,009h	; 75e7
	defb 016h,000h,000h,018h	; 75eb
	defb 016h,000h,013h,00fh	; 75ef
	defb 0ffh	; 75f3

; ----------------------------------------------------------------------
; DATOS sprites_83: los 0 grupos de sprites de la pantalla 0x83: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x75f4..0x75f5  (1 bytes)
DATA_sprites_83:
	defb 0ffh	; 75f4

; ----------------------------------------------------------------------
; DATOS ordenes_84_75F5: las ordenes de pieza de la pantalla 0x84 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (52 bytes)
;   0x75f5..0x7629  (52 bytes)
DATA_ordenes_84_75F5:
	defb 0feh,0aeh,075h,081h,006h,013h,063h,081h,018h,013h,063h,000h,010h,003h,006h,013h	; 75f5  ..u...c...c.....
	defb 063h,08ch,013h,06bh,063h,08eh,015h,06bh,063h,090h,011h,06bh,063h,08bh,010h,039h	; 7605  c..kc..kc..kc..9
	defb 065h,00bh,011h,002h,00eh,03fh,063h,00ch,011h,001h,00eh,05ch,062h,013h,001h,001h	; 7615  e....?c....\b...
	defb 01eh,043h,065h,0ffh	; 7625

; ----------------------------------------------------------------------
; DATOS objetos_84: los 4 objetos de la pantalla 0x84: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7629..0x763a  (17 bytes)
DATA_objetos_84:
	defb 016h,000h,000h,005h	; 7629
	defb 016h,000h,000h,00bh	; 762d
	defb 016h,000h,000h,019h	; 7631
	defb 016h,000h,013h,00ch	; 7635
	defb 0ffh	; 7639

; ----------------------------------------------------------------------
; DATOS sprites_84: los 0 grupos de sprites de la pantalla 0x84: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x763a..0x763b  (1 bytes)
DATA_sprites_84:
	defb 0ffh	; 763a

; ----------------------------------------------------------------------
; DATOS ordenes_85_763B: las ordenes de pieza de la pantalla 0x85 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (78 bytes)
;   0x763b..0x7689  (78 bytes)
DATA_ordenes_85_763B:
	defb 0feh,0aeh,075h,08ch,003h,06bh,063h,08fh,002h,06bh,063h,091h,006h,06bh,063h,00bh	; 763b  ..u..kc..kc..kc.
	defb 001h,002h,00ch,03fh,063h,08bh,00dh,03eh,065h,093h,015h,06bh,063h,085h,017h,06bh	; 764b  ...?c..>e..kc..k
	defb 063h,083h,014h,06bh,063h,081h,00ch,06bh,063h,088h,014h,039h,065h,008h,015h,002h	; 765b  c..kc..kc..9e...
	defb 00ah,03fh,063h,081h,014h,013h,063h,094h,003h,013h,063h,013h,001h,001h,01eh,043h	; 766b  .?c...c...c....C
	defb 065h,00ch,001h,001h,00ch,05ch,062h,009h,015h,001h,00ah,05ch,062h,0ffh	; 767b  e....\b....\b.

; ----------------------------------------------------------------------
; DATOS objetos_85: los 4 objetos de la pantalla 0x85: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7689..0x769a  (17 bytes)
DATA_objetos_85:
	defb 016h,000h,000h,004h	; 7689
	defb 016h,000h,000h,00dh	; 768d
	defb 016h,000h,000h,01ah	; 7691
	defb 016h,000h,013h,00ah	; 7695
	defb 0ffh	; 7699

; ----------------------------------------------------------------------
; DATOS sprites_85: los 0 grupos de sprites de la pantalla 0x85: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x769a..0x769b  (1 bytes)
DATA_sprites_85:
	defb 0ffh	; 769a

; ----------------------------------------------------------------------
; DATOS ordenes_86_769B: las ordenes de pieza de la pantalla 0x86 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (84 bytes)
;   0x769b..0x76ef  (84 bytes)
DATA_ordenes_86_769B:
	defb 0feh,0aeh,075h,080h,016h,06bh,063h,085h,004h,06bh,063h,083h,001h,06bh,063h,083h	; 769b  ..u..kc..kc..kc.
	defb 009h,06bh,063h,008h,001h,002h,00ch,03fh,063h,088h,00dh,03eh,065h,08ch,016h,06bh	; 76ab  .kc....?c..>e..k
	defb 063h,08eh,013h,06bh,063h,011h,00fh,004h,010h,06bh,063h,081h,008h,013h,063h,093h	; 76bb  c..kc....kc...c.
	defb 004h,013h,063h,094h,006h,013h,063h,08bh,012h,039h,065h,00bh,013h,002h,00ch,03fh	; 76cb  ..c...c..9e....?
	defb 063h,009h,001h,001h,00ch,05ch,062h,00ch,013h,001h,00ch,05ch,062h,013h,001h,001h	; 76db  c....\b....\b...
	defb 01eh,043h,065h,0ffh	; 76eb

; ----------------------------------------------------------------------
; DATOS objetos_86: los 7 objetos de la pantalla 0x86: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (29 bytes)
;   0x76ef..0x770c  (29 bytes)
DATA_objetos_86:
	defb 00bh,000h,011h,00ah	; 76ef
	defb 00bh,000h,011h,010h	; 76f3
	defb 00bh,000h,00ah,014h	; 76f7
	defb 00bh,000h,00ah,016h	; 76fb
	defb 016h,000h,000h,005h	; 76ff
	defb 016h,000h,000h,00dh	; 7703
	defb 016h,000h,013h,016h	; 7707
	defb 0ffh	; 770b

; ----------------------------------------------------------------------
; DATOS sprites_86: los 0 grupos de sprites de la pantalla 0x86: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x770c..0x770d  (1 bytes)
DATA_sprites_86:
	defb 0ffh	; 770c

; ----------------------------------------------------------------------
; DATOS ordenes_87_770D: las ordenes de pieza de la pantalla 0x87 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (58 bytes)
;   0x770d..0x7747  (58 bytes)
DATA_ordenes_87_770D:
	defb 0feh,0aeh,075h,080h,010h,06bh,063h,081h,005h,013h,063h,08ch,001h,06bh,063h,08eh	; 770d  ..u..kc...c..kc.
	defb 004h,06bh,063h,091h,008h,06bh,063h,00bh,001h,002h,00eh,03fh,063h,08bh,00fh,03eh	; 771d  .kc..kc....?c..>
	defb 065h,093h,002h,013h,063h,093h,00fh,013h,063h,093h,016h,06bh,063h,00ch,001h,001h	; 772d  e...c...c..kc...
	defb 00eh,05ch,062h,013h,001h,001h,01eh,043h,065h,0ffh	; 773d  .\b....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_87: los 8 objetos de la pantalla 0x87: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (33 bytes)
;   0x7747..0x7768  (33 bytes)
DATA_objetos_87:
	defb 00bh,000h,00ah,007h	; 7747
	defb 00bh,000h,00ah,00ah	; 774b
	defb 00bh,000h,011h,012h	; 774f
	defb 00bh,000h,011h,015h	; 7753
	defb 00bh,000h,011h,018h	; 7757
	defb 016h,000h,000h,00bh	; 775b
	defb 016h,000h,000h,010h	; 775f
	defb 016h,000h,000h,016h	; 7763
	defb 0ffh	; 7767

; ----------------------------------------------------------------------
; DATOS sprites_87: los 0 grupos de sprites de la pantalla 0x87: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7768..0x7769  (1 bytes)
DATA_sprites_87:
	defb 0ffh	; 7768

; ----------------------------------------------------------------------
; DATOS ordenes_88_7769: las ordenes de pieza de la pantalla 0x88 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (10 bytes)
;   0x7769..0x7773  (10 bytes)
DATA_ordenes_88_7769:
	defb 0feh,0aeh,075h,013h,001h,001h,01eh,043h,065h,0ffh	; 7769  ..u....Ce.

; ----------------------------------------------------------------------
; DATOS objetos_88: los 8 objetos de la pantalla 0x88: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (33 bytes)
;   0x7773..0x7794  (33 bytes)
DATA_objetos_88:
	defb 00bh,000h,011h,00bh	; 7773
	defb 00bh,000h,011h,00eh	; 7777
	defb 00bh,000h,011h,016h	; 777b
	defb 016h,000h,000h,005h	; 777f
	defb 016h,000h,000h,00fh	; 7783
	defb 016h,000h,000h,014h	; 7787
	defb 016h,000h,013h,008h	; 778b
	defb 016h,000h,013h,018h	; 778f
	defb 0ffh	; 7793

; ----------------------------------------------------------------------
; DATOS sprites_88: los 0 grupos de sprites de la pantalla 0x88: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7794..0x7795  (1 bytes)
DATA_sprites_88:
	defb 0ffh	; 7794

; ----------------------------------------------------------------------
; DATOS ordenes_89_7795: las ordenes de pieza de la pantalla 0x89 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (14 bytes)
;   0x7795..0x77a3  (14 bytes)
DATA_ordenes_89_7795:
	defb 0feh,0aeh,075h,013h,001h,001h,01eh,043h,065h,086h,012h,053h,07eh,0ffh	; 7795  ..u....Ce..S~.

; ----------------------------------------------------------------------
; DATOS objetos_89: los 6 objetos de la pantalla 0x89: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (25 bytes)
;   0x77a3..0x77bc  (25 bytes)
DATA_objetos_89:
	defb 013h,000h,00ah,016h	; 77a3
	defb 00bh,000h,011h,010h	; 77a7
	defb 00bh,000h,011h,012h	; 77ab
	defb 00bh,000h,011h,015h	; 77af
	defb 016h,000h,000h,00ah	; 77b3
	defb 016h,000h,000h,011h	; 77b7
	defb 0ffh	; 77bb

; ----------------------------------------------------------------------
; DATOS sprites_89: los 0 grupos de sprites de la pantalla 0x89: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x77bc..0x77bd  (1 bytes)
DATA_sprites_89:
	defb 0ffh	; 77bc

; ----------------------------------------------------------------------
; DATOS ordenes_4B_77BD: las ordenes de pieza compartidas que usa la pantalla
;   0x4B (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (125 bytes)
;   0x77bd..0x783a  (125 bytes)
DATA_ordenes_4B_77BD:
	defb 000h,001h,017h,01eh,0a4h,066h,003h,004h,011h,008h,08eh,066h,003h,014h,011h,008h	; 77bd  .....f.....f....
	defb 099h,066h,003h,00ch,004h,008h,0e8h,065h,006h,00ch,001h,008h,0c0h,065h,00fh,00ch	; 77cd  .f.....e.....e..
	defb 001h,008h,0c4h,065h,010h,00ch,001h,008h,0b4h,065h,011h,00ch,003h,008h,0e8h,065h	; 77dd  ...e.....e.....e
	defb 012h,00ch,001h,008h,0b4h,065h,083h,008h,030h,066h,083h,014h,043h,066h,08fh,007h	; 77ed  .....e..0f..Cf..
	defb 056h,066h,08fh,014h,072h,066h,014h,007h,001h,012h,043h,065h,08fh,008h,016h,066h	; 77fd  Vf..rf....Ce...f
	defb 08fh,017h,00fh,066h,003h,006h,011h,001h,043h,065h,003h,019h,011h,001h,043h,065h	; 780d  ...f....Ce....Ce
	defb 003h,00eh,004h,004h,0b2h,066h,083h,00ch,0b6h,066h,085h,00dh,0b6h,066h,083h,012h	; 781d  .....f...f...f..
	defb 0abh,066h,085h,011h,0abh,066h,006h,00dh,001h,006h,0e1h,066h,0ffh	; 782d  .f...f.....f.

; ----------------------------------------------------------------------
; DATOS ordenes_4B_783A: las ordenes de pieza de la pantalla 0x4B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (17 bytes)
;   0x783a..0x784b  (17 bytes)
DATA_ordenes_4B_783A:
	defb 0feh,0bdh,077h,0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h	; 783a  ..w.Mx...b.....f
	defb 0ffh	; 784a

; ----------------------------------------------------------------------
; DATOS objetos_4B: los 0 objetos de la pantalla 0x4B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x784b..0x784c  (1 bytes)
DATA_objetos_4B:
	defb 0ffh	; 784b

; ----------------------------------------------------------------------
; DATOS sprites_4B: los 0 grupos de sprites de la pantalla 0x4B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x784c..0x784d  (1 bytes)
DATA_sprites_4B:
	defb 0ffh	; 784c

; ----------------------------------------------------------------------
; DATOS ordenes_4B_784D: las ordenes de pieza compartidas que usa la pantalla
;   0x4B (p03:BBA2: forma corta con el bit 7, larga sin el, 0xFE + puntero,
;   0xFF acaba); lo leen p03:BBA2 (41 bytes)
;   0x784d..0x7876  (41 bytes)
DATA_ordenes_4B_784D:
	defb 007h,00ch,008h,008h,0e4h,065h,00eh,00ch,001h,008h,0fch,065h,007h,00dh,007h,001h	; 784d  .....e.....e....
	defb 0d8h,065h,007h,012h,007h,001h,0dch,065h,08bh,00dh,0f8h,065h,08bh,00ch,0fch,065h	; 785d  .e.....e...e...e
	defb 08bh,012h,0f4h,065h,08bh,013h,0fch,065h,0ffh	; 786d  ...e...e.

; ----------------------------------------------------------------------
; DATOS ordenes_4C_7876: las ordenes de pieza de la pantalla 0x4C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x7876..0x7888  (18 bytes)
DATA_ordenes_4C_7876:
	defb 0feh,04dh,078h,088h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h,08ah,00fh,0c2h	; 7876  .Mx...b.....f...
	defb 066h,0ffh	; 7886

; ----------------------------------------------------------------------
; DATOS objetos_4C: los 2 objetos de la pantalla 0x4C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x7888..0x7891  (9 bytes)
DATA_objetos_4C:
	defb 003h,000h,00ah,00fh	; 7888
	defb 01ah,000h,009h,00fh	; 788c
	defb 0ffh	; 7890

; ----------------------------------------------------------------------
; DATOS sprites_4C: los 0 grupos de sprites de la pantalla 0x4C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7891..0x7892  (1 bytes)
DATA_sprites_4C:
	defb 0ffh	; 7891

; ----------------------------------------------------------------------
; DATOS ordenes_4D_7892: las ordenes de pieza de la pantalla 0x4D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (28 bytes)
;   0x7892..0x78ae  (28 bytes)
DATA_ordenes_4D_7892:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 7892  .Mx.....b...b...
	defb 002h,0bdh,066h,08ah,00ch,0c2h,066h,08ah,012h,004h,066h,0ffh	; 78a2  ..f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_4D: los 3 objetos de la pantalla 0x4D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x78ae..0x78bb  (13 bytes)
DATA_objetos_4D:
	defb 003h,000h,00ah,00ch	; 78ae
	defb 002h,000h,00ah,012h	; 78b2
	defb 01ah,000h,009h,00fh	; 78b6
	defb 0ffh	; 78ba

; ----------------------------------------------------------------------
; DATOS sprites_4D: los 0 grupos de sprites de la pantalla 0x4D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x78bb..0x78bc  (1 bytes)
DATA_sprites_4D:
	defb 0ffh	; 78bb

; ----------------------------------------------------------------------
; DATOS ordenes_4E_78BC: las ordenes de pieza de la pantalla 0x4E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x78bc..0x78ce  (18 bytes)
DATA_ordenes_4E_78BC:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00fh,004h,066h,08ch,00fh,0c2h	; 78bc  .Mx.....b...f...
	defb 066h,0ffh	; 78cc

; ----------------------------------------------------------------------
; DATOS objetos_4E: los 3 objetos de la pantalla 0x4E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x78ce..0x78db  (13 bytes)
DATA_objetos_4E:
	defb 003h,000h,00ch,00fh	; 78ce
	defb 002h,000h,00ah,00fh	; 78d2
	defb 01ah,000h,009h,00fh	; 78d6
	defb 0ffh	; 78da

; ----------------------------------------------------------------------
; DATOS sprites_4E: los 0 grupos de sprites de la pantalla 0x4E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x78db..0x78dc  (1 bytes)
DATA_sprites_4E:
	defb 0ffh	; 78db

; ----------------------------------------------------------------------
; DATOS ordenes_4F_78DC: las ordenes de pieza de la pantalla 0x4F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (28 bytes)
;   0x78dc..0x78f8  (28 bytes)
DATA_ordenes_4F_78DC:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 78dc  .Mx.....b...b...
	defb 002h,0bdh,066h,08ah,00ch,004h,066h,08ah,012h,0c2h,066h,0ffh	; 78ec  ..f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_4F: los 3 objetos de la pantalla 0x4F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x78f8..0x7905  (13 bytes)
DATA_objetos_4F:
	defb 003h,000h,00ah,012h	; 78f8
	defb 002h,000h,00ah,00ch	; 78fc
	defb 01ah,000h,009h,00fh	; 7900
	defb 0ffh	; 7904

; ----------------------------------------------------------------------
; DATOS sprites_4F: los 0 grupos de sprites de la pantalla 0x4F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7905..0x7906  (1 bytes)
DATA_sprites_4F:
	defb 0ffh	; 7905

; ----------------------------------------------------------------------
; DATOS ordenes_50_7906: las ordenes de pieza de la pantalla 0x50 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7906..0x791c  (22 bytes)
DATA_ordenes_50_7906:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,088h,00eh,01dh,066h,08ah,00ch,004h	; 7906  .Mx.....b...f...
	defb 066h,08ah,012h,004h,066h,0ffh	; 7916

; ----------------------------------------------------------------------
; DATOS objetos_50: los 4 objetos de la pantalla 0x50: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x791c..0x792d  (17 bytes)
DATA_objetos_50:
	defb 017h,000h,008h,00eh	; 791c
	defb 002h,000h,00ah,00ch	; 7920
	defb 002h,000h,00ah,012h	; 7924
	defb 01ah,000h,009h,00fh	; 7928
	defb 0ffh	; 792c

; ----------------------------------------------------------------------
; DATOS sprites_50: los 0 grupos de sprites de la pantalla 0x50: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x792d..0x792e  (1 bytes)
DATA_sprites_50:
	defb 0ffh	; 792d

; ----------------------------------------------------------------------
; DATOS ordenes_51_792E: las ordenes de pieza de la pantalla 0x51 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (17 bytes)
;   0x792e..0x793f  (17 bytes)
DATA_ordenes_51_792E:
	defb 0feh,0bdh,077h,0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h	; 792e  ..w.Mx...b.....f
	defb 0ffh	; 793e

; ----------------------------------------------------------------------
; DATOS objetos_51: los 0 objetos de la pantalla 0x51: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x793f..0x7940  (1 bytes)
DATA_objetos_51:
	defb 0ffh	; 793f

; ----------------------------------------------------------------------
; DATOS sprites_51: los 0 grupos de sprites de la pantalla 0x51: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7940..0x7941  (1 bytes)
DATA_sprites_51:
	defb 0ffh	; 7940

; ----------------------------------------------------------------------
; DATOS ordenes_52_7941: las ordenes de pieza de la pantalla 0x52 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7941..0x7957  (22 bytes)
DATA_ordenes_52_7941:
	defb 0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h,08ch,00fh,004h	; 7941  .Mx...b.....f...
	defb 066h,087h,00fh,0c2h,066h,0ffh	; 7951

; ----------------------------------------------------------------------
; DATOS objetos_52: los 3 objetos de la pantalla 0x52: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7957..0x7964  (13 bytes)
DATA_objetos_52:
	defb 003h,000h,007h,00fh	; 7957
	defb 002h,000h,00ch,00fh	; 795b
	defb 01ah,000h,009h,00fh	; 795f
	defb 0ffh	; 7963

; ----------------------------------------------------------------------
; DATOS sprites_52: los 0 grupos de sprites de la pantalla 0x52: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7964..0x7965  (1 bytes)
DATA_sprites_52:
	defb 0ffh	; 7964

; ----------------------------------------------------------------------
; DATOS ordenes_53_7965: las ordenes de pieza de la pantalla 0x53 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (28 bytes)
;   0x7965..0x7981  (28 bytes)
DATA_ordenes_53_7965:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,007h,00fh,002h,002h,0bdh,066h,089h	; 7965  .Mx.....b.....f.
	defb 00eh,0b1h,062h,08ah,012h,0c2h,066h,08ch,00fh,004h,066h,0ffh	; 7975  ..b...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_53: los 3 objetos de la pantalla 0x53: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7981..0x798e  (13 bytes)
DATA_objetos_53:
	defb 003h,000h,00ah,012h	; 7981
	defb 002h,000h,00ch,00fh	; 7985
	defb 01ah,000h,009h,00fh	; 7989
	defb 0ffh	; 798d

; ----------------------------------------------------------------------
; DATOS sprites_53: los 0 grupos de sprites de la pantalla 0x53: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x798e..0x798f  (1 bytes)
DATA_sprites_53:
	defb 0ffh	; 798e

; ----------------------------------------------------------------------
; DATOS ordenes_54_798F: las ordenes de pieza de la pantalla 0x54 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x798f..0x79a5  (22 bytes)
DATA_ordenes_54_798F:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,004h,066h,087h,00ch,0c2h	; 798f  .Mx.....b...f...
	defb 066h,087h,00fh,004h,066h,0ffh	; 799f

; ----------------------------------------------------------------------
; DATOS objetos_54: los 4 objetos de la pantalla 0x54: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x79a5..0x79b6  (17 bytes)
DATA_objetos_54:
	defb 002h,000h,00ah,00ch	; 79a5
	defb 003h,000h,007h,00ch	; 79a9
	defb 002h,000h,007h,00fh	; 79ad
	defb 01ah,000h,009h,00fh	; 79b1
	defb 0ffh	; 79b5

; ----------------------------------------------------------------------
; DATOS sprites_54: los 0 grupos de sprites de la pantalla 0x54: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x79b6..0x79b7  (1 bytes)
DATA_sprites_54:
	defb 0ffh	; 79b6

; ----------------------------------------------------------------------
; DATOS ordenes_55_79B7: las ordenes de pieza de la pantalla 0x55 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x79b7..0x79c9  (18 bytes)
DATA_ordenes_55_79B7:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,004h,066h,08ah,00fh,0c2h	; 79b7  .Mx.....b...f...
	defb 066h,0ffh	; 79c7

; ----------------------------------------------------------------------
; DATOS objetos_55: los 3 objetos de la pantalla 0x55: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x79c9..0x79d6  (13 bytes)
DATA_objetos_55:
	defb 002h,000h,00ah,00ch	; 79c9
	defb 003h,000h,00ah,00fh	; 79cd
	defb 01ah,000h,009h,00fh	; 79d1
	defb 0ffh	; 79d5

; ----------------------------------------------------------------------
; DATOS sprites_55: los 0 grupos de sprites de la pantalla 0x55: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x79d6..0x79d7  (1 bytes)
DATA_sprites_55:
	defb 0ffh	; 79d6

; ----------------------------------------------------------------------
; DATOS ordenes_56_79D7: las ordenes de pieza de la pantalla 0x56 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (32 bytes)
;   0x79d7..0x79f7  (32 bytes)
DATA_ordenes_56_79D7:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 79d7  .Mx.....b...b...
	defb 002h,0bdh,066h,088h,00ch,004h,066h,088h,012h,004h,066h,08ch,00fh,0c2h,066h,0ffh	; 79e7  ..f...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_56: los 4 objetos de la pantalla 0x56: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x79f7..0x7a08  (17 bytes)
DATA_objetos_56:
	defb 002h,000h,008h,00ch	; 79f7
	defb 002h,000h,008h,012h	; 79fb
	defb 003h,000h,00ch,00fh	; 79ff
	defb 01ah,000h,009h,00fh	; 7a03
	defb 0ffh	; 7a07

; ----------------------------------------------------------------------
; DATOS sprites_56: los 0 grupos de sprites de la pantalla 0x56: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7a08..0x7a09  (1 bytes)
DATA_sprites_56:
	defb 0ffh	; 7a08

; ----------------------------------------------------------------------
; DATOS ordenes_57_7A09: las ordenes de pieza de la pantalla 0x57 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (28 bytes)
;   0x7a09..0x7a25  (28 bytes)
DATA_ordenes_57_7A09:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 7a09  .Mx.....b...b...
	defb 002h,0bdh,066h,089h,00ch,0c2h,066h,08ch,00fh,004h,066h,0ffh	; 7a19  ..f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_57: los 3 objetos de la pantalla 0x57: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7a25..0x7a32  (13 bytes)
DATA_objetos_57:
	defb 002h,000h,00ch,00fh	; 7a25
	defb 003h,000h,009h,00ch	; 7a29
	defb 01ah,000h,009h,00fh	; 7a2d
	defb 0ffh	; 7a31

; ----------------------------------------------------------------------
; DATOS sprites_57: los 0 grupos de sprites de la pantalla 0x57: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7a32..0x7a33  (1 bytes)
DATA_sprites_57:
	defb 0ffh	; 7a32

; ----------------------------------------------------------------------
; DATOS ordenes_58_7A33: las ordenes de pieza de la pantalla 0x58 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (16 bytes)
;   0x7a33..0x7a43  (16 bytes)
DATA_ordenes_58_7A33:
	defb 0feh,04dh,078h,08ah,00eh,01dh,066h,08ch,00ch,004h,066h,08ch,012h,004h,066h,0ffh	; 7a33  .Mx...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_58: los 3 objetos de la pantalla 0x58: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7a43..0x7a50  (13 bytes)
DATA_objetos_58:
	defb 017h,000h,00ah,00eh	; 7a43
	defb 002h,000h,00ch,012h	; 7a47
	defb 002h,000h,00ch,00ch	; 7a4b
	defb 0ffh	; 7a4f

; ----------------------------------------------------------------------
; DATOS sprites_58: los 0 grupos de sprites de la pantalla 0x58: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7a50..0x7a51  (1 bytes)
DATA_sprites_58:
	defb 0ffh	; 7a50

; ----------------------------------------------------------------------
; DATOS ordenes_59_7A51: las ordenes de pieza de la pantalla 0x59 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (17 bytes)
;   0x7a51..0x7a62  (17 bytes)
DATA_ordenes_59_7A51:
	defb 0feh,0bdh,077h,0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h	; 7a51  ..w.Mx...b.....f
	defb 0ffh	; 7a61

; ----------------------------------------------------------------------
; DATOS objetos_59: los 0 objetos de la pantalla 0x59: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (1 bytes)
;   0x7a62..0x7a63  (1 bytes)
DATA_objetos_59:
	defb 0ffh	; 7a62

; ----------------------------------------------------------------------
; DATOS sprites_59: los 0 grupos de sprites de la pantalla 0x59: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7a63..0x7a64  (1 bytes)
DATA_sprites_59:
	defb 0ffh	; 7a63

; ----------------------------------------------------------------------
; DATOS ordenes_5A_7A64: las ordenes de pieza de la pantalla 0x5A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (32 bytes)
;   0x7a64..0x7a84  (32 bytes)
DATA_ordenes_5A_7A64:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 7a64  .Mx.....b...b...
	defb 002h,0bdh,066h,08ah,00ch,004h,066h,08ah,012h,004h,066h,08ch,00fh,0c2h,066h,0ffh	; 7a74  ..f...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_5A: los 4 objetos de la pantalla 0x5A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7a84..0x7a95  (17 bytes)
DATA_objetos_5A:
	defb 002h,000h,00ah,00ch	; 7a84
	defb 002h,000h,00ah,012h	; 7a88
	defb 003h,000h,00ch,00fh	; 7a8c
	defb 01ah,000h,009h,00fh	; 7a90
	defb 0ffh	; 7a94

; ----------------------------------------------------------------------
; DATOS sprites_5A: los 0 grupos de sprites de la pantalla 0x5A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7a95..0x7a96  (1 bytes)
DATA_sprites_5A:
	defb 0ffh	; 7a95

; ----------------------------------------------------------------------
; DATOS ordenes_5B_7A96: las ordenes de pieza de la pantalla 0x5B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (12 bytes)
;   0x7a96..0x7aa2  (12 bytes)
DATA_ordenes_5B_7A96:
	defb 0feh,04dh,078h,089h,00ch,0c2h,066h,08ch,00fh,004h,066h,0ffh	; 7a96  .Mx...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_5B: los 3 objetos de la pantalla 0x5B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7aa2..0x7aaf  (13 bytes)
DATA_objetos_5B:
	defb 002h,000h,00ch,00fh	; 7aa2
	defb 003h,000h,009h,00ch	; 7aa6
	defb 01ah,000h,009h,00fh	; 7aaa
	defb 0ffh	; 7aae

; ----------------------------------------------------------------------
; DATOS sprites_5B: los 0 grupos de sprites de la pantalla 0x5B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7aaf..0x7ab0  (1 bytes)
DATA_sprites_5B:
	defb 0ffh	; 7aaf

; ----------------------------------------------------------------------
; DATOS ordenes_5C_7AB0: las ordenes de pieza de la pantalla 0x5C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x7ab0..0x7ac2  (18 bytes)
DATA_ordenes_5C_7AB0:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ch,00fh,004h,066h,087h,00fh,0c2h	; 7ab0  .Mx.....b...f...
	defb 066h,0ffh	; 7ac0

; ----------------------------------------------------------------------
; DATOS objetos_5C: los 3 objetos de la pantalla 0x5C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7ac2..0x7acf  (13 bytes)
DATA_objetos_5C:
	defb 002h,000h,00ch,00fh	; 7ac2
	defb 003h,000h,007h,00fh	; 7ac6
	defb 01ah,000h,009h,00fh	; 7aca
	defb 0ffh	; 7ace

; ----------------------------------------------------------------------
; DATOS sprites_5C: los 0 grupos de sprites de la pantalla 0x5C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7acf..0x7ad0  (1 bytes)
DATA_sprites_5C:
	defb 0ffh	; 7acf

; ----------------------------------------------------------------------
; DATOS ordenes_5D_7AD0: las ordenes de pieza de la pantalla 0x5D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (16 bytes)
;   0x7ad0..0x7ae0  (16 bytes)
DATA_ordenes_5D_7AD0:
	defb 0feh,04dh,078h,08ch,00fh,0c2h,066h,08ah,00ch,004h,066h,08ah,012h,004h,066h,0ffh	; 7ad0  .Mx...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_5D: los 4 objetos de la pantalla 0x5D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7ae0..0x7af1  (17 bytes)
DATA_objetos_5D:
	defb 003h,000h,00ch,00fh	; 7ae0
	defb 002h,000h,00ah,00ch	; 7ae4
	defb 002h,000h,00ah,012h	; 7ae8
	defb 01ah,000h,009h,00fh	; 7aec
	defb 0ffh	; 7af0

; ----------------------------------------------------------------------
; DATOS sprites_5D: los 0 grupos de sprites de la pantalla 0x5D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7af1..0x7af2  (1 bytes)
DATA_sprites_5D:
	defb 0ffh	; 7af1

; ----------------------------------------------------------------------
; DATOS ordenes_5E_7AF2: las ordenes de pieza de la pantalla 0x5E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (18 bytes)
;   0x7af2..0x7b04  (18 bytes)
DATA_ordenes_5E_7AF2:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,0c2h,066h,088h,00fh,004h	; 7af2  .Mx.....b...f...
	defb 066h,0ffh	; 7b02

; ----------------------------------------------------------------------
; DATOS objetos_5E: los 3 objetos de la pantalla 0x5E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (13 bytes)
;   0x7b04..0x7b11  (13 bytes)
DATA_objetos_5E:
	defb 002h,000h,008h,00fh	; 7b04
	defb 003h,000h,00ah,00ch	; 7b08
	defb 01ah,000h,009h,00fh	; 7b0c
	defb 0ffh	; 7b10

; ----------------------------------------------------------------------
; DATOS sprites_5E: los 0 grupos de sprites de la pantalla 0x5E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7b11..0x7b12  (1 bytes)
DATA_sprites_5E:
	defb 0ffh	; 7b11

; ----------------------------------------------------------------------
; DATOS ordenes_5F_7B12: las ordenes de pieza de la pantalla 0x5F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (32 bytes)
;   0x7b12..0x7b32  (32 bytes)
DATA_ordenes_5F_7B12:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00eh,0b1h,062h,007h,00fh,002h	; 7b12  .Mx.....b...b...
	defb 002h,0bdh,066h,08ah,00ch,004h,066h,08ah,012h,004h,066h,087h,00fh,0c2h,066h,0ffh	; 7b22  ..f...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_5F: los 4 objetos de la pantalla 0x5F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7b32..0x7b43  (17 bytes)
DATA_objetos_5F:
	defb 002h,000h,00ah,00ch	; 7b32
	defb 002h,000h,00ah,012h	; 7b36
	defb 003h,000h,007h,00fh	; 7b3a
	defb 01ah,000h,009h,00fh	; 7b3e
	defb 0ffh	; 7b42

; ----------------------------------------------------------------------
; DATOS sprites_5F: los 0 grupos de sprites de la pantalla 0x5F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7b43..0x7b44  (1 bytes)
DATA_sprites_5F:
	defb 0ffh	; 7b43

; ----------------------------------------------------------------------
; DATOS ordenes_60_7B44: las ordenes de pieza de la pantalla 0x60 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (14 bytes)
;   0x7b44..0x7b52  (14 bytes)
DATA_ordenes_60_7B44:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,087h,00fh,0c2h,066h,0ffh	; 7b44  .Mx.....b...f.

; ----------------------------------------------------------------------
; DATOS objetos_60: los 2 objetos de la pantalla 0x60: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (9 bytes)
;   0x7b52..0x7b5b  (9 bytes)
DATA_objetos_60:
	defb 003h,000h,007h,00fh	; 7b52
	defb 01ah,000h,009h,00fh	; 7b56
	defb 0ffh	; 7b5a

; ----------------------------------------------------------------------
; DATOS sprites_60: los 0 grupos de sprites de la pantalla 0x60: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7b5b..0x7b5c  (1 bytes)
DATA_sprites_60:
	defb 0ffh	; 7b5b

; ----------------------------------------------------------------------
; DATOS ordenes_61_7B5C: las ordenes de pieza de la pantalla 0x61 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7b5c..0x7b72  (22 bytes)
DATA_ordenes_61_7B5C:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ch,00fh,0c2h,066h,089h,00ch,004h	; 7b5c  .Mx.....b...f...
	defb 066h,089h,012h,004h,066h,0ffh	; 7b6c

; ----------------------------------------------------------------------
; DATOS objetos_61: los 4 objetos de la pantalla 0x61: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7b72..0x7b83  (17 bytes)
DATA_objetos_61:
	defb 003h,000h,00ch,00fh	; 7b72
	defb 002h,000h,009h,00ch	; 7b76
	defb 002h,000h,009h,012h	; 7b7a
	defb 01ah,000h,009h,00fh	; 7b7e
	defb 0ffh	; 7b82

; ----------------------------------------------------------------------
; DATOS sprites_61: los 0 grupos de sprites de la pantalla 0x61: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7b83..0x7b84  (1 bytes)
DATA_sprites_61:
	defb 0ffh	; 7b83

; ----------------------------------------------------------------------
; DATOS ordenes_62_7B84: las ordenes de pieza de la pantalla 0x62 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7b84..0x7b9a  (22 bytes)
DATA_ordenes_62_7B84:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,004h,066h,08ah,012h,004h	; 7b84  .Mx.....b...f...
	defb 066h,08ah,00fh,004h,066h,0ffh	; 7b94

; ----------------------------------------------------------------------
; DATOS objetos_62: los 5 objetos de la pantalla 0x62: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7b9a..0x7baf  (21 bytes)
DATA_objetos_62:
	defb 002h,000h,00ah,00ch	; 7b9a
	defb 002h,000h,00ah,012h	; 7b9e
	defb 002h,000h,00ah,00fh	; 7ba2
	defb 003h,000h,007h,00fh	; 7ba6
	defb 01ah,000h,009h,00fh	; 7baa
	defb 0ffh	; 7bae

; ----------------------------------------------------------------------
; DATOS sprites_62: los 0 grupos de sprites de la pantalla 0x62: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7baf..0x7bb0  (1 bytes)
DATA_sprites_62:
	defb 0ffh	; 7baf

; ----------------------------------------------------------------------
; DATOS ordenes_63_7BB0: las ordenes de pieza de la pantalla 0x63 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7bb0..0x7bc6  (22 bytes)
DATA_ordenes_63_7BB0:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,088h,00eh,01dh,066h,088h,00ch,004h	; 7bb0  .Mx.....b...f...
	defb 066h,08ah,012h,004h,066h,0ffh	; 7bc0

; ----------------------------------------------------------------------
; DATOS objetos_63: los 4 objetos de la pantalla 0x63: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7bc6..0x7bd7  (17 bytes)
DATA_objetos_63:
	defb 017h,000h,008h,00eh	; 7bc6
	defb 002h,000h,008h,00ch	; 7bca
	defb 002h,000h,00ah,012h	; 7bce
	defb 01ah,000h,009h,00fh	; 7bd2
	defb 0ffh	; 7bd6

; ----------------------------------------------------------------------
; DATOS sprites_63: los 0 grupos de sprites de la pantalla 0x63: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7bd7..0x7bd8  (1 bytes)
DATA_sprites_63:
	defb 0ffh	; 7bd7

; ----------------------------------------------------------------------
; DATOS ordenes_64_7BD8: las ordenes de pieza de la pantalla 0x64 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (19 bytes)
;   0x7bd8..0x7beb  (19 bytes)
DATA_ordenes_64_7BD8:
	defb 0feh,0bdh,077h,0feh,04dh,078h,08ah,00ch,004h,066h,08ah,00fh,0c2h,066h,08ah,012h	; 7bd8  ..w.Mx...f...f..
	defb 004h,066h,0ffh	; 7be8

; ----------------------------------------------------------------------
; DATOS objetos_64: los 4 objetos de la pantalla 0x64: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7beb..0x7bfc  (17 bytes)
DATA_objetos_64:
	defb 002h,000h,00ah,00ch	; 7beb
	defb 003h,000h,00ah,00fh	; 7bef
	defb 002h,000h,00ah,012h	; 7bf3
	defb 01ah,000h,009h,00fh	; 7bf7
	defb 0ffh	; 7bfb

; ----------------------------------------------------------------------
; DATOS sprites_64: los 0 grupos de sprites de la pantalla 0x64: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7bfc..0x7bfd  (1 bytes)
DATA_sprites_64:
	defb 0ffh	; 7bfc

; ----------------------------------------------------------------------
; DATOS ordenes_65_7BFD: las ordenes de pieza de la pantalla 0x65 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7bfd..0x7c13  (22 bytes)
DATA_ordenes_65_7BFD:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ch,012h,004h,066h,08ah,012h,0c2h	; 7bfd  .Mx.....b...f...
	defb 066h,088h,012h,004h,066h,0ffh	; 7c0d

; ----------------------------------------------------------------------
; DATOS objetos_65: los 4 objetos de la pantalla 0x65: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7c13..0x7c24  (17 bytes)
DATA_objetos_65:
	defb 002h,000h,00ch,012h	; 7c13
	defb 002h,000h,008h,012h	; 7c17
	defb 003h,000h,00ah,012h	; 7c1b
	defb 01ah,000h,009h,00fh	; 7c1f
	defb 0ffh	; 7c23

; ----------------------------------------------------------------------
; DATOS sprites_65: los 0 grupos de sprites de la pantalla 0x65: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7c24..0x7c25  (1 bytes)
DATA_sprites_65:
	defb 0ffh	; 7c24

; ----------------------------------------------------------------------
; DATOS ordenes_66_7C25: las ordenes de pieza de la pantalla 0x66 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7c25..0x7c3b  (22 bytes)
DATA_ordenes_66_7C25:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ch,00ch,004h,066h,08ah,00fh,004h	; 7c25  .Mx.....b...f...
	defb 066h,088h,00ch,0c2h,066h,0ffh	; 7c35

; ----------------------------------------------------------------------
; DATOS objetos_66: los 4 objetos de la pantalla 0x66: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7c3b..0x7c4c  (17 bytes)
DATA_objetos_66:
	defb 002h,000h,00ch,00ch	; 7c3b
	defb 002h,000h,00ah,00fh	; 7c3f
	defb 003h,000h,008h,00ch	; 7c43
	defb 01ah,000h,009h,00fh	; 7c47
	defb 0ffh	; 7c4b

; ----------------------------------------------------------------------
; DATOS sprites_66: los 0 grupos de sprites de la pantalla 0x66: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7c4c..0x7c4d  (1 bytes)
DATA_sprites_66:
	defb 0ffh	; 7c4c

; ----------------------------------------------------------------------
; DATOS ordenes_67_7C4D: las ordenes de pieza de la pantalla 0x67 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (16 bytes)
;   0x7c4d..0x7c5d  (16 bytes)
DATA_ordenes_67_7C4D:
	defb 0feh,04dh,078h,08ch,00fh,0c2h,066h,08ah,00dh,004h,066h,08ah,011h,004h,066h,0ffh	; 7c4d  .Mx...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_67: los 4 objetos de la pantalla 0x67: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7c5d..0x7c6e  (17 bytes)
DATA_objetos_67:
	defb 002h,000h,00ah,00dh	; 7c5d
	defb 002h,000h,00ah,011h	; 7c61
	defb 003h,000h,00ch,00fh	; 7c65
	defb 01ah,000h,009h,00fh	; 7c69
	defb 0ffh	; 7c6d

; ----------------------------------------------------------------------
; DATOS sprites_67: los 0 grupos de sprites de la pantalla 0x67: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7c6e..0x7c6f  (1 bytes)
DATA_sprites_67:
	defb 0ffh	; 7c6e

; ----------------------------------------------------------------------
; DATOS ordenes_68_7C6F: las ordenes de pieza de la pantalla 0x68 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7c6f..0x7c85  (22 bytes)
DATA_ordenes_68_7C6F:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00dh,004h,066h,08ah,00fh,0c2h	; 7c6f  .Mx.....b...f...
	defb 066h,08ah,011h,004h,066h,0ffh	; 7c7f

; ----------------------------------------------------------------------
; DATOS objetos_68: los 4 objetos de la pantalla 0x68: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7c85..0x7c96  (17 bytes)
DATA_objetos_68:
	defb 002h,000h,00ah,00dh	; 7c85
	defb 002h,000h,00ah,011h	; 7c89
	defb 003h,000h,00ah,00fh	; 7c8d
	defb 01ah,000h,009h,00fh	; 7c91
	defb 0ffh	; 7c95

; ----------------------------------------------------------------------
; DATOS sprites_68: los 0 grupos de sprites de la pantalla 0x68: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7c96..0x7c97  (1 bytes)
DATA_sprites_68:
	defb 0ffh	; 7c96

; ----------------------------------------------------------------------
; DATOS ordenes_69_7C97: las ordenes de pieza de la pantalla 0x69 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (16 bytes)
;   0x7c97..0x7ca7  (16 bytes)
DATA_ordenes_69_7C97:
	defb 0feh,04dh,078h,08ch,00ch,004h,066h,08ch,00fh,004h,066h,08ch,012h,0c2h,066h,0ffh	; 7c97  .Mx...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_69: los 4 objetos de la pantalla 0x69: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7ca7..0x7cb8  (17 bytes)
DATA_objetos_69:
	defb 002h,000h,00ch,00ch	; 7ca7
	defb 002h,000h,00ch,00fh	; 7cab
	defb 003h,000h,00ch,012h	; 7caf
	defb 01ah,000h,009h,00fh	; 7cb3
	defb 0ffh	; 7cb7

; ----------------------------------------------------------------------
; DATOS sprites_69: los 0 grupos de sprites de la pantalla 0x69: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7cb8..0x7cb9  (1 bytes)
DATA_sprites_69:
	defb 0ffh	; 7cb8

; ----------------------------------------------------------------------
; DATOS ordenes_6A_7CB9: las ordenes de pieza de la pantalla 0x6A (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (20 bytes)
;   0x7cb9..0x7ccd  (20 bytes)
DATA_ordenes_6A_7CB9:
	defb 0feh,04dh,078h,08ch,00ch,004h,066h,08ch,00fh,004h,066h,08ch,012h,004h,066h,088h	; 7cb9  .Mx...f...f...f.
	defb 00dh,0c2h,066h,0ffh	; 7cc9

; ----------------------------------------------------------------------
; DATOS objetos_6A: los 5 objetos de la pantalla 0x6A: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7ccd..0x7ce2  (21 bytes)
DATA_objetos_6A:
	defb 002h,000h,00ch,00ch	; 7ccd
	defb 002h,000h,00ch,00fh	; 7cd1
	defb 002h,000h,00ch,012h	; 7cd5
	defb 003h,000h,008h,00dh	; 7cd9
	defb 01ah,000h,009h,00fh	; 7cdd
	defb 0ffh	; 7ce1

; ----------------------------------------------------------------------
; DATOS sprites_6A: los 0 grupos de sprites de la pantalla 0x6A: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7ce2..0x7ce3  (1 bytes)
DATA_sprites_6A:
	defb 0ffh	; 7ce2

; ----------------------------------------------------------------------
; DATOS ordenes_6B_7CE3: las ordenes de pieza de la pantalla 0x6B (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (26 bytes)
;   0x7ce3..0x7cfd  (26 bytes)
DATA_ordenes_6B_7CE3:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,089h,00ch,004h,066h,089h,012h,004h	; 7ce3  .Mx.....b...f...
	defb 066h,088h,00fh,0c2h,066h,08ch,00fh,004h,066h,0ffh	; 7cf3  f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_6B: los 5 objetos de la pantalla 0x6B: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7cfd..0x7d12  (21 bytes)
DATA_objetos_6B:
	defb 002h,000h,009h,00ch	; 7cfd
	defb 002h,000h,009h,012h	; 7d01
	defb 003h,000h,008h,00fh	; 7d05
	defb 002h,000h,00ch,00fh	; 7d09
	defb 01ah,000h,009h,00fh	; 7d0d
	defb 0ffh	; 7d11

; ----------------------------------------------------------------------
; DATOS sprites_6B: los 0 grupos de sprites de la pantalla 0x6B: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d12..0x7d13  (1 bytes)
DATA_sprites_6B:
	defb 0ffh	; 7d12

; ----------------------------------------------------------------------
; DATOS ordenes_6C_7D13: las ordenes de pieza de la pantalla 0x6C (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (20 bytes)
;   0x7d13..0x7d27  (20 bytes)
DATA_ordenes_6C_7D13:
	defb 0feh,04dh,078h,08ah,00ch,004h,066h,08ah,00fh,0c2h,066h,08ah,012h,004h,066h,088h	; 7d13  .Mx...f...f...f.
	defb 00fh,004h,066h,0ffh	; 7d23

; ----------------------------------------------------------------------
; DATOS objetos_6C: los 5 objetos de la pantalla 0x6C: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7d27..0x7d3c  (21 bytes)
DATA_objetos_6C:
	defb 002h,000h,00ah,00ch	; 7d27
	defb 003h,000h,00ah,00fh	; 7d2b
	defb 002h,000h,00ah,012h	; 7d2f
	defb 002h,000h,008h,00fh	; 7d33
	defb 01ah,000h,009h,00fh	; 7d37
	defb 0ffh	; 7d3b

; ----------------------------------------------------------------------
; DATOS sprites_6C: los 0 grupos de sprites de la pantalla 0x6C: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d3c..0x7d3d  (1 bytes)
DATA_sprites_6C:
	defb 0ffh	; 7d3c

; ----------------------------------------------------------------------
; DATOS ordenes_6D_7D3D: las ordenes de pieza de la pantalla 0x6D (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (22 bytes)
;   0x7d3d..0x7d53  (22 bytes)
DATA_ordenes_6D_7D3D:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,004h,066h,08ah,00fh,004h	; 7d3d  .Mx.....b...f...
	defb 066h,08ah,012h,0c2h,066h,0ffh	; 7d4d

; ----------------------------------------------------------------------
; DATOS objetos_6D: los 4 objetos de la pantalla 0x6D: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7d53..0x7d64  (17 bytes)
DATA_objetos_6D:
	defb 002h,000h,00ah,00ch	; 7d53
	defb 002h,000h,00ah,00fh	; 7d57
	defb 003h,000h,00ah,012h	; 7d5b
	defb 01ah,000h,009h,00fh	; 7d5f
	defb 0ffh	; 7d63

; ----------------------------------------------------------------------
; DATOS sprites_6D: los 0 grupos de sprites de la pantalla 0x6D: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d64..0x7d65  (1 bytes)
DATA_sprites_6D:
	defb 0ffh	; 7d64

; ----------------------------------------------------------------------
; DATOS ordenes_6E_7D65: las ordenes de pieza de la pantalla 0x6E (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (16 bytes)
;   0x7d65..0x7d75  (16 bytes)
DATA_ordenes_6E_7D65:
	defb 0feh,04dh,078h,08ch,00ch,0c2h,066h,08ch,00fh,004h,066h,08ch,012h,004h,066h,0ffh	; 7d65  .Mx...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_6E: los 4 objetos de la pantalla 0x6E: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7d75..0x7d86  (17 bytes)
DATA_objetos_6E:
	defb 003h,000h,00ch,00ch	; 7d75
	defb 002h,000h,00ch,00fh	; 7d79
	defb 002h,000h,00ch,012h	; 7d7d
	defb 01ah,000h,009h,00fh	; 7d81
	defb 0ffh	; 7d85

; ----------------------------------------------------------------------
; DATOS sprites_6E: los 0 grupos de sprites de la pantalla 0x6E: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7d86..0x7d87  (1 bytes)
DATA_sprites_6E:
	defb 0ffh	; 7d86

; ----------------------------------------------------------------------
; DATOS ordenes_6F_7D87: las ordenes de pieza de la pantalla 0x6F (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (26 bytes)
;   0x7d87..0x7da1  (26 bytes)
DATA_ordenes_6F_7D87:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,08ah,00ch,004h,066h,08ah,00fh,004h	; 7d87  .Mx.....b...f...
	defb 066h,08ah,012h,004h,066h,087h,00fh,0c2h,066h,0ffh	; 7d97  f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_6F: los 5 objetos de la pantalla 0x6F: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7da1..0x7db6  (21 bytes)
DATA_objetos_6F:
	defb 002h,000h,00ah,00ch	; 7da1
	defb 002h,000h,00ah,00fh	; 7da5
	defb 002h,000h,00ah,012h	; 7da9
	defb 003h,000h,007h,00fh	; 7dad
	defb 01ah,000h,009h,00fh	; 7db1
	defb 0ffh	; 7db5

; ----------------------------------------------------------------------
; DATOS sprites_6F: los 0 grupos de sprites de la pantalla 0x6F: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7db6..0x7db7  (1 bytes)
DATA_sprites_6F:
	defb 0ffh	; 7db6

; ----------------------------------------------------------------------
; DATOS ordenes_70_7DB7: las ordenes de pieza de la pantalla 0x70 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (26 bytes)
;   0x7db7..0x7dd1  (26 bytes)
DATA_ordenes_70_7DB7:
	defb 0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h,088h,00ch,0c2h	; 7db7  .Mx...b.....f...
	defb 066h,08ch,010h,004h,066h,08ch,012h,004h,066h,0ffh	; 7dc7  f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_70: los 4 objetos de la pantalla 0x70: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (17 bytes)
;   0x7dd1..0x7de2  (17 bytes)
DATA_objetos_70:
	defb 003h,000h,008h,00ch	; 7dd1
	defb 002h,000h,00ch,010h	; 7dd5
	defb 002h,000h,00ch,012h	; 7dd9
	defb 01ah,000h,009h,00fh	; 7ddd
	defb 0ffh	; 7de1

; ----------------------------------------------------------------------
; DATOS sprites_70: los 0 grupos de sprites de la pantalla 0x70: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7de2..0x7de3  (1 bytes)
DATA_sprites_70:
	defb 0ffh	; 7de2

; ----------------------------------------------------------------------
; DATOS ordenes_71_7DE3: las ordenes de pieza de la pantalla 0x71 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (34 bytes)
;   0x7de3..0x7e05  (34 bytes)
DATA_ordenes_71_7DE3:
	defb 0feh,04dh,078h,089h,00eh,0b1h,062h,007h,00fh,002h,002h,0bdh,066h,087h,012h,0c2h	; 7de3  .Mx...b.....f...
	defb 066h,08ch,00ch,004h,066h,08ch,00fh,004h,066h,08ch,012h,004h,066h,08ah,012h,004h	; 7df3  f...f...f...f...
	defb 066h,0ffh	; 7e03

; ----------------------------------------------------------------------
; DATOS objetos_71: los 6 objetos de la pantalla 0x71: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (25 bytes)
;   0x7e05..0x7e1e  (25 bytes)
DATA_objetos_71:
	defb 003h,000h,007h,012h	; 7e05
	defb 002h,000h,00ch,00ch	; 7e09
	defb 002h,000h,00ch,00fh	; 7e0d
	defb 002h,000h,00ch,012h	; 7e11
	defb 002h,000h,00ah,012h	; 7e15
	defb 01ah,000h,009h,00fh	; 7e19
	defb 0ffh	; 7e1d

; ----------------------------------------------------------------------
; DATOS sprites_71: los 0 grupos de sprites de la pantalla 0x71: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7e1e..0x7e1f  (1 bytes)
DATA_sprites_71:
	defb 0ffh	; 7e1e

; ----------------------------------------------------------------------
; DATOS ordenes_72_7E1F: las ordenes de pieza de la pantalla 0x72 (p03:BBA2:
;   forma corta con el bit 7, larga sin el, 0xFE + puntero, 0xFF acaba); lo
;   leen p03:BBA2 (30 bytes)
;   0x7e1f..0x7e3d  (30 bytes)
DATA_ordenes_72_7E1F:
	defb 0feh,04dh,078h,00ch,00ch,002h,008h,0aah,062h,088h,00ch,004h,066h,08ah,00ch,004h	; 7e1f  .Mx.....b...f...
	defb 066h,088h,012h,004h,066h,08ah,012h,004h,066h,088h,00eh,01dh,066h,0ffh	; 7e2f  f...f...f...f.

; ----------------------------------------------------------------------
; DATOS objetos_72: los 5 objetos de la pantalla 0x72: tipo, IY+3, fila y
;   columna (la y, la x y su casilla salen de las dos: p03:BD7B-BDD5), y el
;   0xFF que acaba; lo leen p03:BD7F (21 bytes)
;   0x7e3d..0x7e52  (21 bytes)
DATA_objetos_72:
	defb 002h,000h,008h,00ch	; 7e3d
	defb 002h,000h,00ah,00ch	; 7e41
	defb 002h,000h,008h,012h	; 7e45
	defb 002h,000h,00ah,012h	; 7e49
	defb 017h,000h,008h,00eh	; 7e4d
	defb 0ffh	; 7e51

; ----------------------------------------------------------------------
; DATOS sprites_72: los 0 grupos de sprites de la pantalla 0x72: tipo,
;   cuantos, y, x (p03:BDD6-BE1C), y el 0xFF que acaba (si no se llega antes a
;   0x14 sprites); lo leen p03:BDE3 (1 bytes)
;   0x7e52..0x7e53  (1 bytes)
DATA_sprites_72:
	defb 0ffh	; 7e52

; ----------------------------------------------------------------------
; DATOS pieza_7E53: una pieza de 10 x 10 dibujos (alto, ancho) de la fila 0x40
;   de la hoja, copia normal; la usan las pantallas 89 (p03:BC2F/BBEE); lo
;   leen p03:BC5C (103 bytes)
;   0x7e53..0x7eba  (103 bytes)
DATA_pieza_7E53:
	defb 040h,00ah,00ah	; 7e53
	defb 000h,000h,004h	; 7e56
	defb 003h,010h,011h	; 7e59
	defb 012h,013h,000h	; 7e5c
	defb 000h,000h,005h	; 7e5f
	defb 006h,007h,014h	; 7e62
	defb 015h,016h,017h	; 7e65
	defb 084h,000h,008h	; 7e68
	defb 009h,00ah,00bh	; 7e6b
	defb 018h,019h,01ah	; 7e6e
	defb 01bh,088h,089h	; 7e71
	defb 00ch,00dh,00eh	; 7e74
	defb 00fh,01ch,01dh	; 7e77
	defb 01eh,01fh,08ch	; 7e7a
	defb 08dh,000h,0a1h	; 7e7d
	defb 0a2h,0a3h,0b0h	; 7e80
	defb 0b1h,0b2h,0b3h	; 7e83
	defb 082h,000h,000h	; 7e86
	defb 0a5h,0a6h,0a7h	; 7e89
	defb 0b4h,0b5h,0b6h	; 7e8c
	defb 0b7h,086h,000h	; 7e8f
	defb 0a8h,0a9h,0aah	; 7e92
	defb 0abh,0b8h,0b9h	; 7e95
	defb 0bah,0bbh,08ah	; 7e98
	defb 08bh,0ach,0adh	; 7e9b
	defb 0aeh,0afh,0bch	; 7e9e
	defb 0bdh,0beh,0bfh	; 7ea1
	defb 08eh,08fh,000h	; 7ea4
	defb 0e1h,0e2h,0e3h	; 7ea7
	defb 0e8h,0e9h,0eah	; 7eaa
	defb 0ebh,0f0h,000h	; 7ead
	defb 000h,000h,0e6h	; 7eb0
	defb 0e7h,0ech,0edh	; 7eb3
	defb 0eeh,0efh,000h	; 7eb6
	defb 000h	; 7eb9

; ----------------------------------------------------------------------
; DATOS sin_lector_7EBA: 326 bytes sin formato de pieza, lista ni orden (223 a
;   0x00 o 0xFF y 160 acabados en 0xF); no lo lee nada: ni un puntero, ni una
;   lista, orden o pieza, ni las partidas de tools/cobertura.py; lo leen nadie
;   (326 bytes)
;   0x7eba..0x8000  (326 bytes)
DATA_sin_lector_7EBA:
	defb 0eeh,0efh,000h,000h,0efh,000h,000h,0efh,000h,0afh,000h,0efh,000h,0ffh,000h,07fh	; 7eba  ................
	defb 000h,02fh,000h,0ffh,000h,06fh,0efh,000h,0efh,000h,06fh,000h,0efh,000h,0ffh,000h	; 7eca  ./...o....o.....
	defb 06fh,000h,0ffh,000h,0efh,000h,000h,07fh,000h,0ffh,000h,0efh,000h,0efh,000h,06fh	; 7eda  o..............o
	defb 000h,06fh,000h,06fh,000h,06fh,0ffh,000h,06fh,000h,06fh,000h,06bh,000h,06fh,000h	; 7eea  .o.o.o..o.o.k.o.
	defb 0efh,000h,06fh,000h,0ffh,000h,010h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh	; 7efa  ..o.............
	defb 000h,0ffh,010h,0ffh,010h,0ffh,0ffh,000h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,000h	; 7f0a  ................
	defb 0ffh,000h,0ffh,000h,0ffh,010h,010h,0ffh,010h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh	; 7f1a  ................
	defb 000h,0ffh,000h,0ffh,010h,0ffh,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7f2a  ................
	defb 0ffh,010h,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh	; 7f3a  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,010h,0ffh,000h,0ffh,000h,0ffh,000h	; 7f4a  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,010h,0ffh,000h,0ffh,000h,0ffh,010h,0ffh,000h,0ffh	; 7f5a  ................
	defb 010h,0ffh,010h,0ffh,000h,0ffh,0ffh,000h,0ffh,010h,0ffh,010h,0ffh,000h,0ffh,000h	; 7f6a  ................
	defb 0ffh,010h,0ffh,010h,0ffh,000h,000h,06fh,000h,06fh,000h,06fh,000h,06fh,000h,07fh	; 7f7a  .......o.o.o.o..
	defb 000h,06fh,000h,0ffh,000h,07fh,0ffh,000h,0efh,000h,06fh,000h,07fh,000h,0ffh,000h	; 7f8a  .o........o.....
	defb 0efh,000h,07fh,000h,07fh,000h,000h,0efh,000h,06fh,000h,0efh,000h,07fh,000h,0efh	; 7f9a  .........o......
	defb 000h,0efh,000h,0ffh,000h,07fh,06fh,000h,0ffh,000h,07fh,000h,0efh,000h,0efh,000h	; 7faa  ......o.........
	defb 0efh,000h,0ffh,000h,0ffh,000h,000h,06fh,000h,06fh,000h,06fh,000h,02fh,000h,0efh	; 7fba  .......o.o.o./..
	defb 000h,06fh,000h,0ffh,000h,06fh,0afh,000h,06fh,000h,06fh,000h,0efh,000h,07fh,000h	; 7fca  .o...o..o.o.....
	defb 07fh,000h,07fh,000h,07fh,000h,000h,0efh,000h,0efh,000h,0ffh,000h,06fh,000h,0ffh	; 7fda  .............o..
	defb 000h,0efh,000h,0ffh,000h,07fh,0efh,000h,0efh,000h,06fh,000h,0ffh,000h,06fh,000h	; 7fea  ..........o...o.
	defb 0efh,000h,0ffh,000h,06bh,000h	; 7ffa
