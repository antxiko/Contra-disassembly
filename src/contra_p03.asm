; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS sin identificar  0xa000..0xa001  (1 bytes)
DATA_A000:
	defb 000h	; a000

; ======================================================================
; CODIGO 0xa001..0xa098  (151 bytes)
; ======================================================================


L_A001:
	ld (iy+010h),a		;a001
	inc hl			;a004
	ld a,(hl)			;a005
	add a,(iy+00bh)		;a006
	ld (iy+001h),a		;a009
	ld (iy+011h),a		;a00c
	inc hl			;a00f
	ld a,(hl)			;a010
	ld (iy+002h),a		;a011
	add a,004h		;a014
	ld (iy+012h),a		;a016
	ret			;a019
L_A01A:
	call 09ffah		;a01a
	inc hl			;a01d
	ld a,(hl)			;a01e
	add a,(iy+00ah)		;a01f
	ld (iy+020h),a		;a022
	ld (iy+030h),a		;a025
	inc hl			;a028
	ld a,(hl)			;a029
	add a,(iy+00bh)		;a02a
	ld (iy+021h),a		;a02d
	ld (iy+031h),a		;a030
	inc hl			;a033
	ld a,(hl)			;a034
	ld (iy+022h),a		;a035
	add a,004h		;a038
	ld (iy+032h),a		;a03a
	ret			;a03d
despacha_estado:		; salta por la tabla que va detras del call, con el estado del objeto (IY+5)
	ld e,(iy+005h)		;a03e
despacha_e:		; salta por la tabla que va detras del call, con el indice en E
	pop hl			;a041
	rlc e		;a042
	ld d,000h		;a044
	add hl,de			;a046
	ld e,(hl)			;a047
	inc hl			;a048
	ld d,(hl)			;a049
	ex de,hl			;a04a
	jp (hl)			;a04b
L_A04C:
	inc (iy+017h)		;a04c
	ld e,(iy+017h)		;a04f
	ld a,(iy+004h)		;a052
	cp 017h		;a055
	jr nz,L_A065		;a057
	ld a,(iy+017h)		;a059
	cp 018h		;a05c
	jr nc,L_A074		;a05e
	ld hl,0a098h		;a060
	jr L_A06F		;a063
L_A065:
	ld a,(iy+017h)		;a065
	cp 00fh		;a068
	jr nc,L_A074		;a06a
	ld hl,0a0a0h		;a06c
L_A06F:
	ld d,000h		;a06f
	add hl,de			;a071
	ld b,(hl)			;a072
	ret			;a073
L_A074:
	ld (iy+016h),002h		;a074
	ret			;a078
L_A079:
	dec (iy+017h)		;a079
	ld a,(iy+017h)		;a07c
	ld e,a			;a07f
	cp 001h		;a080
	jr nc,L_A087		;a082
	inc (iy+017h)		;a084
L_A087:
	ld a,(iy+004h)		;a087
	cp 017h		;a08a
	jr nz,L_A093		;a08c
	ld hl,0a098h		;a08e
	jr L_A06F		;a091
L_A093:
	ld hl,0a0b0h		;a093
	jr L_A06F		;a096

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa098..0xa0d0  (56 bytes)
DATA_A098:
	defb 005h,005h,005h,004h,004h,004h,004h,004h,004h,004h,003h,003h,003h,003h,002h,002h	; a098  ................
	defb 002h,002h,001h,001h,001h,001h,000h,000h,004h,004h,003h,003h,003h,002h,002h,002h	; a0a8  ................
	defb 002h,001h,001h,001h,001h,000h,000h,000h,0e8h,000h,0e8h,008h,0f0h,008h,0f8h,008h	; a0b8  ................
	defb 0f8h,000h,0f8h,0f8h,0f0h,0f8h,0e8h,0f8h	; a0c8  ........

; ======================================================================
; CODIGO 0xa0d0..0xa10d  (61 bytes)
; ======================================================================


L_A0D0:
	ld e,001h		;a0d0
	jp L_A0D7		;a0d2
L_A0D5:
	ld e,002h		;a0d5
L_A0D7:
	call L_A0E4		;a0d7
	ld a,(0e2d2h)		;a0da
	and a			;a0dd
	ret z			;a0de
	call 05052h		;a0df   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	xor a			;a0e2
	ret			;a0e3
L_A0E4:
	xor a			;a0e4
	ld (0e2d2h),a		;a0e5
	ld a,(0e202h)		;a0e8   ; lee la copia del banco de 0x6000
	push af			;a0eb
	ld a,00eh		;a0ec
	ld (0e202h),a		;a0ee   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;a0f1   ; el mapper: pone en 0x6000 el banco de A
	call 07800h		;a0f4
	pop af			;a0f7
	ld (0e202h),a		;a0f8   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;a0fb   ; el mapper: pone en 0x6000 el banco de A
	ret			;a0fe
L_A0FF:
	ld (iy+004h),00bh		;a0ff
	ld (iy+005h),000h		;a103
	jp L_A8AF		;a107
L_A10A:
	call despacha_estado		;a10a   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa10d..0xa115  (8 bytes)
DATA_A10D:
	defb 015h,0a1h,01ah,0a1h,02ah,0a1h,060h,0a1h	; a10d  ....*.`.

; ======================================================================
; CODIGO 0xa115..0xa196  (129 bytes)
; ======================================================================


L_A115:
	ld e,003h		;a115
	jp L_A0E4		;a117
L_A11A:
	ld a,(iy+00dh)		;a11a
	call L_A869		;a11d
	jr nc,L_A170		;a120
	ld hl,0a92fh		;a122
	call 09ffah		;a125
	jr L_A170		;a128
L_A12A:
	ld a,010h		;a12a
	call 09915h		;a12c
	jr nc,L_A170		;a12f
	push ix		;a131
	call 0847eh		;a133
	jr c,L_A15C		;a136
	ld de,00000h		;a138
	ld hl,0a196h		;a13b
	call 08713h		;a13e
	ld (ix+004h),022h		;a141
	ld (ix+005h),000h		;a145
	ld (ix+002h),0f4h		;a149
	ld a,(iy+008h)		;a14d
	ld (ix+00eh),a		;a150
	inc (iy+005h)		;a153
	ld hl,0a92ch		;a156
	call 09ffah		;a159
L_A15C:
	pop ix		;a15c
	jr L_A170		;a15e
L_A160:
	ld a,020h		;a160
	ld b,001h		;a162
	call L_A881		;a164
	call 09915h		;a167
	jr nc,L_A170		;a16a
	ld (iy+005h),001h		;a16c
L_A170:
	ld hl,0a198h		;a170
	call 05a68h		;a173
	ld hl,0a198h		;a176
	call 05af8h		;a179
	ret nc			;a17c
	ld (iy+00dh),000h		;a17d
	ld (iy+004h),00bh		;a181
	ld (iy+005h),000h		;a185
	ld a,010h		;a189
	call 05f33h		;a18b
	ld de,00010h		;a18e
	add iy,de		;a191
	jp L_A8BD		;a193

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa196..0xa19c  (6 bytes)
DATA_A196:
	defb 001h,0f2h,00eh,00ch,002h,00ch	; a196

; ======================================================================
; CODIGO 0xa19c..0xa203  (103 bytes)
; ======================================================================


L_A19C:
	ld a,(iy+005h)		;a19c
	and a			;a19f
	jp nz,L_A1B1		;a1a0
	ld (iy+005h),001h		;a1a3
	ld bc,0a8d3h		;a1a7
	call 05e45h		;a1aa
	ld (iy+002h),0f4h		;a1ad
L_A1B1:
	ld a,(0e18bh)		;a1b1
	and a			;a1b4
	jp z,L_A8BD		;a1b5
	ld a,(iy+00eh)		;a1b8
	cp 0ffh		;a1bb
	jr z,L_A1CF		;a1bd
	inc (iy+001h)		;a1bf
	inc (iy+001h)		;a1c2
	ld a,(iy+001h)		;a1c5
	cp 0e8h		;a1c8
	jp nc,L_A8BD		;a1ca
	jr L_A1DD		;a1cd
L_A1CF:
	dec (iy+001h)		;a1cf
	dec (iy+001h)		;a1d2
	ld a,(iy+001h)		;a1d5
	cp 004h		;a1d8
	jp c,L_A8BD		;a1da
L_A1DD:
	inc (iy+00ch)		;a1dd
	ld a,(iy+00ch)		;a1e0
	cp 003h		;a1e3
	jr c,L_A1EE		;a1e5
	ld (iy+00ch),000h		;a1e7
	dec (iy+001h)		;a1eb
L_A1EE:
	ld hl,0a203h		;a1ee
	push hl			;a1f1
	call 05a61h		;a1f2
	pop hl			;a1f5
	call 05af8h		;a1f6
	ret nc			;a1f9
	ld (iy+004h),00bh		;a1fa
	ld (iy+005h),000h		;a1fe
	ret			;a202

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa203..0xa207  (4 bytes)
DATA_A203:
	defb 010h,010h,000h,010h	; a203

; ======================================================================
; CODIGO 0xa207..0xa287  (128 bytes)
; ======================================================================


L_A207:
	ld a,(iy+005h)		;a207
	and a			;a20a
	jp nz,L_A237		;a20b
	inc (iy+005h)		;a20e
	ld a,(iy+001h)		;a211
	sub (ix+001h)		;a214
	srl a		;a217
	srl a		;a219
	srl a		;a21b
	srl a		;a21d
	set 0,a		;a21f
	ld (iy+00dh),a		;a221
	ld bc,0a8dbh		;a224
	call 05e45h		;a227
	ld a,014h		;a22a
	ld (iy+008h),a		;a22c
	call 05cb6h		;a22f
	ld a,0fch		;a232
	call 05c75h		;a234
L_A237:
	ld a,(0e18bh)		;a237
	and a			;a23a
	jp nz,L_A8BD		;a23b
	dec (iy+001h)		;a23e
	dec (iy+001h)		;a241
	ld a,(iy+00dh)		;a244
	call 09915h		;a247
	jr nc,L_A25D		;a24a
	ld a,(iy+008h)		;a24c
	inc a			;a24f
	ld (iy+008h),a		;a250
	call 05cb6h		;a253
	ld a,(iy+006h)		;a256
	inc a			;a259
	call 05c75h		;a25a
L_A25D:
	call 05c53h		;a25d
	ld a,(iy+000h)		;a260
	cp 0b0h		;a263
	jp nc,L_A8BD		;a265
	ld a,(iy+001h)		;a268
	cp 004h		;a26b
	jp c,L_A8BD		;a26d
	inc (iy+00ah)		;a270
	ld a,(iy+00ah)		;a273
	and 004h		;a276
	add a,0f8h		;a278
	ld (iy+002h),a		;a27a
	ld hl,0a287h		;a27d
	call 05a68h		;a280
	ret nc			;a283
	jp L_A8BD		;a284

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa287..0xa28b  (4 bytes)
DATA_A287:
	defb 00ch,008h,004h,008h	; a287

; ======================================================================
; CODIGO 0xa28b..0xa295  (10 bytes)
; ======================================================================


L_A28B:
	ld a,(0e18bh)		;a28b
	and a			;a28e
	jp nz,L_A8BD		;a28f
	call despacha_estado		;a292   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa295..0xa29b  (6 bytes)
DATA_A295:
	defb 09bh,0a2h,0e0h,0a2h,0e8h,0a2h	; a295

; ======================================================================
; CODIGO 0xa29b..0xa33f  (164 bytes)
; ======================================================================


L_A29B:
	inc (iy+005h)		;a29b
	ld a,(0e020h)		;a29e   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;a2a1
	jr z,L_A2AD		;a2a3
	ld a,(iy+000h)		;a2a5
	sub 010h		;a2a8
	ld (iy+000h),a		;a2aa
L_A2AD:
	ld a,r		;a2ad
	and 003h		;a2af
	set 0,a		;a2b1
	ld (iy+00dh),a		;a2b3
	ld (iy+00eh),a		;a2b6
	ld bc,0a8d3h		;a2b9
	call 05e45h		;a2bc
	ld (iy+008h),000h		;a2bf
	ld a,0fdh		;a2c3
	call 05c75h		;a2c5
	ld a,010h		;a2c8
	ld (iy+008h),a		;a2ca
	ld (iy+002h),0fch		;a2cd
	ld a,(0e020h)		;a2d1   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;a2d4
	jp nz,05cb6h		;a2d6
	ld (iy+002h),0f4h		;a2d9
	jp 05cb6h		;a2dd
L_A2E0:
	inc (iy+005h)		;a2e0
	ld a,03ah		;a2e3
	call 05052h		;a2e5   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_A2E8:
	dec (iy+001h)		;a2e8
	dec (iy+00eh)		;a2eb
	jr nz,L_A2F9		;a2ee
	ld a,(iy+00dh)		;a2f0
	ld (iy+00eh),a		;a2f3
	dec (iy+001h)		;a2f6
L_A2F9:
	inc (iy+00ch)		;a2f9
	ld a,(iy+00ch)		;a2fc
	cp 004h		;a2ff
	jr c,L_A312		;a301
	ld (iy+00ch),000h		;a303
	ld a,(iy+006h)		;a307
	inc a			;a30a
	cp 00ch		;a30b
	jr z,L_A312		;a30d
	call 05c75h		;a30f
L_A312:
	call 05c53h		;a312
	ld a,(iy+001h)		;a315
	cp 0e8h		;a318
	jp nc,L_A8A9		;a31a
	ld a,(0e020h)		;a31d   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;a320
	jr z,L_A332		;a322
	ld a,(iy+000h)		;a324
	cp 0b0h		;a327
	jp nc,L_A8A9		;a329
L_A32C:
	ld hl,05bd1h		;a32c
	jp 05a5ah		;a32f
L_A332:
	ld a,(iy+000h)		;a332
	cp 05ch		;a335
	jr c,L_A32C		;a337
	ld (iy+004h),020h		;a339
	jr L_A32C		;a33d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa33f..0xa34e  (15 bytes)
DATA_A33F:
	defb 0fdh,07eh,00bh,0fdh,077h,001h,0fdh,07eh,00ah,0d6h,010h,0fdh,077h,000h,0c9h	; a33f  .~..w..~....w..

; ======================================================================
; CODIGO 0xa34e..0xa3b2  (100 bytes)
; ======================================================================


L_A34E:
	ld a,(iy+005h)		;a34e
	and a			;a351
	jp nz,L_A37F		;a352
	inc (iy+005h)		;a355
	call 09a24h		;a358
	ld a,r		;a35b
	and 001h		;a35d
	ld (iy+00ah),a		;a35f
	ld bc,0a8d9h		;a362
	call 05e31h		;a365
	ld a,(iy+000h)		;a368
	xor 0ffh		;a36b
	and 080h		;a36d
	srl a		;a36f
	srl a		;a371
	srl a		;a373
	ld (iy+008h),a		;a375
	call 05cb6h		;a378
	xor a			;a37b
	call 05c75h		;a37c
L_A37F:
	ld a,010h		;a37f
	ld b,008h		;a381
	call L_A3B6		;a383
	call 05c53h		;a386
	ld a,084h		;a389
	inc (iy+007h)		;a38b
	bit 3,(iy+007h)		;a38e
	jr z,L_A396		;a392
	ld a,08ch		;a394
L_A396:
	ld (iy+002h),a		;a396
	call 09abfh		;a399
	call L_A7D5		;a39c
	ret nc			;a39f
	ld hl,0a3b2h		;a3a0
	push hl			;a3a3
	call 05a5ah		;a3a4
	pop hl			;a3a7
	call 05af8h		;a3a8
	ret nc			;a3ab
	call 09ff5h		;a3ac
	jp L_A0FF		;a3af

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa3b2..0xa3b6  (4 bytes)
DATA_A3B2:
	defb 008h,008h,000h,010h	; a3b2

; ======================================================================
; CODIGO 0xa3b6..0xa420  (106 bytes)
; ======================================================================


L_A3B6:
	call 09915h		;a3b6
	ret nc			;a3b9
	ld a,(iy+001h)		;a3ba
	cp (ix+001h)		;a3bd
	jr c,L_A3C6		;a3c0
	ld a,001h		;a3c2
	jr L_A3C8		;a3c4
L_A3C6:
	ld a,0ffh		;a3c6
L_A3C8:
	add a,(iy+008h)		;a3c8
	and 01fh		;a3cb
	ld (iy+008h),a		;a3cd
	call 05cb6h		;a3d0
	ld a,(iy+006h)		;a3d3
	inc a			;a3d6
	inc a			;a3d7
	cp b			;a3d8
	ret nc			;a3d9
	ld (iy+006h),a		;a3da
	jp 05c75h		;a3dd
L_A3E0:
	ld (iy+009h),018h		;a3e0
	ld a,(iy+005h)		;a3e4
	and a			;a3e7
	jr nz,L_A3F8		;a3e8
	ld (iy+00ch),000h		;a3ea
	ld (iy+005h),001h		;a3ee
	ld bc,0a8d3h		;a3f2
	call 05e45h		;a3f5
L_A3F8:
	ld a,018h		;a3f8
	call 09915h		;a3fa
	jp c,L_A8BD		;a3fd
	ld a,(iy+009h)		;a400
	bit 3,(iy+00ch)		;a403
	jr z,L_A40B		;a407
	ld a,01ch		;a409
L_A40B:
	ld (iy+002h),a		;a40b
	ld bc,0a8d3h		;a40e
	jp 05e45h		;a411
L_A414:
	ld (iy+009h),010h		;a414
	ld hl,0a420h		;a418
	call 05a68h		;a41b
	jr L_A3E0		;a41e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa420..0xa424  (4 bytes)
DATA_A420:
	defb 000h,010h,000h,010h	; a420

; ======================================================================
; CODIGO 0xa424..0xa4a6  (130 bytes)
; ======================================================================


L_A424:
	ld a,(iy+005h)		;a424
	and a			;a427
	jp nz,L_A459		;a428
	ld (iy+005h),001h		;a42b
	ld bc,0a8d3h		;a42f
	call 05e45h		;a432
	ld (iy+00eh),000h		;a435
	ld a,004h		;a439
	ld (iy+006h),a		;a43b
	call 05c75h		;a43e
	xor a			;a441
	ld (iy+008h),a		;a442
	call 05cb6h		;a445
	ld (iy+002h),0fch		;a448
	ld (iy+00ah),002h		;a44c
	ld (iy+00dh),003h		;a450
	ld a,02ah		;a454
	call 05052h		;a456   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_A459:
	call L_A74A		;a459
	inc (iy+00bh)		;a45c
	ld a,(iy+00bh)		;a45f
	ld b,0e8h		;a462
	cp 008h		;a464
	jr c,L_A478		;a466
	ld b,0ech		;a468
	cp 010h		;a46a
	jr c,L_A478		;a46c
	ld b,0f0h		;a46e
	cp 018h		;a470
	jr c,L_A478		;a472
	ld (iy+00bh),000h		;a474
L_A478:
	ld (iy+002h),b		;a478
	ld hl,0a4a6h		;a47b
	call 05af8h		;a47e
	jp c,L_A499		;a481
	ld a,(iy+008h)		;a484
	cp 010h		;a487
	ret nz			;a489
	ld a,(iy+006h)		;a48a
	cp 004h		;a48d
	ret c			;a48f
	ld a,(iy+000h)		;a490
	add a,018h		;a493
	cp (ix+00ah)		;a495
	ret c			;a498
L_A499:
	ld (iy+004h),020h		;a499
	ld (iy+005h),000h		;a49d
	ld a,030h		;a4a1
	jp 05052h		;a4a3   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa4a6..0xa4aa  (4 bytes)
DATA_A4A6:
	defb 004h,008h,004h,008h	; a4a6

; ======================================================================
; CODIGO 0xa4aa..0xa4c0  (22 bytes)
; ======================================================================


L_A4AA:
	ld a,(0e031h)		;a4aa
	cp 002h		;a4ad
	jp z,L_A8BD		;a4af
	inc (iy+003h)		;a4b2
	ld a,(iy+003h)		;a4b5
	and 00fh		;a4b8
	call 05e57h		;a4ba
	call despacha_estado		;a4bd   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa4c0..0xa4c6  (6 bytes)
DATA_A4C0:
	defb 0c6h,0a4h,0dch,0a4h,0fdh,0a4h	; a4c0

; ======================================================================
; CODIGO 0xa4c6..0xa531  (107 bytes)
; ======================================================================


L_A4C6:
	inc (iy+005h)		;a4c6
	ld (iy+002h),024h		;a4c9
	ld a,000h		;a4cd
	ld (iy+008h),a		;a4cf
	call 05cb6h		;a4d2
	ld a,007h		;a4d5
L_A4D7:
	call 05c75h		;a4d7
	jr L_A510		;a4da
L_A4DC:
	ld a,003h		;a4dc
	call 09915h		;a4de
	jr nc,L_A510		;a4e1
	ld a,(iy+006h)		;a4e3
	dec a			;a4e6
	cp 0f9h		;a4e7
	jr nz,L_A4D7		;a4e9
	inc (iy+005h)		;a4eb
	ld a,(iy+008h)		;a4ee
	xor 0ffh		;a4f1
	and 010h		;a4f3
	ld (iy+008h),a		;a4f5
	call 05cb6h		;a4f8
	jr L_A510		;a4fb
L_A4FD:
	ld a,003h		;a4fd
	call 09915h		;a4ff
	jr nc,L_A510		;a502
	ld a,(iy+006h)		;a504
	inc a			;a507
	cp 007h		;a508
	jr nz,L_A4D7		;a50a
	ld (iy+005h),001h		;a50c
L_A510:
	call 05c53h		;a510
	ld a,002h		;a513
	call 09921h		;a515
	jr nc,L_A51D		;a518
	inc (iy+001h)		;a51a
L_A51D:
	ld a,(iy+001h)		;a51d
	cp 0f0h		;a520
	jp nc,L_A8A9		;a522
	ld hl,0a531h		;a525
	call 05af8h		;a528
	ret nc			;a52b
	ld e,008h		;a52c
	jp L_A0E4		;a52e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa531..0xa535  (4 bytes)
DATA_A531:
	defb 00ch,008h,004h,008h	; a531

; ======================================================================
; CODIGO 0xa535..0xa5a0  (107 bytes)
; ======================================================================


L_A535:
	ld a,(iy+005h)		;a535
	and a			;a538
	jp nz,L_A557		;a539
	inc (iy+005h)		;a53c
	ld bc,0a8d3h		;a53f
	call 05e45h		;a542
	ld a,010h		;a545
	ld (iy+008h),a		;a547
	ld a,0feh		;a54a
	call 05c75h		;a54c
	ld a,010h		;a54f
	ld (iy+008h),a		;a551
	call 05cb6h		;a554
L_A557:
	ld a,(0e18bh)		;a557
	and a			;a55a
	jp nz,L_A8BD		;a55b
	ld a,010h		;a55e
	ld b,004h		;a560
	call L_A3B6		;a562
L_A565:
	inc (iy+00ah)		;a565
	ld a,(iy+00ah)		;a568
	ld c,0e8h		;a56b
	cp 006h		;a56d
	jr c,L_A565		;a56f
	ld c,0ech		;a571
	cp 00ch		;a573
	jr c,L_A585		;a575
	ld c,0f0h		;a577
	cp 012h		;a579
	jr c,L_A585		;a57b
	cp 018h		;a57d
	jr c,L_A585		;a57f
	ld (iy+00ah),000h		;a581
L_A585:
	ld (iy+002h),c		;a585
	call 05c53h		;a588
	ld hl,0a5a0h		;a58b
	push hl			;a58e
	call 05a68h		;a58f
	pop hl			;a592
	call 05af8h		;a593
	jp nc,L_A7B9		;a596
	ld (iy+004h),00bh		;a599
	jp L_A7B9		;a59d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa5a0..0xa5a4  (4 bytes)
DATA_A5A0:
	defb 00ah,004h,004h,008h	; a5a0

; ======================================================================
; CODIGO 0xa5a4..0xa608  (100 bytes)
; ======================================================================


L_A5A4:
	ret			;a5a4
L_A5A5:
	ld a,(iy+005h)		;a5a5
	and a			;a5a8
	jp nz,L_A5BA		;a5a9
	inc (iy+005h)		;a5ac
	ld e,004h		;a5af
	call L_A0E4		;a5b1
	ld bc,0a60ch		;a5b4
	jp 05e45h		;a5b7
L_A5BA:
	ld a,(iy+000h)		;a5ba
	cp 098h		;a5bd
	jp nc,L_A8A9		;a5bf
	ld a,(0e18bh)		;a5c2
	and a			;a5c5
	jp nz,L_A8A9		;a5c6
	inc (iy+00eh)		;a5c9
	ld a,0d8h		;a5cc
	bit 2,(iy+00eh)		;a5ce
	jr z,L_A5D6		;a5d2
	ld a,0e0h		;a5d4
L_A5D6:
	ld (iy+002h),a		;a5d6
	add a,004h		;a5d9
	ld (iy+012h),a		;a5db
	call 05c53h		;a5de
	call 09abfh		;a5e1
	ld hl,0a608h		;a5e4
	call 05af8h		;a5e7
	jr nc,L_A5F7		;a5ea
	inc (iy+00ch)		;a5ec
	ld a,(iy+00ch)		;a5ef
	cp 003h		;a5f2
	jp nc,L_A0FF		;a5f4
L_A5F7:
	ld a,(iy+000h)		;a5f7
	cp 098h		;a5fa
	jp nc,L_A8A9		;a5fc
	cp 090h		;a5ff
	ret c			;a601
	ld hl,0a608h		;a602
	jp 05a5ah		;a605

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa608..0xa60e  (6 bytes)
DATA_A608:
	defb 000h,014h,000h,014h,007h,066h	; a608

; ======================================================================
; CODIGO 0xa60e..0xa611  (3 bytes)
; ======================================================================


L_A60E:
	call despacha_estado		;a60e   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa611..0xa61f  (14 bytes)
DATA_A611:
	defb 01fh,0a6h,046h,0a6h,06ah,0a6h,07bh,0a6h,082h,0a6h,092h,0a6h,09dh,0a6h	; a611  ..F.j.{.......

; ======================================================================
; CODIGO 0xa61f..0xa6ce  (175 bytes)
; ======================================================================


L_A61F:
	ld (iy+005h),001h		;a61f
	ld a,(iy+000h)		;a623
	ld (iy+01eh),a		;a626
	ld a,(iy+001h)		;a629
	ld (iy+01dh),a		;a62c
	ld (iy+001h),0ech		;a62f
	ld (iy+000h),0ech		;a633
	ld a,r		;a637
	and 03fh		;a639
	add a,060h		;a63b
	ld (iy+00dh),a		;a63d
	ld bc,09d18h		;a640
	jp 05e31h		;a643
L_A646:
	dec (iy+00dh)		;a646
	ret nz			;a649
	ld (iy+005h),002h		;a64a
	ld a,(iy+01dh)		;a64e
	ld (iy+001h),a		;a651
	ld a,(iy+01eh)		;a654
	ld (iy+000h),a		;a657
	ld (iy+00ch),000h		;a65a
	call 09abfh		;a65e
L_A661:
	ld (iy+002h),0c8h		;a661
	ld (iy+012h),0cch		;a665
	ret			;a669
L_A66A:
	ld a,020h		;a66a
	call L_A869		;a66c
	jr nc,L_A6BA		;a66f
	ld (iy+002h),0d0h		;a671
	ld (iy+012h),0d4h		;a675
	jr L_A6BA		;a679
L_A67B:
	ld a,010h		;a67b
	call L_A869		;a67d
	jr L_A6BA		;a680
L_A682:
	ld hl,00300h		;a682
	ld bc,0f803h		;a685
	call 08383h		;a688
	ret nc			;a68b
	ld (iy+005h),005h		;a68c
	jr L_A6BA		;a690
L_A692:
	ld a,020h		;a692
	ld b,006h		;a694
	call L_A871		;a696
	jr nc,L_A6BA		;a699
	jr L_A661		;a69b
L_A69D:
	ld a,010h		;a69d
	ld b,001h		;a69f
	call L_A871		;a6a1
	jr nc,L_A6BA		;a6a4
	ld (iy+001h),0ech		;a6a6
	ld (iy+000h),0ech		;a6aa
	ld (iy+011h),0ech		;a6ae
	ld (iy+010h),0ech		;a6b2
	ld (iy+00dh),0c0h		;a6b6
L_A6BA:
	ld hl,0a6ceh		;a6ba
	push hl			;a6bd
	call 05a5ah		;a6be
	pop hl			;a6c1
	call 05af8h		;a6c2
	ret nc			;a6c5
	ld a,010h		;a6c6
	call 05f33h		;a6c8
	jp L_A0FF		;a6cb

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6ce..0xa6d2  (4 bytes)
DATA_A6CE:
	defb 004h,008h,002h,00ch	; a6ce

; ======================================================================
; CODIGO 0xa6d2..0xa6d5  (3 bytes)
; ======================================================================


L_A6D2:
	call despacha_estado		;a6d2   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa6d5..0xa6db  (6 bytes)
DATA_A6D5:
	defb 0dbh,0a6h,0e9h,0a6h,0fdh,0a6h	; a6d5

; ======================================================================
; CODIGO 0xa6db..0xa730  (85 bytes)
; ======================================================================


L_A6DB:
	inc (iy+005h)		;a6db
	ld bc,0a8d3h		;a6de
	call 05e45h		;a6e1
	ld (iy+002h),0f8h		;a6e4
	ret			;a6e8
L_A6E9:
	ld a,(iy+000h)		;a6e9
	sub 002h		;a6ec
	ld (iy+000h),a		;a6ee
	cp 018h		;a6f1
	ret nc			;a6f3
	ld (iy+005h),002h		;a6f4
	ld (iy+00dh),008h		;a6f8
	ret			;a6fc
L_A6FD:
	ld a,018h		;a6fd
	bit 1,(iy+00dh)		;a6ff
	jr z,L_A707		;a703
	ld a,01ch		;a705
L_A707:
	ld (iy+002h),a		;a707
	dec (iy+00dh)		;a70a
	ret nz			;a70d
	push ix		;a70e
	call L_A731		;a710
	jr c,L_A72B		;a713
	ld (ix+00eh),0ffh		;a715
	call L_A731		;a719
	jr c,L_A72B		;a71c
	ld (ix+00eh),000h		;a71e
	call L_A731		;a722
	jr c,L_A72B		;a725
	ld (ix+00eh),001h		;a727
L_A72B:
	pop ix		;a72b
	jp L_A8BD		;a72d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa730..0xa731  (1 bytes)
DATA_A730:
	defb 0c9h	; a730

; ======================================================================
; CODIGO 0xa731..0xa74d  (28 bytes)
; ======================================================================


L_A731:
	call 0847eh		;a731
	ret c			;a734
	ld a,(iy+000h)		;a735
	ld (ix+000h),a		;a738
	ld a,(iy+001h)		;a73b
	ld (ix+001h),a		;a73e
	ld (ix+004h),004h		;a741
	ld (ix+002h),0f8h		;a745
	ret			;a749
L_A74A:
	call despacha_estado		;a74a   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa74d..0xa753  (6 bytes)
DATA_A74D:
	defb 053h,0a7h,072h,0a7h,08bh,0a7h	; a74d

; ======================================================================
; CODIGO 0xa753..0xa80d  (186 bytes)
; ======================================================================


L_A753:
	ld (iy+005h),001h		;a753
	ld bc,0a8d3h		;a757
	call 05e45h		;a75a
	ld a,006h		;a75d
	call 05c75h		;a75f
	ld a,000h		;a762
	ld (iy+008h),a		;a764
	call 05cb6h		;a767
	ld (iy+002h),0fch		;a76a
	ld (iy+00ah),002h		;a76e
L_A772:
	ld a,(iy+00dh)		;a772
	call 09915h		;a775
	jr nc,L_A7A1		;a778
	ld a,(iy+006h)		;a77a
	cp 0fah		;a77d
	jr z,L_A784		;a77f
	dec a			;a781
	jr L_A79B		;a782
L_A784:
	ld (iy+008h),010h		;a784
	inc (iy+005h)		;a788
L_A78B:
	ld a,(iy+00ah)		;a78b
	call 09915h		;a78e
	jr nc,L_A7A1		;a791
	ld a,(iy+006h)		;a793
	cp 007h		;a796
	jr z,L_A7A1		;a798
	inc a			;a79a
L_A79B:
	ld (iy+006h),a		;a79b
	call 05c75h		;a79e
L_A7A1:
	call 05c53h		;a7a1
	ld a,(iy+004h)		;a7a4
	cp 00ah		;a7a7
	ret z			;a7a9
	ld a,(iy+00eh)		;a7aa
	call 081bbh		;a7ad
	ld hl,0a80dh		;a7b0
	call 05a5ah		;a7b3
	jp c,L_A8BD		;a7b6
L_A7B9:
	ld a,(iy+000h)		;a7b9
	cp 0b0h		;a7bc
	jp nc,L_A8BD		;a7be
	cp 001h		;a7c1
	jp c,L_A8BD		;a7c3
	ld a,(iy+001h)		;a7c6
	cp 0f0h		;a7c9
	jp nc,L_A8BD		;a7cb
	cp 004h		;a7ce
	jp c,L_A8BD		;a7d0
	scf			;a7d3
	ret			;a7d4
L_A7D5:
	ld a,(iy+000h)		;a7d5
	cp 0b0h		;a7d8
	jp nc,L_A8A9		;a7da
	cp 001h		;a7dd
	jp c,L_A8A9		;a7df
	ld a,(iy+001h)		;a7e2
	cp 0f0h		;a7e5
	jp nc,L_A8A9		;a7e7
	cp 004h		;a7ea
	jp c,L_A8A9		;a7ec
	scf			;a7ef
	ret			;a7f0
L_A7F1:
	ld b,0a7h		;a7f1
L_A7F3:
	ld a,(iy+000h)		;a7f3
	cp 0f0h		;a7f6
	jr nc,L_A7FE		;a7f8
	cp b			;a7fa
	jp nc,L_A889		;a7fb
L_A7FE:
	ld a,(iy+001h)		;a7fe
	cp 0f0h		;a801
	jp nc,L_A889		;a803
	cp 004h		;a806
	jp c,L_A889		;a808
	scf			;a80b
	ret			;a80c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa80d..0xa811  (4 bytes)
DATA_A80D:
	defb 006h,004h,00ah,004h	; a80d

; ======================================================================
; CODIGO 0xa811..0xa865  (84 bytes)
; ======================================================================


L_A811:
	ld a,(iy+005h)		;a811
	and a			;a814
	jr nz,L_A831		;a815
	inc (iy+005h)		;a817
	call 09a24h		;a81a
	ld (iy+01bh),003h		;a81d
	ld bc,0a865h		;a821
	call 05e15h		;a824
	ld hl,0a974h		;a827
	ld (iy+016h),002h		;a82a
	jp L_A01A		;a82e
L_A831:
	ld a,(iy+016h)		;a831
	and a			;a834
	jp nz,09ce3h		;a835
	ld a,(iy+00ah)		;a838
	cp 080h		;a83b
	jp nc,09ce3h		;a83d
	ld a,(iy+00bh)		;a840
	cp 080h		;a843
	jr c,L_A856		;a845
	ld a,(ix+00bh)		;a847
	cp 08ah		;a84a
	jp c,09ce3h		;a84c
	ld (iy+016h),001h		;a84f
	jp 09ce3h		;a853
L_A856:
	ld a,(ix+00bh)		;a856
	cp 060h		;a859
	jp nc,09ce3h		;a85b
	ld (iy+016h),001h		;a85e
	jp 09ce3h		;a862

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa865..0xa869  (4 bytes)
DATA_A865:
	defb 006h,069h,006h,06bh	; a865

; ======================================================================
; CODIGO 0xa869..0xa8d3  (106 bytes)
; ======================================================================


L_A869:
	call 09915h		;a869
	ret nc			;a86c
	inc (iy+005h)		;a86d
	ret			;a870
L_A871:
	call 09915h		;a871
	ret nc			;a874
	ld (iy+005h),b		;a875
	ret			;a878
L_A879:
	call 09921h		;a879
	ret nc			;a87c
	inc (iy+005h)		;a87d
	ret			;a880
L_A881:
	call 09921h		;a881
	ret nc			;a884
	ld (iy+005h),b		;a885
	ret			;a888
L_A889:
	ld bc,0003fh		;a889
	call L_A8C0		;a88c
L_A88F:
	ld (iy+021h),0ech		;a88f
	ld (iy+031h),0ech		;a893
	ld (iy+020h),0ech		;a897
	ld (iy+030h),0ech		;a89b
	ld (iy+024h),000h		;a89f
	ld (iy+034h),000h		;a8a3
	jr L_A8AF		;a8a7
L_A8A9:
	ld bc,0001fh		;a8a9
	call L_A8C0		;a8ac
L_A8AF:
	ld (iy+010h),0ech		;a8af
	ld (iy+011h),0ech		;a8b3
	ld (iy+014h),000h		;a8b7
	and a			;a8bb
	ret			;a8bc
L_A8BD:
	ld bc,0000fh		;a8bd
L_A8C0:
	push iy		;a8c0
	pop hl			;a8c2
	push hl			;a8c3
	pop de			;a8c4
	inc de			;a8c5
	ld (hl),000h		;a8c6
	ldir		;a8c8
	ld (iy+000h),0ech		;a8ca
	ld (iy+001h),0ech		;a8ce
	ret			;a8d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa8d3..0xae38  (1381 bytes)
DATA_A8D3:
	defb 00ah,00dh,001h,062h,003h,064h,002h,064h,009h,06ah,003h,065h,004h,066h,003h,067h	; a8d3  ...b.d.d.j.e.f.g
	defb 007h,069h,005h,068h,005h,068h,00ah,06bh,00ah,06bh,0f2h,000h,078h,0e2h,000h,058h	; a8e3  .i.h.h.k.k..x..X
	defb 0f2h,000h,080h,0e4h,000h,058h,0f2h,002h,0b0h,0e2h,000h,090h,0f2h,002h,0b8h,0e4h	; a8f3  .....X..........
	defb 000h,090h,0f2h,000h,080h,0e2h,000h,060h,0f2h,000h,080h,0e2h,000h,070h,0f2h,000h	; a903  .......`.....p..
	defb 080h,0e2h,000h,068h,0f2h,000h,0b8h,0e2h,000h,0a0h,0f2h,000h,0b8h,0e2h,000h,0a8h	; a913  ...h............
	defb 0f2h,000h,0b8h,0e2h,000h,098h,0f0h,000h,024h,0f0h,000h,0c8h,0f0h,000h,0d0h,0f0h	; a923  ........$.......
	defb 000h,0fch,0f0h,000h,058h,0f0h,000h,060h,0f0h,000h,068h,0f0h,000h,070h,0f0h,000h	; a933  ....X..`..h..p..
	defb 078h,0f0h,000h,058h,0f0h,000h,078h,0f0h,000h,058h,0f0h,000h,090h,0f0h,000h,098h	; a943  x..X..x..X......
	defb 0f0h,000h,0a0h,0f0h,000h,060h,0e2h,002h,058h,0f0h,000h,068h,0e2h,002h,058h,0f0h	; a953  .....`..X..h..X.
	defb 000h,078h,0e2h,0feh,070h,0f0h,000h,080h,0e2h,0feh,070h,0f0h,000h,090h,0e2h,000h	; a963  .x..p.....p.....
	defb 088h,0f0h,000h,060h,0e2h,002h,098h,0f0h,000h,068h,0e2h,002h,098h,0f0h,000h,078h	; a973  ...`.....h.....x
	defb 0e2h,0feh,0a0h,0f0h,000h,080h,0e2h,0feh,0a0h,0f0h,000h,090h,0e2h,000h,0a8h,0f0h	; a983  ................
	defb 000h,060h,0e2h,002h,0b0h,0f0h,000h,068h,0e2h,002h,0b0h,0f0h,000h,078h,0e2h,0feh	; a993  .`.....h.....x..
	defb 0b8h,0f0h,000h,080h,0e2h,0feh,0b8h,0f0h,000h,0d0h,0e2h,002h,0c8h,0f0h,000h,0e0h	; a9a3  ................
	defb 0e2h,000h,0d8h,0f0h,000h,0e8h,0e2h,000h,0d8h,0f0h,000h,078h,0e0h,000h,0e0h,0f0h	; a9b3  ...........x....
	defb 000h,048h,0f0h,010h,050h,0f0h,000h,080h,0e0h,002h,058h,0f0h,000h,078h,0e0h,002h	; a9c3  .H..P.....X..x..
	defb 060h,0f0h,000h,078h,0e0h,002h,068h,0f0h,000h,070h,0e0h,002h,088h,0f0h,000h,0b8h	; a9d3  `..x..h..p......
	defb 0e0h,0feh,090h,0f0h,000h,0b0h,0e0h,0feh,098h,0f0h,000h,0b0h,0e0h,0feh,0a0h,0f0h	; a9e3  ................
	defb 000h,0a8h,0e0h,0feh,0c0h,000h,004h,004h,0c0h,0c1h,0c2h,0c3h,0c4h,0c5h,0c6h,0c7h	; a9f3  ................
	defb 0c8h,0c9h,0cah,0cbh,0cch,0cdh,0ceh,0cfh,000h,003h,002h,021h,022h,029h,02ah,02dh	; aa03  ...........!")*-
	defb 02eh,000h,003h,002h,025h,026h,029h,02ah,02dh,02eh,001h,003h,002h,003h,007h,005h	; aa13  ....%&)*-.......
	defb 006h,02dh,02eh,040h,002h,002h,0f8h,0f9h,0fch,0fdh,040h,002h,002h,046h,047h,04ah	; aa23  .-.@......@..FGJ
	defb 04bh,040h,002h,002h,0e8h,0e9h,0ech,0edh,040h,002h,002h,008h,009h,00ch,00dh,040h	; aa33  K@......@......@
	defb 002h,002h,046h,047h,04ah,04bh,040h,004h,003h,0b2h,0a1h,0a2h,0a4h,0a5h,0a6h,0a8h	; aa43  ..FGJK@.........
	defb 0a9h,0aah,0ach,0adh,0aeh,040h,004h,003h,0b2h,0b3h,0c0h,0b6h,0b7h,0c4h,0bah,0bbh	; aa53  .....@..........
	defb 0c8h,0beh,0bfh,0cch,040h,004h,003h,0a3h,0b0h,0b1h,0a7h,0b4h,0b5h,0abh,0b8h,0b9h	; aa63  ....@...........
	defb 0afh,0bch,0bdh,040h,004h,003h,0b2h,0b3h,0c0h,0b6h,0b7h,0c4h,0bah,0bbh,0c8h,0beh	; aa73  ...@............
	defb 0bfh,0cch,040h,002h,002h,068h,069h,06ch,06dh,040h,002h,002h,058h,059h,05ch,05dh	; aa83  ..@..hilm@..XY\]
	defb 040h,002h,002h,062h,063h,066h,067h,040h,002h,002h,05ah,05bh,05eh,05fh,040h,002h	; aa93  @..bcfg@..Z[^_@.
	defb 002h,06ah,06bh,06eh,06fh,040h,002h,002h,052h,053h,056h,057h,040h,002h,002h,060h	; aaa3  .jkno@..RSVW@..`
	defb 061h,064h,065h,040h,002h,002h,050h,051h,054h,055h,040h,002h,002h,046h,047h,04ah	; aab3  ade@..PQTU@..FGJ
	defb 04bh,000h,004h,003h,040h,041h,042h,044h,045h,046h,048h,049h,04ah,04ch,04dh,04eh	; aac3  K...@ABDEFHIJLMN
	defb 000h,004h,003h,0a1h,0a2h,0a3h,0a5h,0a6h,0a7h,0a9h,0aah,0abh,0adh,0aeh,0afh,000h	; aad3  ................
	defb 004h,003h,0c0h,0c1h,0c3h,0c4h,0c5h,0c7h,0c8h,0c9h,0cbh,0cch,0cdh,0cfh,040h,004h	; aae3  ..............@.
	defb 003h,0c0h,0c1h,0c2h,0c4h,0c5h,0c6h,0c8h,0c9h,0cah,0cch,0cdh,0ceh,040h,004h,003h	; aaf3  .............@..
	defb 0d1h,0c1h,0d2h,0d5h,0c5h,0d6h,0d8h,0c9h,0d9h,0dch,0cdh,0ddh,040h,004h,003h,0c0h	; ab03  ............@...
	defb 0c1h,0c2h,0c3h,0cbh,0d0h,0c7h,0cfh,0d4h,0cch,0cdh,0ceh,000h,004h,003h,0b0h,0b1h	; ab13  ................
	defb 0b2h,0b4h,0b5h,0b6h,0b8h,0b9h,0bah,0bch,0bdh,0beh,000h,004h,003h,0d5h,0b1h,0d7h	; ab23  ................
	defb 0d6h,0b5h,0eeh,0b8h,0b9h,0bah,0efh,0bdh,09fh,000h,004h,003h,0b0h,0b1h,0b2h,0a0h	; ab33  ................
	defb 0a8h,0ech,0a4h,0ach,0edh,0bch,0bdh,0beh,000h,004h,003h,0c0h,0c1h,0c2h,0c4h,0c5h	; ab43  ................
	defb 0c6h,0c8h,0c9h,0cah,0cch,0cdh,0ceh,000h,004h,003h,043h,0c1h,0d5h,047h,0c5h,0d6h	; ab53  ..........C..G..
	defb 0c8h,0c9h,0cah,04bh,0cdh,0d7h,000h,004h,003h,043h,0c1h,0d5h,0c3h,0cbh,0d0h,0c7h	; ab63  ...K.....C......
	defb 0cfh,0d4h,04bh,0cdh,0d7h,040h,003h,002h,090h,091h,094h,095h,098h,099h,040h,003h	; ab73  ..K..@........@.
	defb 002h,09ah,09bh,094h,095h,098h,099h,040h,003h,002h,092h,093h,096h,097h,098h,099h	; ab83  .......@........
	defb 040h,004h,003h,070h,071h,072h,074h,075h,076h,078h,079h,07ah,07ch,07dh,07eh,040h	; ab93  @..pqrtuvxyz|}~@
	defb 004h,003h,080h,081h,082h,084h,085h,086h,088h,089h,08ah,08ch,08dh,08eh,001h,004h	; aba3  ................
	defb 003h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,041h,008h,004h	; abb3  .............A..
	defb 050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah,05bh,05ch,05dh,05eh,05fh	; abc3  PQRSTUVWXYZ[\]^_
	defb 060h,061h,062h,063h,064h,065h,066h,067h,068h,069h,06ah,06bh,06ch,06dh,06eh,06fh	; abd3  `abcdefghijklmno
	defb 041h,008h,004h,050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah,05bh,05ch	; abe3  A..PQRSTUVWXYZ[\
	defb 05dh,05eh,05fh,070h,071h,072h,073h,074h,075h,076h,077h,078h,079h,07ah,07bh,07ch	; abf3  ]^_pqrstuvwxyz{|
	defb 07dh,07eh,07fh,041h,008h,004h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac03  }~.A............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac13  ................
	defb 0ffh,0ffh,09ch,09ch,09ch,09ch,000h,007h,006h,000h,051h,052h,053h,060h,000h,054h	; ac23  ..........QRS`.T
	defb 055h,056h,057h,064h,065h,058h,059h,05ah,05bh,068h,069h,05ch,05dh,05eh,05fh,06ch	; ac33  UVWdeXYZ[hi\]^_l
	defb 06dh,070h,071h,072h,073h,080h,000h,074h,075h,076h,077h,084h,000h,000h,079h,000h	; ac43  mpqrs..tuvw...y.
	defb 000h,088h,000h,001h,007h,006h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac53  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac63  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ac73  ................
	defb 000h,002h,007h,090h,091h,092h,093h,098h,099h,09ah,094h,095h,096h,097h,09ch,09dh	; ac83  ................
	defb 09eh,000h,002h,007h,078h,079h,07ah,07bh,088h,089h,08ah,07ch,07dh,07eh,07fh,08ch	; ac93  ....xyz{...|}~..
	defb 08dh,08eh,000h,002h,007h,070h,071h,072h,073h,080h,081h,082h,074h,075h,076h,077h	; aca3  .....pqrs...tuvw
	defb 084h,085h,086h,001h,004h,004h,0b0h,0b1h,0b2h,0b3h,0b4h,0b5h,0b6h,0b7h,0b8h,0b9h	; acb3  ................
	defb 0bah,0bbh,0bch,0bdh,0beh,0bfh,001h,004h,004h,091h,092h,093h,0a0h,095h,096h,097h	; acc3  ................
	defb 0a4h,099h,09ah,09bh,0a8h,09dh,09eh,09fh,0ach,040h,003h,003h,090h,091h,092h,094h	; acd3  .........@......
	defb 095h,096h,098h,099h,09ah,040h,003h,003h,090h,091h,092h,09ch,09dh,09eh,09bh,09fh	; ace3  .....@..........
	defb 09ah,001h,003h,003h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,040h,002h,002h	; acf3  .............@..
	defb 0dah,0dbh,0deh,0dfh,040h,002h,002h,0b0h,0b1h,0b4h,0b5h,000h,004h,003h,0e0h,0e1h	; ad03  ....@...........
	defb 0e2h,0e4h,0e5h,0e6h,0e8h,0e9h,0e4h,0ech,0edh,0eeh,000h,004h,003h,0e0h,0e1h,0e2h	; ad13  ................
	defb 0f0h,0f1h,0f2h,0f4h,0f5h,0f6h,0ech,0edh,0eeh,000h,004h,003h,0e0h,0e1h,0e2h,0f8h	; ad23  ................
	defb 0f9h,0fah,0fch,0fdh,0feh,0ech,0edh,0eeh,000h,004h,004h,0a0h,0a1h,0a2h,0a3h,0a4h	; ad33  ................
	defb 0a5h,0a6h,0a7h,0a8h,0a9h,0aah,0abh,0ach,0adh,0aeh,0afh,000h,004h,004h,008h,009h	; ad43  ................
	defb 00ah,00bh,00ch,00dh,00eh,00fh,0d8h,0d9h,0dah,0dbh,0dch,0ddh,0deh,0dfh,000h,004h	; ad53  ................
	defb 004h,0e0h,0e1h,0e2h,0e3h,0e4h,0e5h,0e6h,0e7h,0e8h,0e9h,0eah,0ebh,0ech,0edh,0eeh	; ad63  ................
	defb 0efh,001h,004h,004h,020h,021h,022h,023h,024h,025h,026h,027h,028h,029h,02ah,02bh	; ad73  .... !"#$%&'()*+
	defb 02ch,02dh,02eh,02fh,001h,004h,004h,010h,011h,012h,013h,014h,015h,016h,017h,018h	; ad83  ,-./............
	defb 019h,01ah,01bh,01ch,01dh,01eh,01fh,040h,006h,007h,000h,021h,022h,023h,030h,031h	; ad93  .......@...!"#01
	defb 032h,024h,025h,026h,027h,034h,035h,036h,000h,029h,02ah,02bh,038h,039h,03ah,02ch	; ada3  2$%&'456.)*+89:,
	defb 02dh,02eh,02fh,03ch,03dh,03eh,040h,041h,042h,043h,048h,049h,04ah,044h,045h,046h	; adb3  -./<=>@ABCHIJDEF
	defb 047h,04ch,04dh,04eh,040h,006h,007h,000h,021h,022h,023h,030h,031h,032h,024h,025h	; adc3  GLMN@...!"#012$%
	defb 026h,027h,034h,035h,036h,000h,029h,02ah,02bh,038h,039h,03ah,02ch,02dh,02eh,02fh	; add3  &'456.)*+89:,-./
	defb 03ch,03dh,03eh,040h,041h,0f4h,0f5h,048h,0f6h,04bh,044h,045h,0f8h,0f9h,04ch,0fah	; ade3  <=>@A..H.KDE..L.
	defb 04fh,001h,006h,007h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; adf3  O...............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ae03  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,040h,002h	; ae13  ..............@.
	defb 002h,000h,021h,024h,025h,040h,002h,002h,000h,021h,033h,037h,000h,021h,033h,037h	; ae23  ..!$%@...!37.!37
	defb 028h,033h,03dh,032h,0cdh	; ae33

; ======================================================================
; CODIGO 0xae38..0xaf86  (334 bytes)
; ======================================================================


L_AE38:
	di			;ae38
	ld a,(0e2cdh)		;ae39
	and a			;ae3c
	jr z,L_AE74		;ae3d
	dec a			;ae3f
	ld (0e2cdh),a		;ae40
	jr z,L_AE56		;ae43
	ei			;ae45
	ld (ix+00ah),0fch		;ae46
	call L_BA10		;ae4a
	call 04532h		;ae4d   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	call 09943h		;ae50
	jp 0452dh		;ae53   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
L_AE56:
	xor a			;ae56
	ld (0e180h),a		;ae57   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix+009h),a		;ae5a
	ld (ix+01bh),a		;ae5d
	inc a			;ae60
	ld (0e062h),a		;ae61
	ld a,010h		;ae64
	ld (0e2c9h),a		;ae66   ; guarda la energia del jugador
	ei			;ae69
	call 045c3h		;ae6a
	call L_BFF1		;ae6d
	xor a			;ae70
	ld (0e2cdh),a		;ae71
L_AE74:
	ei			;ae74
	call 0531bh		;ae75   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_AE8A		;ae78
	ld a,(0e033h)		;ae7a
	and a			;ae7d
	jr nz,L_AE8A		;ae7e
	ld a,(0e2c8h)		;ae80
	rrca			;ae83
	ld (0e2c8h),a		;ae84
	jp c,L_B1F2		;ae87
L_AE8A:
	ld a,(0e020h)		;ae8a   ; lee la fase (0-19; la 8 se salta)
	cp 00dh		;ae8d
	jr z,L_AE95		;ae8f
	cp 011h		;ae91
	jr nz,L_AED7		;ae93
L_AE95:
	ld a,(ix+00ah)		;ae95
	cp 0fch		;ae98
	jr nc,L_AED7		;ae9a
	cp 09fh		;ae9c
	jr c,L_AED7		;ae9e
	ld b,(ix-00bh)		;aea0
	ld a,(ix-00ah)		;aea3
	cp 002h		;aea6
	jr nc,L_AECB		;aea8
	and a			;aeaa
	push af			;aeab
	call z,04958h		;aeac
	pop af			;aeaf
	call nz,04950h		;aeb0
	inc (ix+00ah)		;aeb3
	dec (ix-00bh)		;aeb6
	ld a,(ix-00bh)		;aeb9
	cp 0ffh		;aebc
	jp nz,L_B262		;aebe
	ld (ix-00bh),00fh		;aec1
	inc (ix-00ah)		;aec5
	jp L_B262		;aec8
L_AECB:
	xor a			;aecb
	ld (ix-00ah),a		;aecc
	ld (ix+00dh),a		;aecf
	ld (ix-006h),a		;aed2
	jr L_AF22		;aed5
L_AED7:
	ld a,(ix-005h)		;aed7
	and a			;aeda
	jp z,L_AF61		;aedb
	ld (0e180h),a		;aede   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	dec (ix-006h)		;aee1
	jr z,L_AF01		;aee4
	ld a,(ix-006h)		;aee6
	add a,002h		;aee9
	cp 02fh		;aeeb
	jp c,L_B1F2		;aeed
	ld a,(ix-005h)		;aef0
	ld (0e180h),a		;aef3   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	call L_AF61		;aef6
	ld a,(ix-005h)		;aef9
	ld (0e180h),a		;aefc   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	jr L_AF61		;aeff
L_AF01:
	ld a,(0e025h)		;af01
	ld c,a			;af04
	ld a,(0e031h)		;af05
	ld b,a			;af08
	ld a,(0e033h)		;af09
	or b			;af0c
	jr z,L_AF11		;af0d
	dec c			;af0f
	dec c			;af10
L_AF11:
	ld a,(0e2c9h)		;af11   ; lee la energia del jugador
	sub c			;af14
	jr nc,L_AF18		;af15
	xor a			;af17
L_AF18:
	ld (0e2c9h),a		;af18   ; guarda la energia del jugador
	push af			;af1b
	call 045dah		;af1c
	pop af			;af1f
	jr nz,L_AF53		;af20
L_AF22:
	ld a,001h		;af22
	ld (0e2ceh),a		;af24
	ld a,027h		;af27
	call 05052h		;af29   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld a,(0e021h)		;af2c   ; lee las vidas que quedan (en BCD)
	sub 001h		;af2f
	daa			;af31
	ld (0e021h),a		;af32   ; guarda las vidas que quedan (en BCD)
	jr nz,L_AF3F		;af35
	ld (0e094h),a		;af37
	inc a			;af3a
	ld (0e183h),a		;af3b
	ret			;af3e
L_AF3F:
	ld a,080h		;af3f
	ld (0e2cdh),a		;af41
	ld b,005h		;af44
	ld hl,0e030h		;af46
	call 051b2h		;af49   ; borra_b: pone a cero B bytes desde HL
	call 045aah		;af4c
	ld (ix-002h),080h		;af4f
L_AF53:
	ld a,(ix+00fh)		;af53
	cpl			;af56
	ld (ix+00fh),a		;af57
	xor a			;af5a
	ld (0e180h),a		;af5b   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix-005h),a		;af5e
L_AF61:
	ld a,(ix-007h)		;af61
	and a			;af64
	jp nz,L_B0FC		;af65
	ld a,(0e2ceh)		;af68
	and a			;af6b
	jr nz,$+44		;af6c
	ld a,(0e5c2h)		;af6e
	and a			;af71
	jr nz,$+38		;af72
	ld a,(0e180h)		;af74   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix+019h),a		;af77
	ld hl,0af86h		;af7a
	add a,a			;af7d
	call 051b8h		;af7e   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,a			;af81
	inc hl			;af82
	ld d,(hl)			;af83
	ex de,hl			;af84
	jp (hl)			;af85

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf86..0xaf98  (18 bytes)
DATA_AF86:
	defb 098h,0afh,0afh,0afh,05bh,0b0h,06eh,0b0h,051h,0b0h,0eah,0afh,0b1h,0b0h,0c5h,0b0h	; af86  ....[.n.Q.......
	defb 0bbh,0b0h	; af96

; ======================================================================
; CODIGO 0xaf98..0xb18b  (499 bytes)
; ======================================================================


L_AF98:
	ld (ix+005h),000h		;af98
	ld a,(ix-007h)		;af9c
	and a			;af9f
	jp nz,L_B0FC		;afa0
	call 0531bh		;afa3   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_AFAC		;afa6
	ld (ix+005h),017h		;afa8
L_AFAC:
	jp L_B1F2		;afac
L_AFAF:
	ld a,(ix-007h)		;afaf
	and a			;afb2
	jp nz,L_B0FC		;afb3
	call 0531bh		;afb6   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_AFC1		;afb9
	ld (ix+005h),00dh		;afbb
	jr L_AFAC		;afbf
L_AFC1:
	ld a,(ix+006h)		;afc1
	and a			;afc4
	jr nz,L_AFAC		;afc5
	ld a,(0e022h)		;afc7   ; lee el tramo: la pantalla de la lista de la fase
	and a			;afca
	jr nz,L_AFD4		;afcb
	ld a,(0e020h)		;afcd   ; lee la fase (0-19; la 8 se salta)
	cp 00eh		;afd0
	jr c,L_AFDA		;afd2
L_AFD4:
	ld a,(0e18bh)		;afd4
	inc a			;afd7
	jr nz,L_AF98		;afd8
L_AFDA:
	ld (ix+00bh),078h		;afda
	ld (ix-002h),000h		;afde
	ld (ix-007h),001h		;afe2
	ld (ix-008h),000h		;afe6
L_AFEA:
	ld a,(0e062h)		;afea
	and a			;afed
	jr z,L_B01E		;afee
	ld a,(0e5c2h)		;aff0
	and a			;aff3
	jr nz,L_B01E		;aff4
	ld a,(ix+009h)		;aff6
	and a			;aff9
	jr nz,L_B03B		;affa
	ld a,(ix+006h)		;affc
	and a			;afff
	jr nz,L_B03B		;b000
	ld a,(ix+00ah)		;b002
	cp 0afh		;b005
	jr z,L_AFAC		;b007
	call L_B4FA		;b009
	jr nc,L_B03B		;b00c
	cp 001h		;b00e
	jr nz,L_B01E		;b010
	ld a,(ix+015h)		;b012
	cp 001h		;b015
	jr nz,L_B01E		;b017
	inc (ix+00ah)		;b019
	jr L_B03B		;b01c
L_B01E:
	ld a,(ix+009h)		;b01e
	and a			;b021
	jr nz,L_B03B		;b022
	ld a,(ix+006h)		;b024
	and a			;b027
	jr nz,L_B03B		;b028
	ld a,(0e020h)		;b02a   ; lee la fase (0-19; la 8 se salta)
	and a			;b02d
	jr nz,L_B042		;b02e
	ld a,(ix+00ah)		;b030
	cp 0afh		;b033
	jr c,L_B042		;b035
	ld (ix+005h),000h		;b037
L_B03B:
	xor a			;b03b
	ld (0e062h),a		;b03c
	jp L_B1F2		;b03f
L_B042:
	ld (ix+005h),00ch		;b042
	call 0531bh		;b046   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_B03B		;b049
	ld (ix+005h),018h		;b04b
	jr L_B03B		;b04f
L_B051:
	call L_B3A2		;b051
	add a,008h		;b054
	ld (ix+005h),a		;b056
	jr L_B074		;b059
L_B05B:
	call L_B3A2		;b05b
	add a,004h		;b05e
	ld (ix+005h),a		;b060
	jr L_B074		;b063
L_B065:
	call L_B3A2		;b065
	add a,01fh		;b068
	ld (ix+005h),a		;b06a
	ret			;b06d
L_B06E:
	call L_B3A2		;b06e
	ld (ix+005h),a		;b071
L_B074:
	call 0531bh		;b074   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	call c,L_B065		;b077
	ld (ix+00fh),000h		;b07a
	ld a,(ix+00bh)		;b07e
	cp 0eah		;b081
	jp c,L_B38A		;b083
	ld a,(0e020h)		;b086   ; lee la fase (0-19; la 8 se salta)
	ld hl,0b18bh		;b089
	ld bc,00006h		;b08c
	cpir		;b08f
	jp nz,L_B1F2		;b091
	ld a,(0e045h)		;b094
	and a			;b097
	ld a,(0e020h)		;b098   ; lee la fase (0-19; la 8 se salta)
	jp nz,L_B1F2		;b09b
	ld b,001h		;b09e
	call cambia_tramo		;b0a0   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;b0a3
	jp z,L_B1F2		;b0a4
	ld (ix+00bh),00ch		;b0a7
	call pantalla_nueva		;b0ab   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	jp L_B1F2		;b0ae
L_B0B1:
	call L_B3A2		;b0b1
	add a,008h		;b0b4
	ld (ix+005h),a		;b0b6
	jr L_B0CB		;b0b9
L_B0BB:
	call L_B3A2		;b0bb
	add a,004h		;b0be
	ld (ix+005h),a		;b0c0
	jr L_B0CB		;b0c3
L_B0C5:
	call L_B3A2		;b0c5
	ld (ix+005h),a		;b0c8
L_B0CB:
	call 0531bh		;b0cb   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	call c,L_B065		;b0ce
	ld (ix+00fh),0ffh		;b0d1
	ld a,(ix+00bh)		;b0d5
	cp 00ah		;b0d8
	jp nc,L_B396		;b0da
	ld a,(0e020h)		;b0dd   ; lee la fase (0-19; la 8 se salta)
	cp 00dh		;b0e0
	jr z,L_B0E9		;b0e2
	cp 011h		;b0e4
	jp nz,L_B1F2		;b0e6
L_B0E9:
	ld b,0ffh		;b0e9
	call cambia_tramo		;b0eb   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;b0ee
	jp z,L_B1F2		;b0ef
	ld (ix+00bh),0e8h		;b0f2
	call pantalla_nueva		;b0f6   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	jp L_B1F2		;b0f9
L_B0FC:
	call L_BA10		;b0fc
	ld a,(ix-007h)		;b0ff
	cp 001h		;b102
	jp z,L_B1AE		;b104
	ld a,(0e180h)		;b107   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	cp 003h		;b10a
	jr nz,L_B11F		;b10c
	ld (ix+00fh),000h		;b10e
	ld a,(ix+00bh)		;b112
	cp 090h		;b115
	jp nc,sale_derecha		;b117   ; sale_derecha: en una base: sale por la puerta derecha a la sala de la tabla (FF: no hay)
	inc (ix+00bh)		;b11a
	jr L_B137		;b11d
L_B11F:
	cp 007h		;b11f
	jr nz,L_B133		;b121
	ld (ix+00fh),0ffh		;b123
	ld a,(ix+00bh)		;b127
	cp 060h		;b12a
	jr c,sale_izquierda		;b12c
	dec (ix+00bh)		;b12e
	jr L_B137		;b131
L_B133:
	ld a,01eh		;b133
	jr L_B144		;b135
L_B137:
	ld a,(0e1c1h)		;b137
	and 008h		;b13a
	srl a		;b13c
	srl a		;b13e
	srl a		;b140
	add a,01dh		;b142
L_B144:
	ld (ix+005h),a		;b144
	jp L_B247		;b147
sale_izquierda:		; en una base: sale por la puerta izquierda a la sala de la tabla (FF: no hay)
	ld hl,0b45dh		;b14a
	ld a,(0e020h)		;b14d   ; lee la fase (0-19; la 8 se salta)
	cp 001h		;b150
	jr z,L_B165		;b152
	ld hl,0b467h		;b154
	cp 004h		;b157
	jr z,L_B165		;b159
	ld hl,0b475h		;b15b
	cp 00bh		;b15e
	jr z,L_B165		;b160
	ld hl,0b489h		;b162
L_B165:
	ld a,(0e022h)		;b165   ; lee el tramo: la pantalla de la lista de la fase
	call 051b8h		;b168   ; lee_tabla: HL = HL + A y A = (HL)
	cp 0ffh		;b16b
	jr z,L_B137		;b16d
	ld (0e022h),a		;b16f   ; guarda el tramo: la pantalla de la lista de la fase
	ld (ix-007h),000h		;b172
	ld (ix+00ah),09fh		;b176
	ld (ix+00bh),078h		;b17a
	set 0,a		;b17e
	call pantalla_nueva		;b180   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	xor a			;b183
	ld (0e060h),a		;b184
	ld (0e062h),a		;b187
	ret			;b18a

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb18b..0xb191  (6 bytes)
DATA_B18B:
	defb 000h,006h,007h,008h,009h,013h	; b18b

; ======================================================================
; CODIGO 0xb191..0xb3ae  (541 bytes)
; ======================================================================


sale_derecha:		; en una base: sale por la puerta derecha a la sala de la tabla (FF: no hay)
	ld hl,0b462h		;b191
	ld a,(0e020h)		;b194   ; lee la fase (0-19; la 8 se salta)
	cp 001h		;b197
	jr z,$-52		;b199
	ld hl,0b46eh		;b19b
	cp 004h		;b19e
	jr z,$-59		;b1a0
	ld hl,0b47fh		;b1a2
	cp 00bh		;b1a5
	jr z,$-66		;b1a7
	ld hl,0b497h		;b1a9
	jr $-71		;b1ac
L_B1AE:
	ld a,(0e1c1h)		;b1ae
	and 008h		;b1b1
	srl a		;b1b3
	srl a		;b1b5
	srl a		;b1b7
	ld b,a			;b1b9
	ld a,(ix-008h)		;b1ba
	inc (ix-008h)		;b1bd
	cp 02fh		;b1c0
	jr c,L_B1CA		;b1c2
	inc (ix-007h)		;b1c4
	jp L_B0FC		;b1c7
L_B1CA:
	ld a,(ix-008h)		;b1ca
	cp 018h		;b1cd
	jr c,L_B1E7		;b1cf
	ld a,01bh		;b1d1
	add a,b			;b1d3
	ld (ix+005h),a		;b1d4
	inc (ix-009h)		;b1d7
	ld a,(ix-009h)		;b1da
	cp 002h		;b1dd
	jr c,L_B247		;b1df
	ld (ix-009h),000h		;b1e1
	jr L_B1ED		;b1e5
L_B1E7:
	ld a,019h		;b1e7
	add a,b			;b1e9
	ld (ix+005h),a		;b1ea
L_B1ED:
	dec (ix+00ah)		;b1ed
	jr L_B247		;b1f0
L_B1F2:
	ld a,(0e033h)		;b1f2
	cp 002h		;b1f5
	jr nz,L_B203		;b1f7
	ld a,(0e2c8h)		;b1f9
	rrca			;b1fc
	ld (0e2c8h),a		;b1fd
	jp c,L_AE38		;b200
L_B203:
	call L_B5EE		;b203
	call L_BA5C		;b206
	call L_BADB		;b209
	call L_B7B7		;b20c
	call L_BA10		;b20f
	ld a,(ix-006h)		;b212
	and a			;b215
	jr z,L_B247		;b216
	cp 003h		;b218
	jr nc,L_B220		;b21a
	ld (ix-002h),060h		;b21c
L_B220:
	ld b,014h		;b220
	cp 028h		;b222
	jr nc,L_B22D		;b224
	push bc			;b226
	call L_B4FA		;b227
	pop bc			;b22a
	jr c,L_B235		;b22b
L_B22D:
	ld b,013h		;b22d
	cp 03ch		;b22f
	jr c,L_B235		;b231
	ld b,012h		;b233
L_B235:
	ld a,(0e020h)		;b235   ; lee la fase (0-19; la 8 se salta)
	and a			;b238
	jr nz,L_B244		;b239
	ld a,(ix+00ah)		;b23b
	cp 0afh		;b23e
	jr c,L_B244		;b240
	ld b,013h		;b242
L_B244:
	ld (ix+005h),b		;b244
L_B247:
	ld hl,0b3aeh		;b247
	ld a,(ix+00fh)		;b24a
	and a			;b24d
	jr z,L_B253		;b24e
	ld hl,0b3f4h		;b250
L_B253:
	ld a,(ix+005h)		;b253
	add a,a			;b256
	call 051b8h		;b257   ; lee_tabla: HL = HL + A y A = (HL)
	ld (ix+00ch),a		;b25a
	inc hl			;b25d
	ld a,(hl)			;b25e
	ld (ix+00dh),a		;b25f
L_B262:
	ld hl,0b43ah		;b262
	ld a,(ix+005h)		;b265
	cp 00ch		;b268
	jp z,L_B2FE		;b26a
	cp 015h		;b26d
	jp z,L_B2FE		;b26f
	cp 014h		;b272
	jp z,L_B310		;b274
	cp 012h		;b277
	jr nc,L_B280		;b279
	cp 00eh		;b27b
	jp nc,L_B310		;b27d
L_B280:
	call 051b8h		;b280   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,(hl)			;b283
	ld a,(0e020h)		;b284   ; lee la fase (0-19; la 8 se salta)
	and a			;b287
	jr nz,L_B2B8		;b288
	ld a,(ix+00ah)		;b28a
	cp 0afh		;b28d
	jr c,L_B2BB		;b28f
	ld c,a			;b291
	ld a,(ix+01bh)		;b292
	cp 006h		;b295
	jr nc,L_B29D		;b297
	inc a			;b299
	ld (ix+01bh),a		;b29a
L_B29D:
	add a,c			;b29d
	ld (ix+00dh),024h		;b29e
	push bc			;b2a2
	push af			;b2a3
	ld a,(0e2cfh)		;b2a4
	and a			;b2a7
	jr nz,L_B2B4		;b2a8
	ld a,039h		;b2aa
	call 05052h		;b2ac   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld a,001h		;b2af
	ld (0e2cfh),a		;b2b1
L_B2B4:
	pop af			;b2b4
	pop bc			;b2b5
	jr L_B2BF		;b2b6
L_B2B8:
	ld a,(ix+00ah)		;b2b8
L_B2BB:
	ld (ix+01bh),000h		;b2bb
L_B2BF:
	sub b			;b2bf
	ld b,a			;b2c0
L_B2C1:
	ld a,(0e020h)		;b2c1   ; lee la fase (0-19; la 8 se salta)
	cp 012h		;b2c4
	jr nz,L_B2CC		;b2c6
	ld a,b			;b2c8
	sub 002h		;b2c9
	ld b,a			;b2cb
L_B2CC:
	ld a,b			;b2cc
	ld (ix-020h),a		;b2cd
	ld (ix-010h),a		;b2d0
	add a,010h		;b2d3
	ld (ix+000h),a		;b2d5
	ld (ix+010h),a		;b2d8
L_B2DB:
	ld a,(ix+00bh)		;b2db
	ld (ix+001h),a		;b2de
	ld (ix+011h),a		;b2e1
	ld (ix-01fh),a		;b2e4
	ld (ix-00fh),a		;b2e7
L_B2EA:
	ld (ix-01eh),000h		;b2ea
	ld (ix-00eh),004h		;b2ee
	ld (ix+002h),008h		;b2f2
	ld (ix+012h),00ch		;b2f6
	ld a,(ix+00ah)		;b2fa
	ret			;b2fd
L_B2FE:
	call 051b8h		;b2fe   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,(hl)			;b301
	ld a,(ix+00ah)		;b302
	sub b			;b305
	ld b,a			;b306
	ld a,(ix+00fh)		;b307
	and a			;b30a
	jp nz,L_B375		;b30b
	jr L_B33A		;b30e
L_B310:
	call 051b8h		;b310   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,(hl)			;b313
	ld a,(ix+00ah)		;b314
	sub b			;b317
	ld b,a			;b318
	ld a,(ix+005h)		;b319
	cp 00eh		;b31c
	jr z,L_B2C1		;b31e
	cp 00fh		;b320
	jr z,L_B36F		;b322
	cp 010h		;b324
	jr z,L_B35D		;b326
	cp 011h		;b328
	jr z,L_B334		;b32a
	cp 012h		;b32c
	jr z,L_B2C1		;b32e
	cp 013h		;b330
	jr z,L_B2C1		;b332
L_B334:
	ld a,(ix+00fh)		;b334
	and a			;b337
	jr nz,L_B375		;b338
L_B33A:
	ld a,(ix+00bh)		;b33a
	sub 008h		;b33d
	ld (ix+001h),a		;b33f
	ld (ix+011h),a		;b342
	add a,010h		;b345
	ld (ix-01fh),a		;b347
	ld (ix-00fh),a		;b34a
L_B34D:
	ld a,b			;b34d
	ld (ix+000h),a		;b34e
	ld (ix+010h),a		;b351
	ld (ix-020h),a		;b354
	ld (ix-010h),a		;b357
	jp L_B2EA		;b35a
L_B35D:
	ld a,b			;b35d
	ld (ix+000h),a		;b35e
	ld (ix+010h),a		;b361
	add a,010h		;b364
	ld (ix-020h),a		;b366
	ld (ix-010h),a		;b369
	jp L_B2DB		;b36c
L_B36F:
	ld a,(ix+00fh)		;b36f
	and a			;b372
	jr nz,L_B33A		;b373
L_B375:
	ld a,(ix+00bh)		;b375
	sub 008h		;b378
	ld (ix-01fh),a		;b37a
	ld (ix-00fh),a		;b37d
	add a,010h		;b380
	ld (ix+001h),a		;b382
	ld (ix+011h),a		;b385
	jr L_B34D		;b388
L_B38A:
	call L_B4C3		;b38a
	jp c,L_B1F2		;b38d
	inc (ix+00bh)		;b390
	jp L_B1F2		;b393
L_B396:
	call L_B52B		;b396
	jp c,L_B1F2		;b399
	dec (ix+00bh)		;b39c
	jp L_B1F2		;b39f
L_B3A2:
	ld a,(0e1c2h)		;b3a2
	and 018h		;b3a5
	srl a		;b3a7
	srl a		;b3a9
	srl a		;b3ab
	ret			;b3ad

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb3ae..0xb4a5  (247 bytes)
DATA_B3AE:
	defb 005h,010h,005h,00fh,005h,010h,005h,011h,006h,010h,006h,00fh,006h,010h,006h,011h	; b3ae  ................
	defb 007h,010h,007h,00fh,007h,010h,007h,011h,012h,013h,008h,010h,01ch,01dh,01eh,01fh	; b3be  ................
	defb 020h,021h,022h,023h,000h,00ah,014h,015h,025h,026h,012h,013h,008h,010h,030h,031h	; b3ce   !"#....%&....01
	defb 032h,033h,034h,035h,034h,036h,037h,038h,037h,039h,03dh,03eh,03dh,03fh,030h,010h	; b3de  2345467879=>=?0.
	defb 030h,00fh,030h,010h,030h,011h,000h,00bh,000h,00ah,000h,00bh,000h,00ch,001h,00bh	; b3ee  0.0.0...........
	defb 001h,00ah,001h,00bh,001h,00ch,002h,00bh,002h,00ah,002h,00bh,002h,00ch,00dh,00eh	; b3fe  ................
	defb 003h,00bh,014h,015h,016h,017h,018h,019h,01ah,01bh,005h,00fh,01ch,01dh,027h,028h	; b40e  ..............'(
	defb 00dh,00eh,003h,00bh,030h,031h,032h,033h,034h,035h,034h,036h,037h,038h,037h,039h	; b41e  ....012345467879
	defb 03ah,03bh,03ah,03ch,030h,00bh,030h,00ah,030h,00bh,030h,00ch,01fh,01eh,01fh,01eh	; b42e  :.:<0.0.0.0.....
	defb 01fh,01eh,01fh,01eh,01fh,01eh,01fh,01eh,00fh,01fh,01fh,017h,01fh,017h,01fh,01fh	; b43e  ................
	defb 010h,010h,01eh,01eh,016h,01fh,01fh,01fh,01fh,01fh,01fh,01fh,01eh,01fh,01eh,001h	; b44e  ................
	defb 002h,0ffh,0ffh,0ffh,0ffh,0ffh,004h,0ffh,005h,0ffh,003h,0ffh,0ffh,0ffh,007h,0ffh	; b45e  ................
	defb 001h,0ffh,0ffh,004h,005h,0ffh,0ffh,001h,004h,0ffh,001h,005h,008h,008h,0ffh,009h	; b46e  ................
	defb 00ah,003h,003h,0ffh,005h,006h,004h,009h,0ffh,006h,0ffh,001h,004h,0ffh,0ffh,006h	; b47e  ................
	defb 0ffh,007h,008h,00bh,0ffh,0ffh,00dh,0ffh,00eh,004h,006h,0ffh,0ffh,007h,0ffh,008h	; b48e  ................
	defb 006h,0ffh,0ffh,0ffh,00eh,0ffh,00bh	; b49e

; ======================================================================
; CODIGO 0xb4a5..0xb757  (690 bytes)
; ======================================================================


L_B4A5:
	ld bc,0e804h		;b4a5
	call L_B5C6		;b4a8
	ld (ix+015h),a		;b4ab
	ld bc,0e80ah		;b4ae
	call L_B5C6		;b4b1
	cp 002h		;b4b4
	jr z,L_B4BF		;b4b6
	ld a,(ix+015h)		;b4b8
	cp 002h		;b4bb
	jr nz,L_B4C1		;b4bd
L_B4BF:
	scf			;b4bf
	ret			;b4c0
L_B4C1:
	xor a			;b4c1
	ret			;b4c2
L_B4C3:
	ld a,(ix+00ah)		;b4c3
	cp 010h		;b4c6
	jr c,L_B4C1		;b4c8
	cp 0ech		;b4ca
	jr nc,L_B4C1		;b4cc
	ld bc,0000ch		;b4ce
	call L_B5C6		;b4d1
	ld (ix+016h),a		;b4d4
	cp 003h		;b4d7
	jp c,L_B574		;b4d9
	ld de,0ffe0h		;b4dc
	add hl,de			;b4df
	ld a,(hl)			;b4e0
	cp 003h		;b4e1
	jp c,L_B574		;b4e3
	add hl,de			;b4e6
	ld a,(hl)			;b4e7
	cp 003h		;b4e8
	jp c,L_B574		;b4ea
	ld b,(ix+014h)		;b4ed
	ld c,00ch		;b4f0
	call L_B5C6		;b4f2
	ld (ix+015h),a		;b4f5
	jr L_B55D		;b4f8
L_B4FA:
	ld a,(ix+00ah)		;b4fa
	and 007h		;b4fd
	cp 007h		;b4ff
	jp nz,L_B572		;b501
	ld bc,00104h		;b504
	call L_B5C6		;b507
	ld (ix+015h),a		;b50a
	ld bc,0010ah		;b50d
	call L_B5C6		;b510
	ld (ix+016h),a		;b513
	cp 003h		;b516
	jr c,L_B529		;b518
	ld a,(ix+015h)		;b51a
	cp 003h		;b51d
	jr c,L_B529		;b51f
	ld a,(0e2c5h)		;b521
	and a			;b524
	jr nz,L_B529		;b525
L_B527:
	xor a			;b527
	ret			;b528
L_B529:
	scf			;b529
	ret			;b52a
L_B52B:
	ld a,(ix+00ah)		;b52b
	cp 010h		;b52e
	jr c,L_B527		;b530
	cp 0ech		;b532
	jr nc,L_B527		;b534
	ld bc,00002h		;b536
	call L_B5C6		;b539
	ld (ix+016h),a		;b53c
	cp 003h		;b53f
	jr c,L_B574		;b541
	ld de,0ffe0h		;b543
	add hl,de			;b546
	ld a,(hl)			;b547
	cp 003h		;b548
	jr c,L_B574		;b54a
	add hl,de			;b54c
	ld a,(hl)			;b54d
	cp 003h		;b54e
	jr c,L_B574		;b550
	ld b,(ix+014h)		;b552
	ld c,002h		;b555
	call L_B5C6		;b557
	ld (ix+015h),a		;b55a
L_B55D:
	ld a,(ix+00ah)		;b55d
	cp 00fh		;b560
	jr c,L_B572		;b562
	ld a,(ix+015h)		;b564
	cp 003h		;b567
	jr c,L_B574		;b569
	ld a,(ix+016h)		;b56b
	cp 003h		;b56e
	jr c,L_B57F		;b570
L_B572:
	xor a			;b572
	ret			;b573
L_B574:
	cp 001h		;b574
	jr nz,L_B589		;b576
	ld a,(ix+016h)		;b578
	cp 003h		;b57b
	jr nc,L_B583		;b57d
L_B57F:
	cp 001h		;b57f
	jr nz,L_B589		;b581
L_B583:
	ld a,(ix+006h)		;b583
	and a			;b586
	jr nz,L_B572		;b587
L_B589:
	scf			;b589
	ret			;b58a
cambia_tramo:		; suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	di			;b58b
	ld hl,0bae4h		;b58c
	ld a,(0e020h)		;b58f   ; lee la fase (0-19; la 8 se salta)
	call 051b8h		;b592   ; lee_tabla: HL = HL + A y A = (HL)
	call 04f78h		;b595   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld a,(0e022h)		;b598   ; lee el tramo: la pantalla de la lista de la fase
	add a,b			;b59b
	cp 0f0h		;b59c
	jr nc,L_B5BF		;b59e
	ld (0e022h),a		;b5a0   ; guarda el tramo: la pantalla de la lista de la fase
	push af			;b5a3
	ld hl,06000h		;b5a4
	ld a,(0e020h)		;b5a7   ; lee la fase (0-19; la 8 se salta)
	add a,a			;b5aa
	add a,l			;b5ab
	ld l,a			;b5ac
	ld e,(hl)			;b5ad
	inc hl			;b5ae
	ld d,(hl)			;b5af
	ex de,hl			;b5b0
	pop af			;b5b1
	call 051b8h		;b5b2   ; lee_tabla: HL = HL + A y A = (HL)
	and a			;b5b5
	jr nz,L_B5C2		;b5b6
	ld a,(0e022h)		;b5b8   ; lee el tramo: la pantalla de la lista de la fase
	sub b			;b5bb
	ld (0e022h),a		;b5bc   ; guarda el tramo: la pantalla de la lista de la fase
L_B5BF:
	ei			;b5bf
	xor a			;b5c0
	ret			;b5c1
L_B5C2:
	ei			;b5c2
	ld a,001h		;b5c3
	ret			;b5c5
L_B5C6:
	ld a,(ix+00ah)		;b5c6
	add a,b			;b5c9
	ld b,a			;b5ca
	ld a,(ix+00bh)		;b5cb
	add a,c			;b5ce
	ld c,a			;b5cf
L_B5D0:
	ld hl,0c300h		;b5d0   ; apunta a el mapa de la pantalla: 32 x 24 dibujos
	ld a,b			;b5d3
	srl a		;b5d4
	srl a		;b5d6
	srl a		;b5d8
	and a			;b5da
	jr z,L_B5E4		;b5db
	ld b,a			;b5dd
	ld de,00020h		;b5de
L_B5E1:
	add hl,de			;b5e1
	djnz L_B5E1		;b5e2
L_B5E4:
	ld a,c			;b5e4
	srl a		;b5e5
	srl a		;b5e7
	srl a		;b5e9
	jp 051b8h		;b5eb   ; lee_tabla: HL = HL + A y A = (HL)
L_B5EE:
	ld a,(ix+00ch)		;b5ee
	cp 00dh		;b5f1
	jr z,L_B5F9		;b5f3
	cp 012h		;b5f5
	jr nz,L_B5FE		;b5f7
L_B5F9:
	ld (ix+006h),000h		;b5f9
	ret			;b5fd
L_B5FE:
	ld a,(ix+006h)		;b5fe
	and a			;b601
	jr nz,L_B642		;b602
	ld a,(0e062h)		;b604
	and a			;b607
	ret z			;b608
	xor a			;b609
	ld (0e062h),a		;b60a
	ld (0e2cfh),a		;b60d
	ld a,(0e5c2h)		;b610
	and a			;b613
	ret nz			;b614
	ld a,(ix-005h)		;b615
	and a			;b618
	ret nz			;b619
	ld a,(ix+009h)		;b61a
	and a			;b61d
	ret nz			;b61e
	inc (ix+006h)		;b61f
	ld (ix+01bh),000h		;b622
	ld a,001h		;b626
	call 049a0h		;b628
	ld a,(0e180h)		;b62b   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	cp 002h		;b62e
	jr c,L_B642		;b630
	cp 005h		;b632
	jr c,L_B63E		;b634
	jr z,L_B642		;b636
	ld (ix+008h),002h		;b638
	jr L_B642		;b63c
L_B63E:
	ld (ix+008h),001h		;b63e
L_B642:
	ld hl,0b757h		;b642
	ld a,(0e031h)		;b645
	and a			;b648
	jr z,L_B655		;b649
	ld hl,0b777h		;b64b
	cp 001h		;b64e
	jr z,L_B655		;b650
	ld hl,0b797h		;b652
L_B655:
	ld a,(ix+006h)		;b655
	cp 001h		;b658
	jp nz,L_B6E2		;b65a
	ld a,(0e000h)		;b65d
	and a			;b660
	jr z,L_B677		;b661
	ld a,(ix+007h)		;b663
	cp 006h		;b666
	jr c,L_B677		;b668
	ld a,(0e063h)		;b66a
	and a			;b66d
	jr nz,L_B677		;b66e
	ld (ix+007h),020h		;b670
	jp L_B6DF		;b674
L_B677:
	ld a,(ix+007h)		;b677
	cp 020h		;b67a
	jr nc,L_B6DF		;b67c
	inc (ix+007h)		;b67e
	call 051b8h		;b681   ; lee_tabla: HL = HL + A y A = (HL)
	and a			;b684
	jp z,L_B746		;b685
	ld b,a			;b688
L_B689:
	push bc			;b689
	ld a,(ix+00ah)		;b68a
	cp 010h		;b68d
	jr nc,L_B694		;b68f
	call L_B6C1		;b691
L_B694:
	ld a,(ix+00ah)		;b694
	cp 0f8h		;b697
	jr nc,L_B6A3		;b699
	call L_B4A5		;b69b
	jr c,L_B6A3		;b69e
	dec (ix+00ah)		;b6a0
L_B6A3:
	pop bc			;b6a3
	djnz L_B689		;b6a4
	jp L_B746		;b6a6
L_B6A9:
	push af			;b6a9
	ld a,(0e032h)		;b6aa
	cp 002h		;b6ad
	jr nz,L_B6B3		;b6af
	ld b,0f8h		;b6b1
L_B6B3:
	pop af			;b6b3
	ret			;b6b4
L_B6B5:
	push af			;b6b5
	ld a,(0e032h)		;b6b6
	cp 002h		;b6b9
	jr nz,L_B6B3		;b6bb
	pop af			;b6bd
	add a,0f8h		;b6be
	ret			;b6c0
L_B6C1:
	ld a,(0e020h)		;b6c1   ; lee la fase (0-19; la 8 se salta)
	cp 003h		;b6c4
	jr z,L_B6CC		;b6c6
	cp 012h		;b6c8
	jr nz,L_B6DD		;b6ca
L_B6CC:
	ld b,001h		;b6cc
	call cambia_tramo		;b6ce   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;b6d1
	jr z,L_B6DD		;b6d2
	ld (ix+00ah),090h		;b6d4
	call pantalla_nueva		;b6d8   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	xor a			;b6db
	ret			;b6dc
L_B6DD:
	scf			;b6dd
	ret			;b6de
L_B6DF:
	inc (ix+006h)		;b6df
L_B6E2:
	ld a,(ix+007h)		;b6e2
	and a			;b6e5
	jr z,L_B720		;b6e6
	dec (ix+007h)		;b6e8
	ld a,(ix+007h)		;b6eb
	call 051b8h		;b6ee   ; lee_tabla: HL = HL + A y A = (HL)
	ld (ix+01dh),a		;b6f1
	and a			;b6f4
	jp z,L_B746		;b6f5
	ld b,a			;b6f8
L_B6F9:
	push bc			;b6f9
	ld a,(ix+00ah)		;b6fa
	and 007h		;b6fd
	and a			;b6ff
	jr z,L_B712		;b700
	ld a,(ix+00ah)		;b702
	cp 0f8h		;b705
	jr nc,L_B717		;b707
	cp 010h		;b709
	jr c,L_B717		;b70b
	call L_B4FA		;b70d
	jr c,L_B71F		;b710
L_B712:
	call L_BAAD		;b712
	jr L_B71A		;b715
L_B717:
	inc (ix+00ah)		;b717
L_B71A:
	pop bc			;b71a
	djnz L_B6F9		;b71b
	jr L_B746		;b71d
L_B71F:
	pop bc			;b71f
L_B720:
	xor a			;b720
	ld (ix+008h),a		;b721
	ld (ix+006h),a		;b724
	ld (ix+007h),a		;b727
	ld (0e062h),a		;b72a
	ld a,(0e094h)		;b72d
	and a			;b730
	jp z,0499ch		;b731
	call L_B4FA		;b734
	jp nc,0499ch		;b737
	xor a			;b73a
	ld (0e2ceh),a		;b73b
	ld a,015h		;b73e
	call 05052h		;b740   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 0499ch		;b743
L_B746:
	ld a,(0e1c2h)		;b746
	and 018h		;b749
	srl a		;b74b
	srl a		;b74d
	srl a		;b74f
	add a,00eh		;b751
	ld (ix+005h),a		;b753
	ret			;b756

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb757..0xb7b7  (96 bytes)
DATA_B757:
	defb 004h,004h,004h,004h,004h,004h,003h,003h,003h,003h,003h,003h,003h,003h,002h,002h	; b757  ................
	defb 002h,002h,002h,002h,002h,001h,000h,001h,000h,001h,000h,001h,000h,000h,000h,000h	; b767  ................
	defb 005h,004h,005h,004h,004h,004h,004h,003h,004h,003h,004h,003h,003h,003h,003h,003h	; b777  ................
	defb 002h,002h,002h,002h,002h,002h,001h,001h,001h,001h,001h,000h,001h,000h,000h,000h	; b787  ................
	defb 005h,005h,005h,004h,004h,004h,004h,004h,004h,004h,004h,004h,003h,003h,003h,003h	; b797  ................
	defb 003h,003h,002h,002h,002h,002h,001h,001h,001h,001h,001h,001h,001h,000h,000h,000h	; b7a7  ................

; ======================================================================
; CODIGO 0xb7b7..0xb7f3  (60 bytes)
; ======================================================================


L_B7B7:
	ld a,(ix+01ah)		;b7b7
	and a			;b7ba
	jr z,L_B7C4		;b7bb
	dec (ix+01ah)		;b7bd
	xor a			;b7c0
	ld (0e060h),a		;b7c1
L_B7C4:
	ld a,(0e060h)		;b7c4
	and a			;b7c7
	ret z			;b7c8
	ld a,(0e2ceh)		;b7c9
	and a			;b7cc
	ret nz			;b7cd
	ld (0e060h),a		;b7ce
	ld a,(0e5c2h)		;b7d1
	and a			;b7d4
	ret nz			;b7d5
	ld a,(ix-006h)		;b7d6
	and a			;b7d9
	ret nz			;b7da
	ld a,(ix+005h)		;b7db
	ld (ix+004h),a		;b7de
	ld a,(0e180h)		;b7e1   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix+019h),a		;b7e4
	ld hl,0b7f3h		;b7e7
	add a,a			;b7ea
	call 051b8h		;b7eb   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;b7ee
	inc hl			;b7ef
	ld d,(hl)			;b7f0
	ex de,hl			;b7f1
	jp (hl)			;b7f2

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb7f3..0xb805  (18 bytes)
DATA_B7F3:
	defb 005h,0b8h,02ah,0b8h,051h,0b8h,06ch,0b8h,091h,0b8h,0ach,0b8h,00bh,0b9h,026h,0b9h	; b7f3  ..*.Q.l.......&.
	defb 04bh,0b9h	; b803

; ======================================================================
; CODIGO 0xb805..0xba3d  (568 bytes)
; ======================================================================


L_B805:
	ld (ix+019h),003h		;b805
	call 0531bh		;b809   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_B81D		;b80c
	ld (ix+019h),009h		;b80e
	ld a,(ix+00ah)		;b812
	sub 01ah		;b815
	ld b,a			;b817
	ld c,(ix+00bh)		;b818
	jr L_B84E		;b81b
L_B81D:
	ld a,(ix+00fh)		;b81d
	and a			;b820
	jr z,L_B86C		;b821
	ld (ix+019h),007h		;b823
	jp L_B926		;b827
L_B82A:
	call 0531bh		;b82a   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_B805		;b82d
	ld a,(ix+006h)		;b82f
	and a			;b832
	jr nz,L_B839		;b833
	ld (ix+005h),016h		;b835
L_B839:
	ld a,(ix+00ah)		;b839
	sub 025h		;b83c
	ld b,a			;b83e
	ld c,002h		;b83f
	ld a,(ix+00fh)		;b841
	and a			;b844
	jr z,L_B849		;b845
	ld c,0feh		;b847
L_B849:
	ld a,(ix+00bh)		;b849
	add a,c			;b84c
	ld c,a			;b84d
L_B84E:
	jp L_B97D		;b84e
L_B851:
	call 0531bh		;b851   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b854
	ld a,(ix+00ah)		;b857
	sub 024h		;b85a
	ld b,(ix+01bh)		;b85c
	call L_B6A9		;b85f
	add a,b			;b862
	ld b,a			;b863
	ld a,(ix+00bh)		;b864
	add a,006h		;b867
	ld c,a			;b869
	jr L_B8DA		;b86a
L_B86C:
	call 0531bh		;b86c   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b86f
	ld a,(ix+006h)		;b872
	and a			;b875
	jr nz,L_B87C		;b876
	ld (ix+005h),001h		;b878
L_B87C:
	ld a,(ix+00ah)		;b87c
	sub 01dh		;b87f
	ld b,(ix+01bh)		;b881
	call L_B6A9		;b884
	add a,b			;b887
	ld b,a			;b888
	ld a,(ix+00bh)		;b889
	add a,007h		;b88c
	ld c,a			;b88e
	jr L_B8DA		;b88f
L_B891:
	call 0531bh		;b891   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b894
	ld a,(ix+00ah)		;b897
	sub 01ah		;b89a
	ld b,(ix+01bh)		;b89c
	call L_B6A9		;b89f
	add a,b			;b8a2
	ld b,a			;b8a3
	ld a,(ix+00bh)		;b8a4
	add a,006h		;b8a7
	ld c,a			;b8a9
	jr L_B8DA		;b8aa
L_B8AC:
	ld a,(ix+006h)		;b8ac
	and a			;b8af
	jp nz,L_B966		;b8b0
	ld a,(ix+009h)		;b8b3
	and a			;b8b6
	jp nz,L_B966		;b8b7
	ld a,(0e020h)		;b8ba   ; lee la fase (0-19; la 8 se salta)
	and a			;b8bd
	jr nz,L_B8C8		;b8be
	ld a,(ix+00ah)		;b8c0
	cp 0afh		;b8c3
	jp z,L_B805		;b8c5
L_B8C8:
	call 0531bh		;b8c8   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_B8DD		;b8cb
	ld (ix+019h),009h		;b8cd
	ld a,(ix+00ah)		;b8d1
	sub 010h		;b8d4
	ld b,a			;b8d6
	ld c,(ix+00bh)		;b8d7
L_B8DA:
	jp L_B97D		;b8da
L_B8DD:
	ld (ix+005h),015h		;b8dd
	ld a,(ix+00fh)		;b8e1
	and a			;b8e4
	jr z,L_B8ED		;b8e5
	ld (ix+019h),007h		;b8e7
	jr L_B8F1		;b8eb
L_B8ED:
	ld (ix+019h),003h		;b8ed
L_B8F1:
	ld a,(ix+00ah)		;b8f1
	sub 00ch		;b8f4
	call L_B6B5		;b8f6
	ld b,a			;b8f9
	ld c,00ch		;b8fa
	ld a,(ix+00fh)		;b8fc
	and a			;b8ff
	jr z,L_B904		;b900
	ld c,0f0h		;b902
L_B904:
	ld a,(ix+00bh)		;b904
	add a,c			;b907
	ld c,a			;b908
	jr L_B97D		;b909
L_B90B:
	call 0531bh		;b90b   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b90e
	ld a,(ix+00ah)		;b911
	sub 01ah		;b914
	ld b,(ix+01bh)		;b916
	call L_B6A9		;b919
	add a,b			;b91c
	ld b,a			;b91d
	ld a,(ix+00bh)		;b91e
	sub 006h		;b921
	ld c,a			;b923
	jr L_B97D		;b924
L_B926:
	call 0531bh		;b926   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b929
	ld a,(ix+006h)		;b92c
	and a			;b92f
	jr nz,L_B936		;b930
	ld (ix+005h),001h		;b932
L_B936:
	ld a,(ix+00ah)		;b936
	sub 01dh		;b939
	ld b,(ix+01bh)		;b93b
	call L_B6A9		;b93e
	add a,b			;b941
	ld b,a			;b942
	ld a,(ix+00bh)		;b943
	sub 003h		;b946
	ld c,a			;b948
	jr L_B97D		;b949
L_B94B:
	call 0531bh		;b94b   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jp c,L_B805		;b94e
	ld a,(ix+00ah)		;b951
	sub 024h		;b954
	ld b,(ix+01bh)		;b956
	call L_B6A9		;b959
	add a,b			;b95c
	ld b,a			;b95d
	ld a,(ix+00bh)		;b95e
	sub 006h		;b961
	ld c,a			;b963
	jr L_B97D		;b964
L_B966:
	ld a,(ix+006h)		;b966
	and a			;b969
	jr nz,L_B970		;b96a
	ld (ix+005h),000h		;b96c
L_B970:
	ld (ix+019h),005h		;b970
	ld a,(ix+00ah)		;b974
	sub 010h		;b977
	ld b,a			;b979
	ld c,(ix+00bh)		;b97a
L_B97D:
	ld iy,0e340h		;b97d
	ld d,002h		;b981
L_B983:
	ld a,(iy+004h)		;b983
	and a			;b986
	jr z,L_B9C3		;b987
	push bc			;b989
	call 0531bh		;b98a   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	pop bc			;b98d
	jr c,L_B99C		;b98e
	ld a,(0e032h)		;b990
	cp 001h		;b993
	ret z			;b995
	cp 006h		;b996
	ret z			;b998
	cp 007h		;b999
	ret z			;b99b
L_B99C:
	push de			;b99c
	ld de,00010h		;b99d
	add iy,de		;b9a0
	pop de			;b9a2
	dec d			;b9a3
	jr nz,L_B983		;b9a4
	ld iy,0e4c0h		;b9a6
	ld d,004h		;b9aa
L_B9AC:
	ld a,(iy+004h)		;b9ac
	and a			;b9af
	jr z,L_B9C3		;b9b0
	push de			;b9b2
	ld de,00010h		;b9b3
	add iy,de		;b9b6
	pop de			;b9b8
	dec d			;b9b9
	jr nz,L_B9AC		;b9ba
	ld a,(ix+004h)		;b9bc
	ld (ix+005h),a		;b9bf
	ret			;b9c2
L_B9C3:
	ld a,(0e032h)		;b9c3
	inc a			;b9c6
	ld (iy+004h),a		;b9c7
	dec a			;b9ca
	and a			;b9cb
	jr z,L_B9D9		;b9cc
	push bc			;b9ce
	call 0531bh		;b9cf   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	pop bc			;b9d2
	jr nc,L_B9D9		;b9d3
	ld (iy+004h),004h		;b9d5
L_B9D9:
	ld (iy+005h),000h		;b9d9
	ld (iy+000h),b		;b9dd
	ld (iy+001h),c		;b9e0
	ld (iy+00fh),001h		;b9e3
	ld a,(ix+00dh)		;b9e7
	cp 033h		;b9ea
	jr nz,L_B9F2		;b9ec
	ld (iy+00dh),001h		;b9ee
L_B9F2:
	ld a,(ix+019h)		;b9f2
	ld (iy+003h),a		;b9f5
	cp 009h		;b9f8
	ret nz			;b9fa
	ld a,(ix+00bh)		;b9fb
	ld a,(0e032h)		;b9fe
	cp 006h		;ba01
	jr z,L_BA08		;ba03
	cp 007h		;ba05
	ret nz			;ba07
L_BA08:
	xor a			;ba08
	ld (iy+005h),a		;ba09
	ld (iy+00ah),a		;ba0c
	ret			;ba0f
L_BA10:
	ld iy,0e340h		;ba10
	ld b,002h		;ba14
L_BA16:
	push bc			;ba16
	ld a,(iy+004h)		;ba17
	and a			;ba1a
	call nz,054dfh		;ba1b
	ld de,00010h		;ba1e
	add iy,de		;ba21
	pop bc			;ba23
	djnz L_BA16		;ba24
	ld iy,0e4c0h		;ba26
	ld b,004h		;ba2a
L_BA2C:
	push bc			;ba2c
	ld a,(iy+004h)		;ba2d
	and a			;ba30
	call nz,054dfh		;ba31
	ld de,00010h		;ba34
	add iy,de		;ba37
	pop bc			;ba39
	djnz L_BA2C		;ba3a
	ret			;ba3c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba3d..0xba4f  (18 bytes)
DATA_BA3D:
	defb 0fdh,07eh,000h,0feh,0b0h,030h,00bh,0fdh,07eh,001h,0feh,005h,0dah,04fh,0bah,0feh	; ba3d  .~...0..~....O..
	defb 0f4h,0d8h	; ba4d

; ======================================================================
; CODIGO 0xba4f..0xbab9  (106 bytes)
; ======================================================================


L_BA4F:
	push iy		;ba4f
	pop hl			;ba51
	ld b,010h		;ba52
	call 051b2h		;ba54   ; borra_b: pone a cero B bytes desde HL
	ld (iy+000h),0ech		;ba57
	ret			;ba5b
L_BA5C:
	ld a,(ix+006h)		;ba5c
	and a			;ba5f
	ret nz			;ba60
	ld a,(ix+009h)		;ba61
	and a			;ba64
	jr nz,L_BA7F		;ba65
	ld a,(ix+00ah)		;ba67
	cp 0b0h		;ba6a
	jr c,L_BA77		;ba6c
	call L_BAAD		;ba6e
	ret c			;ba71
	ld (ix+009h),001h		;ba72
	ret			;ba76
L_BA77:
	call L_B4FA		;ba77
	ret c			;ba7a
	ld (ix+009h),001h		;ba7b
L_BA7F:
	call L_B4FA		;ba7f
	jr c,L_BA9E		;ba82
	call L_BAAD		;ba84
	jr c,L_BA9E		;ba87
	call L_B4FA		;ba89
	jr c,L_BA9E		;ba8c
	call L_BAAD		;ba8e
	jr c,L_BA9E		;ba91
	ld a,(0e1c0h)		;ba93
	and 00ch		;ba96
	rrca			;ba98
	rrca			;ba99
	ld (ix+005h),a		;ba9a
	ret			;ba9d
L_BA9E:
	xor a			;ba9e
	ld (0e2ceh),a		;ba9f
	ld (ix+009h),a		;baa2
	ld (ix+008h),a		;baa5
	ld a,015h		;baa8
	jp 05052h		;baaa   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_BAAD:
	ld a,(ix+00ah)		;baad
	cp 0afh		;bab0
	jr nc,$+11		;bab2
	inc (ix+00ah)		;bab4
	xor a			;bab7
	ret			;bab8

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbab9..0xbabd  (4 bytes)
DATA_BAB9:
	defb 003h,00ah,010h,012h	; bab9

; ======================================================================
; CODIGO 0xbabd..0xbae4  (39 bytes)
; ======================================================================


L_BABD:
	ld a,(0e020h)		;babd   ; lee la fase (0-19; la 8 se salta)
	ld hl,0bab9h		;bac0
	ld bc,00004h		;bac3
	cpir		;bac6
	scf			;bac8
	ret nz			;bac9
	ld b,0ffh		;baca
	call cambia_tramo		;bacc   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;bacf
	scf			;bad0
	ret z			;bad1
	ld (ix+00ah),010h		;bad2
	call pantalla_nueva		;bad6   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	xor a			;bad9
	ret			;bada
L_BADB:
	ld a,(ix-002h)		;badb
	and a			;bade
	ret z			;badf
	dec (ix-002h)		;bae0
	ret			;bae3

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbae4..0xbaf8  (20 bytes)
DATA_BAE4:
	defb 00eh,00fh,00dh,00eh,00fh,00dh,00eh,00eh,00eh,00eh,00dh,00fh,00dh,00dh,00fh,00dh	; bae4  ................
	defb 00fh,00fh,00fh,00fh	; baf4

; ======================================================================
; CODIGO 0xbaf8..0xbb06  (14 bytes)
; ======================================================================


L_BAF8:
	ld a,00eh		;baf8
	call 04f78h		;bafa   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld a,(0e023h)		;bafd
	ld hl,06040h		;bb00
	jp L_BB98		;bb03

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb06..0xbb0c  (6 bytes)
DATA_BB06:
	defb 03ah,03eh,0e0h,032h,022h,0e0h	; bb06

; ======================================================================
; CODIGO 0xbb0c..0xbe6f  (867 bytes)
; ======================================================================


pantalla_nueva:		; construye la pantalla del tramo y sus objetos
	ld a,(0e093h)		;bb0c
	push af			;bb0f
	ld a,001h		;bb10
	ld (0e093h),a		;bb12
	call construye_pantalla		;bb15   ; construye_pantalla: construye la pantalla del tramo 0xE022: mapa 0xC300 y dibujos en la VRAM
	call 0531bh		;bb18   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_BB26		;bb1b
	ld a,(0e022h)		;bb1d   ; lee el tramo: la pantalla de la lista de la fase
	and a			;bb20
	jr nz,L_BB26		;bb21
	call 051bfh		;bb23
L_BB26:
	xor a			;bb26
	ld (0e33ch),a		;bb27
	pop af			;bb2a
	ld (0e093h),a		;bb2b
	call 04532h		;bb2e   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	call 09966h		;bb31
	call 0452dh		;bb34   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	xor a			;bb37
	ld (0e30fh),a		;bb38
	ret			;bb3b
construye_pantalla:		; construye la pantalla del tramo 0xE022: mapa 0xC300 y dibujos en la VRAM
	xor a			;bb3c
	ld (0e18ah),a		;bb3d
	ld (0e18bh),a		;bb40
	dec a			;bb43
	ld (0e30fh),a		;bb44
	call 050d6h		;bb47   ; apaga_pantalla: apaga la pantalla (DISSCR)
	call 0531bh		;bb4a   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_BB66		;bb4d
	ld hl,00000h		;bb4f
	ld bc,05c00h		;bb52
	xor a			;bb55
	call 00056h		;bb56   ; BIOS FILVRM - Fills VRAM with value
	ld hl,0c300h		;bb59   ; apunta a el mapa de la pantalla: 32 x 24 dibujos
	ld de,0c301h		;bb5c
	ld bc,002ffh		;bb5f
	ld (hl),0ffh		;bb62
	ldir		;bb64
L_BB66:
	call L_BFD2		;bb66
	ld hl,0bae4h		;bb69
	ld a,(0e020h)		;bb6c   ; lee la fase (0-19; la 8 se salta)
	call 051b8h		;bb6f   ; lee_tabla: HL = HL + A y A = (HL)
	call 04f78h		;bb72   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld (ix-001h),001h		;bb75
	call 0492eh		;bb79
	call 04937h		;bb7c
	call 04b86h		;bb7f   ; vuelca_sprites: lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)
	ld hl,06000h		;bb82
	ld a,(0e020h)		;bb85   ; lee la fase (0-19; la 8 se salta)
	add a,a			;bb88
	add a,l			;bb89
	ld l,a			;bb8a
	ld e,(hl)			;bb8b
	inc hl			;bb8c
	ld d,(hl)			;bb8d
	ex de,hl			;bb8e
	ld a,(0e022h)		;bb8f   ; lee el tramo: la pantalla de la lista de la fase
	call 051b8h		;bb92   ; lee_tabla: HL = HL + A y A = (HL)
	ld hl,06100h		;bb95
L_BB98:
	add a,a			;bb98
	jr nc,L_BB9C		;bb99
	inc h			;bb9b
L_BB9C:
	call 051b8h		;bb9c   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;bb9f
	inc hl			;bba0
	ld d,(hl)			;bba1
L_BBA2:
	ld a,(de)			;bba2
	inc de			;bba3
	cp 0ffh		;bba4
	jp z,L_BD7B		;bba6
	cp 0feh		;bba9
	jr z,L_BBB2		;bbab
	call L_BBC8		;bbad
	jr L_BBA2		;bbb0
L_BBB2:
	ld a,(de)			;bbb2
	inc de			;bbb3
	ld l,a			;bbb4
	ld a,(de)			;bbb5
	inc de			;bbb6
	ld h,a			;bbb7
	push de			;bbb8
	ex de,hl			;bbb9
L_BBBA:
	ld a,(de)			;bbba
	inc de			;bbbb
	cp 0ffh		;bbbc
	jr z,L_BBC5		;bbbe
	call L_BBC8		;bbc0
	jr L_BBBA		;bbc3
L_BBC5:
	pop de			;bbc5
	jr L_BBA2		;bbc6
L_BBC8:
	cp 080h		;bbc8
	jr c,L_BC14		;bbca
	sub 080h		;bbcc
	call L_BCE8		;bbce
	ld (0e1b1h),hl		;bbd1
	ld a,(de)			;bbd4
	inc de			;bbd5
	ld l,a			;bbd6
	ld a,(de)			;bbd7
	inc de			;bbd8
	ld h,a			;bbd9
	ld (0e1a3h),de		;bbda
	ex de,hl			;bbde
	ld a,(de)			;bbdf
	push de			;bbe0
	and 001h		;bbe1
	and a			;bbe3
	jr nz,L_BBEB		;bbe4
	call 0485eh		;bbe6
	jr L_BBEE		;bbe9
L_BBEB:
	call 0484eh		;bbeb   ; orden_copia: prepara en 0xE0D0 la orden HMMM de copiar un dibujo de 8 x 8
L_BBEE:
	pop de			;bbee
	ld a,(de)			;bbef
	inc de			;bbf0
	and 0f0h		;bbf1
	ld (0e01fh),a		;bbf3   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	ld a,(de)			;bbf6
	inc de			;bbf7
	ld (0e1a1h),a		;bbf8
	ld (0e1a5h),a		;bbfb
	ld (0e1b5h),a		;bbfe
	ld a,(de)			;bc01
	inc de			;bc02
	ld (0e1a2h),a		;bc03
	ld (0e1a6h),a		;bc06
	ld (0e1a7h),de		;bc09
	ld (0e1b3h),de		;bc0d
	jp L_BC59		;bc11
L_BC14:
	call L_BCE8		;bc14
	ld (0e1b1h),hl		;bc17
	ld a,(de)			;bc1a
	inc de			;bc1b
	ld (0e1a1h),a		;bc1c
	ld a,(de)			;bc1f
	inc de			;bc20
	ld (0e1a2h),a		;bc21
	ld a,(de)			;bc24
	inc de			;bc25
	ld l,a			;bc26
	ld a,(de)			;bc27
	inc de			;bc28
	ld (0e1a3h),de		;bc29
	ld h,a			;bc2d
	ex de,hl			;bc2e
	ld a,(de)			;bc2f
	push de			;bc30
	and 001h		;bc31
	and a			;bc33
	push af			;bc34
	call z,0485eh		;bc35
	pop af			;bc38
	call nz,0484eh		;bc39   ; orden_copia: prepara en 0xE0D0 la orden HMMM de copiar un dibujo de 8 x 8
	pop de			;bc3c
	ld a,(de)			;bc3d
	inc de			;bc3e
	and 0f0h		;bc3f
	ld (0e01fh),a		;bc41   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	ld a,(de)			;bc44
	inc de			;bc45
	ld (0e1a5h),a		;bc46
	ld (0e1b5h),a		;bc49
	ld a,(de)			;bc4c
	inc de			;bc4d
	ld (0e1a6h),a		;bc4e
	ld (0e1a7h),de		;bc51
	ld (0e1b3h),de		;bc55
L_BC59:
	ld hl,(0e1b1h)		;bc59
	ld a,(0e1a2h)		;bc5c
	ld b,a			;bc5f
L_BC60:
	ld de,(0e1b3h)		;bc60
	ld a,(0e1a6h)		;bc64
	ld c,a			;bc67
L_BC68:
	ld a,(de)			;bc68
	and a			;bc69
	jr z,L_BC7F		;bc6a
	ld (hl),a			;bc6c
	push hl			;bc6d
	push de			;bc6e
	push bc			;bc6f
	ld hl,(0e1b7h)		;bc70
	ld a,(0e1ach)		;bc73
	add a,h			;bc76
	ld h,a			;bc77
	ld a,(de)			;bc78
	call 0486eh		;bc79   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	pop bc			;bc7c
	pop de			;bc7d
	pop hl			;bc7e
L_BC7F:
	inc de			;bc7f
	inc hl			;bc80
	push hl			;bc81
	ld hl,(0e1b7h)		;bc82
	inc hl			;bc85
	ld (0e1b7h),hl		;bc86
	pop hl			;bc89
	dec b			;bc8a
	jr z,L_BC96		;bc8b
	dec c			;bc8d
	jr nz,L_BC68		;bc8e
	ld de,(0e1a7h)		;bc90
	jr L_BC60		;bc94
L_BC96:
	ld a,(0e1a1h)		;bc96
	dec a			;bc99
	ld (0e1a1h),a		;bc9a
	and a			;bc9d
	jr nz,L_BCA5		;bc9e
	ld de,(0e1a3h)		;bca0
	ret			;bca4
L_BCA5:
	dec c			;bca5
	jr z,L_BCAB		;bca6
	inc de			;bca8
	jr L_BCA5		;bca9
L_BCAB:
	ld (0e1b3h),de		;bcab
	ld a,(0e1b5h)		;bcaf
	dec a			;bcb2
	ld (0e1b5h),a		;bcb3
	and a			;bcb6
	jr z,L_BCD7		;bcb7
L_BCB9:
	ld hl,(0e1b1h)		;bcb9
	push de			;bcbc
	ld de,00020h		;bcbd
	add hl,de			;bcc0
	pop de			;bcc1
	ld (0e1b1h),hl		;bcc2
	ld hl,(0e1aeh)		;bcc5
	push de			;bcc8
	ld de,00020h		;bcc9
	add hl,de			;bccc
	pop de			;bccd
	ld (0e1aeh),hl		;bcce
	ld (0e1b7h),hl		;bcd1
	jp L_BC59		;bcd4
L_BCD7:
	ld a,(0e1a5h)		;bcd7
	ld (0e1b5h),a		;bcda
	ld de,(0e1a7h)		;bcdd
	ld (0e1b3h),de		;bce1
	jp L_BCB9		;bce5
L_BCE8:
	ld hl,0c300h		;bce8   ; apunta a el mapa de la pantalla: 32 x 24 dibujos
	and a			;bceb
	ld c,a			;bcec
	jr z,L_BCF8		;bced
	ld b,a			;bcef
	push de			;bcf0
	ld de,00020h		;bcf1
L_BCF4:
	add hl,de			;bcf4
	djnz L_BCF4		;bcf5
	pop de			;bcf7
L_BCF8:
	ld a,(de)			;bcf8
	inc de			;bcf9
	ld b,a			;bcfa
	call 051b8h		;bcfb   ; lee_tabla: HL = HL + A y A = (HL)
	push hl			;bcfe
	ld hl,00000h		;bcff
	ld a,c			;bd02
	and a			;bd03
	jr z,L_BD11		;bd04
	ld c,b			;bd06
	ld b,a			;bd07
	push de			;bd08
	ld de,00020h		;bd09
L_BD0C:
	add hl,de			;bd0c
	djnz L_BD0C		;bd0d
	pop de			;bd0f
	ld b,c			;bd10
L_BD11:
	ld a,l			;bd11
	add a,b			;bd12
	jr nc,L_BD16		;bd13
	inc h			;bd15
L_BD16:
	ld l,a			;bd16
	ld (0e1aeh),hl		;bd17
	ld (0e1b7h),hl		;bd1a
	pop hl			;bd1d
	ret			;bd1e
L_BD1F:
	ld a,(0e093h)		;bd1f
	push af			;bd22
	ld a,001h		;bd23
	ld (0e093h),a		;bd25
	call L_BD30		;bd28
	pop af			;bd2b
	ld (0e093h),a		;bd2c
	ret			;bd2f
L_BD30:
	ld a,h			;bd30
	sub 0c3h		;bd31
	ld h,a			;bd33
	ld (0e1a5h),hl		;bd34
	ld a,(de)			;bd37
	and 0f0h		;bd38
	ld (0e01fh),a		;bd3a   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	ld a,(de)			;bd3d
	inc de			;bd3e
	and 00fh		;bd3f
	and a			;bd41
	push af			;bd42
	call z,0485eh		;bd43
	pop af			;bd46
	call nz,0484eh		;bd47   ; orden_copia: prepara en 0xE0D0 la orden HMMM de copiar un dibujo de 8 x 8
	ld a,(de)			;bd4a
	inc de			;bd4b
	ld b,a			;bd4c
	ld a,(de)			;bd4d
	inc de			;bd4e
	ld (0e1a1h),a		;bd4f
L_BD52:
	ld hl,(0e1a5h)		;bd52
	ld (0e1b5h),hl		;bd55
	ld a,(0e1a1h)		;bd58
	ld c,a			;bd5b
L_BD5C:
	ld a,(de)			;bd5c
	and a			;bd5d
	call nz,0486eh		;bd5e   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	inc de			;bd61
	ld hl,(0e1b5h)		;bd62
	inc hl			;bd65
	ld (0e1b5h),hl		;bd66
	dec c			;bd69
	jr nz,L_BD5C		;bd6a
	push de			;bd6c
	ld hl,(0e1a5h)		;bd6d
	ld de,00020h		;bd70
	add hl,de			;bd73
	ld (0e1a5h),hl		;bd74
	pop de			;bd77
	djnz L_BD52		;bd78
	ret			;bd7a
L_BD7B:
	ld iy,0e500h		;bd7b
L_BD7F:
	ld a,(de)			;bd7f
	inc de			;bd80
	cp 0ffh		;bd81
	jp z,L_BDD6		;bd83
	call L_BD8B		;bd86
	jr L_BD7F		;bd89
L_BD8B:
	push af			;bd8b
	push de			;bd8c
	ld de,00010h		;bd8d
	ld b,010h		;bd90
L_BD92:
	ld a,(iy+004h)		;bd92
	and a			;bd95
	jr z,L_BD9F		;bd96
	add iy,de		;bd98
	djnz L_BD92		;bd9a
	pop de			;bd9c
	pop af			;bd9d
	ret			;bd9e
L_BD9F:
	pop de			;bd9f
	pop af			;bda0
	ld (iy+004h),a		;bda1
	ld a,(de)			;bda4
	inc de			;bda5
	ld (iy+003h),a		;bda6
	push de			;bda9
	ld a,(de)			;bdaa
	inc de			;bdab
	ld b,a			;bdac
	xor a			;bdad
L_BDAE:
	add a,008h		;bdae
	djnz L_BDAE		;bdb0
	ld (iy+000h),a		;bdb2
	ld a,(de)			;bdb5
	ld b,a			;bdb6
	inc b			;bdb7
	xor a			;bdb8
L_BDB9:
	add a,008h		;bdb9
	djnz L_BDB9		;bdbb
	ld (iy+001h),a		;bdbd
	pop de			;bdc0
	ld a,(de)			;bdc1
	inc de			;bdc2
	call L_BCE8		;bdc3
	ld (iy+006h),l		;bdc6
	ld (iy+007h),h		;bdc9
	ld hl,(0e1b7h)		;bdcc
	ld (iy+008h),l		;bdcf
	ld (iy+009h),h		;bdd2
	ret			;bdd5
L_BDD6:
	ld a,00ah		;bdd6
	ld (0e1afh),a		;bdd8
	ld iy,0e400h		;bddb
L_BDDF:
	cp 014h		;bddf
	jr nc,L_BE1E		;bde1
	ld a,(de)			;bde3
	cp 0ffh		;bde4
	jr z,L_BE1E		;bde6
	ld (iy+004h),a		;bde8
	inc de			;bdeb
	ld hl,0534ah		;bdec
	call 051b8h		;bdef   ; lee_tabla: HL = HL + A y A = (HL)
	ld (iy+003h),a		;bdf2
	inc de			;bdf5
	ld a,(de)			;bdf6
	cp 000h		;bdf7
	jr nz,L_BDFD		;bdf9
	ld a,0ech		;bdfb
L_BDFD:
	ld (iy+000h),a		;bdfd
	inc de			;be00
	ld a,(de)			;be01
	inc de			;be02
	ld (iy+001h),a		;be03
	ld a,(0e1afh)		;be06
	ld (iy+00fh),a		;be09
	ld b,(iy+003h)		;be0c
	add a,b			;be0f
	ld (0e1afh),a		;be10
L_BE13:
	push de			;be13
	ld de,00010h		;be14
	add iy,de		;be17
	pop de			;be19
	djnz L_BE13		;be1a
	jr L_BDDF		;be1c
L_BE1E:
	ld hl,0be83h		;be1e
	ld a,(0e020h)		;be21   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;be24
	jr z,L_BE4C		;be26
	ld hl,0be8bh		;be28
	cp 009h		;be2b
	jr z,L_BE4C		;be2d
	ld hl,0be93h		;be2f
	cp 00ah		;be32
	jr z,L_BE4C		;be34
	ld hl,0be9bh		;be36
	cp 010h		;be39
	jr z,L_BE4C		;be3b
	ld hl,0bea5h		;be3d
	cp 011h		;be40
	jr z,L_BE4C		;be42
	ld hl,0be6fh		;be44
	call 051b8h		;be47   ; lee_tabla: HL = HL + A y A = (HL)
	jr L_BE52		;be4a
L_BE4C:
	ld a,(0e022h)		;be4c   ; lee el tramo: la pantalla de la lista de la fase
	call 051b8h		;be4f   ; lee_tabla: HL = HL + A y A = (HL)
L_BE52:
	ld b,(hl)			;be52
	ld a,(0e097h)		;be53
	cp b			;be56
	jr z,L_BE60		;be57
	ld a,b			;be59
	ld (0e097h),a		;be5a
	call 049bfh		;be5d
L_BE60:
	ld (ix-001h),000h		;be60
	call 05df4h		;be64
	ld a,001h		;be67
	call 04f78h		;be69   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	jp 00044h		;be6c   ; BIOS ENASCR - Displays the screen

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbe6f..0xbeac  (61 bytes)
DATA_BE6F:
	defb 000h,001h,001h,000h,001h,001h,002h,007h,002h,003h,004h,001h,001h,007h,001h,001h	; be6f  ................
	defb 006h,005h,004h,003h,000h,002h,000h,002h,002h,002h,002h,002h,000h,000h,003h,003h	; be7f  ................
	defb 003h,003h,003h,003h,004h,005h,004h,005h,005h,005h,004h,004h,006h,006h,006h,004h	; be8f  ................
	defb 006h,006h,006h,005h,006h,004h,007h,007h,005h,007h,007h,005h,007h	; be9f  .............

; ======================================================================
; CODIGO 0xbeac..0xbfab  (255 bytes)
; ======================================================================


L_BEAC:
	ld a,(0e283h)		;beac
	cp 002h		;beaf
	jp z,L_BF92		;beb1
	ld a,(0e2c3h)		;beb4
	and a			;beb7
	jr nz,L_BEC9		;beb8
	ld (ix-001h),001h		;beba
	call 050e0h		;bebe
	ld a,021h		;bec1
	call 05052h		;bec3   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 04e35h		;bec6
L_BEC9:
	ld a,(0e180h)		;bec9   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	and a			;becc
	jp z,L_BF61		;becd
	cp 005h		;bed0
	jr z,L_BF1A		;bed2
	cp 001h		;bed4
	jp nz,L_BF61		;bed6
	ld a,(0e2c4h)		;bed9
	cp 042h		;bedc
	jp z,L_BF61		;bede
	ld b,020h		;bee1
	cp 0c2h		;bee3
	jr nz,L_BEF9		;bee5
	push af			;bee7
	ld b,080h		;bee8
	ld a,(0e020h)		;beea   ; lee la fase (0-19; la 8 se salta)
	and a			;beed
	jr z,L_BEF8		;beee
	ld b,060h		;bef0
	cp 004h		;bef2
	jr c,L_BEF8		;bef4
	ld b,020h		;bef6
L_BEF8:
	pop af			;bef8
L_BEF9:
	push hl			;bef9
	push af			;befa
	sub b			;befb
	ld (0e2c4h),a		;befc
	ld h,000h		;beff
	ld l,a			;bf01
	ld a,00bh		;bf02
	call 0486eh		;bf04   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	pop af			;bf07
	ld l,a			;bf08
	ld a,010h		;bf09
	call 0486eh		;bf0b   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	ld a,001h		;bf0e
	ld (0e2c6h),a		;bf10
	pop hl			;bf13
	call L_BFA1		;bf14
	jp L_BF61		;bf17
L_BF1A:
	ld a,(0e2c4h)		;bf1a
	cp 0c2h		;bf1d
	jr z,L_BF61		;bf1f
	ld b,020h		;bf21
	cp 042h		;bf23
	jr nz,L_BF34		;bf25
	push af			;bf27
	ld b,080h		;bf28
	ld a,(0e020h)		;bf2a   ; lee la fase (0-19; la 8 se salta)
	cp 003h		;bf2d
	jr c,L_BF33		;bf2f
	ld b,020h		;bf31
L_BF33:
	pop af			;bf33
L_BF34:
	cp 062h		;bf34
	jr nz,L_BF43		;bf36
	push af			;bf38
	ld a,(0e020h)		;bf39   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;bf3c
	jr nc,L_BF42		;bf3e
	ld b,060h		;bf40
L_BF42:
	pop af			;bf42
L_BF43:
	push hl			;bf43
	push af			;bf44
	add a,b			;bf45
	ld (0e2c4h),a		;bf46
	ld h,000h		;bf49
	ld l,a			;bf4b
	ld a,00bh		;bf4c
	call 0486eh		;bf4e   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	pop af			;bf51
	ld l,a			;bf52
	ld a,010h		;bf53
	call 0486eh		;bf55   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	ld a,001h		;bf58
	ld (0e2c6h),a		;bf5a
	pop hl			;bf5d
	call L_BFA1		;bf5e
L_BF61:
	ld a,(0e062h)		;bf61
	and a			;bf64
	jp z,04e35h		;bf65
	xor a			;bf68
	ld (0e062h),a		;bf69
	ld a,(0e2c4h)		;bf6c
	and 0e0h		;bf6f
	rlca			;bf71
	rlca			;bf72
	rlca			;bf73
	sub 002h		;bf74
	ld hl,0bfabh		;bf76
	call 051b8h		;bf79   ; lee_tabla: HL = HL + A y A = (HL)
	call L_BFB0		;bf7c
	jp c,04e35h		;bf7f
	ld (0e032h),a		;bf82
	ld a,002h		;bf85
	ld (0e283h),a		;bf87
	ld a,023h		;bf8a
	call 05052h		;bf8c   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 04e35h		;bf8f
L_BF92:
	di			;bf92
	call 0517ah		;bf93
	xor a			;bf96
	ld (0e283h),a		;bf97
	ld (ix-001h),a		;bf9a
	ei			;bf9d
	jp 04e35h		;bf9e
L_BFA1:
	push hl			;bfa1
	push af			;bfa2
	ld a,022h		;bfa3
	call 05052h		;bfa5   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	pop af			;bfa8
	pop hl			;bfa9
	ret			;bfaa

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbfab..0xbfb0  (5 bytes)
DATA_BFAB:
	defb 003h,005h,001h,002h,000h	; bfab

; ======================================================================
; CODIGO 0xbfb0..0xc000  (80 bytes)
; ======================================================================


L_BFB0:
	ld c,a			;bfb0
	and a			;bfb1
	jr z,L_BFCC		;bfb2
	cp 003h		;bfb4
	jr z,L_BFCC		;bfb6
	cp 005h		;bfb8
	jr z,L_BFC5		;bfba
	ld a,(0e020h)		;bfbc   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;bfbf
	jr nc,L_BFCC		;bfc1
	jr L_BFCF		;bfc3
L_BFC5:
	ld a,(0e020h)		;bfc5   ; lee la fase (0-19; la 8 se salta)
	cp 002h		;bfc8
	jr c,L_BFCF		;bfca
L_BFCC:
	xor a			;bfcc
	ld a,c			;bfcd
	ret			;bfce
L_BFCF:
	ld a,c			;bfcf
	scf			;bfd0
	ret			;bfd1
L_BFD2:
	ld a,0d8h		;bfd2
	ld (0e01fh),a		;bfd4   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	call 04867h		;bfd7
	ld hl,00000h		;bfda
	ld de,0001fh		;bfdd
	ld b,01ah		;bfe0
L_BFE2:
	ld a,010h		;bfe2
	call 0486eh		;bfe4   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	add hl,de			;bfe7
	ld a,010h		;bfe8
	call 0486eh		;bfea   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	inc hl			;bfed
	djnz L_BFE2		;bfee
	ret			;bff0
L_BFF1:
	ld bc,00040h		;bff1
	push bc			;bff4
	ld hl,0c980h		;bff5
	ld de,04b2ch		;bff8
	ld c,004h		;bffb
	jp 04987h		;bffd
