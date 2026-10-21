; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 12 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS sin identificar  0x8000..0x9400  (5120 bytes)
DATA_8000:
	defb 001h,003h,007h,007h,008h,010h,010h,010h,016h,021h,020h,020h,010h,00fh,004h,007h	; 8000  .........!  ....
	defb 0e0h,0f0h,0f8h,0c8h,0f8h,070h,060h,070h,0ffh,0ffh,08fh,008h,008h,0f0h,040h,0c0h	; 8010  .....p`p......@.
	defb 001h,002h,004h,007h,00fh,01fh,01fh,01fh,01fh,03fh,03fh,03fh,01fh,00fh,007h,004h	; 8020  .........???....
	defb 0e0h,010h,038h,078h,088h,0f0h,0e0h,0d0h,0ffh,0a2h,0ffh,0f8h,0f8h,0f0h,0c0h,040h	; 8030  ..8x...........@
	defb 007h,00fh,01fh,01fh,023h,041h,041h,041h,027h,040h,040h,023h,01fh,00fh,004h,007h	; 8040  ....#AAA'@@#....
	defb 080h,0c2h,0e7h,02eh,0fdh,0f9h,0f6h,014h,018h,010h,0e0h,0c0h,0c0h,080h,040h,0c0h	; 8050  ..............@.
	defb 007h,008h,010h,01dh,03eh,07fh,07fh,07fh,03fh,07fh,07fh,03fh,01ch,008h,007h,004h	; 8060  ....>...?..?....
	defb 080h,042h,0e5h,0eeh,037h,0efh,05eh,0fch,0f8h,0f0h,0e0h,040h,040h,080h,0c0h,040h	; 8070  .B..7.^....@@..@
	defb 003h,007h,01fh,023h,041h,041h,089h,087h,083h,040h,03ch,01fh,00fh,00fh,004h,007h	; 8080  ...#AA...@<.....
	defb 0c0h,0e0h,0f0h,090h,0f0h,0e0h,0d0h,0d0h,0e8h,038h,038h,03ch,0ceh,087h,042h,0c0h	; 8090  .........88<..B.
	defb 003h,004h,01ch,03eh,07fh,07fh,0ffh,0ffh,0ffh,07fh,03fh,013h,008h,008h,007h,004h	; 80a0  ...>......?.....
	defb 0c0h,020h,070h,0f0h,010h,0e0h,0f0h,070h,0f8h,0d8h,0e8h,0f4h,0ceh,085h,0c2h,040h	; 80b0  . p....p.......@
	defb 007h,00fh,01fh,01fh,011h,020h,02ch,043h,041h,040h,020h,01fh,00fh,00fh,004h,007h	; 80c0  ..... ,CA@ .....
	defb 080h,0c0h,0e0h,020h,0e0h,0c0h,0ffh,0ffh,01fh,018h,014h,0e4h,0e4h,0d8h,040h,0c0h	; 80d0  ... ..........@.
	defb 007h,008h,010h,01fh,01fh,03fh,03fh,07fh,07fh,07fh,03fh,01fh,008h,008h,007h,004h	; 80e0  .....??...?.....
	defb 080h,040h,0e0h,0e0h,020h,0c0h,0ffh,0a2h,0ffh,0f8h,0fch,0fch,03ch,0d8h,0c0h,040h	; 80f0  .@.. .......<..@
	defb 004h,006h,005h,004h,008h,019h,03dh,03fh,07eh,07ch,0f0h,0f0h,0f1h,0f9h,0fdh,07ch	; 8100  ......=?~|.....|
	defb 020h,010h,008h,088h,0e4h,0c4h,0f4h,0fch,0f8h,0f8h,0f0h,0f0h,0f8h,0feh,0ffh,0ffh	; 8110   ...............
	defb 007h,007h,007h,007h,00fh,01fh,027h,023h,042h,04ch,090h,090h,091h,089h,085h,07ch	; 8120  ......'#BL.....|
	defb 0e0h,0f0h,0f8h,0f8h,0fch,0fch,0bch,08ch,088h,088h,090h,090h,008h,006h,001h,0ffh	; 8130  ................
	defb 004h,006h,006h,007h,00ah,00bh,00fh,00fh,00fh,00fh,00fh,01fh,01fh,01fh,01fh,01fh	; 8140  ................
	defb 020h,020h,010h,090h,010h,090h,0e0h,0e0h,0e0h,0c0h,0c0h,0c0h,0c0h,0f0h,0f8h,0f8h	; 8150    ..............
	defb 007h,007h,007h,007h,00fh,00fh,00eh,00ah,00ah,00ah,00ah,014h,014h,014h,014h,01fh	; 8160  ................
	defb 0e0h,0e0h,0f0h,0f0h,0f0h,0f0h,060h,020h,020h,040h,040h,0c0h,040h,030h,008h,0f8h	; 8170  ......`  @@.@0..
	defb 004h,006h,005h,004h,008h,019h,03dh,03fh,07eh,07ch,0f0h,0f0h,0f1h,0f9h,0fdh,07ch	; 8180  ......=?~|.....|
	defb 020h,010h,008h,088h,0e4h,0c4h,0f4h,0fch,0f8h,0f8h,0f0h,0f0h,0f8h,0feh,0ffh,0ffh	; 8190   ...............
	defb 007h,007h,007h,007h,00fh,01fh,027h,023h,042h,04ch,090h,090h,091h,089h,085h,07ch	; 81a0  ......'#BL.....|
	defb 0e0h,0f0h,0f8h,0f8h,0fch,0fch,0bch,08ch,088h,088h,090h,090h,008h,006h,001h,0ffh	; 81b0  ................
	defb 007h,00fh,01fh,013h,01fh,00eh,006h,00eh,0ffh,0ffh,0f1h,010h,010h,00fh,002h,003h	; 81c0  ................
	defb 080h,0c0h,0e0h,0e0h,010h,008h,008h,008h,068h,084h,004h,004h,008h,0f0h,020h,0e0h	; 81d0  ........h..... .
	defb 007h,008h,01ch,01eh,011h,00fh,007h,00bh,0ffh,045h,0ffh,01fh,01fh,00fh,003h,002h	; 81e0  .........E......
	defb 080h,040h,020h,0e0h,0f0h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0fch,0f8h,0f0h,0e0h,020h	; 81f0  .@ ............
	defb 001h,043h,0e7h,074h,0bfh,09fh,06fh,028h,018h,008h,007h,003h,003h,001h,002h,003h	; 8200  .C.t..o(........
	defb 0e0h,0f0h,0f8h,0f8h,0c4h,082h,082h,082h,0e4h,002h,002h,0c4h,0f8h,0f0h,020h,0e0h	; 8210  .............. .
	defb 001h,042h,0a7h,077h,0ech,0f7h,07ah,03fh,01fh,00fh,007h,002h,002h,001h,003h,002h	; 8220  .B.w..z?........
	defb 0e0h,010h,008h,0b8h,07ch,0feh,0feh,0feh,0fch,0feh,0feh,0fch,038h,010h,0e0h,020h	; 8230  ....|.......8..
	defb 003h,007h,00fh,009h,00fh,007h,00bh,00bh,017h,01ch,01ch,03ch,073h,0e1h,042h,003h	; 8240  ...........<s.B.
	defb 0c0h,0e0h,0f8h,0c4h,082h,082h,091h,0e1h,0c1h,002h,03ch,0f8h,0f0h,0f0h,020h,0e0h	; 8250  ..........<... .
	defb 003h,004h,00eh,00fh,008h,007h,00fh,00eh,01fh,01bh,017h,02fh,073h,0a1h,043h,002h	; 8260  .........../s.C.
	defb 0c0h,020h,038h,07ch,0feh,0feh,0ffh,0ffh,0ffh,0feh,0fch,0c8h,010h,010h,0e0h,020h	; 8270  . 8|...........
	defb 001h,003h,007h,004h,007h,003h,0ffh,0ffh,0f8h,018h,028h,027h,027h,01bh,002h,003h	; 8280  ..........(''...
	defb 0e0h,0f0h,0f8h,0f8h,088h,004h,034h,0c2h,082h,002h,004h,0f8h,0f0h,0f0h,020h,0e0h	; 8290  ......4....... .
	defb 001h,002h,007h,007h,004h,003h,0ffh,045h,0ffh,01fh,03fh,03fh,03ch,01bh,003h,002h	; 82a0  .......E..??<...
	defb 0e0h,010h,008h,0f8h,0f8h,0fch,0fch,0feh,0feh,0feh,0fch,0f8h,010h,010h,0e0h,020h	; 82b0  ...............
	defb 004h,008h,010h,011h,027h,023h,02fh,03fh,01fh,01fh,00fh,00fh,01fh,07fh,0ffh,0ffh	; 82c0  ....'#/?........
	defb 020h,060h,0a0h,020h,010h,098h,0bch,0fch,07eh,03eh,00fh,00fh,08fh,09fh,0bfh,03eh	; 82d0   `. ....~>.....>
	defb 007h,00fh,01fh,01fh,03fh,03fh,03dh,031h,011h,011h,009h,009h,010h,060h,080h,0ffh	; 82e0  ....??=1.....`..
	defb 0e0h,0e0h,0e0h,0e0h,0f0h,0f8h,0e4h,0c4h,042h,032h,009h,009h,089h,091h,0a1h,03eh	; 82f0  ........B2.....>
	defb 004h,004h,008h,009h,008h,009h,007h,007h,007h,003h,003h,003h,003h,00fh,01fh,01fh	; 8300  ................
	defb 020h,060h,060h,0e0h,050h,0d0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f8h,0f8h,0f8h,0f8h,0f8h	; 8310   ``.P...........
	defb 007h,007h,00fh,00fh,00fh,00fh,006h,004h,004h,002h,002h,003h,002h,00ch,010h,01fh	; 8320  ................
	defb 0e0h,0e0h,0e0h,0e0h,0f0h,0f0h,070h,050h,050h,050h,050h,028h,028h,028h,028h,0f8h	; 8330  ......pPPPP((((.
	defb 004h,008h,010h,011h,027h,023h,02fh,03fh,01fh,01fh,00fh,00fh,01fh,07fh,0ffh,0ffh	; 8340  ....'#/?........
	defb 020h,060h,0a0h,020h,010h,098h,0bch,0fch,07eh,03eh,00fh,00fh,08fh,09fh,0bfh,03eh	; 8350   `. ....~>.....>
	defb 007h,00fh,01fh,01fh,03fh,03fh,03dh,031h,011h,011h,009h,009h,010h,060h,080h,0ffh	; 8360  ....??=1.....`..
	defb 0e0h,0e0h,0e0h,0e0h,0f0h,0f8h,0e4h,0c4h,042h,032h,009h,009h,089h,091h,0a1h,03eh	; 8370  ........B2.....>
	defb 000h,000h,000h,000h,000h,005h,005h,005h,007h,04fh,0ffh,0bfh,0bfh,0ffh,0ffh,0ffh	; 8380  .........O......
	defb 000h,000h,000h,000h,000h,000h,080h,080h,080h,0c0h,0a0h,0a0h,0a0h,0a0h,0e0h,0c0h	; 8390  ................
	defb 000h,000h,002h,002h,002h,007h,006h,007h,004h,04fh,0b3h,0f3h,0e3h,0afh,0a7h,0a4h	; 83a0  .........O......
	defb 000h,000h,000h,000h,000h,000h,080h,080h,000h,0c0h,060h,0e0h,0e0h,060h,0e0h,040h	; 83b0  ..........`..`.@
	defb 000h,000h,000h,000h,006h,007h,00bh,00fh,007h,04fh,0ffh,0bfh,0bfh,0ffh,0ffh,0ffh	; 83c0  .........O......
	defb 000h,000h,060h,070h,078h,03ch,0bch,038h,038h,0b8h,0f8h,0f8h,0f8h,0f8h,0f0h,0e0h	; 83d0  ..`px<.88.......
	defb 000h,000h,000h,020h,016h,009h,00fh,008h,007h,049h,0b0h,0f8h,0fdh,0beh,0a1h,0a1h	; 83e0  ... .....I......
	defb 000h,000h,040h,050h,058h,024h,024h,028h,038h,0b8h,0c8h,0c8h,048h,008h,010h,0e0h	; 83f0  ..@PX$$(8...H...
	defb 000h,000h,000h,000h,000h,000h,001h,001h,001h,003h,005h,005h,005h,005h,007h,003h	; 8400  ................
	defb 000h,000h,000h,000h,000h,0a0h,0a0h,0a0h,0e0h,0f2h,0ffh,0fdh,0fdh,0ffh,0ffh,0ffh	; 8410  ................
	defb 000h,000h,000h,000h,000h,000h,001h,001h,000h,003h,006h,007h,007h,006h,007h,002h	; 8420  ................
	defb 000h,000h,040h,040h,040h,0e0h,060h,0e0h,020h,0f2h,0cdh,0cfh,0c7h,0f5h,0e5h,025h	; 8430  ..@@@.`. ......%
	defb 000h,000h,006h,00eh,01eh,03ch,03dh,01ch,01ch,01dh,01fh,01fh,01fh,01fh,00fh,007h	; 8440  .....<=.........
	defb 000h,000h,000h,000h,060h,0e0h,0d0h,0f0h,0e0h,0f2h,0ffh,0fdh,0fdh,0ffh,0ffh,0ffh	; 8450  ....`...........
	defb 000h,000h,002h,00ah,01ah,024h,024h,014h,01ch,01dh,013h,013h,012h,010h,008h,007h	; 8460  .....$$.........
	defb 000h,000h,000h,004h,068h,090h,0f0h,010h,0e0h,092h,00dh,01fh,0bfh,07dh,085h,085h	; 8470  ....h........}..
	defb 003h,007h,007h,03fh,07fh,07fh,03fh,077h,06fh,0dfh,0dfh,07fh,07dh,03dh,03fh,03fh	; 8480  ...?..?wo...}=??
	defb 000h,080h,080h,080h,080h,0c0h,0e0h,0e0h,0ffh,0d1h,0ffh,0f8h,0f0h,080h,080h,000h	; 8490  ................
	defb 003h,004h,005h,03fh,044h,044h,03ch,07ch,07eh,0ffh,0f8h,07ah,07fh,03fh,03eh,025h	; 84a0  ...?DD<|~..z.?>%
	defb 000h,000h,080h,000h,080h,040h,020h,020h,03fh,0dfh,07fh,0f8h,0f0h,080h,080h,000h	; 84b0  .....@  ?.......
	defb 00fh,00fh,00fh,00ch,00eh,00fh,00fh,01eh,03eh,07eh,0fch,0f8h,0f0h,0c0h,0c0h,080h	; 84c0  ........>~......
	defb 0c0h,0e0h,0e0h,0e0h,060h,030h,0f0h,0f8h,0f8h,0f8h,0fch,07ch,038h,03ch,03eh,03fh	; 84d0  ....`0.....|8<>?
	defb 009h,009h,00fh,00fh,00fh,00fh,00fh,016h,026h,042h,0c4h,0c8h,0b0h,0c0h,0c0h,080h	; 84e0  ........&B......
	defb 040h,020h,0e0h,0e0h,0e0h,0f0h,0f0h,088h,088h,088h,084h,044h,038h,024h,022h,03fh	; 84f0  @ .........D8$"?
	defb 00fh,00fh,00fh,00dh,006h,003h,001h,003h,007h,00fh,01fh,01fh,01fh,01fh,01fh,00fh	; 8500  ................
	defb 0c0h,0e0h,0c0h,0c0h,0c0h,060h,0e0h,0e0h,0e0h,0c0h,0c0h,080h,080h,080h,0c0h,0e0h	; 8510  .....`..........
	defb 009h,009h,00fh,00fh,007h,003h,001h,003h,004h,008h,010h,010h,011h,01fh,012h,00fh	; 8520  ................
	defb 040h,020h,0c0h,0c0h,0c0h,0e0h,0e0h,0e0h,020h,040h,040h,080h,080h,080h,040h,0e0h	; 8530  @ ...... @@...@.
	defb 000h,001h,001h,001h,001h,003h,007h,007h,0ffh,08bh,0ffh,01fh,00fh,001h,001h,000h	; 8540  ................
	defb 0c0h,0e0h,0e0h,0fch,0feh,0feh,0fch,0eeh,0f6h,0fbh,0fbh,0feh,0beh,0bch,0fch,0fch	; 8550  ................
	defb 000h,000h,001h,000h,001h,002h,004h,004h,0fch,0fbh,0feh,01fh,00fh,001h,001h,000h	; 8560  ................
	defb 0c0h,020h,0a0h,0fch,022h,022h,03ch,03eh,07eh,0ffh,01fh,05eh,0feh,0fch,07ch,0a4h	; 8570  . ..""<>~..^..|.
	defb 003h,007h,007h,007h,006h,00ch,00fh,01fh,01fh,01fh,03fh,03eh,01ch,03ch,07ch,0fch	; 8580  ..........?>.<|.
	defb 0f0h,0f0h,0f0h,030h,070h,0f0h,0f0h,078h,07ch,07eh,03fh,01fh,00fh,003h,003h,001h	; 8590  ...0p..x|~?.....
	defb 002h,004h,007h,007h,007h,00fh,00fh,011h,011h,011h,021h,022h,01ch,024h,044h,0fch	; 85a0  ..........!".$D.
	defb 090h,090h,0f0h,0f0h,0f0h,0f0h,0f0h,068h,064h,042h,023h,013h,00dh,003h,003h,001h	; 85b0  .......hdB#.....
	defb 003h,007h,003h,003h,003h,006h,007h,007h,007h,003h,003h,001h,001h,001h,003h,007h	; 85c0  ................
	defb 0f0h,0f0h,0f0h,0b0h,060h,0c0h,080h,0c0h,0e0h,0f0h,0f8h,0f8h,0f8h,0f8h,0f8h,0f0h	; 85d0  ....`...........
	defb 002h,004h,003h,003h,003h,007h,007h,007h,004h,002h,002h,001h,001h,001h,002h,007h	; 85e0  ................
	defb 090h,090h,0f0h,0f0h,0e0h,0c0h,080h,0c0h,020h,010h,008h,008h,088h,0f8h,048h,0f0h	; 85f0  ........ .....H.
	defb 001h,001h,001h,01fh,03fh,03eh,03eh,03fh,03fh,01fh,01fh,00fh,003h,003h,003h,003h	; 8600  ....?>>??.......
	defb 0e0h,0e0h,0e0h,0fch,03eh,0deh,0deh,03eh,0feh,0fch,0fch,0fch,0fch,0feh,0feh,0feh	; 8610  ....>..>........
	defb 001h,001h,001h,01fh,022h,03fh,029h,02fh,020h,011h,013h,00ch,002h,002h,003h,002h	; 8620  ...."?)/ .......
	defb 0e0h,020h,0e0h,0fch,0d2h,0feh,0eah,0cah,04ah,07ch,0fch,0fch,07ch,07ah,0fah,03ah	; 8630  . ......J|..|z.:
	defb 007h,007h,007h,007h,00fh,00fh,00fh,01eh,03eh,03eh,07eh,07ch,078h,078h,0f0h,0f0h	; 8640  ........>>~|xx..
	defb 0fch,0feh,0feh,0fch,0bch,03ch,03ch,03ch,03eh,03eh,03eh,03eh,01eh,00eh,00eh,01fh	; 8650  .....<<<>>>>....
	defb 005h,005h,007h,007h,00fh,00fh,00fh,016h,022h,022h,042h,044h,048h,078h,090h,0f0h	; 8660  ........""BDHx..
	defb 03ch,02eh,03eh,0fch,0bch,03ch,03ch,034h,022h,022h,022h,022h,012h,00eh,00eh,01fh	; 8670  <.>..<<4""""....
	defb 003h,007h,007h,03fh,07fh,07fh,03fh,077h,06fh,0dfh,0dfh,07fh,07dh,03dh,03fh,03fh	; 8680  ...?..?wo...}=??
	defb 000h,080h,080h,080h,080h,0c0h,0e0h,0e0h,0ffh,0d1h,0ffh,0f8h,0f0h,080h,080h,000h	; 8690  ................
	defb 003h,004h,005h,03fh,044h,044h,03ch,07ch,07eh,0ffh,0f8h,07ah,07fh,03fh,03eh,025h	; 86a0  ...?DD<|~..z.?>%
	defb 000h,000h,080h,000h,080h,040h,020h,020h,03fh,0dfh,07fh,0f8h,0f0h,080h,080h,000h	; 86b0  .....@  ?.......
	defb 000h,001h,001h,001h,001h,003h,007h,007h,0ffh,08bh,0ffh,01fh,00fh,001h,001h,000h	; 86c0  ................
	defb 0c0h,0e0h,0e0h,0fch,0feh,0feh,0fch,0eeh,0f6h,0fbh,0fbh,0feh,0beh,0bch,0fch,0fch	; 86d0  ................
	defb 000h,000h,001h,000h,001h,002h,004h,004h,0fch,0fbh,0feh,01fh,00fh,001h,001h,000h	; 86e0  ................
	defb 0c0h,020h,0a0h,0fch,022h,022h,03ch,03eh,07eh,0ffh,01fh,05eh,0feh,0fch,07ch,0a4h	; 86f0  . ..""<>~..^..|.
	defb 001h,001h,001h,01fh,03fh,03eh,03eh,03fh,03fh,01fh,01fh,00fh,003h,003h,003h,003h	; 8700  ....?>>??.......
	defb 0e0h,0e0h,0e0h,0fch,03eh,0deh,0deh,03eh,0feh,0fch,0fch,0fch,0fch,0feh,0feh,0feh	; 8710  ....>..>........
	defb 001h,001h,001h,01fh,022h,03fh,029h,02fh,020h,011h,013h,00ch,002h,002h,003h,002h	; 8720  ...."?)/ .......
	defb 0e0h,020h,0e0h,0fch,0d2h,0feh,0eah,0cah,04ah,07ch,0fch,0fch,07ch,07ah,0fah,03ah	; 8730  . ......J|..|z.:
	defb 000h,001h,000h,000h,01bh,064h,044h,08ch,09fh,0bfh,0bfh,0ffh,07fh,05fh,08eh,082h	; 8740  .....dD......_..
	defb 080h,040h,020h,0c0h,040h,080h,040h,0c0h,0ceh,0ceh,0feh,0feh,0f0h,0e0h,000h,000h	; 8750  .@ .@.@.........
	defb 000h,001h,001h,001h,01bh,07fh,07fh,0ffh,0ffh,0fch,0fch,0e2h,061h,071h,0feh,0feh	; 8760  ............aq..
	defb 080h,0c0h,0e0h,0e0h,0c0h,0c0h,0c0h,0c0h,0ceh,04ah,0f2h,00eh,010h,0e0h,000h,000h	; 8770  .........J......
	defb 001h,002h,004h,003h,002h,001h,002h,003h,073h,073h,07fh,07fh,00fh,007h,000h,000h	; 8780  ........ss......
	defb 000h,080h,000h,000h,0d8h,026h,022h,031h,0f9h,0fdh,0fdh,0ffh,0feh,0fah,071h,041h	; 8790  .....&"1......qA
	defb 001h,003h,007h,007h,003h,003h,003h,003h,073h,052h,04fh,070h,008h,007h,000h,000h	; 87a0  ........sROp....
	defb 000h,080h,080h,080h,0d8h,0feh,0feh,0ffh,0ffh,03fh,03fh,047h,086h,08eh,07fh,07fh	; 87b0  .........??G....
	defb 061h,072h,0e3h,0ffh,0e2h,0fah,07ch,018h,007h,03fh,04fh,04fh,07eh,04eh,047h,044h	; 87c0  ar....|..?OO~NGD
	defb 086h,04eh,0c7h,0ffh,04fh,05fh,03eh,018h,0e0h,0e0h,0f0h,0c8h,078h,078h,0fch,07ch	; 87d0  .N..O_>.....xx.|
	defb 061h,073h,0a3h,09fh,09fh,09fh,067h,01fh,007h,03ch,07ch,07fh,07fh,07fh,07fh,07ch	; 87e0  as....g..<|....|
	defb 086h,0ceh,0c5h,0f9h,0f9h,0f9h,0e6h,0f8h,0e0h,020h,030h,0f8h,0f8h,098h,084h,044h	; 87f0  ......... 0....D
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8800  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8810  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8820  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8830  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8840  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8850  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8860  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 8870  .9.9.9.9.9.9.9.9
	defb 000h,000h,000h,000h,000h,000h,017h,028h,07bh,068h,03fh,017h,000h,000h,000h,000h	; 8880  .......({h?.....
	defb 000h,000h,000h,000h,000h,000h,0e8h,014h,0deh,016h,0fch,0e8h,000h,000h,000h,000h	; 8890  ................
	defb 000h,000h,000h,000h,000h,000h,017h,03fh,06ch,07fh,03fh,017h,000h,000h,000h,000h	; 88a0  .......?l.?.....
	defb 000h,000h,000h,000h,000h,000h,0e8h,0fch,036h,0feh,0fch,0e8h,000h,000h,000h,000h	; 88b0  ........6.......
	defb 000h,000h,000h,000h,000h,000h,017h,03bh,068h,068h,03fh,017h,000h,000h,000h,000h	; 88c0  ........hh?.....
	defb 000h,000h,000h,000h,000h,000h,0e8h,0dch,016h,016h,0fch,0e8h,000h,000h,000h,000h	; 88d0  ................
	defb 000h,000h,000h,000h,000h,000h,017h,02ch,07fh,07fh,03fh,017h,000h,000h,000h,000h	; 88e0  .......,..?.....
	defb 000h,000h,000h,000h,000h,000h,0e8h,034h,0feh,0feh,0fch,0e8h,000h,000h,000h,000h	; 88f0  .......4........
	defb 003h,000h,001h,000h,000h,000h,007h,03fh,01fh,00eh,002h,001h,001h,001h,003h,003h	; 8900  .......?........
	defb 080h,040h,0c0h,000h,000h,000h,078h,0fch,0fch,0fch,078h,088h,008h,0f8h,0f0h,0f0h	; 8910  .@....x...x.....
	defb 003h,003h,000h,000h,000h,000h,007h,03ch,01fh,00fh,003h,001h,001h,001h,003h,003h	; 8920  .......<........
	defb 080h,0c0h,040h,000h,000h,000h,0c8h,0f4h,004h,084h,0f8h,0f8h,0f8h,0f8h,0f0h,0f0h	; 8930  ..@.............
	defb 000h,000h,000h,000h,000h,000h,01fh,00fh,003h,002h,003h,002h,002h,007h,007h,007h	; 8940  ................
	defb 0e0h,010h,070h,000h,000h,000h,0feh,0ffh,07fh,03fh,0deh,004h,008h,0c8h,0f0h,0f0h	; 8950  ..p......?......
	defb 000h,000h,000h,000h,000h,000h,01fh,00fh,003h,003h,003h,003h,003h,007h,007h,007h	; 8960  ................
	defb 0e0h,0f0h,010h,000h,000h,000h,032h,0bdh,0c1h,0e1h,0feh,0fch,0f8h,0f8h,0f0h,0f0h	; 8970  ......2.........
	defb 000h,000h,001h,032h,04ah,00fh,01ch,02ch,02dh,02fh,00eh,01ch,019h,027h,03bh,003h	; 8980  ...2J..,-/...'..
	defb 000h,000h,080h,040h,0a0h,010h,088h,054h,02eh,0b6h,02bh,067h,0e0h,0f0h,0f0h,0f0h	; 8990  ...@...T..+g....
	defb 000h,000h,001h,033h,07bh,03fh,037h,077h,0b7h,0b3h,073h,017h,01fh,03eh,03bh,003h	; 89a0  ...3{?7w..s..>..
	defb 000h,000h,080h,0c0h,0e0h,0f0h,0f8h,0fch,0f8h,0f8h,0e4h,0e0h,0a0h,050h,090h,010h	; 89b0  .............P..
	defb 003h,007h,00fh,01fh,01fh,02fh,02eh,034h,024h,022h,022h,022h,022h,03ah,024h,07ch	; 89c0  ...../.4$"""":$|
	defb 0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f8h,0c4h,0c2h,042h,022h,015h,00dh,005h,003h,001h	; 89d0  .........B".....
	defb 002h,004h,008h,010h,010h,039h,03ah,03ch,03ch,03eh,03eh,03eh,03eh,03eh,03ch,07ch	; 89e0  .....9:<<>>>>><|
	defb 010h,010h,030h,050h,090h,090h,0b8h,0fch,0feh,07eh,03eh,01fh,00fh,007h,003h,001h	; 89f0  ..0P.....~>.....
	defb 003h,003h,003h,003h,003h,003h,003h,002h,001h,001h,000h,000h,000h,000h,000h,001h	; 8a00  ................
	defb 0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0b0h,090h,008h,008h,088h,088h,07ch,05ch,098h,0f0h	; 8a10  ............|\..
	defb 002h,002h,002h,002h,002h,002h,003h,003h,001h,001h,000h,000h,000h,000h,000h,001h	; 8a20  ................
	defb 030h,030h,030h,030h,030h,070h,0f0h,0f0h,0f8h,0f8h,0f8h,0f8h,07ch,07ch,0f8h,0f0h	; 8a30  00000p......||..
	defb 000h,007h,00fh,01bh,01bh,027h,02fh,037h,03eh,00ch,009h,003h,003h,001h,000h,000h	; 8a40  .....'/7>.......
	defb 0f8h,024h,0f6h,0beh,09dh,0f7h,077h,037h,0b7h,0bfh,0b6h,056h,0aeh,05ch,0b8h,0f0h	; 8a50  .$....w7...V.\..
	defb 000h,007h,003h,007h,007h,01fh,01ch,01fh,00ch,018h,008h,001h,003h,001h,000h,000h	; 8a60  ................
	defb 0f8h,0fch,0eeh,0f6h,0fbh,0ffh,0ffh,0fbh,0fbh,0ffh,0feh,0feh,0f6h,0ech,0d8h,0f0h	; 8a70  ................
	defb 00fh,037h,07fh,098h,0bfh,0f7h,0a6h,0bch,07fh,07fh,067h,03ah,019h,007h,000h,000h	; 8a80  .7........g:....
	defb 0c0h,0f8h,0fch,04eh,0f7h,0ebh,015h,0ebh,03ch,098h,0c0h,0e0h,080h,080h,000h,000h	; 8a90  ...N....<.......
	defb 00fh,03fh,076h,0efh,0dfh,0ffh,0ffh,0ffh,07dh,07dh,05fh,007h,007h,000h,000h,000h	; 8aa0  .?v.....}}_.....
	defb 0c0h,0f8h,07ch,0f6h,0fbh,0fdh,0ffh,0ffh,01ch,008h,080h,0e0h,040h,000h,000h,000h	; 8ab0  ..|.........@...
	defb 00fh,01dh,03ah,075h,06ah,06dh,0fdh,0edh,0ech,0eeh,0efh,0f9h,07dh,06fh,024h,01fh	; 8ac0  ..:ujm......}o$.
	defb 000h,000h,080h,0c0h,0c0h,090h,030h,07ch,0ech,0f4h,0e4h,0d8h,0d8h,0f0h,0e0h,000h	; 8ad0  ......0|........
	defb 00fh,01bh,037h,06fh,07fh,07fh,0ffh,0dfh,0dfh,0ffh,0ffh,0dfh,06fh,077h,03fh,01fh	; 8ae0  ..7o........ow?.
	defb 000h,000h,080h,0c0h,080h,010h,018h,030h,0f8h,038h,0f8h,0e0h,0e0h,0c0h,0e0h,000h	; 8af0  .......0.8......
	defb 000h,000h,001h,001h,007h,003h,019h,03ch,0d7h,0a8h,0d7h,0efh,072h,03fh,01fh,003h	; 8b00  .......<....r?..
	defb 000h,000h,0e0h,098h,05ch,0e6h,0feh,0feh,03dh,065h,0efh,0fdh,019h,0feh,0ech,0f0h	; 8b10  ....\...=e......
	defb 000h,000h,000h,002h,007h,001h,010h,038h,0ffh,0ffh,0bfh,0dfh,06fh,03eh,01fh,003h	; 8b20  .......8....o>..
	defb 000h,000h,000h,0e0h,0e0h,0fah,0beh,0beh,0ffh,0ffh,0ffh,0fbh,0f7h,06eh,0fch,0f0h	; 8b30  .............n..
	defb 000h,000h,007h,009h,009h,013h,007h,007h,003h,016h,00dh,003h,003h,001h,000h,000h	; 8b40  ................
	defb 000h,0f8h,0f4h,0bch,0beh,0f6h,07eh,076h,076h,0feh,0f4h,0d4h,0a8h,058h,0f0h,000h	; 8b50  ......~vv....X..
	defb 000h,000h,003h,007h,007h,01fh,01ch,01fh,01eh,01ch,008h,001h,003h,001h,000h,000h	; 8b60  ................
	defb 000h,0f8h,0ech,0f4h,0fah,0feh,0feh,0fah,0fah,0feh,0fch,0fch,0f8h,0f8h,0f0h,000h	; 8b70  ................
	defb 060h,011h,01dh,01fh,087h,08ch,0f9h,07bh,01bh,01fh,0e8h,036h,011h,01fh,000h,000h	; 8b80  `......{...6....
	defb 080h,000h,080h,08ch,0d4h,028h,088h,0aeh,0aeh,04ah,016h,022h,0fch,038h,000h,000h	; 8b90  .....(...J.".8..
	defb 010h,068h,004h,044h,048h,043h,036h,004h,004h,000h,007h,04fh,021h,021h,01eh,000h	; 8ba0  .h.DHC6....O!!..
	defb 070h,080h,080h,0c0h,03eh,0dbh,078h,05eh,059h,0b9h,0f1h,0e7h,0e4h,038h,000h,000h	; 8bb0  p...>.x^Y....8..
	defb 000h,001h,019h,007h,007h,00ch,009h,01bh,01fh,006h,018h,036h,061h,06fh,060h,03ch	; 8bc0  ...........6ao`<
	defb 080h,000h,080h,08ch,0d4h,068h,048h,04ch,058h,098h,030h,0e0h,0e0h,000h,000h,000h	; 8bd0  .....hHLX.0.....
	defb 007h,000h,004h,03ch,040h,043h,006h,074h,0e0h,001h,007h,00fh,011h,01fh,01eh,000h	; 8be0  ...<@C.t........
	defb 01ch,086h,082h,0c2h,030h,098h,0b8h,0bah,0beh,07ah,0f2h,0e2h,0f4h,02ch,040h,0c0h	; 8bf0  ....0....z...,@.
	defb 000h,000h,000h,000h,000h,000h,003h,004h,009h,013h,01fh,00fh,016h,01ah,011h,011h	; 8c00  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,0f0h,0c8h,0fch,0fch,0fch,0f4h,0fch,024h,000h	; 8c10  ..............$.
	defb 000h,000h,000h,000h,000h,000h,003h,007h,00eh,01ch,011h,00fh,01fh,01bh,011h,000h	; 8c20  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,030h,078h,0c4h,0fch,0fch,0fch,0f8h,020h,000h	; 8c30  .......0x..... .
	defb 000h,000h,000h,00fh,007h,030h,03bh,02ch,02bh,04fh,05dh,041h,041h,001h,000h,000h	; 8c40  .....0.,+O]AA...
	defb 000h,078h,0cch,08ah,00ah,00ah,0f6h,00eh,0ffh,0feh,078h,028h,008h,008h,008h,004h	; 8c50  .x........x(....
	defb 000h,000h,00fh,008h,007h,000h,033h,02fh,02eh,04fh,055h,051h,061h,041h,041h,082h	; 8c60  ......3/.OUQaAA.
	defb 000h,0b0h,048h,08eh,00eh,00eh,0fah,0f6h,036h,0cfh,059h,069h,049h,089h,00ah,004h	; 8c70  ..H.....6.YiI...
	defb 000h,000h,00fh,007h,000h,001h,007h,00bh,01bh,03bh,021h,021h,041h,040h,080h,080h	; 8c80  ..........!!A@..
	defb 000h,078h,0cch,08ah,00ah,08eh,0feh,00eh,0feh,0feh,070h,040h,074h,040h,000h,080h	; 8c90  .x........p@t@..
	defb 000h,00fh,000h,007h,000h,001h,007h,00dh,00eh,01eh,025h,025h,045h,044h,080h,080h	; 8ca0  ..........%%ED..
	defb 000h,0b0h,048h,08eh,00eh,08eh,0fah,0fah,03ah,0ceh,0b4h,0c8h,0fch,0c8h,050h,0b0h	; 8cb0  ..H.....:.....P.
	defb 001h,021h,019h,00fh,007h,003h,001h,001h,003h,007h,00fh,019h,021h,000h,000h,000h	; 8cc0  .!..........!...
	defb 0c0h,0c2h,0cch,0f8h,0f0h,0e0h,0c0h,0c0h,0e0h,0f0h,0f8h,0cch,0c2h,080h,080h,080h	; 8cd0  ................
	defb 002h,003h,003h,003h,004h,009h,03bh,07fh,01fh,01fh,01fh,01fh,019h,031h,020h,000h	; 8ce0  .............1 .
	defb 004h,00ch,0fch,0f8h,0f8h,0f8h,0ffh,0feh,0fch,0e0h,0c0h,0c0h,0c0h,0c0h,0c0h,040h	; 8cf0  ...............@
	defb 002h,003h,003h,003h,007h,00eh,03ch,078h,01fh,010h,01fh,00fh,008h,010h,020h,000h	; 8d00  ......<x...... .
	defb 004h,004h,0f4h,0d8h,058h,058h,059h,09ah,03ch,060h,0c0h,0c0h,040h,040h,040h,040h	; 8d10  ....XXY.<`..@@@@
	defb 000h,000h,000h,003h,00fh,02fh,02eh,0a2h,0a8h,0aeh,02ch,02fh,00fh,003h,000h,000h	; 8d20  ...../....,/....
	defb 000h,000h,000h,0c0h,0f0h,0f4h,074h,0c5h,015h,075h,034h,0f4h,0f0h,0c0h,000h,000h	; 8d30  ......t..u4.....
	defb 000h,000h,000h,000h,000h,00eh,011h,026h,02fh,02fh,017h,00eh,000h,000h,000h,000h	; 8d40  .......&//......
	defb 000h,000h,000h,000h,000h,000h,070h,088h,0b8h,0b8h,070h,000h,000h,000h,000h,000h	; 8d50  ......p...p.....
	defb 000h,000h,000h,000h,000h,003h,004h,00bh,00bh,00bh,004h,003h,000h,000h,000h,000h	; 8d60  ................
	defb 000h,000h,000h,000h,000h,080h,040h,0a0h,0a0h,0a0h,040h,080h,000h,000h,000h,000h	; 8d70  ......@...@.....
	defb 000h,000h,000h,000h,000h,000h,00eh,011h,01dh,01dh,00eh,000h,000h,000h,000h,000h	; 8d80  ................
	defb 000h,000h,000h,000h,000h,070h,088h,064h,0f4h,0f4h,0e8h,070h,000h,000h,000h,000h	; 8d90  .....p.d...p....
	defb 000h,000h,000h,001h,003h,003h,000h,003h,003h,003h,003h,001h,003h,003h,000h,000h	; 8da0  ................
	defb 000h,000h,000h,000h,080h,080h,000h,080h,080h,080h,080h,000h,080h,080h,000h,000h	; 8db0  ................
	defb 000h,000h,000h,000h,000h,000h,002h,001h,005h,00eh,00fh,016h,018h,000h,000h,000h	; 8dc0  ................
	defb 000h,000h,000h,018h,068h,0f0h,070h,0a0h,080h,040h,000h,000h,000h,000h,000h,000h	; 8dd0  ....h.p..@......
	defb 000h,000h,000h,000h,000h,001h,003h,005h,003h,001h,000h,000h,000h,000h,000h,000h	; 8de0  ................
	defb 000h,000h,000h,000h,000h,000h,080h,040h,080h,000h,000h,000h,000h,000h,000h,000h	; 8df0  .......@........
	defb 000h,000h,000h,018h,016h,00fh,00eh,005h,001h,002h,000h,000h,000h,000h,000h,000h	; 8e00  ................
	defb 000h,000h,000h,000h,000h,000h,040h,080h,0a0h,070h,0f0h,068h,018h,000h,000h,000h	; 8e10  ......@..p.h....
	defb 000h,000h,000h,000h,000h,001h,006h,005h,00bh,005h,006h,001h,000h,000h,000h,000h	; 8e20  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,040h,0a0h,040h,0c0h,000h,000h,000h,000h,000h	; 8e30  .......@.@......
	defb 000h,000h,000h,000h,000h,000h,000h,001h,003h,001h,000h,000h,000h,000h,000h,000h	; 8e40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,080h,0c0h,080h,000h,000h,000h,000h,000h,000h	; 8e50  ................
	defb 000h,000h,00ch,01ah,010h,056h,008h,02bh,042h,048h,02dh,006h,028h,031h,01ch,000h	; 8e60  .....V.+BH-.(1..
	defb 000h,000h,044h,070h,098h,008h,0c0h,068h,024h,088h,0a0h,06ah,0c8h,018h,070h,000h	; 8e70  ..Dp...h$..j..p.
	defb 000h,000h,001h,000h,02ch,011h,011h,00ah,050h,06ah,011h,018h,00eh,001h,000h,000h	; 8e80  ....,...Pj......
	defb 000h,000h,080h,040h,0e8h,010h,010h,0ach,014h,0a0h,014h,090h,060h,008h,000h,000h	; 8e90  ...@........`...
	defb 000h,000h,001h,000h,000h,000h,001h,003h,001h,003h,002h,00dh,00fh,00fh,00fh,009h	; 8ea0  ................
	defb 0c0h,0c0h,0c0h,0c0h,0c0h,040h,0e0h,0f0h,0f8h,0fch,07ch,0f8h,0fch,0fch,0f8h,0c8h	; 8eb0  .....@....|.....
	defb 001h,001h,001h,001h,001h,001h,002h,007h,00eh,01ch,01fh,00eh,015h,014h,00eh,009h	; 8ec0  ................
	defb 040h,040h,0c0h,040h,040h,0c0h,060h,0f0h,038h,01ch,0fch,0b8h,01ch,05ch,0b8h,0c8h	; 8ed0  @@.@@.`.8....\..
	defb 000h,000h,000h,000h,000h,000h,001h,003h,001h,003h,002h,00dh,00fh,00fh,00fh,009h	; 8ee0  ................
	defb 000h,002h,007h,00fh,01eh,07ch,0f8h,0f0h,0f8h,0fch,07ch,0f8h,0fch,0fch,0f8h,0c8h	; 8ef0  .....|....|.....
	defb 000h,000h,000h,000h,000h,000h,002h,007h,00eh,01ch,01fh,00eh,014h,015h,00eh,009h	; 8f00  ................
	defb 000h,004h,009h,01bh,026h,04ch,078h,0f0h,038h,01ch,0fch,0b8h,05ch,01ch,0b8h,0c8h	; 8f10  ....&Lx.8...\...
	defb 000h,040h,0e0h,070h,038h,01ch,00dh,00bh,001h,003h,002h,00dh,00fh,00fh,00fh,009h	; 8f20  .@.p8...........
	defb 000h,000h,000h,000h,000h,000h,0e0h,0f0h,0f8h,0fch,07ch,0f8h,0fch,0fch,0f8h,0c8h	; 8f30  ..........|.....
	defb 000h,040h,020h,090h,068h,024h,01eh,00fh,00eh,01ch,01fh,00eh,015h,014h,00eh,009h	; 8f40  .@ .h$..........
	defb 000h,000h,000h,000h,000h,000h,060h,0f0h,038h,01ch,0fch,0b8h,01ch,05ch,0b8h,0c8h	; 8f50  ......`.8....\..
	defb 003h,03ch,07fh,07fh,0ffh,0feh,064h,004h,004h,003h,002h,001h,001h,000h,000h,000h	; 8f60  .<....d.........
	defb 0c0h,020h,0a0h,0bch,09eh,03eh,03fh,01fh,03eh,0deh,03fh,0ffh,0feh,0fch,0ach,094h	; 8f70  . ...>?.>.?.....
	defb 003h,03fh,046h,062h,095h,09fh,067h,007h,007h,003h,003h,001h,001h,000h,000h,000h	; 8f80  .?Fb..g.........
	defb 0c0h,0e0h,060h,07ch,0f2h,0e2h,0e1h,0f1h,0fah,0fah,0f9h,0d1h,012h,0fch,0fch,0fch	; 8f90  ..`|............
	defb 003h,007h,006h,03eh,04fh,047h,087h,08fh,05fh,05fh,09fh,08bh,048h,03fh,03fh,03fh	; 8fa0  ...>OG..__..H???
	defb 0c0h,0fch,062h,046h,0a9h,0f9h,0e6h,0e0h,0e0h,0c0h,0c0h,080h,080h,000h,000h,000h	; 8fb0  ..bF............
	defb 003h,004h,005h,03dh,079h,07ch,0fch,0f8h,07ch,07bh,0fch,0ffh,07fh,03fh,035h,029h	; 8fc0  ...=y|..|{...?5)
	defb 0c0h,03ch,0feh,0feh,0ffh,07fh,026h,020h,020h,0c0h,040h,080h,080h,000h,000h,000h	; 8fd0  .<....&  .@.....
	defb 000h,007h,018h,020h,040h,080h,080h,07fh,07fh,06ah,080h,080h,040h,020h,019h,007h	; 8fe0  ... @....j..@ ..
	defb 000h,0e0h,0f8h,03ch,01eh,01fh,0ffh,0feh,0feh,0beh,0ffh,07fh,07eh,0fch,0f8h,0e0h	; 8ff0  ...<........~...
	defb 000h,007h,01fh,03fh,07fh,0ffh,0ffh,07fh,052h,07fh,0ffh,0ffh,07fh,03fh,01fh,007h	; 9000  ...?....R....?..
	defb 000h,0e0h,0f8h,0fch,0feh,0ffh,0ffh,0feh,04ah,0feh,0ffh,0ffh,0feh,0fch,0f8h,0e0h	; 9010  ........J.......
	defb 000h,007h,018h,020h,040h,080h,080h,07fh,07fh,06ah,080h,080h,040h,020h,019h,007h	; 9020  ... @....j..@ ..
	defb 000h,0e0h,0f8h,03ch,01eh,01fh,0ffh,0feh,0feh,0beh,0ffh,07fh,07eh,0fch,0f8h,0e0h	; 9030  ...<........~...
	defb 000h,007h,01fh,03fh,07fh,0ffh,0ffh,07fh,07eh,07fh,0ffh,0ffh,07fh,03fh,01fh,007h	; 9040  ...?....~....?..
	defb 000h,0e0h,0f8h,0fch,0feh,0ffh,0ffh,0feh,0deh,0feh,0ffh,0ffh,0feh,0fch,0f8h,0e0h	; 9050  ................
	defb 000h,000h,000h,000h,000h,000h,03fh,052h,0dfh,0ffh,082h,0bfh,0bfh,0bfh,0ffh,019h	; 9060  ......?R........
	defb 000h,000h,000h,000h,000h,000h,0fch,04ah,0fbh,0ffh,013h,0ffh,0ffh,0ffh,0ffh,098h	; 9070  .......J........
	defb 000h,000h,000h,000h,000h,00ah,03fh,07fh,0b0h,0ffh,0ffh,0c2h,0ffh,0e6h,0e6h,019h	; 9080  ......?.........
	defb 000h,000h,000h,000h,000h,0a8h,0fch,0feh,00dh,0ffh,0fdh,011h,0fdh,065h,067h,098h	; 9090  .............eg.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,00fh,07fh,0f9h,007h,000h	; 90a0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,007h,03fh,0fdh,0e5h,025h,027h,0ffh,03fh	; 90b0  .........?..%'.?
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,009h,0ffh,007h,000h	; 90c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,005h,027h,03fh,0ffh,0ffh,0ffh,03fh	; 90d0  ..........'?...?
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,01fh,07eh,0fah,007h,000h	; 90e0  ............~...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,00fh,07fh,0f9h,0c9h,049h,04fh,0ffh,03fh	; 90f0  ............IO.?
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9100  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9110  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9120  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9130  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9140  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9150  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9160  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9170  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9180  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9190  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 91a0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 91b0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 91c0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 91d0  ................
	defb 001h,007h,00eh,00dh,01ah,015h,03bh,03bh,03bh,03bh,015h,01ah,00dh,00eh,007h,001h	; 91e0  ................
	defb 080h,0e0h,070h,0b0h,058h,0a8h,0dch,0dch,0dch,0dch,0a8h,058h,0b0h,070h,0e0h,080h	; 91f0  ..p.X......X.p..
	defb 000h,001h,007h,006h,00dh,00bh,017h,016h,016h,017h,00bh,00dh,006h,007h,001h,000h	; 9200  ................
	defb 000h,080h,0e0h,060h,0b0h,0d0h,0e8h,068h,068h,0e8h,0d0h,0b0h,060h,0e0h,080h,000h	; 9210  ...`...hh...`...
	defb 001h,006h,005h,00bh,00bh,005h,006h,001h,001h,006h,005h,00bh,00bh,005h,006h,001h	; 9220  ................
	defb 080h,060h,0a0h,0d0h,0d0h,0a0h,060h,080h,080h,060h,0a0h,0d0h,0d0h,0a0h,060h,080h	; 9230  .`....`..`....`.
	defb 001h,007h,006h,00dh,00dh,006h,007h,001h,001h,007h,006h,00dh,00dh,006h,007h,001h	; 9240  ................
	defb 080h,0e0h,060h,0b0h,0b0h,060h,0e0h,080h,080h,0e0h,060h,0b0h,0b0h,060h,0e0h,080h	; 9250  ..`..`....`..`..
	defb 000h,000h,000h,000h,000h,01fh,010h,00fh,010h,00fh,010h,01fh,000h,000h,000h,000h	; 9260  ................
	defb 000h,000h,000h,000h,000h,0f0h,010h,0e0h,010h,0e0h,010h,0f0h,000h,000h,000h,000h	; 9270  ................
	defb 000h,000h,000h,000h,000h,01fh,01fh,00fh,01fh,00fh,01fh,01fh,000h,000h,000h,000h	; 9280  ................
	defb 000h,000h,000h,000h,000h,0f0h,0f0h,0e0h,0f0h,0e0h,0f0h,0f0h,000h,000h,000h,000h	; 9290  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92a0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92b0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92c0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92d0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92e0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 92f0  ................
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 9300  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 9310  .9.9.9.9.9.9.9.9
	defb 00fh,07eh,0e7h,0d7h,0e7h,07eh,03dh,00fh,00eh,007h,003h,000h,000h,000h,000h,000h	; 9320  .~...~=.........
	defb 0efh,01ch,0beh,0f0h,074h,03eh,03ah,0bfh,0fdh,0cfh,0e7h,0d7h,06eh,037h,003h,001h	; 9330  ....t>:.....n7..
	defb 00fh,079h,09ch,0afh,09ch,049h,03ah,008h,009h,004h,003h,000h,000h,000h,000h,000h	; 9340  .y...I:.........
	defb 0efh,0f3h,061h,0efh,0ebh,0e1h,0e5h,070h,072h,0b8h,09fh,0aeh,05dh,034h,002h,001h	; 9350  ..a....pr...]4..
	defb 0f7h,0cfh,086h,0f7h,0d7h,087h,0a7h,00eh,04eh,01dh,0f9h,075h,0bah,02ch,040h,080h	; 9360  ........N..u.,@.
	defb 0f0h,09eh,039h,0f5h,039h,092h,05ch,010h,090h,020h,0c0h,000h,000h,000h,000h,000h	; 9370  ..9.9.\.. ......
	defb 0f7h,038h,07dh,00fh,02eh,07ch,05ch,0fdh,0bfh,0f3h,0e7h,0ebh,076h,0ech,0c0h,080h	; 9380  .8}..|\.....v...
	defb 0f0h,07eh,0e7h,0ebh,0e7h,07eh,0bch,0f0h,070h,0e0h,0c0h,000h,000h,000h,000h,000h	; 9390  .~...~..p.......
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93a0  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93b0  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93c0  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93d0  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93e0  .9.9.9.9.9.9.9.9
	defb 000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h,000h,039h	; 93f0  .9.9.9.9.9.9.9.9

; ======================================================================
; CODIGO 0x9400..0x95cc  (460 bytes)
; ======================================================================


L_9400:
	xor a			;9400   ; el final: ya no hay partida (0xE000 = 0)
	ld (0e1c3h),a		;9401
	ld (0e000h),a		;9404   ; guarda 1 en una partida de verdad, 0 en la demostracion
	ld b,010h		;9407   ; 16 pasos de fundido, cada 0x10 cuadros:
L_9409:
	ld a,(0e1c3h)		;9409   ; espera 0x10 cuadros
	cp 010h		;940c
	jr c,L_9409		;940e
	xor a			;9410
	ld (0e1c3h),a		;9411
	push bc			;9414
	ld hl,0e1d0h		;9415   ; los 16 colores de 0xE1D0 (rojo y azul, verde)...
	ld b,020h		;9418   ; los 32 bytes de la paleta (16 colores)
L_941A:
	ld c,000h		;941a
	ld a,(hl)			;941c   ; la cifra alta (rojo) baja uno...
	push af			;941d
	and 0f0h		;941e   ; ...cada componente baja uno, hasta cero...
	cp 010h		;9420
	jr c,L_9427		;9422
	sub 010h		;9424
	ld c,a			;9426
L_9427:
	pop af			;9427   ; la componente baja (0-7) baja uno si no es cero
	and 00fh		;9428   ; ...y la baja (azul o verde) tambien
	and a			;942a
	jr z,L_942E		;942b
	dec a			;942d
L_942E:
	add a,c			;942e
	ld (hl),a			;942f   ; se guarda
	inc hl			;9430
	djnz L_941A		;9431
	call 046a4h		;9433   ; ...y a la paleta (p00:46A4)
	pop bc			;9436
	djnz L_9409		;9437   ; los 16 pasos
	call 00041h		;9439   ; BIOS DISSCR - Inhibits the screen display | la pantalla apagada
	call 050c5h		;943c   ; borra_vram_ff: llena de 0xFF los 0x6800 primeros bytes de la VRAM
	ld hl,0c300h		;943f   ; el mapa 0xC300-0xC4FF a 0xFF (vacio)...
	ld de,0c301h		;9442
	ld bc,00200h		;9445
	ld (hl),0ffh		;9448
	ldir		;944a
	ld hl,0c4a6h		;944c   ; ...y una fila de suelo (2) en 0xC4C0, y una casilla en 0xC4A6
	ld (hl),002h		;944f
	ld hl,0c4c0h		;9451
	ld de,0c4c1h		;9454
	ld bc,00020h		;9457
	ld (hl),002h		;945a
	ldir		;945c
	ld (ix+00ah),0e0h		;945e   ; el jugador abajo a la izquierda (y 0xE0, x 0)
	ld (ix+00bh),000h		;9462   ; x = 0
	ld (ix+035h),000h		;9466   ; 0xE355 a cero: el final no ha acabado
	ld (ix+038h),000h		;946a
	ld (ix+039h),000h		;946e
	ld (ix+03ch),003h		;9472   ; 0xE35C = 3
	ld (ix-001h),000h		;9476   ; con sprites
	ld a,001h		;947a   ; el color de la primera linea del texto (p12:95BE)
	call 0468eh		;947c   ; pon_paleta: pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	xor a			;947f
	call L_95BE		;9480   ; color 0: el texto empieza sin verse
	ld hl,0e305h		;9483   ; los nueve bytes del texto (0xE305-0xE30D) a cero
	ld b,009h		;9486
L_9488:
	ld (hl),000h		;9488
	inc hl			;948a
	djnz L_9488		;948b
	call 00044h		;948d   ; BIOS ENASCR - Displays the screen | la pantalla encendida
	xor a			;9490
	ld (0e2ceh),a		;9491   ; sin 0xE2CE
	ld (0e1c3h),a		;9494
L_9497:
	ld a,(0e1c3h)		;9497   ; cada dos cuadros: el texto (p12:94BB) y el jugador anda solo (p12:95D2)...
	cp 002h		;949a
	jr c,L_9497		;949c
	xor a			;949e
	ld (0e1c3h),a		;949f
	call L_94BB		;94a2
	call L_95D2		;94a5
	ld ix,0e320h		;94a8   ; ...hasta que acaba (0xE355)
	ld a,(ix+035h)		;94ac   ; acaba cuando 0xE355 no es cero
	and a			;94af
	jr z,L_9497		;94b0
	call 00041h		;94b2   ; BIOS DISSCR - Inhibits the screen display | la pantalla apagada y fin
	ld a,001h		;94b5   ; A = 1 al volver
	call 05052h		;94b7   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ret			;94ba
L_94BB:
	ld iy,0e305h		;94bb   ; el texto del final, por pasos (0xE305 la fase del texto, 0xE307 el paso)
	ld a,(iy+000h)		;94bf   ; 0xE305: aparecer y desaparecer o escribir
	and a			;94c2
	jr z,L_94C8		;94c3
	jp L_9562		;94c5
L_94C8:
	ld a,(iy+002h)		;94c8   ; paso 0: escribir las lineas del bloque (IY+3)...
	and a			;94cb   ; 0xE307: escribir (0), aparecer (1) o ya visto (2)
	jr z,L_94DA		;94cc
	cp 001h		;94ce
	jr z,L_951D		;94d0
	ld (iy+002h),000h		;94d2   ; visto: a desaparecer
	inc (iy+000h)		;94d6
	ret			;94d9
L_94DA:
	ld a,(iy+003h)		;94da   ; ...cuantas lineas tiene el bloque (p12:95CC) y sus punteros (p12:95FC)...
	ld hl,095cch		;94dd   ; el bloque 0xE308 de la tabla de lineas p12:95CC...
	call 051b8h		;94e0   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,a			;94e3
	ld hl,095f6h		;94e4   ; ...y sus punteros en p12:95F6 / p12:95FC
	ld a,(iy+003h)		;94e7
	call 051b8h		;94ea   ; lee_tabla: HL = HL + A y A = (HL)
	ld hl,095fch		;94ed
	add a,a			;94f0
	call 051b8h		;94f1   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;94f4
	inc hl			;94f5
	ld d,(hl)			;94f6
	inc hl			;94f7
	ld (0e282h),hl		;94f8   ; el puntero a la linea siguiente, en 0xE282
	ld hl,00148h		;94fb   ; ...una debajo de otra desde la casilla 0x148 (dos filas de separacion)...
L_94FE:
	push bc			;94fe
	push hl			;94ff
	call 048d3h		;9500   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,(0e282h)		;9503   ; cada linea, desde el puntero
	ld e,(hl)			;9506
	inc hl			;9507
	ld d,(hl)			;9508
	inc hl			;9509
	ld (0e282h),hl		;950a
	pop hl			;950d
	ld a,040h		;950e   ; con la letra de la fila 0x40, dos filas mas abajo cada una
	call 051b8h		;9510   ; lee_tabla: HL = HL + A y A = (HL)
	pop bc			;9513
	djnz L_94FE		;9514
	inc (iy+002h)		;9516   ; ...y el bloque siguiente
	inc (iy+003h)		;9519   ; el bloque siguiente
	ret			;951c
L_951D:
	ld a,(iy+005h)		;951d   ; la cuenta: el color sube cada dos cuadros...
	and a			;9520
	jr nz,L_9542		;9521
	inc (iy+004h)		;9523
	ld a,(iy+004h)		;9526
	cp 002h		;9529
	ret c			;952b
	ld (iy+004h),000h		;952c
	ld a,(iy+006h)		;9530   ; ...0x11 cada vez (rojo-azul y verde a la vez)...
	add a,011h		;9533
	ld (iy+006h),a		;9535
	call L_95BE		;9538
	cp 077h		;953b   ; ...hasta 0x77 (el texto ya se ve del todo)
	ret nz			;953d
	inc (iy+005h)		;953e
	ret			;9541
L_9542:
	inc (iy+004h)		;9542   ; ...se queda 0xB0 cuadros...
	ld a,(iy+004h)		;9545
	cp 0b0h		;9548   ; 0xB0 cuadros leyendolo
	ret c			;954a
	ld (iy+004h),000h		;954b
	ld (iy+005h),000h		;954f
	inc (iy+002h)		;9553   ; el paso siguiente
	ld a,(iy+003h)		;9556   ; ...y tras el sexto bloque, la musica para (0x83)
	cp 006h		;9559   ; despues del sexto bloque...
	ret c			;955b
	ld a,083h		;955c   ; ...la musica se va apagando (0x83)
	call 05052h		;955e   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ret			;9561
L_9562:
	ld a,(iy+005h)		;9562   ; luego desaparece (los colores bajan hasta cero)...
	and a			;9565
	jr nz,L_9586		;9566
	inc (iy+004h)		;9568   ; cada dos cuadros el color baja 0x11...
	ld a,(iy+004h)		;956b
	cp 002h		;956e
	ret c			;9570
	ld (iy+004h),000h		;9571
	ld a,(iy+006h)		;9575
	sub 011h		;9578
	ld (iy+006h),a		;957a
	call L_95BE		;957d   ; ...hasta cero (el texto ya no se ve)
	and a			;9580
	ret nz			;9581
	inc (iy+005h)		;9582
	ret			;9585
L_9586:
	ld a,(iy+003h)		;9586   ; ...se borra (0xFF en la VRAM 0x2800-0x47FF) y el siguiente
	cp 006h		;9589   ; tras el sexto, ya no se borra
	jr nc,L_95A1		;958b
	ld hl,02800h		;958d   ; la VRAM 0x2800-0x47FF a 0xFF: el texto borrado
	ld bc,02000h		;9590
	ld a,0ffh		;9593
	call 0016bh		;9595   ; BIOS BIGFIL - Same function as FILVRM (with 16-bit VRAM-address)
	ld (iy+000h),000h		;9598
	ld (iy+005h),000h		;959c
	ret			;95a0
L_95A1:
	ld a,(iy+007h)		;95a1   ; acabado el texto: un salto (0xE062)...
	and a			;95a4   ; al acabar, un salto del jugador (0xE062)
	jr nz,L_95B0		;95a5
	ld a,001h		;95a7
	ld (0e062h),a		;95a9
	inc (iy+007h)		;95ac
	ret			;95af
L_95B0:
	ld a,(0c000h)		;95b0   ; ...y al acabar la musica, el final acaba (0xE355 = 1)
	and a			;95b3
	ret nz			;95b4
	ld ix,0e320h		;95b5   ; 0xE355 = 1: el final acaba
	ld (ix+035h),001h		;95b9
	ret			;95bd
L_95BE:
	push af			;95be   ; el color 4 de la paleta = A (rojo y azul) y A (verde): el del texto
	ld hl,0e1e4h		;95bf   ; el color de 0xE1E4 (y su copia baja) y la paleta
	ld (hl),a			;95c2
	and 00fh		;95c3
	inc hl			;95c5
	ld (hl),a			;95c6
	call 046a4h		;95c7
	pop af			;95ca
	ret			;95cb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x95cc..0x95d2  (6 bytes)
DATA_95CC:
	defb 001h,002h,004h,002h,005h,005h	; 95cc

; ======================================================================
; CODIGO 0x95d2..0x95d8  (6 bytes)
; ======================================================================


L_95D2:
	ld a,003h		;95d2   ; el jugador va a la derecha (palanca a 3)
	ld (0e180h),a		;95d4   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ret			;95d7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x95d8..0x98bf  (743 bytes)
DATA_95D8:
	defb 050h,000h,000h,000h,050h,000h,0f0h,001h,0a8h,000h,001h,000h,000h,000h,0d0h,050h	; 95d8  P...P..........P
	defb 000h,001h,001h,050h,000h,000h,001h,0a8h,000h,0c0h,000h,000h,000h,0d0h,000h,001h	; 95e8  ...P............
	defb 003h,007h,009h,00eh,022h,096h,02dh,096h,040h,096h,04eh,096h,064h,096h,078h,096h	; 95f8  ....".-.@.N.d.x.
	defb 084h,096h,093h,096h,09eh,096h,0b3h,096h,0c5h,096h,0d4h,096h,0e3h,096h,0f4h,096h	; 9608  ................
	defb 000h,097h,00fh,097h,01bh,097h,029h,097h,036h,097h,027h,015h,01ch,01ch,010h,014h	; 9618  ......).6.'.....
	defb 01fh,01eh,015h,02fh,0ffh,029h,01fh,025h,010h,018h,011h,026h,015h,010h,013h,01fh	; 9628  .../.).%...&....
	defb 01dh,020h,01ch,015h,024h,015h,014h,0ffh,029h,01fh,025h,022h,010h,01dh,019h,023h	; 9638  . ..$...).%"...#
	defb 023h,019h,01fh,01eh,02ch,0ffh,029h,01fh,025h,010h,018h,011h,026h,015h,010h,023h	; 9648  #...,.).%...&..#
	defb 025h,013h,013h,015h,023h,023h,016h,025h,01ch,01ch,029h,0ffh,016h,01fh,019h,01ch	; 9658  %...##.%..).....
	defb 015h,014h,010h,022h,015h,014h,010h,016h,011h,01ch,013h,01fh,01eh,031h,023h,0ffh	; 9668  ...".........1#.
	defb 027h,019h,013h,01bh,015h,014h,010h,020h,01ch,011h,01eh,0ffh,02eh,010h,011h,022h	; 9678  '...... ......."
	defb 01dh,011h,017h,015h,014h,014h,01fh,01eh,010h,02eh,0ffh,01eh,01fh,027h,010h,027h	; 9688  .............'.'
	defb 015h,010h,013h,011h,01eh,0ffh,01ch,019h,026h,015h,010h,011h,024h,010h,020h,015h	; 9698  ........&...$. .
	defb 011h,013h,015h,010h,011h,017h,011h,019h,01eh,02ch,0ffh,02ch,02ch,02ch,012h,025h	; 96a8  .........,.,,,.%
	defb 024h,010h,011h,010h,024h,015h,022h,022h,019h,012h,01ch,015h,0ffh,014h,01fh,025h	; 96b8  $...$."".......%
	defb 012h,024h,010h,022h,015h,01dh,011h,019h,01eh,023h,02ch,0ffh,011h,022h,015h,010h	; 96c8  .$.".....#,.."..
	defb 024h,018h,015h,010h,011h,01ch,019h,015h,01eh,023h,0ffh,022h,015h,011h,01ch,01ch	; 96d8  $........#."....
	defb 029h,010h,014h,015h,023h,024h,022h,01fh,029h,015h,014h,0ffh,02ch,02ch,02ch,01fh	; 96e8  )...#$".)...,,,.
	defb 022h,010h,01eh,01fh,024h,010h,030h,0ffh,024h,018h,019h,023h,010h,019h,023h,010h	; 96f8  "...$.0.$..#..#.
	defb 011h,010h,014h,019h,022h,015h,0ffh,020h,01fh,023h,023h,019h,012h,019h,01ch,019h	; 9708  ....".. .##.....
	defb 024h,029h,0ffh,027h,018h,019h,013h,018h,010h,01dh,025h,023h,024h,010h,012h,015h	; 9718  $).'......%#$...
	defb 0ffh,019h,01eh,026h,015h,023h,024h,019h,017h,011h,024h,015h,014h,0ffh,012h,015h	; 9728  ...&.#$...$.....
	defb 016h,01fh,022h,015h,010h,019h,024h,031h,023h,010h,024h,01fh,01fh,010h,01ch,011h	; 9738  .."...$1#.$.....
	defb 024h,015h,02ch,0ffh,074h,097h,084h,097h,094h,097h,0a9h,097h,0b7h,097h,0c7h,097h	; 9748  $.,.t...........
	defb 0dch,097h,0ebh,097h,0fah,097h,009h,098h,017h,098h,023h,098h,033h,098h,048h,098h	; 9758  ..........#.3.H.
	defb 056h,098h,066h,098h,07bh,098h,08ch,098h,09ah,098h,0afh,098h,010h,011h,023h,020h	; 9768  V.f.{.........#
	defb 018h,011h,01ch,024h,010h,01ah,025h,01eh,017h,01ch,015h,0ffh,010h,010h,001h,023h	; 9778  ...$..%........#
	defb 024h,010h,025h,01eh,014h,015h,022h,020h,011h,023h,023h,0ffh,018h,01fh,01dh,019h	; 9788  $.%..." .##.....
	defb 013h,019h,014h,015h,010h,013h,015h,01eh,023h,01fh,022h,010h,01eh,01fh,02ch,001h	; 9798  ........#."...,.
	defb 0ffh,010h,010h,010h,010h,018h,015h,01ch,01ch,010h,016h,011h,01ch,01ch,0ffh,010h	; 97a8  ................
	defb 010h,002h,01eh,014h,010h,025h,01eh,014h,015h,022h,020h,011h,023h,023h,0ffh,018h	; 97b8  .....%..." .##..
	defb 01fh,01dh,019h,013h,019h,014h,015h,010h,013h,015h,01eh,023h,01fh,022h,010h,01eh	; 97c8  ...........#."..
	defb 01fh,02ch,002h,0ffh,010h,010h,024h,025h,01eh,014h,022h,011h,010h,010h,011h,022h	; 97d8  .,....$%.."...."
	defb 015h,011h,0ffh,010h,010h,015h,01eh,015h,022h,017h,029h,010h,010h,02ah,01fh,01eh	; 97e8  ........".)..*..
	defb 015h,0ffh,010h,010h,024h,022h,011h,020h,010h,010h,018h,011h,01eh,017h,011h,022h	; 97f8  ....$". ......."
	defb 0ffh,010h,010h,010h,011h,01ch,019h,015h,01eh,010h,02ah,01fh,01eh,015h,0ffh,010h	; 9808  ..........*.....
	defb 010h,010h,010h,010h,013h,011h,026h,015h,022h,01eh,0ffh,010h,001h,023h,024h,010h	; 9818  ......&."....#$.
	defb 025h,01eh,014h,015h,022h,010h,01dh,011h,02ah,015h,0ffh,018h,01fh,01dh,019h,013h	; 9828  %..."...*.......
	defb 019h,014h,015h,010h,013h,015h,01eh,023h,01fh,022h,010h,01eh,01fh,02ch,003h,0ffh	; 9838  .......#."...,..
	defb 010h,010h,010h,01dh,011h,017h,01dh,011h,010h,011h,022h,015h,011h,0ffh,010h,002h	; 9848  ..........".....
	defb 01eh,014h,010h,025h,01eh,014h,015h,022h,010h,01dh,011h,02ah,015h,0ffh,018h,01fh	; 9858  ...%..."...*....
	defb 01dh,019h,013h,019h,014h,015h,010h,013h,015h,01eh,023h,01fh,022h,010h,01eh,01fh	; 9868  ..........#."...
	defb 02ch,004h,0ffh,025h,01eh,014h,015h,022h,017h,022h,01fh,025h,01eh,014h,010h,016h	; 9878  ,..%...".".%....
	defb 011h,01ch,01ch,0ffh,010h,010h,010h,01dh,011h,017h,01dh,011h,010h,011h,022h,015h	; 9888  ..............".
	defb 011h,0ffh,025h,01eh,014h,015h,022h,017h,022h,01fh,025h,01eh,014h,010h,016h,01fh	; 9898  ..%...".".%.....
	defb 022h,024h,022h,015h,023h,023h,0ffh,010h,026h,019h,013h,019h,01fh,025h,023h,010h	; 98a8  "$".##..&....%#.
	defb 010h,023h,020h,011h,013h,015h,0ffh	; 98b8

; ======================================================================
; CODIGO 0x98bf..0x9914  (85 bytes)
; ======================================================================


L_98BF:
	ld hl,06c00h		;98bf   ; la tabla de sprites del jugador en la VRAM (0x6C00): p12:9A3A, de cuatro en cuatro...
	ld (0e0d0h),hl		;98c2   ; guarda la orden del VDP que se manda (registros 32-46) y el byte siguiente (16 bits)
	ld de,09a3ah		;98c5   ; la tabla p12:9A3A
L_98C8:
	ld a,(de)			;98c8   ; cada byte de la tabla, hasta 0xFF
	cp 0ffh		;98c9   ; 0xFF: fin de fila
	jr z,L_98F4		;98cb
	ld b,004h		;98cd
L_98CF:
	push bc			;98cf
	ld b,a			;98d0   ; ...cada byte, cuatro parejas de bits: el color 10 (0xA0/0x0A) o el 15
	bit 7,b		;98d1   ; el bit alto de la pareja...
	jr z,L_98D9		;98d3
	ld a,0a0h		;98d5
	jr L_98DB		;98d7
L_98D9:
	ld a,0f0h		;98d9   ; ...(0xF0 sin el)...
L_98DB:
	bit 6,b		;98db   ; ...y el bajo: 0x0A o 0x0F en la mitad derecha
	jr z,L_98E3		;98dd
	add a,00ah		;98df
	jr L_98E5		;98e1
L_98E3:
	add a,00fh		;98e3
L_98E5:
	call 00177h		;98e5   ; BIOS NWRVRM - Writes to VRAM like in WRTVRM (with 16-bit VRAM-address)
	ld a,b			;98e8   ; la pareja siguiente
	sla a		;98e9
	sla a		;98eb
	inc hl			;98ed
	pop bc			;98ee
	djnz L_98CF		;98ef
	inc de			;98f1
	jr L_98C8		;98f2
L_98F4:
	inc de			;98f4   ; dos 0xFF seguidos: se acabo
	ld a,(de)			;98f5
	cp 0ffh		;98f6
	jr z,L_98FF		;98f8
	dec de			;98fa
	ld b,004h		;98fb
	jr L_98CF		;98fd
L_98FF:
	inc de			;98ff
	ld a,(de)			;9900
	cp 0ffh		;9901
	ret z			;9903
	ld hl,(0e0d0h)		;9904   ; lee la orden del VDP que se manda (registros 32-46) y el byte siguiente (16 bits)
	push de			;9907   ; la fila siguiente: 0x80 bytes mas abajo en la VRAM
	ld de,00080h		;9908
	add hl,de			;990b
	pop de			;990c
	ld (0e0d0h),hl		;990d   ; guarda la orden del VDP que se manda (registros 32-46) y el byte siguiente (16 bits)
	ld b,004h		;9910
	jr L_98CF		;9912

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9914..0x9915  (1 bytes)
DATA_9914:
	defb 0c9h	; 9914

; ======================================================================
; CODIGO 0x9915..0x9a12  (253 bytes)
; ======================================================================


L_9915:
	ld hl,00109h		;9915   ; el rotulo de la fase: STAGE...
	ld de,04508h		;9918   ; STAGE en la casilla 0x109
	call 048d3h		;991b   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,00113h		;991e   ; ...su numero (p00:4576)...
	call 04576h		;9921
	ld a,(0e020h)		;9924   ; ...y su nombre (la tabla p12:974C, una por fase)
	ld hl,0974ch		;9927   ; el nombre: el puntero de p12:974C + 2 x fase, en la casilla 0x167
	add a,a			;992a
	call 051b8h		;992b   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;992e
	inc hl			;992f
	ld d,(hl)			;9930
	ld hl,00167h		;9931
	call 048d3h		;9934   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	xor a			;9937   ; 0x60 cuadros
	ld (0e1c3h),a		;9938
L_993B:
	ld a,(0e1c3h)		;993b   ; espera 0x60 cuadros
	cp 060h		;993e
	jr c,L_993B		;9940
	ret			;9942
L_9943:
	ld a,(0e020h)		;9943   ; donde sale el jugador en cada fase: la y y la x de la tabla p12:9A12
	push af			;9946
	add a,a			;9947
	ld hl,09a12h		;9948   ; la y y la x de la tabla p12:9A12 (dos por fase)
	call 051b8h		;994b   ; lee_tabla: HL = HL + A y A = (HL)
	ld (ix+00ah),a		;994e
	inc hl			;9951
	ld a,(hl)			;9952
	ld (ix+00bh),a		;9953
	pop af			;9956
	ld (ix+00fh),001h		;9957   ; mirando a la izquierda en las fases 13 y 17 (las que van hacia la izquierda)
	cp 00dh		;995b
	ret z			;995d
	cp 011h		;995e
	ret z			;9960
	ld (ix+00fh),000h		;9961   ; mirando a la derecha en las demas
	ret			;9965
L_9966:
	ld a,(0e020h)		;9966   ; la fase (0xE020) elige los arreglos:
	cp 007h		;9969   ; la 7...
	jr z,L_999C		;996b
	cp 012h		;996d   ; ...la 18...
	jr z,L_99AB		;996f
	cp 010h		;9971   ; ...la 16...
	jr z,L_99BD		;9973
	cp 006h		;9975   ; ...la 6...
	jr z,L_99DC		;9977
	cp 011h		;9979   ; ...la 17...
	jr z,L_99EC		;997b
	cp 00ah		;997d   ; ...la 10...
	jr z,L_99F8		;997f
	cp 00dh		;9981   ; ...y la 13; las demas, ninguno
	ret nz			;9983
	ld a,(0e022h)		;9984   ; fase 13: tramo 1 tres casillas a 1, tramo 2 una
	cp 002h		;9987
	jr z,L_9998		;9989
	cp 001h		;998b
	ret nz			;998d
	ld (0c494h),a		;998e   ; tramo 1: 1 en tres casillas (una columna de suelo)
	ld (0c475h),a		;9991
	ld (0c455h),a		;9994
	ret			;9997
L_9998:
	ld (0c46bh),a		;9998   ; tramo 2: 2 en una casilla
	ret			;999b
L_999C:
	ld a,(0e022h)		;999c   ; fase 7, tramo 5: dos casillas a 2
	cp 005h		;999f
	ret nz			;99a1
	sub 003h		;99a2   ; 2 en dos casillas
	ld (0c537h),a		;99a4
	ld (0c5b1h),a		;99a7
	ret			;99aa
L_99AB:
	ld a,(0e022h)		;99ab   ; fase 18: tramo 1 o 2, una casilla
	cp 001h		;99ae
	jr z,L_99B9		;99b0
	cp 002h		;99b2
	ret nz			;99b4
	ld (0c530h),a		;99b5   ; tramo 2: una casilla a 2
	ret			;99b8
L_99B9:
	ld (0c3d2h),a		;99b9   ; tramo 1: una casilla a 1
	ret			;99bc
L_99BD:
	ld a,(0e022h)		;99bd   ; fase 16: tramo 4 tres casillas a 0x50, tramo 6 tres a 2
	cp 004h		;99c0
	jr z,L_99D0		;99c2
	cp 006h		;99c4
	ret nz			;99c6
	ld hl,0c388h		;99c7   ; tramo 6: tres casillas a 2
	sub 004h		;99ca
	ld b,003h		;99cc
	jr L_99D7		;99ce
L_99D0:
	ld hl,0c3bch		;99d0   ; tramo 4: tres casillas a 0x50
	ld a,050h		;99d3
	ld b,003h		;99d5
L_99D7:
	ld (hl),a			;99d7   ; B casillas seguidas a A
	inc hl			;99d8
	djnz L_99D7		;99d9
	ret			;99db
L_99DC:
	ld a,(0e022h)		;99dc   ; fase 6, tramo 4: dos casillas (1 y 2)
	cp 004h		;99df
	ret nz			;99e1
	sub 003h		;99e2   ; 1 y 2 en dos casillas
	ld (0c50eh),a		;99e4
	inc a			;99e7
	ld (0c575h),a		;99e8
	ret			;99eb
L_99EC:
	ld a,(0e022h)		;99ec   ; fase 17, tramo 3: una casilla a 2
	cp 003h		;99ef
	ret nz			;99f1
	sub 001h		;99f2   ; 2 en una casilla
	ld (0c3b6h),a		;99f4
	ret			;99f7
L_99F8:
	ld a,(0e022h)		;99f8   ; fase 10: tramo 0 o 4, cuatro casillas
	and a			;99fb
	jr z,L_9A0A		;99fc
	cp 004h		;99fe
	ret nz			;9a00
	sub 003h		;9a01   ; tramo 4: cuatro casillas a 1
	ld hl,0c3abh		;9a03
	ld b,004h		;9a06
	jr L_99D7		;9a08
L_9A0A:
	inc a			;9a0a   ; tramo 0: dos casillas a 1
	ld (0c397h),a		;9a0b
	ld (0c398h),a		;9a0e
	ret			;9a11

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9a12..0xa000  (1518 bytes)
DATA_9A12:
	defb 030h,020h,080h,078h,080h,078h,080h,078h,080h,078h,080h,078h,020h,020h,060h,020h	; 9a12  0 .x.x.x.x.x  `
	defb 060h,020h,060h,020h,020h,078h,080h,078h,080h,078h,010h,0d8h,080h,078h,080h,078h	; 9a22  ` `  x.x.x...x.x
	defb 020h,080h,010h,0d8h,080h,078h,080h,020h,000h,000h,000h,000h,000h,000h,000h,000h	; 9a32   ....x. ........
	defb 000h,000h,03ch,008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9a42  ..<.............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,03ch,038h,03ch,03ch,006h,03eh	; 9a52  ..........<8<<.>
	defb 03ch,07eh,03ch,03ch,042h,00ch,000h,000h,000h,000h,000h,03ch,07ch,03ch,07ch,07eh	; 9a62  <~<<B......<|<|~
	defb 07eh,03ch,062h,018h,018h,062h,060h,061h,061h,03eh,0ffh,0ffh,066h,018h,066h,066h	; 9a72  ~<b..b`aa>..f.ff
	defb 00eh,030h,060h,006h,066h,066h,099h,07eh,000h,000h,000h,000h,000h,062h,062h,062h	; 9a82  .0`.ff.~.....bbb
	defb 062h,060h,060h,062h,062h,018h,018h,062h,060h,071h,061h,063h,0ffh,0ffh,06eh,018h	; 9a92  b``bb..b`qac..n.
	defb 006h,006h,016h,030h,060h,006h,066h,066h,0a1h,07fh,000h,000h,000h,000h,000h,062h	; 9aa2  ...0`.ff.......b
	defb 062h,060h,062h,060h,060h,060h,062h,018h,018h,064h,060h,06bh,071h,063h,0ffh,0ffh	; 9ab2  b`b```b..d`kqc..
	defb 076h,018h,03ch,01ch,026h,03eh,07ch,018h,03ch,03eh,0a1h,07fh,000h,000h,000h,000h	; 9ac2  v.<.&>|.<>......
	defb 000h,062h,07ch,060h,062h,07ch,07ch,06eh,07eh,018h,018h,078h,060h,065h,069h,063h	; 9ad2  .b|`b||n~..x`eic
	defb 0ffh,0ffh,066h,018h,060h,006h,046h,003h,066h,018h,066h,006h,099h,07eh,000h,000h	; 9ae2  ..f.`.F.f.f..~..
	defb 000h,000h,000h,062h,062h,060h,062h,060h,060h,062h,062h,018h,018h,064h,060h,061h	; 9af2  ...bb`b``bb..d`a
	defb 065h,063h,0ffh,0ffh,066h,018h,062h,066h,07fh,063h,066h,018h,066h,066h,042h,00ch	; 9b02  ec..f.bf.cf.ffB.
	defb 000h,000h,000h,000h,000h,07eh,062h,062h,062h,060h,060h,062h,062h,018h,018h,062h	; 9b12  .....~bbb``bb..b
	defb 060h,061h,063h,063h,0ffh,0ffh,03ch,018h,07eh,03ch,006h,03eh,03ch,018h,03ch,03ch	; 9b22  `acc..<.~<.><.<<
	defb 03ch,008h,000h,000h,000h,000h,000h,062h,07ch,03ch,07ch,07eh,060h,03ch,062h,018h	; 9b32  <......b|<|~`<b.
	defb 070h,062h,07eh,061h,061h,03eh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h	; 9b42  pb~aa>..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,07eh,03eh,07eh,03eh	; 9b52  ............~>~>
	defb 07eh,062h,062h,061h,043h,062h,07eh,001h,000h,000h,028h,018h,07ch,018h,0ffh,0ffh	; 9b62  ~bbaCb~...(.|...
	defb 063h,063h,063h,061h,018h,062h,062h,061h,026h,062h,006h,002h,000h,000h,028h,018h	; 9b72  ccca.bba&b....(.
	defb 006h,018h,0ffh,0ffh,063h,063h,063h,060h,018h,062h,062h,061h,01ch,062h,00ch,004h	; 9b82  ....ccc`.bba.b..
	defb 000h,000h,000h,018h,006h,010h,0ffh,0ffh,07eh,063h,07eh,03eh,018h,062h,062h,065h	; 9b92  ........~c~>.bbe
	defb 008h,062h,018h,008h,000h,03ch,000h,008h,03ch,000h,0ffh,0ffh,060h,06bh,064h,001h	; 9ba2  .b...<..<...`kd.
	defb 018h,062h,062h,06bh,01ch,03ch,030h,010h,030h,000h,000h,000h,030h,000h,0ffh,0ffh	; 9bb2  .bbk.<0.0...0...
	defb 060h,067h,062h,061h,018h,062h,034h,071h,032h,018h,060h,020h,030h,000h,000h,018h	; 9bc2  `gba.b4q2.` 0...
	defb 000h,000h,0ffh,0ffh,060h,03eh,063h,03eh,018h,03ch,018h,061h,061h,018h,07eh,040h	; 9bd2  ....`>c>.<.aa.~@
	defb 000h,000h,000h,018h,030h,000h,0ffh,0ffh,0ffh,001h,011h,00ah,061h,0c9h,0ebh,023h	; 9be2  ....0.......a..#
	defb 013h,0beh,0ebh,038h,002h,0afh,0c9h,023h,013h,01ah,0ddh,086h,001h,047h,033h,033h	; 9bf2  ...8...#.....G33
	defb 033h,033h,033h,0b3h,033h,000h,000h,083h,033h,033h,033h,033h,033h,033h,033h,033h	; 9c02  333.3...33333333
	defb 033h,033h,0b3h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h	; 9c12  33.3333333333333
	defb 032h,011h,011h,011h,011h,011h,013h,033h,033h,033h,033h,033h,033h,030h,000h,000h	; 9c22  2......3333330..
	defb 008h,000h,000h,033h,033h,033h,033h,033h,033h,033h,033h,033h,0b3h,033h,033h,033h	; 9c32  ...333333333.333
	defb 033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,000h,005h,0d5h	; 9c42  3333333333333...
	defb 055h,055h,0d5h,050h,033h,033h,033h,030h,000h,080h,077h,077h,077h,077h,0f7h,077h	; 9c52  UU.P3330..wwww.w
	defb 077h,003h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,038h,055h,055h,055h	; 9c62  w.33333333338UUU
	defb 055h,000h,085h,055h,057h,077h,077h,073h,000h,000h,080h,000h,000h,000h,033h,033h	; 9c72  U..UWwws......33
	defb 033h,0b3h,033h,033h,033h,033h,033h,033h,033h,030h,000h,0b3h,033h,033h,033h,033h	; 9c82  3.33333330..3333
	defb 033h,030h,00dh,055h,055h,077h,000h,000h,000h,000h,000h,000h,008h,000h,000h,000h	; 9c92  30.UUw..........
	defb 000h,000h,030h,000h,000h,000h,000h,000h,000h,000h,055h,0d5h,050h,000h,000h,000h	; 9ca2  ..0.......U.P...
	defb 000h,000h,000h,000h,008h,000h,000h,000h,033h,033h,033h,03bh,033h,033h,033h,005h	; 9cb2  ........333.333.
	defb 055h,0d5h,053h,033h,033h,033h,033h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9cc2  U.S3333.........
	defb 000h,000h,000h,000h,080h,000h,000h,003h,030h,080h,000h,000h,000h,000h,000h,080h	; 9cd2  ........0.......
	defb 000h,000h,000h,008h,000h,000h,000h,003h,033h,0b3h,033h,033h,033h,033h,033h,033h	; 9ce2  ........3.333333
	defb 033h,033h,033h,033h,033h,033h,033h,035h,0d5h,055h,055h,0d5h,055h,000h,005h,075h	; 9cf2  33333335.UU.U..u
	defb 050h,055h,055h,055h,055h,008h,000h,000h,000h,000h,005h,0d5h,055h,055h,055h,055h	; 9d02  PUUUU.......UUUU
	defb 055h,055h,003h,033h,033h,033h,033h,033h,033h,033h,000h,000h,000h,000h,000h,003h	; 9d12  UU.3333333......
	defb 033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,033h,032h,011h,011h,011h,011h	; 9d22  333333333332....
	defb 011h,011h,011h,011h,011h,011h,019h,000h,000h,000h,0b3h,030h,000h,000h,000h,008h	; 9d32  ...........0....
	defb 000h,077h,077h,077h,077h,077h,077h,077h,077h,075h,033h,033h,033h,033h,030h,000h	; 9d42  .wwwwwwwwu33330.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h	; 9d52  ................
	defb 000h,000h,000h,000h,005h,055h,055h,055h,055h,055h,0d5h,055h,055h,05dh,055h,055h	; 9d62  .....UUUUU.UU]UU
	defb 055h,003h,033h,033h,033h,033h,011h,012h,022h,018h,081h,011h,011h,011h,011h,011h	; 9d72  U.3333..".......
	defb 011h,011h,011h,011h,011h,000h,080h,000h,000h,000h,080h,000h,007h,077h,077h,077h	; 9d82  .............www
	defb 077h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,000h	; 9d92  w...............
	defb 000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h	; 9da2  ................
	defb 000h,000h,000h,000h,000h,005h,055h,055h,055h,050h,007h,077h,077h,077h,077h,077h	; 9db2  ......UUUP.wwwww
	defb 077h,077h,077h,077h,077h,033h,011h,011h,011h,011h,011h,011h,011h,011h,011h,03bh	; 9dc2  wwwww3..........
	defb 033h,033h,033h,030h,000h,080h,000h,000h,000h,000h,000h,080h,000h,033h,000h,000h	; 9dd2  3330.........3..
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9de2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h	; 9df2  ................
	defb 000h,000h,000h,000h,033h,033h,033h,033h,033h,03bh,033h,033h,033h,000h,000h,000h	; 9e02  ....33333.333...
	defb 000h,008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9e12  ................
	defb 033h,033h,033h,033h,033h,033h,033h,033h,013h,011h,011h,011h,011h,011h,011h,011h	; 9e22  33333333........
	defb 011h,011h,018h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h,077h	; 9e32  ...wwwwwwwwwwwww
	defb 077h,077h,078h,010h,077h,000h,003h,000h,001h,011h,011h,011h,023h,032h,022h,022h	; 9e42  wwx.w.......#2""
	defb 023h,032h,022h,032h,033h,032h,022h,022h,022h,023h,033h,033h,033h,033h,033h,033h	; 9e52  #2"232"""#333333
	defb 022h,021h,091h,022h,022h,020h,000h,077h,000h,000h,000h,008h,007h,077h,077h,077h	; 9e62  "!."" .w.....www
	defb 077h,077h,077h,077h,077h,077h,077h,080h,000h,000h,000h,000h,000h,000h,000h,033h	; 9e72  wwwwwww........3
	defb 033h,033h,03bh,030h,077h,077h,077h,077h,055h,055h,055h,055h,055h,055h,055h,055h	; 9e82  33.0wwwwUUUUUUUU
	defb 055h,055h,055h,050h,000h,000h,003h,033h,033h,033h,034h,033h,011h,011h,011h,017h	; 9e92  UUUP...33343....
	defb 078h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,030h,000h	; 9ea2  x.............0.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h	; 9eb2  ................
	defb 000h,007h,078h,088h,080h,000h,000h,000h,070h,003h,033h,031h,011h,011h,011h,011h	; 9ec2  ..x.....p.31....
	defb 018h,078h,000h,000h,000h,077h,077h,070h,033h,033h,033h,033h,033h,012h,020h,000h	; 9ed2  .x...wwp33333. .
	defb 000h,000h,000h,000h,000h,000h,000h,007h,077h,077h,000h,077h,077h,077h,07fh,070h	; 9ee2  ........ww.www.p
	defb 000h,000h,003h,032h,022h,022h,023h,033h,030h,000h,001h,011h,011h,011h,013h,033h	; 9ef2  ...2""#30......3
	defb 033h,033h,031h,011h,011h,011h,011h,011h,011h,011h,087h,077h,077h,077h,077h,030h	; 9f02  331........wwww0
	defb 030h,000h,000h,000h,000h,037h,077h,077h,077h,077h,073h,033h,033h,031h,011h,011h	; 9f12  0....7wwwws331..
	defb 011h,011h,011h,011h,010h,000h,033h,033h,03bh,000h,033h,033h,033h,033h,021h,011h	; 9f22  ......33..3333!.
	defb 011h,011h,011h,011h,011h,011h,011h,011h,011h,091h,018h,077h,077h,077h,077h,073h	; 9f32  ...........wwwws
	defb 000h,000h,000h,000h,003h,011h,011h,011h,012h,022h,027h,077h,011h,011h,011h,011h	; 9f42  ........."'w....
	defb 011h,000h,008h,000h,000h,007h,077h,077h,003h,000h,000h,000h,003h,031h,011h,011h	; 9f52  ......ww.....1..
	defb 011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,012h,033h	; 9f62  ...............3
	defb 0b0h,007h,077h,077h,070h,030h,000h,000h,000h,011h,011h,011h,011h,011h,011h,011h	; 9f72  ..wwp0..........
	defb 011h,011h,011h,011h,011h,011h,011h,012h,033h,033h,033h,021h,011h,012h,022h,032h	; 9f82  ........333!.."2
	defb 010h,070h,000h,000h,033h,033h,033h,088h,081h,011h,011h,011h,011h,088h,088h,088h	; 9f92  .p..333.........
	defb 088h,088h,088h,088h,000h,008h,003h,033h,033h,033h,033h,080h,000h,077h,077h,077h	; 9fa2  .......3333..www
	defb 000h,003h,031h,011h,011h,011h,011h,011h,011h,011h,011h,011h,010h,008h,000h,000h	; 9fb2  ..1.............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,007h	; 9fc2  ................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,029h,022h,022h,028h,008h,024h	; 9fd2  ..........)""(.$
	defb 0a1h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,022h,022h,026h,020h,021h,024h	; 9fe2  ..........""& !$
	defb 028h,005h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,026h,026h,023h,028h	; 9ff2  (.........&&#(
