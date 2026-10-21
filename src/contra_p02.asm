; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x8006  (6 bytes)
; ======================================================================


L_8000:
	ld e,(iy+004h)		;8000
	call 0a041h		;8003

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8006..0x8062  (92 bytes)
DATA_8006:
	defb 062h,080h,0e3h,09ch,00eh,0a6h,0d2h,0a6h,04ah,0a7h,0a5h,0a5h,0a4h,0a5h,035h,0a5h	; 8006  b.......J.....5.
	defb 0aah,0a4h,04eh,0a3h,024h,0a4h,0e0h,0a3h,08bh,0a2h,007h,0a2h,09ch,0a1h,00ah,0a1h	; 8016  ..N.$...........
	defb 0d5h,0a0h,0d0h,0a0h,0bfh,09bh,011h,0a8h,0ach,09bh,078h,09ch,0d8h,09ah,0c5h,09ch	; 8026  ..........x.....
	defb 0d5h,09ah,031h,09ah,01dh,096h,099h,095h,01dh,096h,0d2h,09ah,083h,081h,086h,098h	; 8036  ..1.............
	defb 014h,0a4h,0cah,096h,064h,098h,087h,098h,0d2h,094h,0edh,097h,029h,099h,0a5h,097h	; 8046  ....d.......)...
	defb 062h,080h,08dh,097h,0f4h,093h,080h,081h,06bh,094h,062h,080h	; 8056  b.......k.b.

; ======================================================================
; CODIGO 0x8062..0x8069  (7 bytes)
; ======================================================================


L_8062:
	ret			;8062
L_8063:
	ld e,(iy+004h)		;8063
	call 0a041h		;8066

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8069..0x80b3  (74 bytes)
DATA_8069:
	defb 0e4h,082h,0e4h,082h,098h,084h,0deh,084h,00eh,085h,070h,085h,013h,086h,054h,087h	; 8069  ..........p...T.
	defb 0d1h,087h,0d2h,087h,0d3h,087h,0b7h,08fh,070h,088h,071h,088h,095h,08ah,080h,08bh	; 8079  ........p.q.....
	defb 08bh,08ch,03bh,08dh,0bbh,089h,0a2h,08dh,00bh,08eh,071h,097h,0b8h,08fh,073h,08fh	; 8089  ..........q...s.
	defb 0d0h,090h,03ah,091h,061h,091h,0b3h,080h,048h,092h,0d2h,092h,040h,081h,03eh,092h	; 8099  ..:.a...H...@.>.
	defb 002h,089h,07fh,081h,076h,081h,0b3h,080h,0c2h,081h	; 80a9  ....v.....

; ======================================================================
; CODIGO 0x80b3..0x8186  (211 bytes)
; ======================================================================


L_80B3:
	ld a,(iy+005h)		;80b3
	cp 003h		;80b6
	jr z,L_80FA		;80b8
	cp 002h		;80ba
	jr z,L_80F0		;80bc
	ld (iy+015h),002h		;80be
	ld (iy+025h),002h		;80c2
	ld (iy+035h),002h		;80c6
	ld (iy+00fh),000h		;80ca
	ld (iy+01fh),010h		;80ce
	ld (iy+02fh),020h		;80d2
	ld (iy+03fh),030h		;80d6
	push iy		;80da
	ld de,00010h		;80dc
	ld a,r		;80df
	and 003h		;80e1
	jr z,L_80EA		;80e3
	ld b,a			;80e5
L_80E6:
	add iy,de		;80e6
	djnz L_80E6		;80e8
L_80EA:
	ld (iy+004h),01bh		;80ea
	pop iy		;80ee
L_80F0:
	ld (iy+005h),003h		;80f0
	ld de,0aa58h		;80f4
	jp L_8400		;80f7
L_80FA:
	ld hl,0aa49h		;80fa
	ld de,0aa58h		;80fd
	ld a,040h		;8100
	call L_83E9		;8102
	bit 0,(iy+00ah)		;8105
	ret nz			;8109
	ld a,(iy+004h)		;810a
	ld (iy+00eh),a		;810d
	cp 01bh		;8110
	jr z,L_8122		;8112
	ld de,0ad61h		;8114
	ld hl,0856ch		;8117
	call 05af8h		;811a
	ld a,(0e18bh)		;811d
	and a			;8120
	ret z			;8121
L_8122:
	ld hl,0856ch		;8122
	ld de,0ad61h		;8125
	ld a,010h		;8128
	call L_90B1		;812a
	ret nc			;812d
	call L_813B		;812e
	ld (iy+003h),001h		;8131
	ld (iy+002h),001h		;8135
	jr L_817C		;8139
L_813B:
	ld a,050h		;813b
	jp 05f33h		;813d
L_8140:
	bit 0,(iy+005h)		;8140
	jr nz,L_8163		;8144
	ld (iy+005h),001h		;8146
	ld a,000h		;814a
	ld (iy+003h),000h		;814c
	ld (0e5c3h),a		;8150
	ld (iy+001h),018h		;8153
	ld (iy+000h),040h		;8157
	ld (iy+008h),001h		;815b
	ld (iy+00ah),001h		;815f
L_8163:
	call L_8E10		;8163
	ld a,(0e5c3h)		;8166
	cp 010h		;8169
	ret c			;816b
	ld a,(0e5c2h)		;816c
	and a			;816f
	ret nz			;8170
	call 05f1dh		;8171
	jr L_817C		;8174
L_8176:
	ld a,(0e18ah)		;8176
	cp 003h		;8179
	ret c			;817b
L_817C:
	jp L_88FD		;817c
L_817F:
	ret			;817f
L_8180:
	jp 0a8bdh		;8180
L_8183:
	call 0a03eh		;8183

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8186..0x818a  (4 bytes)
DATA_8186:
	defb 08ah,081h,097h,081h	; 8186

; ======================================================================
; CODIGO 0x818a..0x81af  (37 bytes)
; ======================================================================


L_818A:
	ld (iy+002h),0f0h		;818a
	inc (iy+005h)		;818e
	ld bc,081b3h		;8191
	call 05e45h		;8194
L_8197:
	ld a,004h		;8197
	call L_81B4		;8199
	cp 058h		;819c
	jr c,L_81A9		;819e
	ld (iy+004h),020h		;81a0
	ld (iy+005h),000h		;81a4
L_81A8:
	ret			;81a8
L_81A9:
	ld hl,081afh		;81a9
	jp 05a68h		;81ac

; ----------------------------------------------------------------------
; DATOS sin identificar  0x81af..0x81b4  (5 bytes)
DATA_81AF:
	defb 00ch,008h,004h,008h,008h	; 81af

; ======================================================================
; CODIGO 0x81b4..0x81c5  (17 bytes)
; ======================================================================


L_81B4:
	add a,(iy+000h)		;81b4
	ld (iy+000h),a		;81b7
	ret			;81ba
L_81BB:
	add a,(iy+001h)		;81bb
	ld (iy+001h),a		;81be
	ret			;81c1
L_81C2:
	call 0a03eh		;81c2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x81c5..0x81cd  (8 bytes)
DATA_81C5:
	defb 0cdh,081h,0fch,081h,00bh,082h,03eh,082h	; 81c5  ......>.

; ======================================================================
; CODIGO 0x81cd..0x8266  (153 bytes)
; ======================================================================


L_81CD:
	ld a,02ch		;81cd
	call 05052h		;81cf
	ld a,001h		;81d2
	ld (0e045h),a		;81d4
	ld (iy+006h),0d8h		;81d7
	ld (iy+007h),0c3h		;81db
	ld (iy+001h),0c0h		;81df
	ld (iy+000h),030h		;81e3
	ld (iy+00eh),055h		;81e7
	ld (iy+010h),001h		;81eb
	ld (iy+011h),020h		;81ef
	ld de,0ad9ah		;81f3
L_81F6:
	inc (iy+005h)		;81f6
	jp L_8400		;81f9
L_81FC:
	ld a,020h		;81fc
	call L_9921		;81fe
	jr nc,L_820B		;8201
	call L_82A4		;8203
	ld a,00ah		;8206
	jp 0a879h		;8208
L_820B:
	ld a,010h		;820b
	call L_9915		;820d
	jr nc,$+100		;8210
	ld hl,0fa01h		;8212
	ld bc,0f40ch		;8215
	call L_8383		;8218
	jr nc,L_8239		;821b
	ld de,0000eh		;821d
	add hl,de			;8220
	ld (hl),0fdh		;8221
	ld de,0ae21h		;8223
	inc (iy+003h)		;8226
	ld a,(iy+003h)		;8229
	and 003h		;822c
	jp nz,L_8234		;822e
	inc (iy+005h)		;8231
L_8234:
	call L_8400		;8234
	jr $+61		;8237
L_8239:
	ld de,0ae28h		;8239
	jr L_8234		;823c
L_823E:
	ld a,030h		;823e
	call L_9915		;8240
	jr nc,$+49		;8243
	ld (iy+005h),001h		;8245
	ld de,0ae28h		;8249
	ld a,(ix+001h)		;824c
	add a,030h		;824f
	cp (iy+001h)		;8251
	jr nc,L_825C		;8254
	ld (iy+010h),0ffh		;8256
	jr L_8260		;825a
L_825C:
	ld (iy+010h),001h		;825c
L_8260:
	ld (iy+005h),001h		;8260
	jr L_8234		;8264

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8266..0x8274  (14 bytes)
DATA_8266:
	defb 0fdh,036h,005h,001h,018h,008h,0cdh,000h,084h,0cdh,0bdh,0a8h,018h,01eh	; 8266  .6............

; ======================================================================
; CODIGO 0x8274..0x82a0  (44 bytes)
; ======================================================================


L_8274:
	ld hl,08c87h		;8274
	call 05a61h		;8277
	ld hl,082e0h		;827a
	ld a,01bh		;827d
	ld de,0aa2dh		;827f
	call L_90AD		;8282
	ret nc			;8285
	ld (iy+009h),006h		;8286
	ld (iy+008h),006h		;828a
	ld (iy+005h),000h		;828e
L_8292:
	call 05f19h		;8292
	ld a,037h		;8295
	call 05052h		;8297
	ld a,000h		;829a
	ld (0e045h),a		;829c
	ret			;829f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x82a0..0x82a4  (4 bytes)
DATA_82A0:
	defb 0afh,0c3h,019h,05fh	; 82a0

; ======================================================================
; CODIGO 0x82a4..0x82e0  (60 bytes)
; ======================================================================


L_82A4:
	ld a,(iy+011h)		;82a4
	add a,(iy+010h)		;82a7
	cp 009h		;82aa
	ret z			;82ac
	cp 020h		;82ad
	ret nc			;82af
	ld (iy+011h),a		;82b0
	ld a,(iy+010h)		;82b3
	sla a		;82b6
	sla a		;82b8
	sla a		;82ba
	add a,(iy+001h)		;82bc
	ld (iy+001h),a		;82bf
	ld de,0adf4h		;82c2
	call L_8400		;82c5
	ld a,(iy+010h)		;82c8
	add a,(iy+006h)		;82cb
	ld (iy+006h),a		;82ce
	ld de,0ad9ah		;82d1
	rlc (iy+00eh)		;82d4
	jr c,L_82DD		;82d8
	ld de,0adc7h		;82da
L_82DD:
	jp L_8400		;82dd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x82e0..0x82e4  (4 bytes)
DATA_82E0:
	defb 018h,010h,010h,006h	; 82e0

; ======================================================================
; CODIGO 0x82e4..0x82e7  (3 bytes)
; ======================================================================


L_82E4:
	call 0a03eh		;82e4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x82e7..0x82ed  (6 bytes)
DATA_82E7:
	defb 0edh,082h,000h,083h,042h,083h	; 82e7

; ======================================================================
; CODIGO 0x82ed..0x83e5  (248 bytes)
; ======================================================================


L_82ED:
	ld a,r		;82ed
	and 01fh		;82ef
	add a,030h		;82f1
	ld (iy+00ch),a		;82f3
	ld (iy+005h),001h		;82f6
	ld de,0aa0bh		;82fa
	jp L_8400		;82fd
L_8300:
	dec (iy+00ch)		;8300
	jp nz,L_8355		;8303
	ld de,0aa14h		;8306
	call L_8400		;8309
	push ix		;830c
	call L_843F		;830e
	jr c,L_833E		;8311
	ld a,(iy+000h)		;8313
	add a,00ch		;8316
	ld (ix+000h),a		;8318
	ld a,(iy+001h)		;831b
	sub 012h		;831e
	ld (ix+001h),a		;8320
	ld (ix+004h),00ch		;8323
	ld (ix+005h),000h		;8327
	push iy		;832b
	push ix		;832d
	pop iy		;832f
	call 0a28bh		;8331
	pop iy		;8334
	ld (iy+00ch),030h		;8336
	ld (iy+005h),002h		;833a
L_833E:
	pop ix		;833e
	jr L_8355		;8340
L_8342:
	dec (iy+00ch)		;8342
	jr nz,L_8355		;8345
	ld de,0aa0bh		;8347
	call L_8400		;834a
	ld (iy+00ch),030h		;834d
	ld (iy+005h),000h		;8351
L_8355:
	ld hl,083e5h		;8355
	ld de,0aa1dh		;8358
	ld a,007h		;835b
	ld b,002h		;835d
	call L_9085		;835f
	ret nc			;8362
	ld (iy+003h),000h		;8363
	ld (iy+002h),001h		;8367
	call L_8372		;836b
	call L_8564		;836e
	ret			;8371
L_8372:
	ld a,030h		;8372
	jp 05f33h		;8374
L_8377:
	push bc			;8377
	call L_8419		;8378
	jr L_8399		;837b
L_837D:
	push bc			;837d
	call L_843F		;837e
	jr L_8399		;8381
L_8383:
	push ix		;8383
	call L_8392		;8385
	pop ix		;8388
	ret			;838a
L_838B:
	push bc			;838b
	call L_8479		;838c
	pop bc			;838f
	jr L_83C7		;8390
L_8392:
	push bc			;8392
	call L_847E		;8393
	pop bc			;8396
	jr L_83C7		;8397
L_8399:
	pop bc			;8399
	call L_83C7		;839a
	jr nc,L_83B7		;839d
	push ix		;839f
	push iy		;83a1
	push ix		;83a3
	pop iy		;83a5
	ld ix,0e320h		;83a7
	call L_8000		;83ab
	pop iy		;83ae
	pop ix		;83b0
L_83B2:
	push ix		;83b2
	pop hl			;83b4
	scf			;83b5
	ret			;83b6
L_83B7:
	push ix		;83b7
	pop hl			;83b9
	xor a			;83ba
	ret			;83bb
L_83BC:
	push bc			;83bc
	call L_8479		;83bd
	pop bc			;83c0
	jr c,L_83E3		;83c1
	ld (ix+002h),01ch		;83c3
L_83C7:
	jr c,L_83E3		;83c7
	ld (ix+002h),b		;83c9
	ld a,(iy+001h)		;83cc
	add a,h			;83cf
	ld (ix+001h),a		;83d0
	ld a,(iy+000h)		;83d3
	add a,l			;83d6
	ld (ix+000h),a		;83d7
	ld (ix+004h),c		;83da
	ld (ix+005h),000h		;83dd
	jr L_83B2		;83e1
L_83E3:
	xor a			;83e3
	ret			;83e4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x83e5..0x83e9  (4 bytes)
DATA_83E5:
	defb 00ah,010h,000h,010h	; 83e5

; ======================================================================
; CODIGO 0x83e9..0x850a  (289 bytes)
; ======================================================================


L_83E9:
	inc (iy+00fh)		;83e9
	cp (iy+00fh)		;83ec
	ret nc			;83ef
	ld (iy+00fh),000h		;83f0
	inc (iy+00ah)		;83f4
	bit 0,(iy+00ah)		;83f7
	jr z,L_83FF		;83fb
	jr L_8400		;83fd
L_83FF:
	ex de,hl			;83ff
L_8400:
	di			;8400
	ld a,(0e093h)		;8401
	push af			;8404
	ld a,001h		;8405
	ld (0e093h),a		;8407
	ld l,(iy+006h)		;840a
	ld h,(iy+007h)		;840d
	call 0bd1fh		;8410
	pop af			;8413
	ld (0e093h),a		;8414
	ei			;8417
	ret			;8418
L_8419:
	push hl			;8419
	ld b,004h		;841a
	ld c,002h		;841c
	ld l,00dh		;841e
	ld ix,0e400h		;8420
	ld de,00020h		;8424
L_8427:
	ld a,(ix+004h)		;8427
	or (ix+014h)		;842a
	or (ix+024h)		;842d
	or (ix+034h)		;8430
	jr z,L_8468		;8433
	ld a,l			;8435
	add a,c			;8436
	ld l,a			;8437
	add ix,de		;8438
	djnz L_8427		;843a
	scf			;843c
	pop hl			;843d
	ret			;843e
L_843F:
	push hl			;843f
	ld b,005h		;8440
	ld ix,0e400h		;8442
	jr L_844F		;8446
L_8448:
	push hl			;8448
	ld b,00ah		;8449
	ld ix,0e380h		;844b
L_844F:
	ld c,002h		;844f
	ld l,00bh		;8451
	ld de,00020h		;8453
L_8456:
	ld a,(ix+004h)		;8456
	or (ix+014h)		;8459
	jr z,L_8470		;845c
	ld a,l			;845e
	add a,c			;845f
	ld l,a			;8460
	add ix,de		;8461
	djnz L_8456		;8463
	scf			;8465
	pop hl			;8466
	ret			;8467
L_8468:
	ld (ix+03fh),l		;8468
	dec l			;846b
	ld (ix+02fh),l		;846c
	dec l			;846f
L_8470:
	ld (ix+01fh),l		;8470
	dec l			;8473
L_8474:
	ld (ix+00fh),l		;8474
	pop hl			;8477
	ret			;8478
L_8479:
	push hl			;8479
	ld b,013h		;847a
	jr L_8481		;847c
L_847E:
	push hl			;847e
	ld b,008h		;847f
L_8481:
	ld ix,0e380h		;8481
	ld l,000h		;8485
	ld de,00010h		;8487
L_848A:
	ld a,(ix+004h)		;848a
	and a			;848d
	jr z,L_8474		;848e
	add ix,de		;8490
	inc l			;8492
	djnz L_848A		;8493
	scf			;8495
	pop hl			;8496
	ret			;8497
L_8498:
	ld a,(iy+005h)		;8498
	and a			;849b
	jr nz,L_84A4		;849c
	ld de,0aa26h		;849e
	call L_81F6		;84a1
L_84A4:
	ld a,040h		;84a4
	call L_9915		;84a6
	jr nc,L_84C9		;84a9
	call 05d1dh		;84ab
	ld (iy+00eh),a		;84ae
	ld hl,0f800h		;84b1
	ld c,025h		;84b4
	ld b,0f4h		;84b6
	call L_8383		;84b8
	ret nc			;84bb
	ld a,(iy+00eh)		;84bc
	push ix		;84bf
	push hl			;84c1
	pop ix		;84c2
	ld (ix+008h),a		;84c4
	pop ix		;84c7
L_84C9:
	ld hl,0850ah		;84c9
	ld a,008h		;84cc
	ld de,0aa2dh		;84ce
	call L_9085		;84d1
	ret nc			;84d4
	call L_8372		;84d5
	ld hl,0f503h		;84d8
	jp L_8B7A		;84db
L_84DE:
	ld a,008h		;84de
	call L_9915		;84e0
	jr nc,L_84E5		;84e3
L_84E5:
	ld hl,0aa34h		;84e5
	ld de,0aa3bh		;84e8
	ld a,008h		;84eb
	call L_83E9		;84ed
	ld hl,0850ah		;84f0
	ld a,008h		;84f3
	ld de,0aa42h		;84f5
	call L_9085		;84f8
	ret nc			;84fb
	ld a,0ffh		;84fc
	ld (0e18bh),a		;84fe
	call 054dah		;8501
	ld hl,0f503h		;8504
	jp L_8B7A		;8507

; ----------------------------------------------------------------------
; DATOS sin identificar  0x850a..0x850e  (4 bytes)
DATA_850A:
	defb 00ch,00ch,0fch,008h	; 850a

; ======================================================================
; CODIGO 0x850e..0x8511  (3 bytes)
; ======================================================================


L_850E:
	call 0a03eh		;850e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8511..0x8517  (6 bytes)
DATA_8511:
	defb 017h,085h,026h,085h,033h,085h	; 8511

; ======================================================================
; CODIGO 0x8517..0x856c  (85 bytes)
; ======================================================================


L_8517:
	ld a,r		;8517
	and 03fh		;8519
	add a,070h		;851b
	ld (iy+00ch),a		;851d
	ld de,0aa58h		;8520
	jp L_81F6		;8523
L_8526:
	ld a,(iy+00ch)		;8526
	call 0a879h		;8529
	ret nc			;852c
	ld de,0aa49h		;852d
	jp L_8400		;8530
L_8533:
	ld a,038h		;8533
	ld b,000h		;8535
	call 0a881h		;8537
	jr nc,L_8543		;853a
	ld de,0aa58h		;853c
	call L_8400		;853f
	ret			;8542
L_8543:
	ld hl,0856ch		;8543
	ld de,0ad61h		;8546
	ld a,003h		;8549
	call L_90B1		;854b
	ret nc			;854e
	ld (iy+003h),001h		;854f
	ld (iy+002h),001h		;8553
	ld a,(0e5c7h)		;8557
	inc a			;855a
	ld (0e5c7h),a		;855b
	call L_8564		;855e
	jp L_813B		;8561
L_8564:
	ld a,(0e18ah)		;8564
	inc a			;8567
	ld (0e18ah),a		;8568
	ret			;856b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x856c..0x8570  (4 bytes)
DATA_856C:
	defb 002h,008h,000h,008h	; 856c

; ======================================================================
; CODIGO 0x8570..0x8579  (9 bytes)
; ======================================================================


L_8570:
	ld a,(0e18bh)		;8570
	and a			;8573
	jr nz,$+99		;8574
	call 0a03eh		;8576

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8579..0x8581  (8 bytes)
DATA_8579:
	defb 081h,085h,095h,085h,0a2h,085h,0f1h,085h	; 8579  ........

; ======================================================================
; CODIGO 0x8581..0x860f  (142 bytes)
; ======================================================================


L_8581:
	ld a,r		;8581
	and 03fh		;8583
	add a,0b0h		;8585
	ld (iy+00dh),a		;8587
	and 03fh		;858a
	ld (iy+00ch),a		;858c
	ld de,0aa76h		;858f
	jp L_81F6		;8592
L_8595:
	ld a,(iy+00dh)		;8595
	call L_9915		;8598
	ret nc			;859b
	ld de,0aa67h		;859c
	jp L_81F6		;859f
L_85A2:
	ld a,030h		;85a2
	call L_9915		;85a4
	jr nc,L_85D7		;85a7
	ld hl,0fc09h		;85a9
	ld bc,0f41fh		;85ac
	ld (iy+008h),010h		;85af
	call L_8601		;85b3
	jr nc,L_85D4		;85b6
	ld hl,0f409h		;85b8
	ld bc,0f41fh		;85bb
	ld (iy+008h),013h		;85be
	call L_8601		;85c2
	jr nc,L_85D4		;85c5
	ld hl,00409h		;85c7
	ld bc,0f41fh		;85ca
	ld (iy+008h),00dh		;85cd
	call L_8601		;85d1
L_85D4:
	inc (iy+005h)		;85d4
L_85D7:
	ld hl,0860fh		;85d7
	ld a,008h		;85da
	ld de,0ad2ch		;85dc
	call L_90B1		;85df
	ret nc			;85e2
	ld (iy+003h),001h		;85e3
	ld (iy+002h),001h		;85e7
	call L_813B		;85eb
	jp L_8564		;85ee
L_85F1:
	ld a,020h		;85f1
	ld b,001h		;85f3
	call 0a871h		;85f5
	jr nc,L_85D7		;85f8
	ld de,0aa76h		;85fa
	call L_8400		;85fd
	ret			;8600
L_8601:
	call L_8383		;8601
	ret nc			;8604
	ld a,(iy+008h)		;8605
	ld de,00008h		;8608
	add hl,de			;860b
	ld (hl),a			;860c
	scf			;860d
	ret			;860e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x860f..0x8613  (4 bytes)
DATA_860F:
	defb 002h,008h,000h,008h	; 860f

; ======================================================================
; CODIGO 0x8613..0x8616  (3 bytes)
; ======================================================================


L_8613:
	call 0a03eh		;8613

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8616..0x8620  (10 bytes)
DATA_8616:
	defb 020h,086h,03fh,086h,079h,086h,0c3h,086h,0c7h,086h	; 8616   .?.y.....

; ======================================================================
; CODIGO 0x8620..0x8728  (264 bytes)
; ======================================================================


L_8620:
	ld a,r		;8620
	set 3,a		;8622
	and 038h		;8624
	ld (iy+00ch),a		;8626
	ld a,r		;8629
	and 007h		;862b
	ld (iy+00ah),a		;862d
	ld (iy+005h),001h		;8630
	ld (iy+00eh),000h		;8634
	ld (iy+00bh),000h		;8638
	jp L_86D0		;863c
L_863F:
	ld a,008h		;863f
	call L_9915		;8641
	jp nc,L_86E3		;8644
	call 05c1ah		;8647
	cp (iy+00ah)		;864a
	jr nz,L_8662		;864d
	call 05c48h		;864f
	ld a,b			;8652
	and a			;8653
	jp z,L_86E3		;8654
	ld (iy+005h),002h		;8657
	ld (iy+00ch),000h		;865b
	jp L_86E3		;865f
L_8662:
	sub (iy+00ah)		;8662
	and 007h		;8665
	ld e,a			;8667
	ld d,000h		;8668
	ld hl,08738h		;866a
	add hl,de			;866d
	ld a,(iy+00ah)		;866e
	add a,(hl)			;8671
	and 007h		;8672
	ld (iy+00ah),a		;8674
	jr L_86D0		;8677
L_8679:
	push ix		;8679
	call L_847E		;867b
	jr c,L_86BF		;867e
	ld (ix+004h),023h		;8680
	ld (ix+005h),000h		;8684
	ld (ix+002h),0f4h		;8688
	ld a,(iy+00ah)		;868c
	sla a		;868f
	sla a		;8691
	ld (ix+008h),a		;8693
	srl a		;8696
	srl a		;8698
	ld e,a			;869a
	ld hl,08728h		;869b
	call L_8713		;869e
	ld (iy+00ch),000h		;86a1
	ld (iy+00dh),000h		;86a5
	ld (iy+005h),003h		;86a9
	inc (iy+00eh)		;86ad
	ld a,(iy+00eh)		;86b0
	cp 003h		;86b3
	jr c,L_86BF		;86b5
	ld (iy+00eh),000h		;86b7
	ld (iy+005h),004h		;86bb
L_86BF:
	pop ix		;86bf
	jr L_86E3		;86c1
L_86C3:
	ld a,00ch		;86c3
	jr L_86C9		;86c5
L_86C7:
	ld a,040h		;86c7
L_86C9:
	ld b,001h		;86c9
	call 0a871h		;86cb
	jr L_86E3		;86ce
L_86D0:
	ld a,(iy+00ah)		;86d0
	and 007h		;86d3
	rlca			;86d5
	ld e,a			;86d6
	ld d,000h		;86d7
	ld hl,08740h		;86d9
	add hl,de			;86dc
	ld e,(hl)			;86dd
	inc hl			;86de
	ld d,(hl)			;86df
	call L_8400		;86e0
L_86E3:
	ld hl,08750h		;86e3
	call 05af8h		;86e6
	ret nc			;86e9
	inc (iy+00bh)		;86ea
	ld a,(iy+00bh)		;86ed
	cp 006h		;86f0
	ret c			;86f2
	ld a,028h		;86f3
	call 05052h		;86f5
	ld (iy+004h),000h		;86f8
	ld hl,0f800h		;86fc
	ld c,00bh		;86ff
	ld b,01ch		;8701
	push ix		;8703
	call L_838B		;8705
	pop ix		;8708
	call 054dah		;870a
	ld de,0aabdh		;870d
	jp L_8400		;8710
L_8713:
	rlc e		;8713
	ld d,000h		;8715
	add hl,de			;8717
	ld a,(iy+000h)		;8718
	add a,(hl)			;871b
	ld (ix+000h),a		;871c
	inc hl			;871f
	ld a,(iy+001h)		;8720
	add a,(hl)			;8723
	ld (ix+001h),a		;8724
	ret			;8727

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8728..0x8754  (44 bytes)
DATA_8728:
	defb 0f8h,0f8h,0f8h,000h,000h,000h,008h,000h,008h,0f8h,008h,0f0h,000h,0f0h,0f8h,0f0h	; 8728  ................
	defb 000h,001h,001h,001h,000h,0ffh,0ffh,0ffh,085h,0aah,08ch,0aah,093h,0aah,09ah,0aah	; 8738  ................
	defb 0a1h,0aah,0a8h,0aah,0afh,0aah,0b6h,0aah,008h,00ch,0fah,00ch	; 8748  ............

; ======================================================================
; CODIGO 0x8754..0x87cd  (121 bytes)
; ======================================================================


L_8754:
	ld a,(iy+005h)		;8754
	and a			;8757
	jr nz,L_8772		;8758
	ld a,r		;875a
	and 03fh		;875c
	add a,030h		;875e
	ld (iy+00ch),a		;8760
	ld de,0aac4h		;8763
	bit 0,(iy+003h)		;8766
	jr z,L_876F		;876a
	ld de,0aad3h		;876c
L_876F:
	jp L_81F6		;876f
L_8772:
	dec (iy+00ch)		;8772
	jr nz,L_87AF		;8775
	ld a,r		;8777
	and 03fh		;8779
	add a,040h		;877b
	ld (iy+00ch),a		;877d
	push ix		;8780
	ld hl,0fc04h		;8782
	ld bc,0fc22h		;8785
	call L_8383		;8788
	jr nc,L_87AD		;878b
	push hl			;878d
	pop ix		;878e
	ld a,(iy+001h)		;8790
	bit 0,(iy+003h)		;8793
	jr z,L_87A4		;8797
	add a,00ah		;8799
	ld (ix+001h),a		;879b
	ld (ix+00eh),003h		;879e
	jr L_87AD		;87a2
L_87A4:
	sub 010h		;87a4
	ld (ix+001h),a		;87a6
	ld (ix+00eh),0fdh		;87a9
L_87AD:
	pop ix		;87ad
L_87AF:
	ld hl,087cdh		;87af
	ld de,0aae2h		;87b2
	ld a,006h		;87b5
	call L_9085		;87b7
	ret nc			;87ba
	ld (iy+002h),001h		;87bb
	ld (iy+003h),000h		;87bf
	ld a,040h		;87c3
	call 05f33h		;87c5
	ld a,030h		;87c8
	jp 05052h		;87ca

; ----------------------------------------------------------------------
; DATOS sin identificar  0x87cd..0x87d1  (4 bytes)
DATA_87CD:
	defb 008h,008h,000h,006h	; 87cd

; ======================================================================
; CODIGO 0x87d1..0x87d6  (5 bytes)
; ======================================================================


L_87D1:
	ret			;87d1
L_87D2:
	ret			;87d2
L_87D3:
	call 0a03eh		;87d3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x87d6..0x87dc  (6 bytes)
DATA_87D6:
	defb 0dch,087h,0e3h,087h,01eh,088h	; 87d6

; ======================================================================
; CODIGO 0x87dc..0x886c  (144 bytes)
; ======================================================================


L_87DC:
	inc (iy+005h)		;87dc
	ld (iy+00fh),080h		;87df
L_87E3:
	ld a,(0e020h)		;87e3
	and a			;87e6
	jr z,L_8801		;87e7
	cp 003h		;87e9
	jr z,L_8801		;87eb
	cp 00ah		;87ed
	jr z,L_8809		;87ef
	cp 00dh		;87f1
	jr z,L_8809		;87f3
	cp 010h		;87f5
	jr nc,L_8809		;87f7
	ld hl,0aaf1h		;87f9
	ld de,0ab00h		;87fc
	jr L_880F		;87ff
L_8801:
	ld hl,0ab1eh		;8801
	ld de,0ab2dh		;8804
	jr L_880F		;8807
L_8809:
	ld hl,0ab4bh		;8809
	ld de,0ab5ah		;880c
L_880F:
	ld a,008h		;880f
	call L_83E9		;8811
	ld hl,0886ch		;8814
	call 05af8h		;8817
	ret nc			;881a
	inc (iy+005h)		;881b
L_881E:
	ld hl,0fc08h		;881e
	ld bc,02c24h		;8821
	push ix		;8824
	call L_838B		;8826
	pop ix		;8829
	ret nc			;882b
	ld (iy+004h),01dh		;882c
	ld (iy+005h),000h		;8830
	ld (iy+003h),000h		;8834
	ld (iy+002h),000h		;8838
	ld a,(iy+000h)		;883c
	add a,004h		;883f
	ld (iy+000h),a		;8841
	ld a,(0e020h)		;8844
	and a			;8847
	jr z,L_8860		;8848
	cp 003h		;884a
	jr z,L_8860		;884c
	cp 00ah		;884e
	jr z,L_8866		;8850
	cp 00dh		;8852
	jr z,L_8866		;8854
	cp 010h		;8856
	jr nc,L_8866		;8858
	ld de,0ab0fh		;885a
	jp L_8400		;885d
L_8860:
	ld de,0ab3ch		;8860
	jp L_8400		;8863
L_8866:
	ld de,0ab69h		;8866
	jp L_8400		;8869

; ----------------------------------------------------------------------
; DATOS sin identificar  0x886c..0x8870  (4 bytes)
DATA_886C:
	defb 01ch,018h,0f4h,018h	; 886c

; ======================================================================
; CODIGO 0x8870..0x8874  (4 bytes)
; ======================================================================


L_8870:
	ret			;8870
L_8871:
	call 0a03eh		;8871

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8874..0x8878  (4 bytes)
DATA_8874:
	defb 078h,088h,093h,088h	; 8874

; ======================================================================
; CODIGO 0x8878..0x8977  (255 bytes)
; ======================================================================


L_8878:
	ld a,(0e5c7h)		;8878
	cp 004h		;887b
	ret c			;887d
	inc (iy+005h)		;887e
	ld a,(iy+006h)		;8881
	ld (iy+002h),a		;8884
	ld a,(iy+007h)		;8887
	ld (iy+003h),a		;888a
	ld (iy+00eh),000h		;888d
	jr L_88A9		;8891
L_8893:
	ld a,038h		;8893
	call L_9921		;8895
	jr c,L_88A9		;8898
	ld a,(iy+00eh)		;889a
	and 01fh		;889d
	jp z,L_8936		;889f
	cp 004h		;88a2
	jr c,L_88CC		;88a4
	jp L_8936		;88a6
L_88A9:
	dec (iy+00eh)		;88a9
	call L_8961		;88ac
	inc (iy+00eh)		;88af
	call L_8951		;88b2
	inc (iy+00eh)		;88b5
	call L_8951		;88b8
	ld a,(iy+00eh)		;88bb
	and 01fh		;88be
	ld e,a			;88c0
	ld d,000h		;88c1
	ld hl,08997h		;88c3
	add hl,de			;88c6
	ld a,(hl)			;88c7
	ld (iy+001h),a		;88c8
	ret			;88cb
L_88CC:
	ld a,020h		;88cc
	ld hl,089b7h		;88ce
	ld de,0ab93h		;88d1
	ld a,(iy+00eh)		;88d4
	push af			;88d7
	ld a,010h		;88d8
	call L_90B1		;88da
	jr c,L_88E5		;88dd
	pop af			;88df
	ld (iy+00eh),a		;88e0
	jr L_8936		;88e3
L_88E5:
	pop af			;88e5
	dec (iy+006h)		;88e6
	xor a			;88e9
	call 05f21h		;88ea
	ld (iy+004h),01dh		;88ed
	ld (iy+003h),004h		;88f1
	ld (iy+002h),001h		;88f5
	ld (iy+001h),080h		;88f9
L_88FD:
	ld e,007h		;88fd
	jp 0a0e4h		;88ff
L_8902:
	ld a,(0e020h)		;8902
	cp 00ch		;8905
	jr nz,L_890E		;8907
	ld a,(0e2d4h)		;8909
	and a			;890c
	ret nz			;890d
L_890E:
	ld a,(iy+00ch)		;890e
	call L_9921		;8911
	ret nc			;8914
	xor a			;8915
	ld (0e094h),a		;8916
	ld (0e5c7h),a		;8919
	inc a			;891c
	ld (0e184h),a		;891d
	ld a,(0e020h)		;8920
	cp 013h		;8923
	jr z,L_8931		;8925
	cp 013h		;8927
	jr z,L_8931		;8929
	ld a,00eh		;892b
	call 05052h		;892d
	ret			;8930
L_8931:
	ld a,00fh		;8931
	jp 05052h		;8933
L_8936:
	ld a,(0e18ah)		;8936
	cp 006h		;8939
	ret c			;893b
	ld a,028h		;893c
	call L_9915		;893e
	ret nc			;8941
	ld a,r		;8942
	and 003h		;8944
	ret nz			;8946
	ld hl,00010h		;8947
	ld c,007h		;894a
	ld b,0e8h		;894c
	jp L_8383		;894e
L_8951:
	bit 0,(iy+00eh)		;8951
	jr z,L_895C		;8955
	ld de,0ab93h		;8957
	jr L_8964		;895a
L_895C:
	ld de,0aba2h		;895c
	jr L_8964		;895f
L_8961:
	ld de,0abb1h		;8961
L_8964:
	ld a,(iy+00eh)		;8964
	and 01fh		;8967
	ld c,a			;8969
	ld b,000h		;896a
	ld hl,08977h		;896c
	add hl,bc			;896f
	ld a,(hl)			;8970
	ld (iy+006h),a		;8971
	jp L_8400		;8974

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8977..0x89bb  (68 bytes)
DATA_8977:
	defb 02fh,02fh,02fh,02fh,030h,02eh,031h,02dh,032h,02ch,033h,02bh,034h,02ah,035h,029h	; 8977  ////0.1-2,3+4*5)
	defb 036h,028h,036h,028h,035h,029h,034h,02ah,033h,02bh,032h,02ch,031h,02dh,030h,02eh	; 8987  6(6(5)4*3+2,1-0.
	defb 078h,078h,078h,078h,070h,080h,068h,088h,060h,090h,058h,098h,050h,0a0h,048h,0a8h	; 8997  xxxxp.h.`.X.P.H.
	defb 040h,0b0h,040h,0b0h,048h,0a8h,050h,0a0h,058h,098h,060h,090h,068h,088h,070h,080h	; 89a7  @.@.H.P.X.`.h.p.
	defb 010h,010h,002h,014h	; 89b7

; ======================================================================
; CODIGO 0x89bb..0x8a5f  (164 bytes)
; ======================================================================


L_89BB:
	ld a,(iy+005h)		;89bb
	and a			;89be
	jr nz,L_89E5		;89bf
	ld a,(0e18ah)		;89c1
	cp 008h		;89c4
	ret c			;89c6
	ld a,r		;89c7
	and 03fh		;89c9
	add a,080h		;89cb
	ld (iy+00fh),a		;89cd
	inc (iy+005h)		;89d0
	ld a,(iy+006h)		;89d3
	ld (iy+002h),a		;89d6
	ld a,(iy+007h)		;89d9
	ld (iy+003h),a		;89dc
	ld (iy+008h),000h		;89df
	jr L_8A1A		;89e3
L_89E5:
	ld a,018h		;89e5
	call L_9915		;89e7
	jr nc,L_8A2E		;89ea
	ld de,0acf4h		;89ec
	call L_8400		;89ef
	ld a,(iy+008h)		;89f2
	inc a			;89f5
	cp 019h		;89f6
	jr c,L_89FC		;89f8
	ld a,000h		;89fa
L_89FC:
	ld (iy+008h),a		;89fc
	ld e,a			;89ff
	ld d,000h		;8a00
	ld hl,08a5fh		;8a02
	add hl,de			;8a05
	ld a,(hl)			;8a06
	add a,(iy+002h)		;8a07
	ld (iy+006h),a		;8a0a
	ld hl,08a78h		;8a0d
	ld e,(iy+008h)		;8a10
	ld d,000h		;8a13
	add hl,de			;8a15
	ld a,(hl)			;8a16
	ld (iy+001h),a		;8a17
L_8A1A:
	inc (iy+009h)		;8a1a
	bit 0,(iy+009h)		;8a1d
	jr z,L_8A28		;8a21
	ld de,0acdch		;8a23
	jr L_8A2B		;8a26
L_8A28:
	ld de,0ace8h		;8a28
L_8A2B:
	call L_8400		;8a2b
L_8A2E:
	ld a,020h		;8a2e
	call L_9921		;8a30
	jr nc,L_8A44		;8a33
	ld a,r		;8a35
	and 007h		;8a37
	jr nz,L_8A44		;8a39
	ld hl,00000h		;8a3b
	ld bc,01027h		;8a3e
	call L_8383		;8a41
L_8A44:
	ld hl,08a91h		;8a44
	ld de,0acf4h		;8a47
	ld a,030h		;8a4a
	call L_90B1		;8a4c
	ret nc			;8a4f
	xor a			;8a50
	call 05f1dh		;8a51
	ld (iy+003h),002h		;8a54
	ld (iy+002h),000h		;8a58
	jp L_88FD		;8a5c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8a5f..0x8a95  (54 bytes)
DATA_8A5F:
	defb 000h,001h,002h,003h,004h,005h,006h,005h,004h,003h,002h,001h,000h,0ffh,0feh,0fdh	; 8a5f  ................
	defb 0fch,0fbh,0fah,0fbh,0fch,0fdh,0feh,0ffh,000h,080h,088h,090h,098h,0a0h,0a8h,0b0h	; 8a6f  ................
	defb 0a8h,0a0h,098h,090h,088h,080h,078h,070h,068h,060h,058h,050h,058h,060h,068h,070h	; 8a7f  ......xph`XPX`hp
	defb 078h,080h,010h,010h,0fch,012h	; 8a8f

; ======================================================================
; CODIGO 0x8a95..0x8b6a  (213 bytes)
; ======================================================================


L_8A95:
	ld a,(iy+005h)		;8a95
	and a			;8a98
	jr nz,L_8AC3		;8a99
	ld a,r		;8a9b
	and 03fh		;8a9d
	add a,060h		;8a9f
	ld (iy+00ch),a		;8aa1
	ld (iy+009h),0fdh		;8aa4
	ld (iy+006h),0b8h		;8aa8
	ld (iy+007h),0c3h		;8aac
	ld (iy+001h),0b8h		;8ab0
	ld (iy+000h),030h		;8ab4
	ld de,0abc0h		;8ab8
	call L_81F6		;8abb
	ld a,001h		;8abe
	ld (0e045h),a		;8ac0
L_8AC3:
	ld a,r		;8ac3
	and 03fh		;8ac5
	jr nz,L_8B07		;8ac7
	ld de,0ac06h		;8ac9
	call L_8400		;8acc
	ld a,r		;8acf
	bit 6,a		;8ad1
	jr z,L_8AEB		;8ad3
	ld a,(iy+009h)		;8ad5
	dec a			;8ad8
	cp 0e9h		;8ad9
	jr c,L_8AFF		;8adb
	ld (iy+009h),a		;8add
	dec (iy+006h)		;8ae0
	ld hl,0f800h		;8ae3
	call L_8B72		;8ae6
	jr L_8AFF		;8ae9
L_8AEB:
	ld a,(iy+009h)		;8aeb
	inc a			;8aee
	cp 000h		;8aef
	jr z,L_8AFF		;8af1
	ld (iy+009h),a		;8af3
	inc (iy+006h)		;8af6
	ld hl,00800h		;8af9
	call L_8B72		;8afc
L_8AFF:
	ld de,0abc0h		;8aff
	call L_8400		;8b02
	jr L_8B12		;8b05
L_8B07:
	ld hl,0abc0h		;8b07
	ld de,0abe3h		;8b0a
	ld a,020h		;8b0d
	call L_83E9		;8b0f
L_8B12:
	ld a,(iy+00ch)		;8b12
	call L_9921		;8b15
	jr nc,L_8B35		;8b18
	ld hl,01614h		;8b1a
	ld c,00dh		;8b1d
	ld b,0f8h		;8b1f
	call L_8383		;8b21
	jr c,L_8B35		;8b24
	push iy		;8b26
	push hl			;8b28
	pop iy		;8b29
	ld a,016h		;8b2b
	ld (iy+008h),a		;8b2d
	call 05cb6h		;8b30
	pop iy		;8b33
L_8B35:
	ld hl,08b6eh		;8b35
	call 05a5ah		;8b38
	ld hl,08b6ah		;8b3b
	ld a,030h		;8b3e
	call L_90AD		;8b40
	ret nc			;8b43
	ld a,000h		;8b44
	ld (0e045h),a		;8b46
	xor a			;8b49
	call 05f25h		;8b4a
	push iy		;8b4d
	call L_88FD		;8b4f
	ld (iy+00ch),0a0h		;8b52
	pop iy		;8b56
	ld (iy+004h),01fh		;8b58
	ld (iy+009h),008h		;8b5c
	ld (iy+008h),005h		;8b60
	ld hl,010f0h		;8b64
	jp L_8B72		;8b67

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8b6a..0x8b72  (8 bytes)
DATA_8B6A:
	defb 004h,010h,010h,010h,034h,040h,010h,010h	; 8b6a  ....4@..

; ======================================================================
; CODIGO 0x8b72..0x8b83  (17 bytes)
; ======================================================================


L_8B72:
	ld a,h			;8b72
	call L_81BB		;8b73
	ld a,l			;8b76
	jp L_81B4		;8b77
L_8B7A:
	call L_8B72		;8b7a
	jp L_81A8		;8b7d
L_8B80:
	call 0a03eh		;8b80

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8b83..0x8b89  (6 bytes)
DATA_8B83:
	defb 089h,08bh,0b7h,08bh,0cfh,08bh	; 8b83

; ======================================================================
; CODIGO 0x8b89..0x8c83  (250 bytes)
; ======================================================================


L_8B89:
	ld (iy+001h),0c8h		;8b89
	ld (iy+000h),018h		;8b8d
	ld (iy+006h),017h		;8b91
	ld (iy+007h),0c3h		;8b95
	ld (iy+00bh),000h		;8b99
	ld a,r		;8b9d
	and 01fh		;8b9f
	set 2,a		;8ba1
	add a,020h		;8ba3
	ld (iy+00ah),a		;8ba5
	ld (iy+000h),010h		;8ba8
	ld a,001h		;8bac
	ld (0e045h),a		;8bae
	ld de,0ac29h		;8bb1
	jp L_81F6		;8bb4
L_8BB7:
	ld a,040h		;8bb7
	call L_9915		;8bb9
	jp nc,L_8BCF		;8bbc
	ld a,(iy+001h)		;8bbf
	cp (ix+001h)		;8bc2
	jr nc,L_8BCC		;8bc5
	call L_8C56		;8bc7
	jr L_8BCF		;8bca
L_8BCC:
	call L_8C63		;8bcc
L_8BCF:
	ld a,(iy+00ah)		;8bcf
	call L_9921		;8bd2
	jr nc,L_8C18		;8bd5
	push ix		;8bd7
	call L_8419		;8bd9
	jr c,L_8C16		;8bdc
	ld a,(iy+000h)		;8bde
	add a,010h		;8be1
	ld (ix+00ah),a		;8be3
	inc (iy+00bh)		;8be6
	ld a,018h		;8be9
	bit 0,(iy+00bh)		;8beb
	jr z,L_8BF3		;8bef
	ld a,0e8h		;8bf1
L_8BF3:
	add a,(iy+001h)		;8bf3
	ld (ix+00bh),a		;8bf6
	ld (ix+004h),015h		;8bf9
	inc (iy+003h)		;8bfd
	ld a,(iy+003h)		;8c00
	cp 020h		;8c03
	jr c,L_8C16		;8c05
	push iy		;8c07
	push ix		;8c09
	pop iy		;8c0b
	ld ix,0e320h		;8c0d
	call L_8000		;8c11
	pop iy		;8c14
L_8C16:
	pop ix		;8c16
L_8C18:
	inc (iy+009h)		;8c18
	ld a,(iy+009h)		;8c1b
	cp 018h		;8c1e
	jr c,L_8C30		;8c20
	ld (iy+009h),000h		;8c22
	ld hl,00010h		;8c26
	ld c,01eh		;8c29
	ld b,0f0h		;8c2b
	call L_8383		;8c2d
L_8C30:
	ld hl,08c87h		;8c30
	call 05a68h		;8c33
	ld hl,0ac29h		;8c36
	ld a,020h		;8c39
	ld b,008h		;8c3b
	call L_90AD		;8c3d
	ret nc			;8c40
	xor a			;8c41
	call 05f19h		;8c42
	ld hl,0f8e0h		;8c45
	call L_8B7A		;8c48
	ld (iy+009h),007h		;8c4b
	ld (iy+008h),005h		;8c4f
	jp L_8292		;8c53
L_8C56:
	ld a,(iy+006h)		;8c56
	inc a			;8c59
	cp 019h		;8c5a
	ret nc			;8c5c
	push af			;8c5d
	ld a,008h		;8c5e
	push af			;8c60
	jr L_8C6F		;8c61
L_8C63:
	ld a,(iy+006h)		;8c63
	dec a			;8c66
	cp 001h		;8c67
	ret z			;8c69
	ret c			;8c6a
	push af			;8c6b
	ld a,0f8h		;8c6c
	push af			;8c6e
L_8C6F:
	pop af			;8c6f
	call L_81BB		;8c70
	ld de,0ac56h		;8c73
	call L_8400		;8c76
	pop af			;8c79
	ld (iy+006h),a		;8c7a
	ld de,0ac29h		;8c7d
	jp L_8400		;8c80

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8c83..0x8c8b  (8 bytes)
DATA_8C83:
	defb 010h,010h,000h,010h,030h,040h,008h,010h	; 8c83  ....0@..

; ======================================================================
; CODIGO 0x8c8b..0x8c8e  (3 bytes)
; ======================================================================


L_8C8B:
	call 0a03eh		;8c8b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8c8e..0x8c9c  (14 bytes)
DATA_8C8E:
	defb 09ch,08ch,0a2h,08ch,0afh,08ch,0bch,08ch,008h,08dh,0afh,08ch,013h,08dh	; 8c8e  ..............

; ======================================================================
; CODIGO 0x8c9c..0x8d2c  (144 bytes)
; ======================================================================


L_8C9C:
	ld de,0ac83h		;8c9c
	call L_81F6		;8c9f
L_8CA2:
	ld a,0c0h		;8ca2
	call L_9915		;8ca4
	jr nc,L_8D17		;8ca7
	ld de,0ac94h		;8ca9
	jp L_81F6		;8cac
L_8CAF:
	ld a,004h		;8caf
	call L_9915		;8cb1
	jr nc,L_8D17		;8cb4
	ld de,0aca5h		;8cb6
	jp L_81F6		;8cb9
L_8CBC:
	ld a,020h		;8cbc
	call L_9915		;8cbe
	jr nc,L_8D1E		;8cc1
	ld hl,0f8feh		;8cc3
	ld bc,0f41fh		;8cc6
	ld (iy+008h),014h		;8cc9
	call L_8601		;8ccd
	ld hl,000feh		;8cd0
	ld bc,0f41fh		;8cd3
	ld (iy+008h),012h		;8cd6
	call L_8601		;8cda
	ld hl,008feh		;8cdd
	ld bc,0f41fh		;8ce0
	ld (iy+008h),010h		;8ce3
	call L_8601		;8ce7
	ld hl,010feh		;8cea
	ld bc,0f41fh		;8ced
	ld (iy+008h),00eh		;8cf0
	call L_8601		;8cf4
	ld hl,018feh		;8cf7
	ld bc,0f41fh		;8cfa
	ld (iy+008h),00ch		;8cfd
	call L_8601		;8d01
	inc (iy+005h)		;8d04
	ret			;8d07
L_8D08:
	ld a,020h		;8d08
	call L_9915		;8d0a
	jr nc,L_8D1E		;8d0d
	inc (iy+005h)		;8d0f
	ret			;8d12
L_8D13:
	ld (iy+005h),000h		;8d13
L_8D17:
	ld hl,08d2ch		;8d17
	call 05af8h		;8d1a
	ret			;8d1d
L_8D1E:
	ld hl,08d2ch		;8d1e
	ld a,00ch		;8d21
	call L_90B1		;8d23
	ret nc			;8d26
	ld e,006h		;8d27
	jp 0a0e4h		;8d29

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8d2c..0x8d3b  (15 bytes)
DATA_8D2C:
	defb 006h,010h,0feh,028h,098h,000h,040h,000h,002h,000h,010h,000h,000h,000h,0c0h	; 8d2c  ...(..@........

; ======================================================================
; CODIGO 0x8d3b..0x8e00  (197 bytes)
; ======================================================================


L_8D3B:
	ld a,(iy+005h)		;8d3b
	and a			;8d3e
	jr nz,L_8D52		;8d3f
	ld a,r		;8d41
	and 03fh		;8d43
	set 0,a		;8d45
	ld (iy+00dh),a		;8d47
	inc (iy+005h)		;8d4a
	ld a,001h		;8d4d
	ld (0e045h),a		;8d4f
L_8D52:
	inc (iy+00eh)		;8d52
	ld a,(iy+00eh)		;8d55
	cp (iy+00dh)		;8d58
	jr c,L_8D7B		;8d5b
	ld (iy+00eh),000h		;8d5d
	ld a,r		;8d61
	and 03fh		;8d63
	set 0,a		;8d65
	ld (iy+00dh),a		;8d67
L_8D6A:
	push ix		;8d6a
	ld hl,00000h		;8d6c
	ld bc,06410h		;8d6f
	call L_837D		;8d72
	jr nc,L_8D78		;8d75
	scf			;8d77
L_8D78:
	pop ix		;8d78
	ret			;8d7a
L_8D7B:
	ld hl,0acb6h		;8d7b
	ld de,0acc9h		;8d7e
	ld a,030h		;8d81
	call L_83E9		;8d83
	ld hl,090cch		;8d86
	ld a,010h		;8d89
	ld de,0acb6h		;8d8b
	call L_9085		;8d8e
	ret nc			;8d91
	xor a			;8d92
	ld (0e045h),a		;8d93
	call 05f19h		;8d96
L_8D99:
	ld (iy+002h),002h		;8d99
	ld (iy+003h),000h		;8d9d
	ret			;8da1
L_8DA2:
	ld a,(iy+005h)		;8da2
	and a			;8da5
	jr nz,L_8DB9		;8da6
	inc (iy+005h)		;8da8
	ld de,0ad00h		;8dab
	call L_8400		;8dae
	ld (iy+000h),058h		;8db1
	ld (iy+001h),0c0h		;8db5
L_8DB9:
	ld de,0ad00h		;8db9
	ld hl,0ad07h		;8dbc
	ld a,008h		;8dbf
	call L_83E9		;8dc1
	ld a,020h		;8dc4
	call L_9915		;8dc6
	jr nc,L_8DE4		;8dc9
	call 05d1dh		;8dcb
	ld (iy+00eh),a		;8dce
	ld hl,0f0f6h		;8dd1
	ld bc,0f423h		;8dd4
	call L_8383		;8dd7
	jr nc,L_8DE4		;8dda
	ld de,00008h		;8ddc
	add hl,de			;8ddf
	ld a,(iy+00eh)		;8de0
	ld (hl),a			;8de3
L_8DE4:
	ld hl,08e07h		;8de4
	ld a,040h		;8de7
	ld de,08e00h		;8de9
	call L_9085		;8dec
	ret nc			;8def
	call L_8D99		;8df0
	xor a			;8df3
	call 05f2dh		;8df4
	ld hl,0f0f0h		;8df7
	call L_8B7A		;8dfa
	jp L_88FD		;8dfd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e00..0x8e0b  (11 bytes)
DATA_8E00:
	defb 040h,002h,002h,0ffh,0ffh,0ffh,0ffh,004h,010h,0f0h,010h	; 8e00  @..........

; ======================================================================
; CODIGO 0x8e0b..0x8e19  (14 bytes)
; ======================================================================


L_8E0B:
	ld a,(0e18bh)		;8e0b
	and a			;8e0e
	ret nz			;8e0f
L_8E10:
	ld a,(iy+003h)		;8e10
	and 00fh		;8e13
	ld e,a			;8e15
	call 0a041h		;8e16

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8e19..0x8e37  (30 bytes)
DATA_8E19:
	defb 037h,08eh,0a6h,08eh,0b1h,08eh,0cbh,08eh,00ah,08fh,011h,08fh,034h,08fh,03dh,08fh	; 8e19  7...........4.=.
	defb 03dh,08fh,040h,08fh,047h,08fh,047h,08fh,04eh,08fh,06bh,08fh,06ch,08fh	; 8e29  =.@.G.G.N.k.l.

; ======================================================================
; CODIGO 0x8e37..0x8fb3  (380 bytes)
; ======================================================================


L_8E37:
	ld a,(iy+005h)		;8e37
	and a			;8e3a
	jr nz,L_8E65		;8e3b
	ld (iy+00ah),001h		;8e3d
L_8E41:
	inc (iy+005h)		;8e41
	ld (iy+003h),000h		;8e44
	bit 7,(iy+001h)		;8e48
	jr nz,L_8E54		;8e4c
	ld (iy+008h),001h		;8e4e
	jr L_8E58		;8e52
L_8E54:
	ld (iy+008h),0ffh		;8e54
L_8E58:
	ld a,r		;8e58
	and 007h		;8e5a
	set 1,a		;8e5c
	ld (iy+00eh),a		;8e5e
	ld b,078h		;8e61
	jr L_8E90		;8e63
L_8E65:
	ld a,(iy+001h)		;8e65
	cp 080h		;8e68
	jr c,L_8E74		;8e6a
	ld a,(ix+001h)		;8e6c
	cp 0d0h		;8e6f
	ret nc			;8e71
	jr L_8E7A		;8e72
L_8E74:
	ld a,(ix+001h)		;8e74
	cp 030h		;8e77
	ret c			;8e79
L_8E7A:
	ld a,(0e020h)		;8e7a
	ld c,a			;8e7d
	ld a,022h		;8e7e
	sub c			;8e80
	set 0,a		;8e81
	call L_9915		;8e83
	ret nc			;8e86
	ld a,(iy+00eh)		;8e87
	call L_9921		;8e8a
	ret nc			;8e8d
	ld b,078h		;8e8e
L_8E90:
	push ix		;8e90
	ld hl,0f01fh		;8e92
	ld c,(iy+00ah)		;8e95
	call L_8377		;8e98
	jr nc,L_8EA3		;8e9b
	ld a,(iy+008h)		;8e9d
	ld (ix+008h),a		;8ea0
L_8EA3:
	pop ix		;8ea3
	ret			;8ea5
L_8EA6:
	ld a,(ix+001h)		;8ea6
	cp 080h		;8ea9
	ret c			;8eab
	ld (iy+003h),000h		;8eac
	ret			;8eb0
L_8EB1:
	ld a,040h		;8eb1
	call L_9915		;8eb3
	ret nc			;8eb6
	ld hl,0e504h		;8eb7
	ld de,00010h		;8eba
	ld b,010h		;8ebd
L_8EBF:
	ld a,(hl)			;8ebf
	cp 00fh		;8ec0
	ret z			;8ec2
	add hl,de			;8ec3
	djnz L_8EBF		;8ec4
	ld (iy+003h),000h		;8ec6
	ret			;8eca
L_8ECB:
	ld a,(iy+005h)		;8ecb
	cp 001h		;8ece
	jr nz,L_8EE0		;8ed0
	inc (iy+005h)		;8ed2
	ld a,r		;8ed5
	and 037h		;8ed7
	set 2,a		;8ed9
	ld (iy+00eh),a		;8edb
	jr L_8EED		;8ede
L_8EE0:
	ld a,090h		;8ee0
	call L_9915		;8ee2
	ret nc			;8ee5
	ld a,(iy+00eh)		;8ee6
	call L_9921		;8ee9
	ret nc			;8eec
L_8EED:
	push ix		;8eed
	ld hl,00000h		;8eef
	ld bc,0e80ah		;8ef2
	call L_8392		;8ef5
	jr nc,L_8F07		;8ef8
	ld a,r		;8efa
	and 07fh		;8efc
	add a,040h		;8efe
	ld (ix+001h),a		;8f00
	ld (ix+000h),030h		;8f03
L_8F07:
	pop ix		;8f07
	ret			;8f09
L_8F0A:
	ld (iy+00ah),026h		;8f0a
	jp L_8E41		;8f0e
L_8F11:
	push iy		;8f11
	ld iy,0e500h		;8f13
	ld b,010h		;8f17
	ld de,00010h		;8f19
L_8F1C:
	ld a,(iy+004h)		;8f1c
	and a			;8f1f
	jr z,L_8F29		;8f20
	add iy,de		;8f22
	djnz L_8F1C		;8f24
	pop iy		;8f26
	ret			;8f28
L_8F29:
	ld (iy+004h),024h		;8f29
	pop iy		;8f2d
	ld (iy+004h),000h		;8f2f
	ret			;8f33
L_8F34:
	ld a,020h		;8f34
	call L_9915		;8f36
	ret nc			;8f39
	jp L_8D6A		;8f3a
L_8F3D:
	jp L_8E37		;8f3d
L_8F40:
	ld (iy+00ah),026h		;8f40
	jp L_8E41		;8f44
L_8F47:
	ld (iy+00ah),017h		;8f47
	jp L_8E41		;8f4b
L_8F4E:
	inc (iy+005h)		;8f4e
	ld a,r		;8f51
	and 007h		;8f53
	set 2,a		;8f55
	ld (iy+00eh),a		;8f57
	ld (iy+00ah),001h		;8f5a
	ld (iy+008h),0ffh		;8f5e
	ld (iy+003h),000h		;8f62
	ld b,078h		;8f66
	jp L_8E90		;8f68
L_8F6B:
	nop			;8f6b
L_8F6C:
	ld (iy+00ah),013h		;8f6c
	jp L_8E41		;8f70
L_8F73:
	ld hl,0ad3bh		;8f73
	ld de,0ad4eh		;8f76
	bit 0,(iy+005h)		;8f79
	jr nz,L_8F88		;8f7d
	call L_8400		;8f7f
	ld (iy+005h),001h		;8f82
	jr L_8F8D		;8f86
L_8F88:
	ld a,010h		;8f88
	call L_83E9		;8f8a
L_8F8D:
	ld de,0ad61h		;8f8d
	ld hl,08fb3h		;8f90
	ld a,018h		;8f93
	call L_9085		;8f95
	ret nc			;8f98
	ld (iy+002h),002h		;8f99
	ld (iy+003h),000h		;8f9d
	ld a,0ffh		;8fa1
	ld (0e18bh),a		;8fa3
	ld a,(0e5c7h)		;8fa6
	inc a			;8fa9
	ld (0e5c7h),a		;8faa
	call 05f1dh		;8fad
	jp L_88FD		;8fb0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8fb3..0x8fb7  (4 bytes)
DATA_8FB3:
	defb 011h,006h,004h,008h	; 8fb3

; ======================================================================
; CODIGO 0x8fb7..0x8fbb  (4 bytes)
; ======================================================================


L_8FB7:
	nop			;8fb7
L_8FB8:
	call 0a03eh		;8fb8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8fbb..0x8fc3  (8 bytes)
DATA_8FBB:
	defb 0c3h,08fh,0eah,08fh,00bh,090h,039h,090h	; 8fbb  ......9.

; ======================================================================
; CODIGO 0x8fc3..0x9081  (190 bytes)
; ======================================================================


L_8FC3:
	inc (iy+005h)		;8fc3
	ld a,(0e020h)		;8fc6
	ld c,a			;8fc9
	ld a,r		;8fca
	and 01fh		;8fcc
	add a,028h		;8fce
	sub c			;8fd0
	ld (iy+00eh),a		;8fd1
	and 02fh		;8fd4
	ld (iy+00ch),a		;8fd6
	ld de,0ad0eh		;8fd9
	ld a,(iy+004h)		;8fdc
	cp 00bh		;8fdf
	jp nz,L_8400		;8fe1
	ld de,0ab78h		;8fe4
	jp L_8400		;8fe7
L_8FEA:
	ld a,(iy+00eh)		;8fea
	sla a		;8fed
	call L_9915		;8fef
	jr nc,L_9044		;8ff2
	ld a,(iy+004h)		;8ff4
	cp 00bh		;8ff7
	jr z,L_9000		;8ff9
	ld de,0ad1dh		;8ffb
	jr L_9003		;8ffe
L_9000:
	ld de,0ab81h		;9000
L_9003:
	call L_8400		;9003
	inc (iy+005h)		;9006
	jr L_9044		;9009
L_900B:
	ld a,010h		;900b
	call L_9915		;900d
	jr nc,L_9044		;9010
	ld a,(iy+004h)		;9012
	cp 00bh		;9015
	jr z,L_9021		;9017
	ld hl,0fa08h		;9019
	ld bc,00009h		;901c
	jr L_9027		;901f
L_9021:
	ld hl,0f8f8h		;9021
	ld bc,00011h		;9024
L_9027:
	push ix		;9027
	call L_837D		;9029
	pop ix		;902c
	jr nc,L_9044		;902e
	ld (iy+00dh),001h		;9030
	inc (iy+005h)		;9034
	jr L_9044		;9037
L_9039:
	ld a,008h		;9039
	call L_9915		;903b
	jr nc,L_9044		;903e
	ld (iy+005h),000h		;9040
L_9044:
	ld a,(iy+004h)		;9044
	cp 00bh		;9047
	jr z,L_906F		;9049
	ld hl,090cch		;904b
	ld a,010h		;904e
	ld de,0ad2ch		;9050
	call L_9085		;9053
	ret nc			;9056
	ld a,(iy+004h)		;9057
	cp 00bh		;905a
	jr z,L_9063		;905c
	call L_813B		;905e
	jr L_9066		;9061
L_9063:
	call 05f1dh		;9063
L_9066:
	ld (iy+002h),001h		;9066
	ld (iy+003h),000h		;906a
	ret			;906e
L_906F:
	ld hl,09081h		;906f
	ld a,004h		;9072
	ld de,0ab8ah		;9074
	call L_9085		;9077
	ret nc			;907a
	ld hl,0f000h		;907b
	jp L_8B7A		;907e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9081..0x9085  (4 bytes)
DATA_9081:
	defb 010h,008h,0fch,008h	; 9081

; ======================================================================
; CODIGO 0x9085..0x90cc  (71 bytes)
; ======================================================================


L_9085:
	push af			;9085
	push de			;9086
	call 05af8h		;9087
	pop de			;908a
	jr nc,L_90AA		;908b
	pop af			;908d
	inc (iy+00bh)		;908e
	cp (iy+00bh)		;9091
	ret nc			;9094
	call L_8400		;9095
	ld (iy+004h),01dh		;9098
	ld (iy+005h),000h		;909c
	ld (iy+002h),003h		;90a0
	ld (iy+003h),000h		;90a4
	scf			;90a8
	ret			;90a9
L_90AA:
	pop af			;90aa
	xor a			;90ab
	ret			;90ac
L_90AD:
	ld b,01ch		;90ad
	jr L_90B3		;90af
L_90B1:
	ld b,01dh		;90b1
L_90B3:
	push af			;90b3
	push bc			;90b4
	call 05af8h		;90b5
	pop bc			;90b8
	jr nc,L_90AA		;90b9
	pop af			;90bb
	inc (iy+00bh)		;90bc
	cp (iy+00bh)		;90bf
	ret nc			;90c2
	ld (iy+004h),b		;90c3
	ld (iy+005h),000h		;90c6
	scf			;90ca
	ret			;90cb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x90cc..0x90d0  (4 bytes)
DATA_90CC:
	defb 00eh,00ch,000h,00ch	; 90cc

; ======================================================================
; CODIGO 0x90d0..0x9118  (72 bytes)
; ======================================================================


L_90D0:
	ld a,(iy+005h)		;90d0
	and a			;90d3
	jr nz,L_90DF		;90d4
	ld de,0ad74h		;90d6
	call L_8400		;90d9
	inc (iy+005h)		;90dc
L_90DF:
	ld de,0ad74h		;90df
	ld hl,0ad87h		;90e2
	ld a,00ah		;90e5
	call L_83E9		;90e7
	ld hl,0850ah		;90ea
	ld a,010h		;90ed
	ld de,09127h		;90ef
	call L_9085		;90f2
	ret nc			;90f5
	ld (iy+004h),01dh		;90f6
	ld (iy+002h),002h		;90fa
	ld (iy+003h),000h		;90fe
	call 05f21h		;9102
	ld hl,09118h		;9105
	ld de,0e0d0h		;9108
	ld bc,0000fh		;910b
	ldir		;910e
	ld b,020h		;9110
	call 0507bh		;9112
	jp L_88FD		;9115

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9118..0x913a  (34 bytes)
DATA_9118:
	defb 088h,000h,038h,000h,0b8h,000h,038h,000h,020h,000h,020h,000h,000h,000h,0d0h,041h	; 9118  ..8...8. . ....A
	defb 004h,004h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; 9128  ................
	defb 001h,001h	; 9138

; ======================================================================
; CODIGO 0x913a..0x915d  (35 bytes)
; ======================================================================


L_913A:
	ld a,(0e18ah)		;913a
	cp 002h		;913d
	jr c,L_9157		;913f
	ld de,0a9f8h		;9141
	ld hl,0915dh		;9144
	ld a,018h		;9147
	call L_9085		;9149
	ret nc			;914c
	call 05f1dh		;914d
	ld (iy+002h),002h		;9150
	jp L_88FD		;9154
L_9157:
	ld hl,0915dh		;9157
	jp 05af8h		;915a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x915d..0x9161  (4 bytes)
DATA_915D:
	defb 00ah,00ah,000h,010h	; 915d

; ======================================================================
; CODIGO 0x9161..0x924b  (234 bytes)
; ======================================================================


L_9161:
	ld a,(0e18bh)		;9161
	and a			;9164
	ret nz			;9165
	ld a,(iy+005h)		;9166
	and a			;9169
	jr nz,L_918F		;916a
	inc (iy+005h)		;916c
	ld a,r		;916f
	and 01fh		;9171
	add a,060h		;9173
	ld (iy+00eh),a		;9175
	ld a,(0e020h)		;9178
	srl a		;917b
	ld c,a			;917d
	ld a,r		;917e
	and 00fh		;9180
	sub c			;9182
	jr z,L_918B		;9183
	jr c,L_918B		;9185
L_9187:
	ld (iy+008h),a		;9187
	ret			;918a
L_918B:
	ld a,002h		;918b
	jr L_9187		;918d
L_918F:
	ld a,(iy+00eh)		;918f
	call L_9915		;9192
	ret nc			;9195
	ld a,(iy+005h)		;9196
	cp 002h		;9199
	jr z,L_91E6		;919b
	dec (iy+008h)		;919d
	jr z,L_91E6		;91a0
	ld a,r		;91a2
	bit 0,a		;91a4
	jr z,L_91CD		;91a6
	push ix		;91a8
	call L_8419		;91aa
	jr c,L_91CA		;91ad
	ld (ix+001h),098h		;91af
	ld (ix+000h),078h		;91b3
	ld (ix+004h),012h		;91b7
	ld (ix+008h),0ffh		;91bb
L_91BF:
	push iy		;91bf
	push ix		;91c1
	pop iy		;91c3
	call L_8000		;91c5
	pop iy		;91c8
L_91CA:
	pop ix		;91ca
	ret			;91cc
L_91CD:
	push ix		;91cd
	call L_8419		;91cf
	jr c,L_91CA		;91d2
	ld (ix+001h),060h		;91d4
	ld (ix+000h),078h		;91d8
	ld (ix+004h),012h		;91dc
	ld (ix+008h),001h		;91e0
	jr L_91BF		;91e4
L_91E6:
	ld (iy+005h),000h		;91e6
	push ix		;91ea
	call L_9230		;91ec
	jr c,L_91CA		;91ef
	ld a,(0e32bh)		;91f1
	cp 058h		;91f4
	jr c,L_91FE		;91f6
	cp 098h		;91f8
	jr c,L_9203		;91fa
	jr L_9208		;91fc
L_91FE:
	ld hl,06014h		;91fe
	jr L_920B		;9201
L_9203:
	ld hl,07810h		;9203
	jr L_920B		;9206
L_9208:
	ld hl,0900ch		;9208
L_920B:
	ld (ix+001h),h		;920b
	ld (ix+008h),l		;920e
	call L_9220		;9211
	pop ix		;9214
	ld a,(iy+009h)		;9216
	ld (iy+008h),a		;9219
	inc (iy+00fh)		;921c
	ret			;921f
L_9220:
	push ix		;9220
	push iy		;9222
	push ix		;9224
	pop iy		;9226
	call L_8000		;9228
	pop iy		;922b
	pop ix		;922d
	ret			;922f
L_9230:
	call L_843F		;9230
	ret c			;9233
	ld (ix+004h),005h		;9234
	ld (ix+000h),070h		;9238
	xor a			;923c
	ret			;923d
L_923E:
	ld (iy+004h),01ch		;923e
	ld (iy+00fh),001h		;9242
	jr $+20		;9246
L_9248:
	call 0a03eh		;9248

; ----------------------------------------------------------------------
; DATOS sin identificar  0x924b..0x9251  (6 bytes)
DATA_924B:
	defb 051h,092h,066h,092h,0b5h,092h	; 924b

; ======================================================================
; CODIGO 0x9251..0x92ba  (105 bytes)
; ======================================================================


L_9251:
	ld (iy+00fh),000h		;9251
	ld a,029h		;9255
	call 05052h		;9257
L_925A:
	inc (iy+005h)		;925a
	ld a,(iy+001h)		;925d
	sub 010h		;9260
	ld (iy+001h),a		;9262
	ret			;9265
L_9266:
	ld l,(iy+000h)		;9266
	ld h,(iy+001h)		;9269
	push hl			;926c
	ld b,(iy+008h)		;926d
L_9270:
	bit 0,(iy+00fh)		;9270
	jr z,L_9286		;9274
	ld a,(iy+00eh)		;9276
	and a			;9279
	jr nz,L_9286		;927a
	ld a,029h		;927c
	push bc			;927e
	call 05052h		;927f
	pop bc			;9282
	inc (iy+00eh)		;9283
L_9286:
	bit 0,(iy+01fh)		;9286
	jr nz,L_92A4		;928a
	push bc			;928c
	push ix		;928d
	ld hl,00000h		;928f
	ld bc,01c0bh		;9292
	call L_83BC		;9295
	pop ix		;9298
	pop bc			;929a
	ld a,00ch		;929b
	call L_81BB		;929d
	djnz L_9270		;92a0
	jr L_92A7		;92a2
L_92A4:
	call L_9332		;92a4
L_92A7:
	pop hl			;92a7
	ld a,008h		;92a8
	add a,l			;92aa
	ld (iy+000h),a		;92ab
	ld (iy+001h),h		;92ae
	inc (iy+005h)		;92b1
	ret			;92b4
L_92B5:
	ld e,005h		;92b5
	jp 0a0e4h		;92b7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x92ba..0x92d2  (24 bytes)
DATA_92BA:
	defb 001h,001h,007h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,040h,001h,004h,09ch,09ch,09ch	; 92ba  ..........@.....
	defb 09ch,001h,001h,004h,0ffh,0ffh,0ffh,0ffh	; 92ca  ........

; ======================================================================
; CODIGO 0x92d2..0x92d5  (3 bytes)
; ======================================================================


L_92D2:
	call 0a03eh		;92d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x92d5..0x92db  (6 bytes)
DATA_92D5:
	defb 0dbh,092h,051h,093h,073h,093h	; 92d5

; ======================================================================
; CODIGO 0x92db..0x9385  (170 bytes)
; ======================================================================


L_92DB:
	ld hl,0e2d3h		;92db
	ld a,(0e020h)		;92de
	cp 00ch		;92e1
	jr nz,L_92FD		;92e3
	ld a,(iy+00eh)		;92e5
	cp 01bh		;92e8
	jr z,L_92F9		;92ea
	ld a,(0e18bh)		;92ec
	and a			;92ef
	jr z,L_92F9		;92f0
	ld a,(hl)			;92f2
	cp 080h		;92f3
	jr nc,L_92F9		;92f5
	dec (hl)			;92f7
	ret nz			;92f8
L_92F9:
	ld (hl),02ch		;92f9
	inc hl			;92fb
	inc (hl)			;92fc
L_92FD:
	ld a,029h		;92fd
	call 05052h		;92ff
	push ix		;9302
	call L_930D		;9304
	inc (iy+005h)		;9307
	pop ix		;930a
	ret			;930c
L_930D:
	ld a,(iy+002h)		;930d
	cp 000h		;9310
	jr z,L_932B		;9312
	cp 001h		;9314
	jr z,L_9339		;9316
	cp 002h		;9318
	jr z,L_9324		;931a
	cp 004h		;931c
	jr z,L_9332		;931e
	ld b,001h		;9320
	jr L_9326		;9322
L_9324:
	ld b,009h		;9324
L_9326:
	ld hl,09399h		;9326
	jr L_933E		;9329
L_932B:
	ld hl,09385h		;932b
	ld b,004h		;932e
	jr L_933E		;9330
L_9332:
	ld hl,093abh		;9332
	ld b,005h		;9335
	jr L_933E		;9337
L_9339:
	ld hl,0938dh		;9339
	ld b,006h		;933c
L_933E:
	push bc			;933e
	ld e,(hl)			;933f
	inc hl			;9340
	ld d,(hl)			;9341
	inc hl			;9342
	ld bc,01c0bh		;9343
	push hl			;9346
	push de			;9347
	pop hl			;9348
	call L_83BC		;9349
	pop hl			;934c
	pop bc			;934d
	djnz L_933E		;934e
	ret			;9350
L_9351:
	ld a,(iy+003h)		;9351
	and a			;9354
	jr z,L_936F		;9355
	dec a			;9357
	ld de,093b7h		;9358
	jr z,L_936C		;935b
	dec a			;935d
	ld de,093c6h		;935e
	jr z,L_936C		;9361
	dec a			;9363
	ld de,093e5h		;9364
	jr z,L_936C		;9367
	ld de,093d2h		;9369
L_936C:
	call L_8400		;936c
L_936F:
	inc (iy+005h)		;936f
	ret			;9372
L_9373:
	ld a,030h		;9373
	call L_9915		;9375
	ret nc			;9378
	ld a,(0e2d4h)		;9379
	dec a			;937c
	ld (0e2d4h),a		;937d
	ld (iy+004h),000h		;9380
	ret			;9384

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9385..0x93f4  (111 bytes)
DATA_9385:
	defb 0fch,004h,006h,004h,0fch,0f8h,006h,0f8h,0fch,003h,006h,003h,010h,003h,0fch,0f6h	; 9385  ................
	defb 006h,0f6h,010h,0f6h,0fch,004h,006h,004h,010h,004h,0fch,0f8h,006h,0f8h,010h,0f8h	; 9395  ................
	defb 0fch,00ch,006h,00ch,010h,00ch,0feh,008h,0feh,012h,0feh,0feh,0feh,01ch,0feh,0f4h	; 93a5  ................
	defb 0feh,024h,001h,004h,003h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 93b5  .$..............
	defb 0ffh,001h,003h,003h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,001h,004h,004h	; 93c5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 93d5  ................
	defb 001h,002h,006h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 93e5  ...............

; ======================================================================
; CODIGO 0x93f4..0x93f7  (3 bytes)
; ======================================================================


L_93F4:
	call 0a03eh		;93f4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x93f7..0x9407  (16 bytes)
DATA_93F7:
	defb 007h,094h,021h,094h,05eh,094h,012h,09fh,012h,09fh,012h,09fh,012h,09fh,021h,09fh	; 93f7  ..!.^.........!.

; ======================================================================
; CODIGO 0x9407..0x946e  (103 bytes)
; ======================================================================


L_9407:
	ld a,(iy+001h)		;9407
	cp 080h		;940a
	jr nc,L_946B		;940c
	ld (iy+005h),002h		;940e
	call L_9A24		;9412
	ld bc,09d18h		;9415
	call 05e15h		;9418
	ld hl,0a905h		;941b
	jp L_9FA1		;941e
L_9421:
	call 05d1dh		;9421
	cp 004h		;9424
	jp nz,L_9FA4		;9426
	ld hl,00404h		;9429
	ld bc,023f4h		;942c
	push ix		;942f
	call L_847E		;9431
	jr c,L_9456		;9434
	ld a,(iy+001h)		;9436
	add a,008h		;9439
	ld (ix+001h),a		;943b
	ld a,(iy+000h)		;943e
	add a,0edh		;9441
	ld (ix+000h),a		;9443
	ld (ix+004h),01fh		;9446
	ld (ix+005h),000h		;944a
	ld (ix+002h),0f4h		;944e
	ld (ix+008h),004h		;9452
L_9456:
	pop ix		;9456
	inc (iy+005h)		;9458
	jp L_9FA4		;945b
L_945E:
	ld a,020h		;945e
	call L_9915		;9460
	jp nc,L_9FA4		;9463
	ld (iy+005h),001h		;9466
	ret			;946a
L_946B:
	call 0a03eh		;946b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x946e..0x947e  (16 bytes)
DATA_946E:
	defb 07eh,094h,095h,094h,05eh,094h,012h,09fh,012h,09fh,012h,09fh,012h,09fh,021h,09fh	; 946e  ~...^.........!.

; ======================================================================
; CODIGO 0x947e..0x94d5  (87 bytes)
; ======================================================================


L_947E:
	ld (iy+004h),02ch		;947e
	ld (iy+005h),002h		;9482
	call L_9A24		;9486
	ld bc,09d18h		;9489
	call 05e15h		;948c
	ld hl,0a923h		;948f
	jp L_9FA1		;9492
L_9495:
	call 05d1dh		;9495
	cp 01ch		;9498
	jp nz,L_9FA4		;949a
	ld hl,00404h		;949d
	ld bc,023f4h		;94a0
	push ix		;94a3
	call L_847E		;94a5
	jr c,L_94CA		;94a8
	ld a,(iy+001h)		;94aa
	add a,0f8h		;94ad
	ld (ix+001h),a		;94af
	ld a,(iy+000h)		;94b2
	add a,0edh		;94b5
	ld (ix+000h),a		;94b7
	ld (ix+004h),01fh		;94ba
	ld (ix+005h),000h		;94be
	ld (ix+002h),0f4h		;94c2
	ld (ix+008h),01ch		;94c6
L_94CA:
	pop ix		;94ca
	inc (iy+005h)		;94cc
	jp L_9FA4		;94cf
L_94D2:
	call 0a03eh		;94d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x94d5..0x94df  (10 bytes)
DATA_94D5:
	defb 0dfh,094h,0f6h,094h,017h,095h,05ch,095h,075h,095h	; 94d5  ......\.u.

; ======================================================================
; CODIGO 0x94df..0x958b  (172 bytes)
; ======================================================================


L_94DF:
	inc (iy+005h)		;94df
	ld a,(iy+001h)		;94e2
	ld (iy+00bh),a		;94e5
	ld a,(iy+000h)		;94e8
	add a,010h		;94eb
	ld (iy+00ah),a		;94ed
	ld bc,0a8d3h		;94f0
	call 05e45h		;94f3
L_94F6:
	ld a,(iy+000h)		;94f6
	sub 003h		;94f9
	ld (iy+000h),a		;94fb
	cp 0f0h		;94fe
	jr nc,L_9575		;9500
	cp 0c0h		;9502
	jr c,L_9575		;9504
	ld (iy+00ch),030h		;9506
	ld (iy+005h),002h		;950a
	ld (iy+001h),0ech		;950e
	ld (iy+000h),0ech		;9512
	ret			;9516
L_9517:
	dec (iy+00ch)		;9517
	ret nz			;951a
	ld (iy+00ah),004h		;951b
	ld a,(0e020h)		;951f
	cp 011h		;9522
	jr z,L_9537		;9524
	cp 012h		;9526
	jr nz,L_9546		;9528
	ld a,(0e022h)		;952a
	dec a			;952d
	jr z,L_9542		;952e
	dec a			;9530
	jr nz,L_9546		;9531
	ld a,0b0h		;9533
	jr L_9553		;9535
L_9537:
	ld a,(0e022h)		;9537
	cp 004h		;953a
	jr nz,L_9546		;953c
	ld a,0b0h		;953e
	jr L_9553		;9540
L_9542:
	ld a,050h		;9542
	jr L_9553		;9544
L_9546:
	ld a,040h		;9546
	add a,(iy+00bh)		;9548
	jr c,L_9551		;954b
	cp 0c0h		;954d
	jr c,L_9553		;954f
L_9551:
	ld a,0c0h		;9551
L_9553:
	ld (iy+00bh),a		;9553
	ld (iy+005h),003h		;9556
	jr L_9575		;955a
L_955C:
	call 05ecdh		;955c
	push af			;955f
	ld a,(iy+00ah)		;9560
	sub 010h		;9563
	ld (iy+000h),a		;9565
	ld a,(iy+00bh)		;9568
	ld (iy+001h),a		;956b
	pop af			;956e
	jr c,L_9575		;956f
	ld (iy+005h),004h		;9571
L_9575:
	ld hl,09595h		;9575
	call 05aceh		;9578
	ret nc			;957b
	ld a,(iy+002h)		;957c
	cp 02ch		;957f
	jr z,$+12		;9581
	ld a,001h		;9583
	ld (0e2c2h),a		;9585
	jp 0a8bdh		;9588

; ----------------------------------------------------------------------
; DATOS sin identificar  0x958b..0x958d  (2 bytes)
DATA_958B:
	defb 018h,005h	; 958b

; ======================================================================
; CODIGO 0x958d..0x9595  (8 bytes)
; ======================================================================


L_958D:
	ld a,001h		;958d
	ld (0e2c1h),a		;958f
	jp 0a8bdh		;9592

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9595..0x9599  (4 bytes)
DATA_9595:
	defb 00eh,00ch,000h,010h	; 9595

; ======================================================================
; CODIGO 0x9599..0x959c  (3 bytes)
; ======================================================================


L_9599:
	call 0a03eh		;9599

; ----------------------------------------------------------------------
; DATOS sin identificar  0x959c..0x95a8  (12 bytes)
DATA_959C:
	defb 0a8h,095h,0b7h,095h,0c7h,095h,0b7h,095h,0dbh,095h,0efh,095h	; 959c  ............

; ======================================================================
; CODIGO 0x95a8..0x9619  (113 bytes)
; ======================================================================


L_95A8:
	call L_9A24		;95a8
	ld (iy+005h),002h		;95ab
	ld bc,09619h		;95af
	call 05e15h		;95b2
	jr L_95C1		;95b5
L_95B7:
	ld a,050h		;95b7
	call L_9915		;95b9
	jr nc,L_95F3		;95bc
	inc (iy+005h)		;95be
L_95C1:
	ld (iy+009h),092h		;95c1
	jr L_95F3		;95c5
L_95C7:
	rlc (iy+009h)		;95c7
	jr c,L_95B7		;95cb
	dec (iy+00bh)		;95cd
	ld a,(0e2c5h)		;95d0
	and a			;95d3
	jr z,L_95B7		;95d4
	dec (ix+00bh)		;95d6
	jr L_95B7		;95d9
L_95DB:
	rlc (iy+009h)		;95db
	jr c,L_95B7		;95df
	inc (iy+00bh)		;95e1
	ld a,(0e2c5h)		;95e4
	and a			;95e7
	jr z,L_95B7		;95e8
	inc (ix+00bh)		;95ea
	jr L_95B7		;95ed
L_95EF:
	ld (iy+005h),001h		;95ef
L_95F3:
	ld hl,0a9c2h		;95f3
	call 0a01ah		;95f6
	xor a			;95f9
	ld (0e2c5h),a		;95fa
	ld a,(iy+000h)		;95fd
	sub (ix+00ah)		;9600
	ret c			;9603
	cp 008h		;9604
	ret nc			;9606
	ld a,(iy+001h)		;9607
	sub 008h		;960a
	sub (ix+00bh)		;960c
	ret nc			;960f
	cp 0e0h		;9610
	ret c			;9612
	ld a,001h		;9613
	ld (0e2c5h),a		;9615
	ret			;9618

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9619..0x961d  (4 bytes)
DATA_9619:
	defb 003h,012h,003h,012h	; 9619

; ======================================================================
; CODIGO 0x961d..0x9620  (3 bytes)
; ======================================================================


L_961D:
	call 0a03eh		;961d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9620..0x9626  (6 bytes)
DATA_9620:
	defb 026h,096h,062h,096h,069h,096h	; 9620

; ======================================================================
; CODIGO 0x9626..0x96c2  (156 bytes)
; ======================================================================


L_9626:
	ld a,(iy+00ah)		;9626
	cp 0a0h		;9629
	jr nz,L_9631		;962b
	ld (iy+00ah),09ch		;962d
L_9631:
	call L_9721		;9631
	ld (iy+005h),002h		;9634
	ld (iy+002h),0e8h		;9638
	ld (iy+012h),0ech		;963c
	ld a,(iy+000h)		;9640
	cp 080h		;9643
	jr c,L_9658		;9645
	ld (iy+00eh),0d8h		;9647
	ld (iy+00fh),0f0h		;964b
	ld (iy+010h),02dh		;964f
	call L_9ABF		;9653
	jr L_9669		;9656
L_9658:
	ld (iy+00eh),0e0h		;9658
	ld (iy+00fh),010h		;965c
	jr L_9669		;9660
L_9662:
	ld a,0f0h		;9662
	call 0a869h		;9664
	jr nc,L_9698		;9667
L_9669:
	ld a,(iy+00bh)		;9669
	sub (ix+00bh)		;966c
	jr nc,L_9677		;966f
	ld a,(ix+00bh)		;9671
	sub (iy+00bh)		;9674
L_9677:
	cp 020h		;9677
	jr c,L_967D		;9679
	jr L_9698		;967b
L_967D:
	push ix		;967d
	call L_8448		;967f
	jr c,L_9695		;9682
	call L_9738		;9684
	ld (iy+005h),001h		;9687
	ld (ix+004h),021h		;968b
	ld a,(iy+00eh)		;968f
	ld (ix+00eh),a		;9692
L_9695:
	pop ix		;9695
	ret			;9697
L_9698:
	inc (iy+00ch)		;9698
	bit 2,(iy+00ch)		;969b
	jr z,L_96A6		;969f
	ld (iy+000h),0ech		;96a1
	ret			;96a5
L_96A6:
	ld a,(iy+00ah)		;96a6
	ld (iy+000h),a		;96a9
L_96AC:
	ld a,(0e020h)		;96ac
	cp 00dh		;96af
	jr z,L_96BD		;96b1
	cp 011h		;96b3
	jr z,L_96BD		;96b5
	ld hl,096c2h		;96b7
L_96BA:
	jp 05a5ah		;96ba
L_96BD:
	ld hl,096c6h		;96bd
	jr L_96BA		;96c0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x96c2..0x96ca  (8 bytes)
DATA_96C2:
	defb 000h,010h,004h,008h,004h,00ch,004h,008h	; 96c2  ........

; ======================================================================
; CODIGO 0x96ca..0x976d  (163 bytes)
; ======================================================================


L_96CA:
	ld a,(iy+005h)		;96ca
	and a			;96cd
	jr nz,L_96D9		;96ce
	call L_9721		;96d0
	ld a,(iy+00eh)		;96d3
	ld (iy+002h),a		;96d6
L_96D9:
	ld a,(iy+005h)		;96d9
	cp 003h		;96dc
	jr z,L_9716		;96de
	cp 002h		;96e0
	jr z,L_96EB		;96e2
	ld a,002h		;96e4
	call 0a879h		;96e6
	jr nc,$-61		;96e9
L_96EB:
	ld a,(iy+00ah)		;96eb
	cp 008h		;96ee
	jp c,0a8a9h		;96f0
	cp 0a0h		;96f3
	jp nc,0a8a9h		;96f5
	cp 090h		;96f8
	jr nc,L_970F		;96fa
	ld a,002h		;96fc
	call L_9921		;96fe
	jr nc,$-105		;9701
	push ix		;9703
	call L_8448		;9705
	jr c,L_970D		;9708
	call L_9738		;970a
L_970D:
	pop ix		;970d
L_970F:
	ld (iy+005h),003h		;970f
	jp L_96AC		;9713
L_9716:
	ld a,020h		;9716
	call L_9921		;9718
	jp nc,L_96AC		;971b
	jp 0a8a9h		;971e
L_9721:
	ld (iy+005h),001h		;9721
	call L_9A24		;9725
	ld bc,0976dh		;9728
	ld a,(0e020h)		;972b
	cp 007h		;972e
	jr nz,L_9735		;9730
	ld bc,0976fh		;9732
L_9735:
	jp 05e31h		;9735
L_9738:
	ld a,(iy+00fh)		;9738
	ld (ix+00fh),a		;973b
	add a,(iy+00ah)		;973e
	ld (ix+000h),a		;9741
	ld (ix+010h),a		;9744
	ld (ix+00ah),a		;9747
	ld a,(iy+00bh)		;974a
	ld (ix+001h),a		;974d
	ld (ix+00bh),a		;9750
	ld (ix+011h),a		;9753
	ld a,(iy+00eh)		;9756
	ld (ix+002h),a		;9759
	ld (ix+00eh),a		;975c
	add a,004h		;975f
	ld (ix+012h),a		;9761
	ld (ix+004h),021h		;9764
	ld (iy+00dh),000h		;9768
	ret			;976c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x976d..0x9771  (4 bytes)
DATA_976D:
	defb 001h,06ch,001h,068h	; 976d

; ======================================================================
; CODIGO 0x9771..0x97e9  (120 bytes)
; ======================================================================


L_9771:
	ld (iy+00eh),0e0h		;9771
	ld (iy+00fh),000h		;9775
	push ix		;9779
	call L_8448		;977b
	jr c,L_978A		;977e
	call L_9738		;9780
	ld (ix+005h),000h		;9783
	call 0a8bdh		;9787
L_978A:
	pop ix		;978a
	ret			;978c
L_978D:
	ld a,(iy+005h)		;978d
	and a			;9790
	jr nz,L_979C		;9791
	inc (iy+005h)		;9793
	ld bc,0a8d3h		;9796
	call 05e45h		;9799
L_979C:
	dec (iy+000h)		;979c
	dec (iy+000h)		;979f
	jp L_9812		;97a2
L_97A5:
	ld a,(iy+005h)		;97a5
	and a			;97a8
	jr nz,L_97C2		;97a9
	inc (iy+005h)		;97ab
	call 05d1dh		;97ae
	ld (iy+008h),a		;97b1
	call 05cb6h		;97b4
	ld a,003h		;97b7
	call 05c75h		;97b9
	ld bc,0a8d3h		;97bc
	jp 05e45h		;97bf
L_97C2:
	call 05c53h		;97c2
	ld a,(iy+00ah)		;97c5
	add a,004h		;97c8
	ld (iy+00ah),a		;97ca
	and 004h		;97cd
	set 4,a		;97cf
	ld (iy+002h),a		;97d1
	call 0a7b9h		;97d4
	ret nc			;97d7
	ld hl,097e9h		;97d8
	push hl			;97db
	call 05a68h		;97dc
	pop hl			;97df
	call 05af8h		;97e0
	ret nc			;97e3
	ld (iy+004h),00bh		;97e4
	ret			;97e8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x97e9..0x97ed  (4 bytes)
DATA_97E9:
	defb 00ah,004h,004h,008h	; 97e9

; ======================================================================
; CODIGO 0x97ed..0x98d2  (229 bytes)
; ======================================================================


L_97ED:
	ld a,(iy+005h)		;97ed
	and a			;97f0
	jr nz,L_980C		;97f1
	ld bc,0a8d3h		;97f3
	call 05e45h		;97f6
	ld (iy+005h),001h		;97f9
	ld a,(iy+008h)		;97fd
	call 05cb6h		;9800
	ld a,0ffh		;9803
	call 05c75h		;9805
	ld (iy+00eh),020h		;9808
L_980C:
	inc (iy+00eh)		;980c
	call 05c53h		;980f
L_9812:
	ld a,(0e020h)		;9812
	cp 001h		;9815
	jr z,L_982B		;9817
	cp 004h		;9819
	jr z,L_982B		;981b
	cp 00bh		;981d
	jr z,L_982B		;981f
	cp 00eh		;9821
	jr z,L_982B		;9823
	call 0a7b9h		;9825
	jr c,L_984E		;9828
	ret			;982a
L_982B:
	ld a,(0e18bh)		;982b
	and a			;982e
	jp nz,0a8bdh		;982f
	ld a,(iy+000h)		;9832
	cp 088h		;9835
	jr nc,L_9861		;9837
	cp 010h		;9839
	jr c,L_9861		;983b
	ld a,(iy+001h)		;983d
	cp 0b8h		;9840
	jr nc,L_9861		;9842
	cp 038h		;9844
	jr c,L_9861		;9846
	ld a,(iy+00eh)		;9848
	cp 020h		;984b
	ret c			;984d
L_984E:
	ld a,(ix+006h)		;984e
	and a			;9851
	jr nz,L_985A		;9852
	ld a,(0e180h)		;9854
	cp 005h		;9857
	ret z			;9859
L_985A:
	ld hl,05bd1h		;985a
	call 05a68h		;985d
	ret nc			;9860
L_9861:
	jp 0a8bdh		;9861
L_9864:
	ld a,(iy+005h)		;9864
	and a			;9867
	jr nz,L_9874		;9868
	ld bc,0a8d3h		;986a
	call 05e45h		;986d
	ld (iy+005h),001h		;9870
L_9874:
	cp 001h		;9874
	jr nz,L_987E		;9876
	ld a,022h		;9878
	call 0a869h		;987a
	ret nc			;987d
L_987E:
	ld a,(iy+00eh)		;987e
	call L_81BB		;9881
	jr L_988A		;9884
L_9886:
	nop			;9886
L_9887:
	call L_98D6		;9887
L_988A:
	ld a,(0e18bh)		;988a
	and a			;988d
	jp nz,0a8bdh		;988e
	ld a,(iy+004h)		;9891
	cp 019h		;9894
	ret z			;9896
	ld b,09dh		;9897
	ld a,(0e020h)		;9899
	and a			;989c
	jr z,L_98A1		;989d
	ld b,0adh		;989f
L_98A1:
	ld a,(iy+000h)		;98a1
	cp b			;98a4
	jp nc,0a8bdh		;98a5
	cp 001h		;98a8
	jp c,0a8bdh		;98aa
	ld a,(iy+001h)		;98ad
	cp 0f0h		;98b0
	jp nc,0a8bdh		;98b2
	cp 004h		;98b5
	jp c,0a8bdh		;98b7
	ld hl,098d2h		;98ba
	ld a,(iy+004h)		;98bd
	cp 022h		;98c0
	jr z,L_98CB		;98c2
	call 05a68h		;98c4
	ret nc			;98c7
	jp 0a8bdh		;98c8
L_98CB:
	call 05a68h		;98cb
	ret nc			;98ce
	jp 0a8bdh		;98cf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x98d2..0x98d6  (4 bytes)
DATA_98D2:
	defb 004h,004h,006h,004h	; 98d2

; ======================================================================
; CODIGO 0x98d6..0x992c  (86 bytes)
; ======================================================================


L_98D6:
	ld a,(iy+005h)		;98d6
	and a			;98d9
	jr nz,L_98F0		;98da
	ld bc,0a8d3h		;98dc
	call 05e45h		;98df
	ld (iy+005h),001h		;98e2
	ld a,(iy+008h)		;98e6
	call 05cb6h		;98e9
	ld (iy+007h),088h		;98ec
L_98F0:
	ld a,(iy+004h)		;98f0
	cp 01fh		;98f3
	jr z,L_990A		;98f5
	ld a,(0e032h)		;98f7
	and a			;98fa
	jr z,L_9902		;98fb
	call 05ccch		;98fd
	jr L_990D		;9900
L_9902:
	rrc (iy+007h)		;9902
	ret c			;9906
	jp 05ccch		;9907
L_990A:
	call 05ccch		;990a
L_990D:
	rrc (iy+007h)		;990d
	ret nc			;9911
	jp 05ccch		;9912
L_9915:
	inc (iy+00ch)		;9915
	cp (iy+00ch)		;9918
	ret nc			;991b
	ld (iy+00ch),000h		;991c
	ret			;9920
L_9921:
	inc iy		;9921
	call L_9915		;9923
	dec iy		;9926
	ret			;9928
L_9929:
	call 0a03eh		;9929

; ----------------------------------------------------------------------
; DATOS sin identificar  0x992c..0x993c  (16 bytes)
DATA_992C:
	defb 03ch,099h,04bh,099h,072h,099h,09ah,099h,02eh,09fh,02eh,09fh,02eh,09fh,02eh,09fh	; 992c  <.K.r...........

; ======================================================================
; CODIGO 0x993c..0x9a14  (216 bytes)
; ======================================================================


L_993C:
	inc (iy+005h)		;993c
	call L_9A24		;993f
	ld bc,09d20h		;9942
	call 05e15h		;9945
	jp L_99F5		;9948
L_994B:
	ld a,(iy+001h)		;994b
	cp (ix+001h)		;994e
	jr nc,L_9959		;9951
	ld (iy+008h),001h		;9953
	jr L_995D		;9957
L_9959:
	ld (iy+008h),0ffh		;9959
L_995D:
	ld a,(iy+000h)		;995d
	cp (ix+000h)		;9960
	jr c,L_9969		;9963
	ld a,0ffh		;9965
	jr L_996B		;9967
L_9969:
	ld a,001h		;9969
L_996B:
	ld (iy+009h),a		;996b
	inc (iy+005h)		;996e
	ret			;9971
L_9972:
	bit 7,(iy+008h)		;9972
	jr nz,L_9985		;9976
	inc (iy+00bh)		;9978
	ld a,(iy+00bh)		;997b
	cp 0f0h		;997e
	jp nc,0a889h		;9980
	jr L_9993		;9983
L_9985:
	dec (iy+00bh)		;9985
	ld a,(iy+00bh)		;9988
	cp 004h		;998b
	jp c,0a889h		;998d
	ld (iy+001h),a		;9990
L_9993:
	ld a,028h		;9993
	call 0a869h		;9995
	jr L_99F5		;9998
L_999A:
	bit 7,(iy+009h)		;999a
	jr nz,L_99B5		;999e
	ld a,(iy+00ah)		;99a0
	cp 078h		;99a3
	jp nc,L_99E5		;99a5
	inc (iy+00ah)		;99a8
	ld a,(iy+00ah)		;99ab
	cp 0b0h		;99ae
	jp nc,0a889h		;99b0
	jr L_99C0		;99b3
L_99B5:
	dec (iy+00ah)		;99b5
	ld a,(iy+00ah)		;99b8
	cp 001h		;99bb
	jp c,0a889h		;99bd
L_99C0:
	cp (ix+00ah)		;99c0
	jr nc,L_99E5		;99c3
	ld a,010h		;99c5
	call L_9921		;99c7
	jr nc,L_99E5		;99ca
	call 05d1dh		;99cc
	ld (iy+007h),a		;99cf
	ld hl,00000h		;99d2
	ld bc,0f425h		;99d5
	call L_8383		;99d8
	jr nc,L_99E5		;99db
	ld de,00008h		;99dd
	add hl,de			;99e0
	ld a,(iy+007h)		;99e1
	ld (hl),a			;99e4
L_99E5:
	ld a,020h		;99e5
	ld b,001h		;99e7
	call 0a871h		;99e9
	call L_9915		;99ec
	jr nc,L_99F5		;99ef
	ld (iy+005h),001h		;99f1
L_99F5:
	ld hl,09a14h		;99f5
	bit 7,(iy+008h)		;99f8
	jr z,L_9A02		;99fc
	ld de,00008h		;99fe
	add hl,de			;9a01
L_9A02:
	ld a,(iy+026h)		;9a02
	and 003h		;9a05
	ld e,a			;9a07
	sla e		;9a08
	ld d,000h		;9a0a
	add hl,de			;9a0c
	ld e,(hl)			;9a0d
	inc hl			;9a0e
	ld d,(hl)			;9a0f
	ex de,hl			;9a10
	jp L_9FA1		;9a11

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9a14..0x9a24  (16 bytes)
DATA_9A14:
	defb 0c8h,0a9h,0ceh,0a9h,0d4h,0a9h,0dah,0a9h,0e0h,0a9h,0e6h,0a9h,0ech,0a9h,0f2h,0a9h	; 9a14  ................

; ======================================================================
; CODIGO 0x9a24..0x9a34  (16 bytes)
; ======================================================================


L_9A24:
	ld a,(iy+001h)		;9a24
	ld (iy+00bh),a		;9a27
	ld a,(iy+000h)		;9a2a
	ld (iy+00ah),a		;9a2d
	ret			;9a30
L_9A31:
	call 0a03eh		;9a31

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9a34..0x9a3c  (8 bytes)
DATA_9A34:
	defb 03ch,09ah,053h,09ah,061h,09ah,085h,09ah	; 9a34  <.S.a...

; ======================================================================
; CODIGO 0x9a3c..0x9acc  (144 bytes)
; ======================================================================


L_9A3C:
	ld (iy+005h),003h		;9a3c
	ld (iy+002h),044h		;9a40
	ld (iy+012h),048h		;9a44
	ld bc,09ad0h		;9a48
	call 05e31h		;9a4b
	call L_9ABF		;9a4e
	jr L_9A8C		;9a51
L_9A53:
	call 05d1dh		;9a53
	ld (iy+008h),a		;9a56
	call 05cb6h		;9a59
	inc (iy+005h)		;9a5c
	jr L_9A8C		;9a5f
L_9A61:
	call L_98D6		;9a61
	call L_98D6		;9a64
	call L_9ABF		;9a67
	cp 010h		;9a6a
	jr c,L_9A7F		;9a6c
	cp 090h		;9a6e
	jr nc,L_9A7F		;9a70
	ld a,(iy+001h)		;9a72
	cp 020h		;9a75
	jr c,L_9A7F		;9a77
	cp 0e0h		;9a79
	jr nc,L_9A7F		;9a7b
	jr L_9A8C		;9a7d
L_9A7F:
	ld (iy+005h),003h		;9a7f
	jr L_9A8C		;9a83
L_9A85:
	ld a,030h		;9a85
	ld b,001h		;9a87
	call 0a871h		;9a89
L_9A8C:
	ld a,0c8h		;9a8c
	inc (iy+01dh)		;9a8e
	bit 4,(iy+01dh)		;9a91
	jr z,L_9A99		;9a95
	ld a,0d0h		;9a97
L_9A99:
	ld (iy+002h),a		;9a99
	add a,004h		;9a9c
	ld (iy+012h),a		;9a9e
	ld hl,09acch		;9aa1
	push hl			;9aa4
	call 05a68h		;9aa5
	pop hl			;9aa8
	call 05af8h		;9aa9
	ret nc			;9aac
	inc (iy+00bh)		;9aad
	ld a,(iy+00bh)		;9ab0
	cp 003h		;9ab3
	ret c			;9ab5
	call L_8564		;9ab6
	call L_813B		;9ab9
	jp 0a0ffh		;9abc
L_9ABF:
	ld a,(iy+001h)		;9abf
	ld (iy+011h),a		;9ac2
	ld a,(iy+000h)		;9ac5
	ld (iy+010h),a		;9ac8
	ret			;9acb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9acc..0x9ad2  (6 bytes)
DATA_9ACC:
	defb 010h,010h,000h,010h,008h,067h	; 9acc

; ======================================================================
; CODIGO 0x9ad2..0x9adb  (9 bytes)
; ======================================================================


L_9AD2:
	jp 0a889h		;9ad2
L_9AD5:
	jp 0a889h		;9ad5
L_9AD8:
	call 0a03eh		;9ad8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9adb..0x9ae5  (10 bytes)
DATA_9ADB:
	defb 0e5h,09ah,004h,09bh,019h,09bh,057h,09bh,067h,09bh	; 9adb  ......W.g.

; ======================================================================
; CODIGO 0x9ae5..0x9ba8  (195 bytes)
; ======================================================================


L_9AE5:
	inc (iy+005h)		;9ae5
	ld (iy+002h),0d8h		;9ae8
	ld (iy+012h),0dch		;9aec
	call L_9A24		;9af0
	ld a,(iy+000h)		;9af3
	add a,00fh		;9af6
	ld (iy+00ah),a		;9af8
	ld bc,0a8ddh		;9afb
	call 05e31h		;9afe
	call L_9ABF		;9b01
L_9B04:
	inc (iy+005h)		;9b04
	ld (iy+008h),001h		;9b07
	ld a,(iy+001h)		;9b0b
	cp (ix+001h)		;9b0e
	jr c,L_9B7F		;9b11
	ld (iy+008h),0ffh		;9b13
	jr L_9B7F		;9b17
L_9B19:
	inc (iy+009h)		;9b19
	ld a,(iy+009h)		;9b1c
	cp 020h		;9b1f
	jr c,L_9B2C		;9b21
	ld (iy+009h),000h		;9b23
	ld (iy+005h),001h		;9b27
	ret			;9b2b
L_9B2C:
	bit 7,(iy+008h)		;9b2c
	jr nz,L_9B3C		;9b30
	call 05e5ch		;9b32
	jr nc,L_9B44		;9b35
	call 05e7bh		;9b37
	jr L_9B44		;9b3a
L_9B3C:
	call 05e66h		;9b3c
	jr nc,L_9B44		;9b3f
	call 05e96h		;9b41
L_9B44:
	ld a,(iy+00bh)		;9b44
	ld (iy+001h),a		;9b47
	ld (iy+011h),a		;9b4a
	cp (ix+001h)		;9b4d
	jr nz,L_9B7F		;9b50
	inc (iy+005h)		;9b52
	jr L_9B7F		;9b55
L_9B57:
	ld hl,00000h		;9b57
	ld bc,0f429h		;9b5a
	call L_8383		;9b5d
	jr nc,L_9B7F		;9b60
	inc (iy+005h)		;9b62
	jr L_9B7F		;9b65
L_9B67:
	ld a,010h		;9b67
	call L_9915		;9b69
	jr nc,L_9B7F		;9b6c
	ld a,(iy+001h)		;9b6e
	cp (ix+001h)		;9b71
	jr nz,L_9B7B		;9b74
	ld (iy+005h),003h		;9b76
	ret			;9b7a
L_9B7B:
	ld (iy+005h),001h		;9b7b
L_9B7F:
	ld a,(iy+001h)		;9b7f
	cp 0f0h		;9b82
	jp nc,0a8a9h		;9b84
	cp 004h		;9b87
	jp c,0a8a9h		;9b89
	ld hl,09ba8h		;9b8c
	call 05a68h		;9b8f
	ld hl,09ba8h		;9b92
	call 05af8h		;9b95
	ret nc			;9b98
	inc (iy+00bh)		;9b99
	ld a,(iy+00bh)		;9b9c
	cp 006h		;9b9f
	ret c			;9ba1
	call 054dah		;9ba2
	jp 0a0ffh		;9ba5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ba8..0x9bac  (4 bytes)
DATA_9BA8:
	defb 00eh,00ch,002h,00ch	; 9ba8

; ======================================================================
; CODIGO 0x9bac..0x9baf  (3 bytes)
; ======================================================================


L_9BAC:
	call 0a03eh		;9bac

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9baf..0x9bbf  (16 bytes)
DATA_9BAF:
	defb 0cbh,054h,024h,09dh,09dh,09eh,0a5h,09eh,00ah,09fh,024h,09dh,012h,09fh,021h,09fh	; 9baf  .T$.......$...!.

; ======================================================================
; CODIGO 0x9bbf..0x9bc2  (3 bytes)
; ======================================================================


L_9BBF:
	call 0a03eh		;9bbf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9bc2..0x9bca  (8 bytes)
DATA_9BC2:
	defb 0cah,09bh,0e1h,09bh,004h,09ch,02fh,09ch	; 9bc2  ....../.

; ======================================================================
; CODIGO 0x9bca..0x9c70  (166 bytes)
; ======================================================================


L_9BCA:
	inc (iy+005h)		;9bca
	call L_9A24		;9bcd
	ld a,r		;9bd0
	and 00fh		;9bd2
	add a,010h		;9bd4
	ld (iy+007h),a		;9bd6
	ld bc,09c74h		;9bd9
	call 05e15h		;9bdc
	jr L_9C38		;9bdf
L_9BE1:
	ld a,(iy+008h)		;9be1
	add a,(iy+00bh)		;9be4
	ld (iy+00bh),a		;9be7
	cp 060h		;9bea
	jp c,0a889h		;9bec
	cp 098h		;9bef
	jp nc,0a889h		;9bf1
	dec (iy+007h)		;9bf4
	jr nz,L_9C38		;9bf7
	inc (iy+005h)		;9bf9
	ld hl,0a96eh		;9bfc
	call 0a01ah		;9bff
	jr L_9C59		;9c02
L_9C04:
	ld a,010h		;9c04
	call L_9921		;9c06
	jr nc,L_9C59		;9c09
	call 05d1dh		;9c0b
	ld (iy+00eh),a		;9c0e
	ld hl,000f8h		;9c11
	ld c,025h		;9c14
	ld b,0f4h		;9c16
	call L_8383		;9c18
	jr nc,L_9C59		;9c1b
	ld a,(iy+00eh)		;9c1d
	push ix		;9c20
	push hl			;9c22
	pop ix		;9c23
	ld (ix+008h),a		;9c25
	pop ix		;9c28
	inc (iy+005h)		;9c2a
	jr L_9C59		;9c2d
L_9C2F:
	ld a,008h		;9c2f
	ld b,001h		;9c31
	call 0a871h		;9c33
	jr L_9C59		;9c36
L_9C38:
	bit 7,(iy+008h)		;9c38
	jr z,L_9C46		;9c3c
	ld hl,0a962h		;9c3e
	ld de,0a968h		;9c41
	jr L_9C4C		;9c44
L_9C46:
	ld hl,0a956h		;9c46
	ld de,0a95ch		;9c49
L_9C4C:
	inc (iy+009h)		;9c4c
	bit 2,(iy+009h)		;9c4f
	jr z,L_9C56		;9c53
	ex de,hl			;9c55
L_9C56:
	call 0a01ah		;9c56
L_9C59:
	ld hl,09c70h		;9c59
	call 05af8h		;9c5c
	ret nc			;9c5f
	ld a,0f8h		;9c60
	add a,(iy+000h)		;9c62
	ld (iy+000h),a		;9c65
	ld a,020h		;9c68
	call 05f33h		;9c6a
	jp L_9F2E		;9c6d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9c70..0x9c78  (8 bytes)
DATA_9C70:
	defb 010h,018h,002h,00ch,00bh,06ch,00bh,06ch	; 9c70  .....l.l

; ======================================================================
; CODIGO 0x9c78..0x9ceb  (115 bytes)
; ======================================================================


L_9C78:
	ld a,(iy+005h)		;9c78
	and a			;9c7b
	jp nz,L_9C97		;9c7c
	inc (iy+005h)		;9c7f
	ld bc,0a8e5h		;9c82
	call 05e15h		;9c85
	ld (iy+008h),008h		;9c88
	ld a,004h		;9c8c
	call 05c75h		;9c8e
	ld hl,0a9b0h		;9c91
	call L_9FA1		;9c94
L_9C97:
	ld a,(iy+005h)		;9c97
	cp 001h		;9c9a
	jr nz,L_9CA9		;9c9c
	call 05ecdh		;9c9e
	jr c,L_9CB8		;9ca1
	ld (iy+005h),002h		;9ca3
	jr L_9CB8		;9ca7
L_9CA9:
	call 05e96h		;9ca9
	inc (iy+007h)		;9cac
	ld hl,0a9b6h		;9caf
	bit 3,(iy+007h)		;9cb2
	jr z,L_9CBB		;9cb6
L_9CB8:
	ld hl,0a9b0h		;9cb8
L_9CBB:
	call L_9FA1		;9cbb
	call 0a7f1h		;9cbe
	ret nc			;9cc1
	jp L_9FC1		;9cc2
L_9CC5:
	ld a,(iy+005h)		;9cc5
	and a			;9cc8
	jr nz,L_9CE3		;9cc9
	ld (iy+005h),081h		;9ccb
	call L_9A24		;9ccf
	call 05e24h		;9cd2
	ld a,r		;9cd5
	and 01fh		;9cd7
	add a,010h		;9cd9
	ld (iy+007h),a		;9cdb
	ld bc,09d1ch		;9cde
	jr $+45		;9ce1
L_9CE3:
	ld e,(iy+005h)		;9ce3
	res 7,e		;9ce6
	call 0a041h		;9ce8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ceb..0x9cfb  (16 bytes)
DATA_9CEB:
	defb 0fbh,09ch,024h,09dh,09dh,09eh,0a5h,09eh,00ah,09fh,024h,09dh,012h,09fh,021h,09fh	; 9ceb  ..$.......$...!.

; ======================================================================
; CODIGO 0x9cfb..0x9d18  (29 bytes)
; ======================================================================


L_9CFB:
	ld (iy+005h),081h		;9cfb
	call L_9A24		;9cff
	ld a,r		;9d02
	and 03fh		;9d04
	set 3,a		;9d06
	ld (iy+019h),a		;9d08
	ld bc,09d18h		;9d0b
L_9D0E:
	call 05e15h		;9d0e
	set 0,(iy+008h)		;9d11
	jp L_9F6E		;9d15

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d18..0x9d24  (12 bytes)
DATA_9D18:
	defb 00bh,06ch,00dh,06eh,002h,069h,004h,069h,002h,063h,001h,063h	; 9d18  .l.n.i.i.c.c

; ======================================================================
; CODIGO 0x9d24..0x9ff1  (717 bytes)
; ======================================================================


L_9D24:
	bit 7,(iy+008h)		;9d24
	jr z,L_9D2F		;9d28
	call 05e96h		;9d2a
	jr L_9D32		;9d2d
L_9D2F:
	call 05e7bh		;9d2f
L_9D32:
	ld a,(iy+016h)		;9d32
	and a			;9d35
	jr nz,L_9D9F		;9d36
	bit 7,(iy+005h)		;9d38
	jr nz,L_9D81		;9d3c
	ld a,(iy+001h)		;9d3e
	cp 020h		;9d41
	jr c,L_9D70		;9d43
	cp 0d0h		;9d45
	jr nc,L_9D70		;9d47
	bit 7,(iy+008h)		;9d49
	jr z,L_9D54		;9d4d
	call 05e66h		;9d4f
	jr L_9D57		;9d52
L_9D54:
	call 05e5ch		;9d54
L_9D57:
	jr c,L_9D70		;9d57
	ld a,(iy+004h)		;9d59
	cp 001h		;9d5c
	jr nz,L_9D8E		;9d5e
	ld a,r		;9d60
	and 007h		;9d62
	cp 003h		;9d64
	jr nc,L_9D8E		;9d66
	ld a,(iy+008h)		;9d68
	neg		;9d6b
	ld (iy+008h),a		;9d6d
L_9D70:
	ld a,(iy+004h)		;9d70
	cp 017h		;9d73
	jp z,L_9F6E		;9d75
	dec (iy+019h)		;9d78
	jp z,L_9E4A		;9d7b
	jp L_9E11		;9d7e
L_9D81:
	call 05ecdh		;9d81
	jp c,L_9E23		;9d84
	res 7,(iy+005h)		;9d87
	jp L_9E11		;9d8b
L_9D8E:
	ld a,(iy+000h)		;9d8e
	cp 0a8h		;9d91
	jr c,L_9D97		;9d93
	jr L_9DC0		;9d95
L_9D97:
	ld (iy+016h),001h		;9d97
	ld (iy+017h),000h		;9d9b
L_9D9F:
	inc (iy+018h)		;9d9f
	ld a,(iy+018h)		;9da2
	cp 002h		;9da5
	jr c,L_9E23		;9da7
	ld (iy+018h),000h		;9da9
	ld a,(iy+016h)		;9dad
	cp 001h		;9db0
	jr nz,L_9DC0		;9db2
	call 0a04ch		;9db4
	ld a,(iy+00ah)		;9db7
	sub b			;9dba
	ld (iy+00ah),a		;9dbb
	jr L_9E23		;9dbe
L_9DC0:
	call 0a079h		;9dc0
	ld a,b			;9dc3
	and a			;9dc4
	jr z,L_9E23		;9dc5
L_9DC7:
	push bc			;9dc7
	call 05ecdh		;9dc8
	pop bc			;9dcb
	jr nc,L_9DD2		;9dcc
	djnz L_9DC7		;9dce
	jr L_9E23		;9dd0
L_9DD2:
	ld (iy+016h),000h		;9dd2
	ld (iy+017h),000h		;9dd6
	ld a,03bh		;9dda
	call 05052h		;9ddc
	ld a,(iy+004h)		;9ddf
	cp 017h		;9de2
	jr nz,L_9DF0		;9de4
	ld a,r		;9de6
	and 003h		;9de8
	jr nz,L_9DF0		;9dea
	ld (iy+005h),002h		;9dec
L_9DF0:
	ld a,(0e020h)		;9df0
	cp 005h		;9df3
	jr nz,L_9DFF		;9df5
	ld a,(iy+00ah)		;9df7
	cp 090h		;9dfa
	jp c,L_9E11		;9dfc
L_9DFF:
	ld a,(iy+00bh)		;9dff
	cp (ix+00bh)		;9e02
	jr nc,L_9E0D		;9e05
	ld (iy+008h),001h		;9e07
	jr L_9E11		;9e0b
L_9E0D:
	ld (iy+008h),0ffh		;9e0d
L_9E11:
	jp L_9F6E		;9e11
L_9E14:
	ld (iy+016h),000h		;9e14
	call 05ecdh		;9e18
	jr nc,L_9E23		;9e1b
	res 7,(iy+005h)		;9e1d
	jr L_9E11		;9e21
L_9E23:
	ld a,(iy+004h)		;9e23
	cp 001h		;9e26
	jr z,L_9E3C		;9e28
	cp 017h		;9e2a
	jr z,L_9E3C		;9e2c
	ld hl,0a986h		;9e2e
	bit 7,(iy+008h)		;9e31
	jr nz,L_9E48		;9e35
	ld hl,0a97ah		;9e37
	jr L_9E48		;9e3a
L_9E3C:
	ld hl,0a8ffh		;9e3c
	bit 7,(iy+008h)		;9e3f
	jr nz,L_9E48		;9e43
	ld hl,0a8f3h		;9e45
L_9E48:
	jr L_9E57		;9e48
L_9E4A:
	bit 7,(iy+005h)		;9e4a
	jr nz,L_9E14		;9e4e
	cp 001h		;9e50
	jr z,L_9E5A		;9e52
	ld hl,0a923h		;9e54
L_9E57:
	jp L_9FA1		;9e57
L_9E5A:
	call 05d1dh		;9e5a
	ld (iy+026h),a		;9e5d
	call 05c48h		;9e60
	ld a,b			;9e63
	and a			;9e64
	jr z,L_9E91		;9e65
	ld a,c			;9e67
	ld hl,0a905h		;9e68
	bit 4,(iy+026h)		;9e6b
	jr z,L_9E75		;9e6f
	ld de,00012h		;9e71
	add hl,de			;9e74
L_9E75:
	and 00ch		;9e75
	jr z,L_9E91		;9e77
	cp 004h		;9e79
	jr z,L_9E86		;9e7b
	ld de,00006h		;9e7d
	add hl,de			;9e80
	cp 008h		;9e81
	jr z,L_9E86		;9e83
	add hl,de			;9e85
L_9E86:
	ld (iy+005h),002h		;9e86
	ld (iy+00dh),000h		;9e8a
	jp L_9FA1		;9e8e
L_9E91:
	ld a,r		;9e91
	and 01fh		;9e93
	set 2,a		;9e95
	ld (iy+007h),a		;9e97
	jp L_9F6E		;9e9a
L_9E9D:
	ld a,020h		;9e9d
	call 0a879h		;9e9f
	jp L_9FA4		;9ea2
L_9EA5:
	ld a,(iy+004h)		;9ea5
	cp 001h		;9ea8
	jr z,L_9ED8		;9eaa
	cp 017h		;9eac
	jr z,L_9EBE		;9eae
	ld hl,00000h		;9eb0
	ld bc,0e80ah		;9eb3
	call L_8383		;9eb6
	ld hl,0a98ch		;9eb9
	jr L_9ECA		;9ebc
L_9EBE:
	ld hl,00000h		;9ebe
	ld bc,0e80ah		;9ec1
	call L_8383		;9ec4
	ld hl,0a9bch		;9ec7
L_9ECA:
	ld (iy+005h),004h		;9eca
	ld (iy+00dh),000h		;9ece
	ld hl,0a9bch		;9ed2
	jp L_9FA1		;9ed5
L_9ED8:
	push ix		;9ed8
	call L_847E		;9eda
	jr c,L_9EFE		;9edd
	ld e,(iy+026h)		;9edf
	srl e		;9ee2
	srl e		;9ee4
	ld hl,0a0c0h		;9ee6
	call L_8713		;9ee9
	ld (ix+004h),01fh		;9eec
	ld (ix+005h),000h		;9ef0
	ld (ix+002h),0f4h		;9ef4
	ld a,(iy+026h)		;9ef8
	ld (ix+008h),a		;9efb
L_9EFE:
	pop ix		;9efe
	ld (iy+005h),004h		;9f00
	ld (iy+00dh),000h		;9f04
	jr L_9F0F		;9f08
L_9F0A:
	ld a,008h		;9f0a
	call 0a869h		;9f0c
L_9F0F:
	jp L_9FA4		;9f0f
L_9F12:
	dec (iy+00ah)		;9f12
	dec (iy+00ah)		;9f15
	ld a,008h		;9f18
	ld b,007h		;9f1a
	call 0a881h		;9f1c
	jr L_9F51		;9f1f
L_9F21:
	inc (iy+00ah)		;9f21
	inc (iy+00ah)		;9f24
	ld a,008h		;9f27
	call L_9921		;9f29
	jr nc,L_9F51		;9f2c
L_9F2E:
	ld a,(iy+00ah)		;9f2e
	sub 028h		;9f31
	ld (iy+00ah),a		;9f33
	ld (iy+005h),000h		;9f36
	ld (iy+004h),00bh		;9f3a
	ld (iy+002h),018h		;9f3e
	ld a,030h		;9f42
	call 05052h		;9f44
	ld a,(0e5c3h)		;9f47
	inc a			;9f4a
	ld (0e5c3h),a		;9f4b
	jp 0a88fh		;9f4e
L_9F51:
	ld a,(iy+004h)		;9f51
	cp 013h		;9f54
	jr z,L_9F5D		;9f56
	ld hl,0a8edh		;9f58
	jr L_9F60		;9f5b
L_9F5D:
	ld hl,0a974h		;9f5d
L_9F60:
	ld a,(iy+008h)		;9f60
	cp 001h		;9f63
	jr z,L_9F6B		;9f65
	ld de,0000ch		;9f67
	add hl,de			;9f6a
L_9F6B:
	jp 0a01ah		;9f6b
L_9F6E:
	ld a,(iy+004h)		;9f6e
	cp 001h		;9f71
	jr z,L_9F87		;9f73
	cp 017h		;9f75
	jr z,L_9F87		;9f77
	cp 013h		;9f79
	jr z,L_9F82		;9f7b
	ld hl,0a992h		;9f7d
	jr L_9F8A		;9f80
L_9F82:
	ld hl,0a974h		;9f82
	jr L_9F8A		;9f85
L_9F87:
	ld hl,0a8edh		;9f87
L_9F8A:
	bit 7,(iy+008h)		;9f8a
	jr z,L_9F94		;9f8e
	ld de,0000ch		;9f90
	add hl,de			;9f93
L_9F94:
	inc (iy+00dh)		;9f94
	bit 2,(iy+00dh)		;9f97
	jr nz,L_9FA1		;9f9b
	ld de,00006h		;9f9d
	add hl,de			;9fa0
L_9FA1:
	call 0a01ah		;9fa1
L_9FA4:
	ld a,(0e020h)		;9fa4
	and a			;9fa7
	jr z,L_9FB8		;9fa8
	cp 00ah		;9faa
	jr z,L_9FB4		;9fac
	cp 010h		;9fae
	jr z,L_9FB4		;9fb0
	jr L_9FC1		;9fb2
L_9FB4:
	ld b,0aah		;9fb4
	jr L_9FBC		;9fb6
L_9FB8:
	ld b,0a1h		;9fb8
	jr L_9FBC		;9fba
L_9FBC:
	call 0a7f3h		;9fbc
	jr L_9FC4		;9fbf
L_9FC1:
	call 0a7f1h		;9fc1
L_9FC4:
	ret nc			;9fc4
	ld hl,09ff1h		;9fc5
	push hl			;9fc8
	ld a,(iy+004h)		;9fc9
	cp 015h		;9fcc
	push af			;9fce
	call z,05a68h		;9fcf
	pop af			;9fd2
	call nz,05a5ah		;9fd3
	pop hl			;9fd6
	call 05af8h		;9fd7
	ret nc			;9fda
	ld (iy+00dh),000h		;9fdb
	ld (iy+005h),006h		;9fdf
	ld a,010h		;9fe3
	call 05f33h		;9fe5
	ld a,(iy+004h)		;9fe8
	cp 015h		;9feb
	ret nz			;9fed
	jp L_9F2E		;9fee

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ff1..0x9ff5  (4 bytes)
DATA_9FF1:
	defb 008h,01eh,002h,00ch	; 9ff1

; ======================================================================
; CODIGO 0x9ff5..0x9ffe  (9 bytes)
; ======================================================================


L_9FF5:
	ld a,010h		;9ff5
	jp 05f33h		;9ff7
L_9FFA:
	ld a,(hl)			;9ffa
	defb 0fdh,086h,00ah		;9ffb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ffe..0xa000  (2 bytes)
DATA_9FFE:
	defb 0fdh,077h	; 9ffe
