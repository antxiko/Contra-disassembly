; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x6124  (292 bytes)
; ======================================================================


L_6000:
	jp L_6009		;6000
L_6003:
	jp L_603D		;6003
L_6006:
	jp L_6287		;6006
L_6009:
	ld a,001h		;6009
	call L_603D		;600b
	ld a,0ffh		;600e
	ld hl,0c1ebh		;6010
	ld (hl),a			;6013
	inc hl			;6014
	ld (hl),a			;6015
	inc hl			;6016
	ld de,0c1eeh		;6017
	ld (hl),001h		;601a
	ld bc,0000eh		;601c
	ldir		;601f
	call L_6CDA		;6021
	ld a,03fh		;6024
	ld (09000h),a		;6026
	xor a			;6029
	ld (0988fh),a		;602a
	ld a,002h		;602d
	ld (09000h),a		;602f
	ld a,0bfh		;6032
	ld (0c1e3h),a		;6034
	ld e,a			;6037
	ld a,007h		;6038
	jp 00093h		;603a   ; BIOS WRTPSG - Writes data to PSG-register
L_603D:
	ld c,a			;603d
	cp 082h		;603e
	jp z,L_6163		;6040
	cp 083h		;6043
	jp z,L_616A		;6045
	cp 084h		;6048
	jp z,L_6175		;604a
	cp 080h		;604d
	jp z,L_618C		;604f
	cp 081h		;6052
	call z,L_61F0		;6054
	ld hl,0c1cch		;6057
	ld (hl),c			;605a
	ld hl,06e12h		;605b
	ld a,c			;605e
	add a,c			;605f
	ld e,a			;6060
	ld d,000h		;6061
	add hl,de			;6063
	ld e,(hl)			;6064
	inc hl			;6065
	ld d,(hl)			;6066
	ex de,hl			;6067
	ld de,0c1cdh		;6068
	ld bc,00012h		;606b
	ldir		;606e
	ld ix,0c1cfh		;6070
	ld hl,0c1cdh		;6074
	bit 7,(hl)		;6077
	jr z,L_6087		;6079
	inc hl			;607b
	ld a,(hl)			;607c
	ld hl,0c001h		;607d
	call L_6104		;6080
	inc ix		;6083
	inc ix		;6085
L_6087:
	ld hl,0c1cdh		;6087
	bit 6,(hl)		;608a
	jr z,L_609A		;608c
	inc hl			;608e
	ld a,(hl)			;608f
	ld hl,0c034h		;6090
	call L_6104		;6093
	inc ix		;6096
	inc ix		;6098
L_609A:
	ld hl,0c1cdh		;609a
	bit 5,(hl)		;609d
	jr z,L_60AD		;609f
	inc hl			;60a1
	ld a,(hl)			;60a2
	ld hl,0c067h		;60a3
	call L_6104		;60a6
	inc ix		;60a9
	inc ix		;60ab
L_60AD:
	ld hl,0c1cdh		;60ad
	bit 4,(hl)		;60b0
	jr z,L_60C0		;60b2
	inc hl			;60b4
	ld a,(hl)			;60b5
	ld hl,0c09ah		;60b6
	call L_6104		;60b9
	inc ix		;60bc
	inc ix		;60be
L_60C0:
	ld hl,0c1cdh		;60c0
	bit 3,(hl)		;60c3
	jr z,L_60D3		;60c5
	inc hl			;60c7
	ld a,(hl)			;60c8
	ld hl,0c0cdh		;60c9
	call L_6104		;60cc
	inc ix		;60cf
	inc ix		;60d1
L_60D3:
	ld hl,0c1cdh		;60d3
	bit 2,(hl)		;60d6
	jr z,L_60E6		;60d8
	inc hl			;60da
	ld a,(hl)			;60db
	ld hl,0c100h		;60dc
	call L_6104		;60df
	inc ix		;60e2
	inc ix		;60e4
L_60E6:
	ld hl,0c1cdh		;60e6
	bit 1,(hl)		;60e9
	jr z,L_60F9		;60eb
	inc hl			;60ed
	ld a,(hl)			;60ee
	ld hl,0c133h		;60ef
	call L_6104		;60f2
	inc ix		;60f5
	inc ix		;60f7
L_60F9:
	ld hl,0c1cdh		;60f9
	bit 0,(hl)		;60fc
	ret z			;60fe
	inc hl			;60ff
	ld a,(hl)			;6100
	ld hl,0c166h		;6101
L_6104:
	ld b,(hl)			;6104
	cp b			;6105
	ret c			;6106
	ex de,hl			;6107
	ld (de),a			;6108
	dec de			;6109
	ld hl,0c1cch		;610a
	ld a,(hl)			;610d
	ld (de),a			;610e
	inc de			;610f
	inc de			;6110
	ld a,(ix+000h)		;6111
	ld (de),a			;6114
	inc de			;6115
	ld a,(ix+001h)		;6116
	ld (de),a			;6119
	inc de			;611a
	ld hl,06124h		;611b
	ld bc,0002eh		;611e
	ldir		;6121
	ret			;6123

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6124..0x6163  (63 bytes)
DATA_6124:
	defb 001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6124  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6134  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,021h	; 6144  ...............!
	defb 0cbh,0c1h,0cbh,0e6h,0cbh,086h,021h,0e1h,0c1h,036h,000h,023h,036h,009h,0c9h	; 6154  ......!..6.#6..

; ======================================================================
; CODIGO 0x6163..0x6405  (674 bytes)
; ======================================================================


L_6163:
	ld hl,0c1cbh		;6163
	res 0,(hl)		;6166
	jr L_6184		;6168
L_616A:
	ld hl,0c1dfh		;616a
	ld (hl),025h		;616d
	inc hl			;616f
	ld (hl),00ah		;6170
	jp L_617D		;6172
L_6175:
	ld hl,0c1dfh		;6175
	ld (hl),025h		;6178
	inc hl			;617a
	ld (hl),00ah		;617b
L_617D:
	ld hl,0c1cbh		;617d
	set 0,(hl)		;6180
	res 4,(hl)		;6182
L_6184:
	ld hl,0c1e1h		;6184
	xor a			;6187
	ld (hl),a			;6188
	inc hl			;6189
	ld (hl),a			;618a
	ret			;618b
L_618C:
	ld hl,0c1cbh		;618c
	bit 1,(hl)		;618f
	ld b,000h		;6191
	jr nz,L_6197		;6193
	ld b,001h		;6195
L_6197:
	res 1,(hl)		;6197
	bit 3,(hl)		;6199
	jr z,L_61A1		;619b
	res 3,(hl)		;619d
	set 0,(hl)		;619f
L_61A1:
	ld hl,0c198h		;61a1
	ld de,0c099h		;61a4
	call L_6281		;61a7
	ld a,(0c00dh)		;61aa
	ld e,a			;61ad
	ld a,(0c1feh)		;61ae
	and 00fh		;61b1
	or e			;61b3
	ld (0c00dh),a		;61b4
	ld a,(0c040h)		;61b7
	ld e,a			;61ba
	ld a,(0c1feh)		;61bb
	and 0f0h		;61be
	rrca			;61c0
	rrca			;61c1
	rrca			;61c2
	rrca			;61c3
	or e			;61c4
	ld (0c040h),a		;61c5
	ld a,(0c073h)		;61c8
	ld e,a			;61cb
	ld a,(0c1ffh)		;61cc
	and 00fh		;61cf
	or e			;61d1
	ld (0c073h),a		;61d2
	ld a,03fh		;61d5
	ld (09000h),a		;61d7
	ld a,(0c1fch)		;61da
	ld (0988fh),a		;61dd
	ld a,002h		;61e0
	ld (09000h),a		;61e2
	ld a,0ffh		;61e5
	ld hl,0c1ebh		;61e7
	ld (hl),a			;61ea
	inc hl			;61eb
	ld (hl),a			;61ec
	jp L_6CDA		;61ed
L_61F0:
	ld hl,0c1cbh		;61f0
	bit 1,(hl)		;61f3
	ld b,000h		;61f5
	jr z,L_61FB		;61f7
	ld b,001h		;61f9
L_61FB:
	set 1,(hl)		;61fb
	bit 0,(hl)		;61fd
	jr z,L_6205		;61ff
	res 0,(hl)		;6201
	set 3,(hl)		;6203
L_6205:
	ld hl,0c099h		;6205
	ld de,0c198h		;6208
	call L_6281		;620b
	ld a,(0c00dh)		;620e
	ld d,a			;6211
	and 00fh		;6212
	ld (0c1feh),a		;6214
	ld a,d			;6217
	and 0f0h		;6218
	ld (0c00dh),a		;621a
	ld a,(0c040h)		;621d
	ld d,a			;6220
	and 00fh		;6221
	rlca			;6223
	rlca			;6224
	rlca			;6225
	rlca			;6226
	ld e,a			;6227
	ld a,(0c1feh)		;6228
	and e			;622b
	ld (0c1feh),a		;622c
	ld a,d			;622f
	and 0f0h		;6230
	ld (0c040h),a		;6232
	ld a,(0c073h)		;6235
	ld d,a			;6238
	and 00fh		;6239
	ld (0c1ffh),a		;623b
	ld a,d			;623e
	and 0f0h		;623f
	ld (0c073h),a		;6241
	ld a,(0c00ch)		;6244
	res 4,a		;6247
	ld (0c00ch),a		;6249
	ld a,(0c03fh)		;624c
	res 4,a		;624f
	ld (0c03fh),a		;6251
	ld a,(0c072h)		;6254
	res 4,a		;6257
	ld (0c072h),a		;6259
	ld a,03fh		;625c
	ld (09000h),a		;625e
	ld a,(0c1fch)		;6261
	and 0feh		;6264
	ld (0988fh),a		;6266
	xor a			;6269
	ld (0988bh),a		;626a
	ld (0988ch),a		;626d
	ld (0988dh),a		;6270
	ld (0988eh),a		;6273
	ld a,002h		;6276
	ld (09000h),a		;6278
	ld a,b			;627b
	or a			;627c
	ret nz			;627d
	ld c,038h		;627e
	ret			;6280
L_6281:
	ld bc,00033h		;6281
	ldir		;6284
	ret			;6286
L_6287:
	ld a,(0c1e3h)		;6287
	call L_6B59		;628a
	ld a,(0fda2h)		;628d
	ld hl,0c1fdh		;6290
	cp (hl)			;6293
	jr z,L_62BA		;6294
	ld ix,0c099h		;6296
	set 7,(ix+00fh)		;629a
	ld ix,0c0cch		;629e
	set 7,(ix+00fh)		;62a2
	ld ix,0c0ffh		;62a6
	set 7,(ix+00fh)		;62aa
	ld ix,0c132h		;62ae
	set 7,(ix+00fh)		;62b2
	ld a,(0fda2h)		;62b6
	ld (hl),a			;62b9
L_62BA:
	inc (hl)			;62ba
	ld a,(hl)			;62bb
	ld (0fda2h),a		;62bc
	ld hl,0c1cbh		;62bf
	bit 1,(hl)		;62c2
	jp nz,L_6343		;62c4
	ld a,(0c1cbh)		;62c7
	bit 0,a		;62ca
	call nz,L_66BE		;62cc
	ld a,(0c1cbh)		;62cf
	bit 4,a		;62d2
	call nz,L_6742		;62d4
	ld a,001h		;62d7
	ld (0c1e4h),a		;62d9
	ld ix,0c000h		;62dc
	call L_633B		;62e0
	ld a,002h		;62e3
	ld (0c1e4h),a		;62e5
	ld ix,0c033h		;62e8
	call L_633B		;62ec
	ld a,004h		;62ef
	ld (0c1e4h),a		;62f1
	ld ix,0c066h		;62f4
	call L_633B		;62f8
	ld a,008h		;62fb
	ld (0c1e4h),a		;62fd
	ld ix,0c099h		;6300
	call L_633B		;6304
	ld a,010h		;6307
	ld (0c1e4h),a		;6309
	ld ix,0c0cch		;630c
	call L_633B		;6310
	ld a,020h		;6313
	ld (0c1e4h),a		;6315
	ld ix,0c0ffh		;6318
	call L_633B		;631c
	ld a,040h		;631f
	ld (0c1e4h),a		;6321
	ld ix,0c132h		;6324
	call L_633B		;6328
	ld a,080h		;632b
	ld (0c1e4h),a		;632d
	ld ix,0c165h		;6330
	call L_633B		;6334
	call L_6A7E		;6337
	ret			;633a
L_633B:
	ld a,(ix+000h)		;633b
	or a			;633e
	call nz,L_635B		;633f
	ret			;6342
L_6343:
	ld a,008h		;6343
	ld (0c1e4h),a		;6345
	ld ix,0c099h		;6348
	call L_633B		;634c
	ld a,0bfh		;634f
	ld (0c1e3h),a		;6351
	call L_6882		;6354
	call L_6A7E		;6357
	ret			;635a
L_635B:
	dec (ix+004h)		;635b
	jp nz,L_6567		;635e
	ld l,(ix+002h)		;6361
	ld h,(ix+003h)		;6364
L_6367:
	ld a,(hl)			;6367
	cp 0ffh		;6368
	jp z,L_675A		;636a
	cp 0d0h		;636d
	jr c,L_6378		;636f
	call L_679B		;6371
	inc hl			;6374
	jp L_6367		;6375
L_6378:
	bit 0,(ix+009h)		;6378
	jp nz,L_638F		;637c
	bit 1,(ix+009h)		;637f
	jp nz,L_6412		;6383
	ld a,(ix+009h)		;6386
	and 01ch		;6389
	jp nz,L_648B		;638b
	ret			;638e
L_638F:
	ld a,(hl)			;638f
	and 00fh		;6390
	ld b,a			;6392
	ld a,(ix+014h)		;6393
	jr z,L_639C		;6396
	ld e,a			;6398
L_6399:
	add a,e			;6399
	djnz L_6399		;639a
L_639C:
	ld (ix+004h),a		;639c
	ld a,(hl)			;639f
	and 0f0h		;63a0
	rrca			;63a2
	rrca			;63a3
	rrca			;63a4
	rrca			;63a5
	call L_66B6		;63a6
	bit 7,(ix+009h)		;63a9
	ret nz			;63ad
	cp 00ch		;63ae
	jr nc,L_63FC		;63b0
	ld hl,06405h		;63b2
	ld e,a			;63b5
	ld d,000h		;63b6
	add hl,de			;63b8
	ld l,(hl)			;63b9
	ld h,000h		;63ba
	ld a,(ix+016h)		;63bc
	or a			;63bf
	jr z,L_63D8		;63c0
	bit 7,(ix+00dh)		;63c2
	jr z,L_63D4		;63c6
	ld a,(ix+02fh)		;63c8
	ld b,a			;63cb
	ld a,(ix+016h)		;63cc
	sub b			;63cf
	jr z,L_63D8		;63d0
	jr c,L_63D8		;63d2
L_63D4:
	ld b,a			;63d4
L_63D5:
	add hl,hl			;63d5
	djnz L_63D5		;63d6
L_63D8:
	ld (ix+010h),l		;63d8
	ld (ix+011h),h		;63db
	ld e,(ix+015h)		;63de
	ld a,(0c1cbh)		;63e1
	and 011h		;63e4
	call nz,L_671E		;63e6
	ld (ix+012h),e		;63e9
	ld a,(ix+00dh)		;63ec
	and 0f0h		;63ef
	ld (ix+00dh),a		;63f1
	set 1,(ix+00dh)		;63f4
	call L_6516		;63f8
	ret			;63fb
L_63FC:
	ld a,(ix+00dh)		;63fc
	and 0f0h		;63ff
	ld (ix+00dh),a		;6401
	ret			;6404

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6405..0x6412  (13 bytes)
DATA_6405:
	defb 06ah,064h,05eh,059h,054h,04fh,04ah,046h,042h,03fh,03bh,038h,035h	; 6405  jd^YTOJFB?.85

; ======================================================================
; CODIGO 0x6412..0x67b0  (926 bytes)
; ======================================================================


L_6412:
	ld a,(ix+00dh)		;6412
	and 003h		;6415
	jr z,L_647C		;6417
	cp 001h		;6419
	jr z,L_6453		;641b
	ld a,(hl)			;641d
	bit 6,(ix+00eh)		;641e
	jr nz,L_643F		;6422
	bit 5,(ix+00eh)		;6424
	jr nz,L_6444		;6428
	and 0f0h		;642a
	ld b,a			;642c
	xor (hl)			;642d
	ld d,a			;642e
	inc hl			;642f
	ld a,(hl)			;6430
	ld (ix+010h),a		;6431
	ld (ix+011h),d		;6434
	ld a,b			;6437
	rrca			;6438
	rrca			;6439
	rrca			;643a
	rrca			;643b
	ld b,a			;643c
	jr L_6457		;643d
L_643F:
	ld (ix+010h),a		;643f
	jr L_646B		;6442
L_6444:
	and 0f0h		;6444
	rrca			;6446
	rrca			;6447
	rrca			;6448
	rrca			;6449
	ld b,a			;644a
	ld a,(hl)			;644b
	and 00fh		;644c
	ld (ix+011h),a		;644e
	jr L_6457		;6451
L_6453:
	ld a,(hl)			;6453
	and 00fh		;6454
	ld b,a			;6456
L_6457:
	ld a,(0c1e4h)		;6457
	cp 008h		;645a
	jr nc,L_6466		;645c
	bit 2,(ix+00dh)		;645e
	jr z,L_6466		;6462
	ld b,010h		;6464
L_6466:
	inc b			;6466
	inc b			;6467
	ld (ix+012h),b		;6468
L_646B:
	ld e,(ix+012h)		;646b
	ld a,(0c1cbh)		;646e
	and 011h		;6471
	call nz,L_671E		;6473
	ld (ix+012h),e		;6476
	call L_6516		;6479
L_647C:
	bit 7,(ix+009h)		;647c
	ret nz			;6480
	call L_66B6		;6481
	ld a,(ix+013h)		;6484
	ld (ix+004h),a		;6487
	ret			;648a
L_648B:
	set 7,(ix+009h)		;648b
	call L_638F		;648f
	ld b,a			;6492
	call L_64C2		;6493
	ld a,b			;6496
	add a,a			;6497
	ld e,a			;6498
	ld d,000h		;6499
	add hl,de			;649b
	ld e,(hl)			;649c
	inc hl			;649d
	ld d,(hl)			;649e
	ex de,hl			;649f
	ld a,(hl)			;64a0
L_64A1:
	set 1,(ix+009h)		;64a1
	call L_6367		;64a5
	res 1,(ix+009h)		;64a8
	res 7,(ix+009h)		;64ac
	ld a,(ix+013h)		;64b0
	ld (ix+019h),a		;64b3
	inc hl			;64b6
	ld (ix+017h),l		;64b7
	ld (ix+018h),h		;64ba
	set 0,(ix+00eh)		;64bd
	ret			;64c1
L_64C2:
	bit 2,(ix+009h)		;64c2
	jp nz,L_64D7		;64c6
	bit 3,(ix+009h)		;64c9
	jp nz,L_64EC		;64cd
	bit 4,(ix+009h)		;64d0
	jp nz,L_6501		;64d4
L_64D7:
	ld a,(ix+02ch)		;64d7
	cp 000h		;64da
	jp z,L_64E4		;64dc
	cp 001h		;64df
	jp z,L_64E8		;64e1
L_64E4:
	ld hl,0740eh		;64e4
	ret			;64e7
L_64E8:
	ld hl,0754fh		;64e8
	ret			;64eb
L_64EC:
	ld a,(ix+02ch)		;64ec
	cp 000h		;64ef
	jp z,L_64F9		;64f1
	cp 001h		;64f4
	jp z,L_64FD		;64f6
L_64F9:
	ld hl,07568h		;64f9
	ret			;64fc
L_64FD:
	ld hl,07581h		;64fd
	ret			;6500
L_6501:
	ld a,(ix+02ch)		;6501
	cp 000h		;6504
	jp z,L_650E		;6506
	cp 001h		;6509
	jp z,L_6512		;650b
L_650E:
	ld hl,0759ah		;650e
	ret			;6511
L_6512:
	ld hl,075b3h		;6512
	ret			;6515
L_6516:
	call L_65A5		;6516
	res 4,(ix+00eh)		;6519
	ld a,(ix+00fh)		;651d
	and 0d7h		;6520
	ld (ix+00fh),a		;6522
	xor a			;6525
	ld (ix+01dh),a		;6526
	ld (ix+01eh),a		;6529
	ld (ix+01fh),a		;652c
	ld (ix+020h),a		;652f
	set 2,(ix+00fh)		;6532
	ld a,(ix+012h)		;6536
	bit 7,(ix+00eh)		;6539
	jr z,L_6546		;653d
	ld e,(ix+029h)		;653f
	sub e			;6542
	call m,L_6565		;6543
L_6546:
	ld (ix+00ch),a		;6546
	ld a,(0c1e4h)		;6549
	cp 008h		;654c
	jr nc,L_6555		;654e
	bit 2,(ix+00dh)		;6550
	ret nz			;6554
L_6555:
	bit 1,(ix+00fh)		;6555
	ret z			;6559
	ld a,(ix+025h)		;655a
	ld (ix+00ch),a		;655d
	res 2,(ix+00fh)		;6560
	ret			;6564
L_6565:
	xor a			;6565
	ret			;6566
L_6567:
	bit 0,(ix+00eh)		;6567
	jp nz,L_657D		;656b
	bit 2,(ix+00eh)		;656e
	call nz,L_65C0		;6572
	bit 0,(ix+00fh)		;6575
	call nz,L_660E		;6579
	ret			;657c
L_657D:
	dec (ix+019h)		;657d
	ret nz			;6580
	ld l,(ix+017h)		;6581
	ld h,(ix+018h)		;6584
	ld a,(hl)			;6587
	cp 0ffh		;6588
	jr z,L_6594		;658a
	set 7,(ix+009h)		;658c
	call L_64A1		;6590
	ret			;6593
L_6594:
	res 0,(ix+00eh)		;6594
	xor a			;6598
	ld (ix+00ch),a		;6599
	ld a,(ix+00dh)		;659c
	and 0f0h		;659f
	ld (ix+00dh),a		;65a1
	ret			;65a4
L_65A5:
	ld e,(ix+010h)		;65a5
	ld d,(ix+011h)		;65a8
	bit 1,(ix+00eh)		;65ab
	jr z,L_65B9		;65af
	ld a,(ix+026h)		;65b1
	add a,e			;65b4
	ld e,a			;65b5
	jr nc,L_65B9		;65b6
	inc d			;65b8
L_65B9:
	ld (ix+00ah),e		;65b9
	ld (ix+00bh),d		;65bc
	ret			;65bf
L_65C0:
	inc (ix+01eh)		;65c0
	ld a,(ix+01eh)		;65c3
	ld b,(ix+00eh)		;65c6
	bit 4,b		;65c9
	jr nz,L_65DF		;65cb
	bit 3,b		;65cd
	jr z,L_65DF		;65cf
	cp (ix+01ah)		;65d1
	ret nz			;65d4
	ld (ix+01eh),000h		;65d5
	set 4,(ix+00eh)		;65d9
	jr L_65E3		;65dd
L_65DF:
	cp (ix+01bh)		;65df
	ret nz			;65e2
L_65E3:
	ld e,(ix+00ah)		;65e3
	ld d,(ix+00bh)		;65e6
	ld b,(ix+01ch)		;65e9
	ld a,(ix+01dh)		;65ec
	cpl			;65ef
	ld (ix+01dh),a		;65f0
	and a			;65f3
	ld a,e			;65f4
	jr nz,L_65FE		;65f5
	add a,b			;65f7
	ld e,a			;65f8
	jr nc,L_6603		;65f9
	inc d			;65fb
	jr L_6603		;65fc
L_65FE:
	sub b			;65fe
	ld e,a			;65ff
	jr nc,L_6603		;6600
	dec d			;6602
L_6603:
	ld (ix+00ah),e		;6603
	ld (ix+00bh),d		;6606
	ld (ix+01eh),000h		;6609
	ret			;660d
L_660E:
	ld a,(0c1e4h)		;660e
	cp 008h		;6611
	jr nc,L_661A		;6613
	bit 2,(ix+00dh)		;6615
	ret nz			;6619
L_661A:
	call L_6621		;661a
	ld (ix+00ch),e		;661d
	ret			;6620
L_6621:
	ld e,(ix+00ch)		;6621
	inc (ix+01fh)		;6624
	ld b,(ix+01fh)		;6627
	ld a,(ix+024h)		;662a
	cp (ix+004h)		;662d
	call nc,L_66B1		;6630
	bit 5,(ix+00fh)		;6633
	jr nz,L_66A5		;6637
	bit 3,(ix+00fh)		;6639
	jr nz,L_666C		;663d
	bit 2,(ix+00fh)		;663f
	jr nz,L_6658		;6643
	ld a,e			;6645
	inc a			;6646
	ld e,a			;6647
	cp (ix+012h)		;6648
	ret c			;664b
	set 2,(ix+00fh)		;664c
	ld e,(ix+012h)		;6650
	ld (ix+01fh),000h		;6653
	ret			;6657
L_6658:
	ld a,e			;6658
	dec a			;6659
	jp m,L_665E		;665a
	ld e,a			;665d
L_665E:
	ld a,b			;665e
	cp (ix+021h)		;665f
	ret c			;6662
	ld (ix+01fh),000h		;6663
	set 3,(ix+00fh)		;6667
	ret			;666b
L_666C:
	bit 4,(ix+00fh)		;666c
	jp nz,L_668F		;6670
	ld a,b			;6673
	cp (ix+022h)		;6674
	ret nz			;6677
	ld a,e			;6678
	dec a			;6679
	ret m			;667a
	ld e,a			;667b
	inc (ix+020h)		;667c
	ld a,(ix+020h)		;667f
	cp (ix+023h)		;6682
	ld (ix+01fh),000h		;6685
	ret nz			;6689
	set 5,(ix+00fh)		;668a
	ret			;668e
L_668F:
	ld a,(ix+022h)		;668f
	ld d,a			;6692
	ld a,e			;6693
	sub d			;6694
	ld e,000h		;6695
	jp m,L_669B		;6697
	ld e,a			;669a
L_669B:
	ld a,b			;669b
	cp (ix+023h)		;669c
	ret nz			;669f
	set 5,(ix+00fh)		;66a0
	ret			;66a4
L_66A5:
	ld a,(ix+004h)		;66a5
	cp (ix+024h)		;66a8
	ret nc			;66ab
	ld a,e			;66ac
	dec a			;66ad
	ret m			;66ae
	ld e,a			;66af
	ret			;66b0
L_66B1:
	set 5,(ix+00fh)		;66b1
	ret			;66b5
L_66B6:
	inc hl			;66b6
	ld (ix+002h),l		;66b7
	ld (ix+003h),h		;66ba
	ret			;66bd
L_66BE:
	ld de,0c1dfh		;66be
	ld a,(de)			;66c1
	ld b,a			;66c2
	inc de			;66c3
	ld a,(de)			;66c4
	ld c,a			;66c5
	ld hl,0c1e1h		;66c6
	inc (hl)			;66c9
	ld a,(hl)			;66ca
	cp b			;66cb
	ret nz			;66cc
	ld (hl),000h		;66cd
	inc hl			;66cf
	inc (hl)			;66d0
	ld a,(hl)			;66d1
	cp c			;66d2
	ret nz			;66d3
	ld hl,0c1cbh		;66d4
	res 0,(hl)		;66d7
	xor a			;66d9
	ld hl,0c1e1h		;66da
	ld (hl),a			;66dd
	inc hl			;66de
	ld (hl),a			;66df
	ld a,(0c033h)		;66e0
	ld e,a			;66e3
	ld a,(0c066h)		;66e4
	cp e			;66e7
	jr nz,L_66F8		;66e8
	ld ix,0c066h		;66ea
	call L_675A		;66ee
	ld ix,0c099h		;66f1
	call L_675A		;66f5
L_66F8:
	ld de,00033h		;66f8
	ld ix,0c000h		;66fb
	call L_675A		;66ff
	add ix,de		;6702
	call L_675A		;6704
	ld ix,0c0cch		;6707
	call L_675A		;670b
	add ix,de		;670e
	call L_675A		;6710
	add ix,de		;6713
	call L_675A		;6715
	add ix,de		;6718
	call L_675A		;671a
	ret			;671d
L_671E:
	ld a,(0c033h)		;671e
	ld b,a			;6721
	ld a,(0c066h)		;6722
	cp b			;6725
	jr z,L_672E		;6726
	ld a,(0c1e4h)		;6728
	and 0f3h		;672b
	ret z			;672d
L_672E:
	bit 2,(ix+00dh)		;672e
	jr nz,L_673F		;6732
	ld a,(0c1e2h)		;6734
	ld b,a			;6737
	ld a,e			;6738
	sub b			;6739
	ld e,000h		;673a
	ret m			;673c
	ld e,a			;673d
	ret			;673e
L_673F:
	ld e,000h		;673f
	ret			;6741
L_6742:
	ld hl,0c1e1h		;6742
	inc (hl)			;6745
	ld a,(hl)			;6746
	cp 025h		;6747
	ret nz			;6749
	ld (hl),000h		;674a
	inc hl			;674c
	dec (hl)			;674d
	ret nz			;674e
	ld hl,0c1cbh		;674f
	res 4,(hl)		;6752
	ld hl,0c1e1h		;6754
	ld (hl),000h		;6757
	ret			;6759
L_675A:
	xor a			;675a
	ld (ix+000h),a		;675b
	ld (ix+001h),a		;675e
	ld (ix+005h),a		;6761
	ld (ix+006h),a		;6764
	ld (ix+00ah),a		;6767
	ld (ix+00bh),a		;676a
	ld (ix+00ch),a		;676d
	ld (ix+00dh),a		;6770
	ld (ix+00eh),a		;6773
	ld (ix+00fh),a		;6776
	ld a,(0c1e4h)		;6779
	cp 008h		;677c
	ret nc			;677e
	nop			;677f
	cp 004h		;6780
	ld hl,0c1e7h		;6782
	jr nz,L_6796		;6785
	res 0,(hl)		;6787
	res 1,(hl)		;6789
	bit 3,(hl)		;678b
	ret z			;678d
	bit 2,(hl)		;678e
	ret z			;6790
	set 2,(hl)		;6791
	res 3,(hl)		;6793
	ret			;6795
L_6796:
	res 2,(hl)		;6796
	res 3,(hl)		;6798
	ret			;679a
L_679B:
	cp 0e0h		;679b
	jp c,L_6A05		;679d
	and 01fh		;67a0
	push hl			;67a2
	ld hl,067b0h		;67a3
	add a,a			;67a6
	ld e,a			;67a7
	ld d,000h		;67a8
	add hl,de			;67aa
	ld e,(hl)			;67ab
	inc hl			;67ac
	ld d,(hl)			;67ad
	ex de,hl			;67ae
	jp (hl)			;67af

; ----------------------------------------------------------------------
; DATOS sin identificar  0x67b0..0x67ee  (62 bytes)
DATA_67B0:
	defb 0eeh,067h,004h,068h,0eeh,067h,004h,068h,021h,068h,04bh,068h,05fh,068h,06fh,068h	; 67b0  .g.h.g.h!hKh_hoh
	defb 081h,068h,092h,068h,099h,068h,0a0h,068h,0f3h,068h,0fdh,068h,004h,069h,00fh,069h	; 67c0  .h.h.h.h.h.h.i.i
	defb 015h,069h,01fh,069h,03ah,069h,049h,069h,04fh,069h,055h,069h,05bh,069h,065h,069h	; 67d0  .i.i:iIiOiUi[iei
	defb 070h,069h,08ah,069h,095h,069h,09dh,069h,0b7h,069h,0cch,069h,0cfh,069h	; 67e0  pi.i.i.i.i.i.i

; ======================================================================
; CODIGO 0x67ee..0x6b6a  (892 bytes)
; ======================================================================


L_67EE:
	pop hl			;67ee
L_67EF:
	res 6,(ix+00eh)		;67ef
	ld a,(hl)			;67f3
	and 003h		;67f4
	ld (ix+00dh),a		;67f6
	ld b,a			;67f9
	inc hl			;67fa
	ld a,(hl)			;67fb
	ld (ix+013h),a		;67fc
	ld a,b			;67ff
	or a			;6800
	ret nz			;6801
	dec hl			;6802
	ret			;6803
L_6804:
	pop hl			;6804
	ld a,(0c1e4h)		;6805
	cp 004h		;6808
	ld a,(0c1e7h)		;680a
	jr nz,L_6818		;680d
	set 0,a		;680f
	res 1,a		;6811
	ld (0c1e7h),a		;6813
	jr L_67EF		;6816
L_6818:
	set 2,a		;6818
	res 3,a		;681a
	ld (0c1e7h),a		;681c
	jr L_67EF		;681f
L_6821:
	pop hl			;6821
	inc hl			;6822
	ld a,(hl)			;6823
	and 01fh		;6824
	ld b,a			;6826
	ld a,(0c1e4h)		;6827
	cp 004h		;682a
	ld a,b			;682c
	jr nz,L_683D		;682d
	ld (0c1e5h),a		;682f
	ld a,(0c1e7h)		;6832
	set 0,a		;6835
	res 1,a		;6837
	ld (0c1e7h),a		;6839
	ret			;683c
L_683D:
	ld (0c1e6h),a		;683d
	ld a,(0c1e7h)		;6840
	set 2,a		;6843
	res 3,a		;6845
	ld (0c1e7h),a		;6847
	ret			;684a
L_684B:
	pop hl			;684b
	inc hl			;684c
	res 3,(ix+00dh)		;684d
	ld a,(hl)			;6851
	ld (0c1e8h),a		;6852
	ld de,0c1e7h		;6855
	ld a,(de)			;6858
	set 5,a		;6859
	ld (de),a			;685b
	jp L_6860		;685c
L_685F:
	pop hl			;685f
L_6860:
	inc hl			;6860
	ld a,(hl)			;6861
	ld (0c1eah),a		;6862
	ld de,0c1e7h		;6865
	ld a,(de)			;6868
	set 6,a		;6869
	ld (de),a			;686b
	jp L_6870		;686c
L_686F:
	pop hl			;686f
L_6870:
	inc hl			;6870
	ld a,(hl)			;6871
	ld (0c1e9h),a		;6872
	ld de,0c1e7h		;6875
	ld a,(de)			;6878
	set 7,a		;6879
	ld (de),a			;687b
	set 2,(ix+00dh)		;687c
	ret			;6880
L_6881:
	pop hl			;6881
L_6882:
	ld de,0c1e7h		;6882
	ld a,(de)			;6885
	and 01fh		;6886
	ld (de),a			;6888
	ld a,(ix+00dh)		;6889
	and 0f3h		;688c
	ld (ix+00dh),a		;688e
	ret			;6891
L_6892:
	pop hl			;6892
	inc hl			;6893
	ld a,(hl)			;6894
	ld (ix+014h),a		;6895
	ret			;6898
L_6899:
	pop hl			;6899
	inc hl			;689a
	ld a,(hl)			;689b
	ld (ix+015h),a		;689c
	ret			;689f
L_68A0:
	pop hl			;68a0
	inc hl			;68a1
	ld a,(ix+00fh)		;68a2
	and 080h		;68a5
	ld (ix+00fh),a		;68a7
	ld a,(hl)			;68aa
	and 0f0h		;68ab
	rrca			;68ad
	rrca			;68ae
	rrca			;68af
	rrca			;68b0
	cp 008h		;68b1
	jp nc,L_68BA		;68b3
	set 2,(ix+00fh)		;68b6
L_68BA:
	res 3,a		;68ba
	inc a			;68bc
	bit 2,(ix+00fh)		;68bd
	jp nz,L_68C8		;68c1
	set 1,(ix+00fh)		;68c4
L_68C8:
	ld (ix+021h),a		;68c8
	ld a,(hl)			;68cb
	and 00fh		;68cc
	cp 008h		;68ce
	jp c,L_68D7		;68d0
	set 4,(ix+00fh)		;68d3
L_68D7:
	res 3,a		;68d7
	inc a			;68d9
	ld (ix+022h),a		;68da
	inc hl			;68dd
	ld a,(hl)			;68de
	and 0f0h		;68df
	rrca			;68e1
	rrca			;68e2
	rrca			;68e3
	rrca			;68e4
	ld (ix+023h),a		;68e5
	ld a,(hl)			;68e8
	and 00fh		;68e9
	ld (ix+024h),a		;68eb
	set 0,(ix+00fh)		;68ee
	ret			;68f2
L_68F3:
	pop hl			;68f3
	res 0,(ix+00fh)		;68f4
	res 1,(ix+00fh)		;68f8
	ret			;68fc
L_68FD:
	pop hl			;68fd
	inc hl			;68fe
	ld a,(hl)			;68ff
	ld (ix+025h),a		;6900
	ret			;6903
L_6904:
	pop hl			;6904
	inc hl			;6905
	ld a,(hl)			;6906
	ld (ix+026h),a		;6907
	set 1,(ix+00eh)		;690a
	ret			;690e
L_690F:
	pop hl			;690f
	res 1,(ix+00eh)		;6910
	ret			;6914
L_6915:
	pop hl			;6915
	ld a,(ix+00eh)		;6916
	and 0e2h		;6919
	ld (ix+00eh),a		;691b
	ret			;691e
L_691F:
	pop hl			;691f
	inc hl			;6920
	ld a,(ix+00eh)		;6921
	or 014h		;6924
	ld (ix+00eh),a		;6926
	ld a,(hl)			;6929
	and 00fh		;692a
	ld (ix+01ch),a		;692c
	ld a,(hl)			;692f
	and 0f0h		;6930
	rrca			;6932
	rrca			;6933
	rrca			;6934
	rrca			;6935
	ld (ix+01bh),a		;6936
	ret			;6939
L_693A:
	pop hl			;693a
	inc hl			;693b
	ld a,(hl)			;693c
	ld (ix+01ah),a		;693d
	ld a,(ix+00eh)		;6940
	or 00ch		;6943
	ld (ix+00eh),a		;6945
	ret			;6948
L_6949:
	pop hl			;6949
	res 3,(ix+00eh)		;694a
	ret			;694e
L_694F:
	pop hl			;694f
	set 6,(ix+00eh)		;6950
	ret			;6954
L_6955:
	pop hl			;6955
	set 5,(ix+00eh)		;6956
	ret			;695a
L_695B:
	pop hl			;695b
	ld a,(ix+00eh)		;695c
	and 09fh		;695f
	ld (ix+00eh),a		;6961
	ret			;6964
L_6965:
	pop hl			;6965
	set 7,(ix+00eh)		;6966
	inc hl			;696a
	ld a,(hl)			;696b
	ld (ix+029h),a		;696c
	ret			;696f
L_6970:
	pop hl			;6970
	inc hl			;6971
	ld a,(hl)			;6972
	ld de,0709eh		;6973
	add a,a			;6976
	add a,e			;6977
	ld e,a			;6978
	jr nc,L_697C		;6979
	inc d			;697b
L_697C:
	ld a,(de)			;697c
	ld (ix+027h),a		;697d
	inc de			;6980
	ld a,(de)			;6981
	ld (ix+028h),a		;6982
	set 7,(ix+00fh)		;6985
	ret			;6989
L_698A:
	pop hl			;698a
	call L_69A9		;698b
	ld (ix+007h),e		;698e
	ld (ix+008h),d		;6991
	ret			;6994
L_6995:
	pop hl			;6995
	ld l,(ix+007h)		;6996
	ld h,(ix+008h)		;6999
	ret			;699c
L_699D:
	pop hl			;699d
	inc hl			;699e
	ld a,(ix+005h)		;699f
	inc a			;69a2
	cp (hl)			;69a3
	jr z,L_69B0		;69a4
	ld (ix+005h),a		;69a6
L_69A9:
	inc hl			;69a9
	ld e,(hl)			;69aa
	inc hl			;69ab
	ld d,(hl)			;69ac
	ex de,hl			;69ad
	dec hl			;69ae
	ret			;69af
L_69B0:
	inc hl			;69b0
	inc hl			;69b1
	ld (ix+005h),000h		;69b2
	ret			;69b6
L_69B7:
	pop hl			;69b7
	inc hl			;69b8
	ld a,(ix+006h)		;69b9
	inc a			;69bc
	cp (hl)			;69bd
	jr z,L_69C5		;69be
	ld (ix+006h),a		;69c0
	jr L_69A9		;69c3
L_69C5:
	inc hl			;69c5
	inc hl			;69c6
	ld (ix+006h),000h		;69c7
	ret			;69cb
L_69CC:
	pop hl			;69cc
	jr L_69A9		;69cd
L_69CF:
	pop hl			;69cf
	inc hl			;69d0
	ld b,(ix+009h)		;69d1
	ld a,(hl)			;69d4
	ld (ix+009h),a		;69d5
	cp 001h		;69d8
	ld a,b			;69da
	jp z,L_69F5		;69db
	cp 001h		;69de
	ret nz			;69e0
	ld a,(ix+00eh)		;69e1
	ld (ix+02ah),a		;69e4
	ld a,(ix+00fh)		;69e7
	ld (ix+02bh),a		;69ea
	xor a			;69ed
	ld (ix+00eh),a		;69ee
	ld (ix+00fh),a		;69f1
	ret			;69f4
L_69F5:
	cp 001h		;69f5
	ret z			;69f7
	ld a,(ix+02ah)		;69f8
	ld (ix+00eh),a		;69fb
	ld a,(ix+02bh)		;69fe
	ld (ix+00fh),a		;6a01
	ret			;6a04
L_6A05:
	ld a,(hl)			;6a05
	and 00fh		;6a06
	cp 006h		;6a08
	jr nc,L_6A13		;6a0a
	ld (ix+016h),a		;6a0c
	ld (ix+02ch),a		;6a0f
	ret			;6a12
L_6A13:
	cp 007h		;6a13
	jr z,L_6A35		;6a15
	cp 008h		;6a17
	jr z,L_6A36		;6a19
	cp 009h		;6a1b
	jr z,L_6A37		;6a1d
	cp 00ah		;6a1f
	jr z,L_6A41		;6a21
	cp 00bh		;6a23
	jr z,L_6A48		;6a25
	cp 00ch		;6a27
	jr z,L_6A64		;6a29
	cp 00dh		;6a2b
	jr z,L_6A6E		;6a2d
	cp 00eh		;6a2f
	jr z,L_6A73		;6a31
	jr L_6A79		;6a33
L_6A35:
	ret			;6a35
L_6A36:
	ret			;6a36
L_6A37:
	call L_69A9		;6a37
	ld (ix+02dh),e		;6a3a
	ld (ix+02eh),d		;6a3d
	ret			;6a40
L_6A41:
	ld l,(ix+02dh)		;6a41
	ld h,(ix+02eh)		;6a44
	ret			;6a47
L_6A48:
	inc hl			;6a48
	ld a,(ix+005h)		;6a49
	inc a			;6a4c
	cp (hl)			;6a4d
	jr z,L_6A5E		;6a4e
	ld (ix+005h),a		;6a50
	inc hl			;6a53
	ld a,(hl)			;6a54
	ld e,a			;6a55
	ld a,l			;6a56
	sub e			;6a57
	ld l,a			;6a58
	jr nc,L_6A5C		;6a59
	dec h			;6a5b
L_6A5C:
	dec hl			;6a5c
	ret			;6a5d
L_6A5E:
	inc hl			;6a5e
	ld (ix+005h),000h		;6a5f
	ret			;6a63
L_6A64:
	set 7,(ix+00dh)		;6a64
	inc hl			;6a68
	ld a,(hl)			;6a69
	ld (ix+02fh),a		;6a6a
	ret			;6a6d
L_6A6E:
	res 7,(ix+00dh)		;6a6e
	ret			;6a72
L_6A73:
	inc hl			;6a73
	ld a,(hl)			;6a74
	ld (ix+001h),a		;6a75
	ret			;6a78
L_6A79:
	res 7,(ix+00eh)		;6a79
	ret			;6a7d
L_6A7E:
	call L_6A85		;6a7e
	call L_6B76		;6a81
	ret			;6a84
L_6A85:
	call L_6A95		;6a85
	call L_6AAC		;6a88
	call L_6AE1		;6a8b
	call L_6B08		;6a8e
	call L_6B36		;6a91
	ret			;6a94
L_6A95:
	ld hl,0c00dh		;6a95
	ld a,(hl)			;6a98
	and 001h		;6a99
	jr z,L_6AAB		;6a9b
	ld hl,0c073h		;6a9d
	ld a,(hl)			;6aa0
	and 001h		;6aa1
	jr z,L_6AAB		;6aa3
	ld hl,0c00dh		;6aa5
	ld a,002h		;6aa8
	ld (hl),a			;6aaa
L_6AAB:
	ret			;6aab
L_6AAC:
	ld b,000h		;6aac
	ld c,008h		;6aae
	ld hl,0c00ah		;6ab0
	call L_6AC3		;6ab3
	ld hl,0c03dh		;6ab6
	call L_6AC3		;6ab9
	ld hl,0c070h		;6abc
	call L_6AC3		;6abf
	ret			;6ac2
L_6AC3:
	ld e,(hl)			;6ac3
	ld a,b			;6ac4
	call 00093h		;6ac5   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;6ac8
	inc b			;6ac9
	ld e,(hl)			;6aca
	ld a,b			;6acb
	call 00093h		;6acc   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;6acf
	ld e,(hl)			;6ad0
	ld a,c			;6ad1
	inc b			;6ad2
	inc c			;6ad3
	inc hl			;6ad4
	bit 3,(hl)		;6ad5
	ret nz			;6ad7
	call 00093h		;6ad8   ; BIOS WRTPSG - Writes data to PSG-register
	bit 2,(hl)		;6adb
	ret z			;6add
	set 3,(hl)		;6ade
	ret			;6ae0
L_6AE1:
	ld hl,0c1e7h		;6ae1
	bit 0,(hl)		;6ae4
	jr z,L_6AF4		;6ae6
	res 0,(hl)		;6ae8
	set 1,(hl)		;6aea
	ld a,(0c1e5h)		;6aec
	ld e,a			;6aef
	ld a,006h		;6af0
	jr L_6B04		;6af2
L_6AF4:
	bit 1,(hl)		;6af4
	ret nz			;6af6
	bit 2,(hl)		;6af7
	ret z			;6af9
	res 2,(hl)		;6afa
	set 3,(hl)		;6afc
	ld a,(0c1e6h)		;6afe
	ld e,a			;6b01
	ld a,006h		;6b02
L_6B04:
	call 00093h		;6b04   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6b07
L_6B08:
	ld hl,0c1e7h		;6b08
	bit 7,(hl)		;6b0b
	ret z			;6b0d
	res 7,(hl)		;6b0e
	ld a,(0c1e9h)		;6b10
	ld e,a			;6b13
	ld a,00bh		;6b14
	call 00093h		;6b16   ; BIOS WRTPSG - Writes data to PSG-register
	bit 6,(hl)		;6b19
	ret z			;6b1b
	res 6,(hl)		;6b1c
	ld a,(0c1eah)		;6b1e
	ld e,a			;6b21
	ld a,00ch		;6b22
	call 00093h		;6b24   ; BIOS WRTPSG - Writes data to PSG-register
	bit 5,(hl)		;6b27
	ret z			;6b29
	res 5,(hl)		;6b2a
	ld a,(0c1e8h)		;6b2c
	ld e,a			;6b2f
	ld a,00dh		;6b30
	call 00093h		;6b32   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6b35
L_6B36:
	ld hl,0c00dh		;6b36
	ld a,(hl)			;6b39
	ld hl,06b6ah		;6b3a
	call L_6B63		;6b3d
	ld b,(hl)			;6b40
	ld hl,0c040h		;6b41
	ld a,(hl)			;6b44
	ld hl,06b6eh		;6b45
	call L_6B63		;6b48
	ld c,(hl)			;6b4b
	ld hl,0c073h		;6b4c
	ld a,(hl)			;6b4f
	ld hl,06b72h		;6b50
	call L_6B63		;6b53
	ld a,(hl)			;6b56
	or b			;6b57
	or c			;6b58
L_6B59:
	ld e,a			;6b59
	ld (0c1e3h),a		;6b5a
	ld a,007h		;6b5d
	call 00093h		;6b5f   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6b62
L_6B63:
	and 003h		;6b63
	ld e,a			;6b65
	ld d,000h		;6b66
	add hl,de			;6b68
	ret			;6b69

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b6a..0x6b76  (12 bytes)
DATA_6B6A:
	defb 089h,081h,088h,080h,092h,082h,090h,080h,0a4h,084h,0a0h,080h	; 6b6a  ............

; ======================================================================
; CODIGO 0x6b76..0x6e14  (670 bytes)
; ======================================================================


L_6B76:
	call L_6B83		;6b76
	call L_6C88		;6b79
	call L_6CDA		;6b7c
	call L_6DA1		;6b7f
	ret			;6b82
L_6B83:
	ld ix,0c1ebh		;6b83
	ld bc,0c1f7h		;6b87
	ld de,0c1edh		;6b8a
	ld hl,0c0a3h		;6b8d
	ld a,(de)			;6b90
	res 0,(ix+000h)		;6b91
	cp (hl)			;6b95
	jr z,L_6B9E		;6b96
	set 0,(ix+000h)		;6b98
	ld a,(hl)			;6b9c
	ld (de),a			;6b9d
L_6B9E:
	inc de			;6b9e
	inc hl			;6b9f
	ld a,(de)			;6ba0
	res 1,(ix+000h)		;6ba1
	cp (hl)			;6ba5
	jr z,L_6BAE		;6ba6
	set 1,(ix+000h)		;6ba8
	ld a,(hl)			;6bac
	ld (de),a			;6bad
L_6BAE:
	inc de			;6bae
	inc hl			;6baf
	res 2,(ix+001h)		;6bb0
	ld a,(bc)			;6bb4
	cp (hl)			;6bb5
	jr z,L_6BBE		;6bb6
	set 2,(ix+001h)		;6bb8
	ld a,(hl)			;6bbc
	ld (bc),a			;6bbd
L_6BBE:
	inc bc			;6bbe
	ld hl,0c0d6h		;6bbf
	ld a,(de)			;6bc2
	res 2,(ix+000h)		;6bc3
	cp (hl)			;6bc7
	jr z,L_6BD0		;6bc8
	set 2,(ix+000h)		;6bca
	ld a,(hl)			;6bce
	ld (de),a			;6bcf
L_6BD0:
	inc de			;6bd0
	inc hl			;6bd1
	ld a,(de)			;6bd2
	res 3,(ix+000h)		;6bd3
	cp (hl)			;6bd7
	jr z,L_6BE0		;6bd8
	set 3,(ix+000h)		;6bda
	ld a,(hl)			;6bde
	ld (de),a			;6bdf
L_6BE0:
	inc de			;6be0
	inc hl			;6be1
	res 3,(ix+001h)		;6be2
	ld a,(bc)			;6be6
	cp (hl)			;6be7
	jr z,L_6BF0		;6be8
	set 3,(ix+001h)		;6bea
	ld a,(hl)			;6bee
	ld (bc),a			;6bef
L_6BF0:
	inc bc			;6bf0
	ld hl,0c109h		;6bf1
	ld a,(de)			;6bf4
	res 4,(ix+000h)		;6bf5
	cp (hl)			;6bf9
	jr z,L_6C02		;6bfa
	set 4,(ix+000h)		;6bfc
	ld a,(hl)			;6c00
	ld (de),a			;6c01
L_6C02:
	inc de			;6c02
	inc hl			;6c03
	ld a,(de)			;6c04
	res 5,(ix+000h)		;6c05
	cp (hl)			;6c09
	jr z,L_6C12		;6c0a
	set 5,(ix+000h)		;6c0c
	ld a,(hl)			;6c10
	ld (de),a			;6c11
L_6C12:
	inc de			;6c12
	inc hl			;6c13
	res 4,(ix+001h)		;6c14
	ld a,(bc)			;6c18
	cp (hl)			;6c19
	jr z,L_6C22		;6c1a
	set 4,(ix+001h)		;6c1c
	ld a,(hl)			;6c20
	ld (bc),a			;6c21
L_6C22:
	inc bc			;6c22
	ld hl,0c13ch		;6c23
	ld a,(de)			;6c26
	res 6,(ix+000h)		;6c27
	cp (hl)			;6c2b
	jr z,L_6C34		;6c2c
	set 6,(ix+000h)		;6c2e
	ld a,(hl)			;6c32
	ld (de),a			;6c33
L_6C34:
	inc de			;6c34
	inc hl			;6c35
	ld a,(de)			;6c36
	res 7,(ix+000h)		;6c37
	cp (hl)			;6c3b
	jr z,L_6C44		;6c3c
	set 7,(ix+000h)		;6c3e
	ld a,(hl)			;6c42
	ld (de),a			;6c43
L_6C44:
	inc de			;6c44
	inc hl			;6c45
	res 5,(ix+001h)		;6c46
	ld a,(bc)			;6c4a
	cp (hl)			;6c4b
	jr z,L_6C54		;6c4c
	set 5,(ix+001h)		;6c4e
	ld a,(hl)			;6c52
	ld (bc),a			;6c53
L_6C54:
	inc bc			;6c54
	ld hl,0c16fh		;6c55
	ld a,(de)			;6c58
	res 0,(ix+001h)		;6c59
	cp (hl)			;6c5d
	jr z,L_6C66		;6c5e
	set 0,(ix+001h)		;6c60
	ld a,(hl)			;6c64
	ld (de),a			;6c65
L_6C66:
	inc de			;6c66
	inc hl			;6c67
	ld a,(de)			;6c68
	res 1,(ix+001h)		;6c69
	cp (hl)			;6c6d
	jr z,L_6C76		;6c6e
	set 1,(ix+001h)		;6c70
	ld a,(hl)			;6c74
	ld (de),a			;6c75
L_6C76:
	inc de			;6c76
	inc hl			;6c77
	res 6,(ix+001h)		;6c78
	ld a,(bc)			;6c7c
	cp (hl)			;6c7d
	jr z,L_6C86		;6c7e
	set 6,(ix+001h)		;6c80
	ld a,(hl)			;6c84
	ld (bc),a			;6c85
L_6C86:
	inc bc			;6c86
	ret			;6c87
L_6C88:
	ld e,000h		;6c88
	ld hl,0c0a6h		;6c8a
	ld c,001h		;6c8d
	ld a,(hl)			;6c8f
	or a			;6c90
	jr z,L_6C94		;6c91
	ld a,c			;6c93
L_6C94:
	or e			;6c94
	ld e,a			;6c95
	ld hl,0c0d9h		;6c96
	sla c		;6c99
	ld a,(hl)			;6c9b
	or a			;6c9c
	jr z,L_6CA0		;6c9d
	ld a,c			;6c9f
L_6CA0:
	or e			;6ca0
	ld e,a			;6ca1
	ld hl,0c10ch		;6ca2
	sla c		;6ca5
	ld a,(hl)			;6ca7
	or a			;6ca8
	jr z,L_6CAC		;6ca9
	ld a,c			;6cab
L_6CAC:
	or e			;6cac
	ld e,a			;6cad
	ld hl,0c13fh		;6cae
	sla c		;6cb1
	ld a,(hl)			;6cb3
	or a			;6cb4
	jr z,L_6CB8		;6cb5
	ld a,c			;6cb7
L_6CB8:
	or e			;6cb8
	ld e,a			;6cb9
	ld hl,0c172h		;6cba
	sla c		;6cbd
	ld a,(hl)			;6cbf
	or a			;6cc0
	jr z,L_6CC4		;6cc1
	ld a,c			;6cc3
L_6CC4:
	or e			;6cc4
	ld e,a			;6cc5
	ld hl,0c1fch		;6cc6
	ld a,(hl)			;6cc9
	cp e			;6cca
	jr z,L_6CD4		;6ccb
	ld (hl),e			;6ccd
	ld hl,0c1ech		;6cce
	set 7,(hl)		;6cd1
	ret			;6cd3
L_6CD4:
	ld hl,0c1ech		;6cd4
	res 7,(hl)		;6cd7
	ret			;6cd9
L_6CDA:
	ld ix,0c1ebh		;6cda
	ld hl,0c1edh		;6cde
	ld de,09880h		;6ce1
	bit 0,(ix+000h)		;6ce4
	jr z,L_6CED		;6ce8
	call L_6D92		;6cea
L_6CED:
	inc hl			;6ced
	inc de			;6cee
	bit 1,(ix+000h)		;6cef
	jr z,L_6CF8		;6cf3
	call L_6D92		;6cf5
L_6CF8:
	inc hl			;6cf8
	inc de			;6cf9
	bit 2,(ix+000h)		;6cfa
	jr z,L_6D03		;6cfe
	call L_6D92		;6d00
L_6D03:
	inc hl			;6d03
	inc de			;6d04
	bit 3,(ix+000h)		;6d05
	jr z,L_6D0E		;6d09
	call L_6D92		;6d0b
L_6D0E:
	inc hl			;6d0e
	inc de			;6d0f
	bit 4,(ix+000h)		;6d10
	jr z,L_6D19		;6d14
	call L_6D92		;6d16
L_6D19:
	inc hl			;6d19
	inc de			;6d1a
	bit 5,(ix+000h)		;6d1b
	jr z,L_6D24		;6d1f
	call L_6D92		;6d21
L_6D24:
	inc hl			;6d24
	inc de			;6d25
	bit 6,(ix+000h)		;6d26
	jr z,L_6D2F		;6d2a
	call L_6D92		;6d2c
L_6D2F:
	inc hl			;6d2f
	inc de			;6d30
	bit 7,(ix+000h)		;6d31
	jr z,L_6D3A		;6d35
	call L_6D92		;6d37
L_6D3A:
	inc hl			;6d3a
	inc de			;6d3b
	bit 0,(ix+001h)		;6d3c
	jr z,L_6D45		;6d40
	call L_6D92		;6d42
L_6D45:
	inc hl			;6d45
	inc de			;6d46
	bit 1,(ix+001h)		;6d47
	jr z,L_6D50		;6d4b
	call L_6D92		;6d4d
L_6D50:
	inc hl			;6d50
	inc de			;6d51
	bit 2,(ix+001h)		;6d52
	jr z,L_6D5B		;6d56
	call L_6D92		;6d58
L_6D5B:
	inc hl			;6d5b
	inc de			;6d5c
	bit 3,(ix+001h)		;6d5d
	jr z,L_6D66		;6d61
	call L_6D92		;6d63
L_6D66:
	inc hl			;6d66
	inc de			;6d67
	bit 4,(ix+001h)		;6d68
	jr z,L_6D71		;6d6c
	call L_6D92		;6d6e
L_6D71:
	inc hl			;6d71
	inc de			;6d72
	bit 5,(ix+001h)		;6d73
	jr z,L_6D7C		;6d77
	call L_6D92		;6d79
L_6D7C:
	inc hl			;6d7c
	inc de			;6d7d
	bit 6,(ix+001h)		;6d7e
	jr z,L_6D87		;6d82
	call L_6D92		;6d84
L_6D87:
	inc hl			;6d87
	inc de			;6d88
	bit 7,(ix+001h)		;6d89
	ret z			;6d8d
	call L_6D92		;6d8e
	ret			;6d91
L_6D92:
	ld a,(hl)			;6d92
	ld c,a			;6d93
	ld a,03fh		;6d94
	ld (09000h),a		;6d96
	ld a,c			;6d99
	ld (de),a			;6d9a
	ld a,005h		;6d9b
	ld (09000h),a		;6d9d
	ret			;6da0
L_6DA1:
	ld hl,0c0a8h		;6da1
	bit 7,(hl)		;6da4
	jr z,L_6DB7		;6da6
	res 7,(hl)		;6da8
	ld hl,0c0c0h		;6daa
	ld e,(hl)			;6dad
	inc hl			;6dae
	ld d,(hl)			;6daf
	ex de,hl			;6db0
	ld de,09800h		;6db1
	call L_6DF5		;6db4
L_6DB7:
	ld hl,0c0dbh		;6db7
	bit 7,(hl)		;6dba
	jr z,L_6DCD		;6dbc
	res 7,(hl)		;6dbe
	ld hl,0c0f3h		;6dc0
	ld e,(hl)			;6dc3
	inc hl			;6dc4
	ld d,(hl)			;6dc5
	ex de,hl			;6dc6
	ld de,09820h		;6dc7
	call L_6DF5		;6dca
L_6DCD:
	ld hl,0c10eh		;6dcd
	bit 7,(hl)		;6dd0
	jr z,L_6DE3		;6dd2
	res 7,(hl)		;6dd4
	ld hl,0c126h		;6dd6
	ld e,(hl)			;6dd9
	inc hl			;6dda
	ld d,(hl)			;6ddb
	ex de,hl			;6ddc
	ld de,09840h		;6ddd
	call L_6DF5		;6de0
L_6DE3:
	ld hl,0c141h		;6de3
	bit 7,(hl)		;6de6
	ret z			;6de8
	res 7,(hl)		;6de9
	ld hl,0c159h		;6deb
	ld e,(hl)			;6dee
	inc hl			;6def
	ld d,(hl)			;6df0
	ex de,hl			;6df1
	ld de,09860h		;6df2
L_6DF5:
	ld a,03fh		;6df5
	ld (09000h),a		;6df7
	xor a			;6dfa
	ld (0988fh),a		;6dfb
	ld b,020h		;6dfe
L_6E00:
	ld a,(hl)			;6e00
	ld (de),a			;6e01
	inc hl			;6e02
	inc de			;6e03
	djnz L_6E00		;6e04
	ld hl,0988fh		;6e06
	ld de,0c1fch		;6e09
	ld a,(de)			;6e0c
	ld (hl),a			;6e0d
	ld a,005h		;6e0e
	ld (09000h),a		;6e10
	ret			;6e13

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6e14..0x8000  (4588 bytes)
DATA_6E14:
	defb 08ch,06eh,0a2h,06eh,0b4h,06eh,0c2h,06eh,0d0h,06eh,0deh,06eh,0ech,06eh,0fah,06eh	; 6e14  .n.n.n.n.n.n.n.n
	defb 008h,06fh,016h,06fh,024h,06fh,032h,06fh,040h,06fh,04eh,06fh,060h,06fh,072h,06fh	; 6e24  .o.o$o2o@oNo`oro
	defb 084h,06fh,096h,06fh,09ch,06fh,0a2h,06fh,0a8h,06fh,0aeh,06fh,0b4h,06fh,0bah,06fh	; 6e34  .o.o.o.o.o.o.o.o
	defb 0c0h,06fh,0c6h,06fh,0cch,06fh,0d2h,06fh,0d8h,06fh,0deh,06fh,0e4h,06fh,0eah,06fh	; 6e44  .o.o.o.o.o.o.o.o
	defb 0f0h,06fh,0f6h,06fh,0fch,06fh,002h,070h,008h,070h,00eh,070h,014h,070h,01ah,070h	; 6e54  .o.o.o.p.p.p.p.p
	defb 020h,070h,026h,070h,02ch,070h,032h,070h,038h,070h,03eh,070h,044h,070h,04ah,070h	; 6e64   p&p,p2p8p>pDpJp
	defb 050h,070h,056h,070h,05ch,070h,062h,070h,074h,070h,07ah,070h,080h,070h,09eh,06eh	; 6e74  PpVp\pbptpzp.p.n
	defb 086h,070h,08ch,070h,092h,070h,098h,070h,0ffh,0ffh,0cch,075h,0cch,075h,0cch,075h	; 6e84  .p.p.p.p...u.u.u
	defb 0cch,075h,0cch,075h,0cch,075h,0cch,075h,0cch,075h,010h,0feh,0d4h,092h,0ffh,010h	; 6e94  .u.u.u.u.u......
	defb 0cdh,075h,0e9h,075h,00ah,076h,01dh,076h,021h,076h,03dh,076h,05ch,076h,076h,076h	; 6ea4  .u.u.v.v!v=v\vvv
	defb 0cfh,010h,0a8h,076h,042h,077h,07bh,077h,088h,078h,0c3h,079h,041h,07ah,0cfh,010h	; 6eb4  ...vBw{w.x.yAz..
	defb 057h,07dh,068h,07dh,079h,07dh,08ah,07dh,09bh,07dh,0ach,07dh,0cfh,010h,0c8h,07fh	; 6ec4  W}h}y}.}.}.}....
	defb 0feh,07fh,04fh,080h,0f5h,080h,046h,081h,0c4h,081h,0cfh,010h,0e0h,082h,02bh,083h	; 6ed4  ..O...F.......+.
	defb 089h,083h,0efh,083h,095h,084h,015h,085h,0cfh,010h,0beh,086h,0f1h,086h,018h,087h	; 6ee4  ................
	defb 076h,087h,0ebh,087h,011h,088h,0cfh,010h,062h,089h,09dh,089h,0c8h,089h,0fch,089h	; 6ef4  v.......b.......
	defb 04bh,08ah,0ach,08ah,0cfh,010h,0a8h,076h,042h,077h,07bh,077h,088h,078h,0c3h,079h	; 6f04  K......vBw{w.x.y
	defb 041h,07ah,0cfh,010h,0c0h,08bh,034h,08ch,080h,08ch,0ffh,08ch,0adh,08dh,021h,08eh	; 6f14  Az....4.......!.
	defb 0cfh,000h,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0cfh,000h	; 6f24  ................
	defb 0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0cfh,000h,0bdh,08fh	; 6f34  ................
	defb 0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0bdh,08fh,0ffh,0f0h,0beh,08fh,0d3h,08fh	; 6f44  ................
	defb 0e2h,08fh,0f4h,08fh,003h,090h,03dh,090h,054h,090h,080h,090h,0ffh,0f0h,0c7h,090h	; 6f54  ......=.T.......
	defb 0d6h,090h,0e7h,090h,003h,091h,01ah,091h,03ah,091h,056h,091h,071h,091h,0ffh,0f0h	; 6f64  ........:.V.q...
	defb 095h,091h,0b6h,091h,0c9h,091h,0dch,091h,000h,092h,03ch,092h,06fh,092h,077h,092h	; 6f74  ..........<.o.w.
	defb 0ffh,010h,0cdh,075h,0e9h,075h,00ah,076h,01dh,076h,021h,076h,03dh,076h,05ch,076h	; 6f84  ...u.u.v.v!v=v\v
	defb 076h,076h,030h,000h,0eah,092h,0eah,092h,030h,000h,0ebh,092h,0ebh,092h,030h,000h	; 6f94  vv0.....0.....0.
	defb 0ech,092h,0ech,092h,030h,005h,0edh,092h,0f8h,092h,030h,005h,007h,093h,017h,093h	; 6fa4  ....0.....0.....
	defb 030h,000h,056h,093h,056h,093h,030h,015h,057h,093h,0b8h,093h,030h,015h,00dh,094h	; 6fb4  0.V.V.0.W...0...
	defb 025h,094h,030h,015h,030h,09eh,074h,09eh,030h,015h,04eh,094h,065h,094h,030h,020h	; 6fc4  %.0.0.t.0.N.e.0
	defb 0b2h,094h,0cdh,094h,030h,015h,04eh,094h,065h,094h,030h,015h,04eh,094h,065h,094h	; 6fd4  ....0.N.e.0.N.e.
	defb 030h,018h,0eah,094h,000h,095h,030h,018h,0eah,094h,000h,095h,030h,080h,037h,095h	; 6fe4  0.....0.....0.7.
	defb 068h,095h,030h,07fh,09bh,095h,0b1h,095h,030h,080h,0d0h,095h,0eeh,095h,030h,081h	; 6ff4  h.0.....0.....0.
	defb 019h,096h,043h,096h,030h,0e8h,0a4h,096h,0c7h,096h,030h,0e0h,007h,097h,01ch,097h	; 7004  ..C.0.....0.....
	defb 030h,0f0h,04ch,097h,087h,097h,030h,070h,00eh,098h,051h,098h,030h,080h,00eh,098h	; 7014  0.L...0p..Q.0...
	defb 051h,098h,030h,030h,01fh,099h,029h,099h,030h,030h,07ch,099h,0b1h,099h,030h,005h	; 7024  Q.00..).00|...0.
	defb 015h,09ah,02ah,09ah,030h,0e0h,041h,09ah,08ah,09ah,030h,0e0h,0e3h,09ah,000h,09bh	; 7034  ..*.0.A...0.....
	defb 030h,050h,021h,09bh,036h,09bh,030h,060h,063h,09bh,08eh,09bh,030h,020h,0b2h,094h	; 7044  0P!.6.0`c...0 ..
	defb 0cdh,094h,030h,070h,0d6h,09bh,0fah,09bh,030h,0a0h,038h,09ch,06bh,09ch,0ffh,0f0h	; 7054  ..0p....0.8.k...
	defb 0e9h,09ch,0f9h,09ch,009h,09dh,01eh,09dh,02eh,09dh,03eh,09dh,04eh,09dh,05ch,09dh	; 7064  ..........>.N.\.
	defb 030h,090h,0cbh,09dh,0e9h,09dh,030h,010h,042h,09eh,086h,09eh,030h,005h,0c8h,09eh	; 7074  0.....0.B...0...
	defb 0c8h,09eh,030h,061h,0c9h,09eh,0e6h,09eh,030h,00fh,025h,09fh,038h,09fh,030h,004h	; 7084  ..0a....0.%.8.0.
	defb 05eh,09fh,076h,09fh,030h,061h,091h,09fh,0d0h,09fh,02eh,071h,02eh,071h,02eh,071h	; 7094  ^.v.0a.....q.q.q
	defb 04eh,071h,06eh,071h,08eh,071h,0aeh,071h,0aeh,071h,0ceh,071h,0ceh,071h,0eeh,071h	; 70a4  Nqnq.q.q.q.q.q.q
	defb 00eh,072h,02eh,072h,04eh,072h,06eh,072h,06eh,072h,06eh,072h,06eh,072h,06eh,072h	; 70b4  .r.rNrnrnrnrnrnr
	defb 06eh,072h,08eh,072h,0aeh,072h,0ceh,072h,0ceh,072h,0ceh,072h,0ceh,072h,0ceh,072h	; 70c4  nr.r.r.r.r.r.r.r
	defb 0eeh,072h,0eeh,072h,0eeh,072h,00eh,073h,00eh,073h,00eh,073h,00eh,073h,02eh,073h	; 70d4  .r.r.r.s.s.s.s.s
	defb 04eh,073h,06eh,073h,06eh,073h,06eh,073h,08eh,073h,0aeh,073h,0ceh,073h,0ceh,073h	; 70e4  Nsnsnsns.s.s.s.s
	defb 0eeh,073h,0eeh,073h,0eeh,073h,0eeh,073h,0eeh,073h,0eeh,073h,0eeh,073h,0eeh,073h	; 70f4  .s.s.s.s.s.s.s.s
	defb 0eeh,073h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h	; 7104  .s.t.t.t.t.t.t.t
	defb 00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h	; 7114  .t.t.t.t.t.t.t.t
	defb 00eh,074h,00eh,074h,00eh,074h,00eh,074h,00eh,074h,000h,0f8h,0f0h,0e8h,0e0h,0d8h	; 7124  .t.t.t.t.t......
	defb 0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h,080h,078h,070h,068h,060h,058h	; 7134  ...........xph`X
	defb 050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h,0f0h,0e0h,0d0h,0c0h,0b0h	; 7144  PH@80( .........
	defb 0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h,000h,0f0h,0e0h,0d0h,0c0h,0b0h	; 7154  ...p`P@0 .......
	defb 0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h,000h,04eh,062h,06dh,075h,07ah	; 7164  ...p`P@0 ..Nbmuz
	defb 07dh,07eh,07fh,07eh,07dh,07ah,075h,06dh,062h,04eh,000h,0b1h,09dh,092h,08ah,085h	; 7174  }~.~}zumbN......
	defb 082h,081h,080h,081h,082h,085h,08ah,092h,09dh,0b1h,000h,019h,031h,047h,05ah,06ah	; 7184  ............1GZj
	defb 075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h,000h,0e7h,0cfh,0b9h,0a6h,096h	; 7194  u}.}ujZG1.......
	defb 08bh,083h,080h,083h,08bh,096h,0a6h,0b9h,0cfh,0e7h,000h,0e0h,0c0h,0a0h,080h,0a0h	; 71a4  ................
	defb 0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h,000h,0e0h,0c0h,0a0h,080h,0a0h	; 71b4  ... @`.`@ ......
	defb 0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h,000h,019h,031h,047h,05ah,06ah	; 71c4  ... @`.`@ ..1GZj
	defb 075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h,000h,0e0h,0c0h,0a0h,080h,0a0h	; 71d4  u}.}ujZG1.......
	defb 0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h,000h,019h,031h,047h,05ah,06ah	; 71e4  ... @`.`@ ..1GZj
	defb 075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h,080h,090h,0a0h,0b0h,0c0h,0d0h	; 71f4  u}.}ujZG1.......
	defb 0e0h,0f0h,000h,010h,020h,030h,040h,050h,060h,070h,000h,019h,031h,047h,05ah,06ah	; 7204  .... 0@P`p..1GZj
	defb 075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h,080h,0a0h,0c0h,0e0h,000h,020h	; 7214  u}.}ujZG1......
	defb 040h,060h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,001h,02ah,040h,050h,05ch,068h	; 7224  @`..... @`.*@P\h
	defb 070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah,0ffh,0d6h,0c0h,0b0h,0a4h,098h	; 7234  px.xph\P@*......
	defb 090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h,000h,040h,07fh,040h,001h,0c0h	; 7244  ...........@.@..
	defb 081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h,001h,0e0h,001h,020h,001h,0f0h	; 7254  ...@.@...@... ..
	defb 001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h,000h,0f0h,0e0h,0d0h,0c0h,0b0h	; 7264  .......@@@......
	defb 0a0h,090h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 7274  ................
	defb 080h,080h,07fh,070h,060h,050h,040h,030h,020h,010h,000h,030h,050h,060h,070h,060h	; 7284  ...p`P@0 ..0P`p`
	defb 050h,030h,000h,0d0h,0b0h,0a0h,090h,0a0h,0b0h,0d0h,000h,040h,060h,070h,060h,040h	; 7294  P0.........@`p`@
	defb 000h,0c0h,0a0h,090h,0a0h,0c0h,000h,070h,000h,090h,030h,050h,050h,030h,000h,000h	; 72a4  .......p..0PP0..
	defb 010h,040h,060h,070h,060h,030h,0f0h,0e0h,0e0h,000h,020h,020h,010h,0c0h,0a0h,090h	; 72b4  .@`p`0....  ....
	defb 0a0h,0c0h,000h,000h,0d0h,0b0h,0b0h,0d0h,000h,000h,000h,000h,000h,000h,000h,000h	; 72c4  ................
	defb 000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h	; 72d4  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,070h,050h,020h,050h,070h	; 72e4  ...........pP Pp
	defb 030h,000h,050h,07fh,060h,010h,030h,040h,000h,0b0h,010h,060h,000h,0e0h,0f0h,000h	; 72f4  0.P.`.0@...`....
	defb 0b0h,090h,0c0h,010h,0e0h,0a0h,0c0h,0f0h,0c0h,0a0h,078h,078h,078h,078h,080h,080h	; 7304  ..........xxxx..
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 7314  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,078h,078h,078h,078h,078h,078h	; 7324  ..........xxxxxx
	defb 078h,078h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 7334  xx..............
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,0b0h,0c0h,010h,01ah,02ah	; 7344  ...............*
	defb 02ch,01ah,000h,0e0h,0d0h,0e0h,022h,053h,070h,075h,070h,031h,0eah,080h,088h,08ah	; 7354  ,....."Spup1....
	defb 08ch,08eh,000h,07fh,075h,073h,062h,000h,0c0h,090h,000h,000h,000h,080h,000h,070h	; 7364  ....usb........p
	defb 070h,070h,000h,000h,000h,080h,000h,000h,000h,080h,080h,080h,080h,000h,080h,000h	; 7374  pp..............
	defb 000h,000h,000h,080h,080h,080h,000h,080h,080h,080h,000h,030h,0f0h,030h,040h,050h	; 7384  ...........0.0@P
	defb 060h,060h,070h,079h,070h,078h,040h,000h,000h,00eh,070h,083h,060h,050h,000h,000h	; 7394  ``pypx@...p.`P..
	defb 000h,026h,074h,082h,084h,065h,064h,0e4h,093h,084h,070h,070h,070h,070h,070h,070h	; 73a4  .&t..ed...pppppp
	defb 070h,070h,080h,080h,080h,080h,080h,080h,080h,080h,070h,070h,070h,080h,080h,080h	; 73b4  pp........ppp...
	defb 070h,070h,070h,070h,080h,080h,080h,080h,080h,080h,070h,070h,060h,080h,090h,090h	; 73c4  pppp......pp`...
	defb 080h,080h,040h,040h,030h,080h,090h,090h,080h,080h,020h,020h,010h,080h,090h,090h	; 73d4  ..@@0.....  ....
	defb 080h,080h,000h,000h,0f0h,080h,090h,090h,080h,080h,080h,080h,080h,080h,080h,080h	; 73e4  ................
	defb 080h,080h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,080h,080h,080h	; 73f4  ................
	defb 080h,080h,000h,000h,000h,000h,000h,000h,000h,000h,026h,074h,02dh,074h,03ah,074h	; 7404  ..........&t-t:t
	defb 04fh,074h,068h,074h,080h,074h,099h,074h,0b2h,074h,0cdh,074h,0eah,074h,0f9h,074h	; 7414  Otht.t.t.t.t.t.t
	defb 014h,075h,0e1h,001h,0e4h,000h,007h,005h,0ffh,0e3h,001h,0e4h,000h,08ah,000h,0e1h	; 7424  .u..............
	defb 004h,006h,005h,004h,003h,0ffh,0e1h,001h,0e4h,014h,007h,0e2h,001h,072h,000h,0e1h	; 7434  .............r..
	defb 002h,0e4h,010h,003h,002h,0e1h,001h,0e4h,006h,002h,0ffh,0e2h,001h,0e5h,00ah,000h	; 7444  ................
	defb 042h,0c1h,0b0h,0e8h,0e1h,001h,0e4h,008h,008h,007h,006h,005h,004h,003h,002h,002h	; 7454  B...............
	defb 001h,001h,000h,0ffh,0e2h,002h,0e5h,009h,000h,0d0h,0a2h,080h,0e1h,002h,0e4h,007h	; 7464  ................
	defb 006h,0e1h,001h,0e4h,003h,005h,004h,003h,002h,001h,000h,0ffh,0e2h,001h,0a1h,02ah	; 7474  ...............*
	defb 091h,04ah,081h,055h,071h,060h,061h,06ah,051h,075h,041h,080h,031h,08ah,021h,095h	; 7484  .J.Uq`ajQuA.1.!.
	defb 011h,0a0h,001h,0b0h,0ffh,0e2h,001h,0a1h,05ah,081h,080h,071h,08ah,061h,095h,051h	; 7494  ........Z..q.a.Q
	defb 0a0h,041h,0aah,031h,0b5h,021h,0c0h,011h,0cah,011h,0d5h,001h,0e0h,0ffh,0e2h,001h	; 74a4  .A.1.!..........
	defb 0a1h,095h,091h,0c0h,081h,0cah,0a1h,0d5h,061h,0e0h,051h,0eah,041h,0f5h,032h,000h	; 74b4  ........a.Q.A.2.
	defb 022h,00ah,012h,015h,012h,020h,002h,030h,0ffh,0e2h,001h,0b1h,0e0h,0a2h,010h,092h	; 74c4  ".... .0........
	defb 01ah,082h,025h,072h,030h,062h,03ah,052h,045h,042h,050h,032h,05ah,022h,065h,012h	; 74d4  ..%r0b:REBP2Z"e.
	defb 070h,002h,07ah,002h,085h,0ffh,0e2h,001h,0e5h,009h,001h,0a0h,094h,050h,096h,000h	; 74e4  p.z..........P..
	defb 097h,000h,098h,000h,0ffh,0e3h,001h,0e4h,00fh,0e5h,009h,000h,0b0h,001h,060h,0e8h	; 74f4  ..............`.
	defb 0e3h,002h,0e4h,000h,0b0h,000h,050h,007h,0e1h,001h,005h,004h,003h,002h,001h,0ffh	; 7504  ......P.........
	defb 0e0h,001h,0e3h,001h,0e4h,00fh,0e5h,003h,000h,0a0h,001h,060h,0e8h,0e3h,002h,0e4h	; 7514  ...........`....
	defb 000h,0b0h,000h,050h,007h,0e1h,001h,005h,004h,003h,002h,0e3h,002h,060h,000h,030h	; 7524  ...P.........`.0
	defb 007h,0e1h,001h,003h,002h,001h,001h,0e3h,002h,040h,000h,020h,007h,0e1h,002h,002h	; 7534  .........@. ....
	defb 001h,0e3h,002h,020h,000h,010h,007h,0e1h,004h,001h,0ffh,067h,075h,067h,075h,067h	; 7544  ... .......gugug
	defb 075h,067h,075h,067h,075h,067h,075h,067h,075h,067h,075h,067h,075h,067h,075h,067h	; 7554  ugugugugugugugug
	defb 075h,067h,075h,0ffh,080h,075h,080h,075h,080h,075h,080h,075h,080h,075h,080h,075h	; 7564  ugu..u.u.u.u.u.u
	defb 080h,075h,080h,075h,080h,075h,080h,075h,080h,075h,080h,075h,0ffh,099h,075h,099h	; 7574  .u.u.u.u.u.u..u.
	defb 075h,099h,075h,099h,075h,099h,075h,099h,075h,099h,075h,099h,075h,099h,075h,099h	; 7584  u.u.u.u.u.u.u.u.
	defb 075h,099h,075h,099h,075h,0ffh,0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h	; 7594  u.u.u..u.u.u.u.u
	defb 0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h,0b2h,075h,0ffh,0cbh	; 75a4  .u.u.u.u.u.u.u..
	defb 075h,0cbh,075h,0cbh,075h,0cbh,075h,0cbh,075h,0cbh,075h,0cbh,075h,0cbh,075h,0cbh	; 75b4  u.u.u.u.u.u.u.u.
	defb 075h,0cbh,075h,0cbh,075h,0cbh,075h,0ffh,0ffh,0feh,004h,0e9h,00ah,0d0h,093h,033h	; 75c4  u.u.u.u........3
	defb 033h,093h,0feh,001h,0eah,007h,0f2h,027h,0f1h,041h,0ebh,002h,020h,0d2h,045h,091h	; 75d4  3......'.A.. .E.
	defb 095h,0eah,004h,091h,0ffh,0feh,001h,0e9h,00ah,0eah,009h,0ebh,017h,070h,0d5h,053h	; 75e4  .............p.S
	defb 0d4h,093h,073h,043h,0f2h,027h,0f1h,042h,0eah,007h,0ebh,002h,020h,0d3h,095h,0d2h	; 75f4  ..sC.'.B.... ...
	defb 021h,045h,0eah,004h,041h,0ffh,0feh,001h,0e9h,00ah,0eah,006h,0ebh,007h,040h,0f1h	; 7604  !E..A.........@.
	defb 041h,0d2h,003h,0d1h,003h,0d2h,0b3h,073h,0ffh,0f9h,09ah,076h,0ffh,0dch,001h,0f7h	; 7614  A......s...v....
	defb 003h,0f9h,09ah,076h,0ddh,0dfh,0eah,00ah,0ebh,007h,050h,0f2h,027h,0f1h,042h,0d2h	; 7624  ...v......P.'.B.
	defb 095h,0d1h,021h,045h,0ech,0eah,002h,041h,0ffh,0feh,001h,0f8h,028h,0e9h,00ah,0eah	; 7634  ..!E...A....(...
	defb 008h,0ebh,004h,030h,0d4h,003h,0eah,006h,0d3h,043h,023h,0d4h,0b3h,0eah,008h,0d5h	; 7644  ...0.....C#.....
	defb 095h,021h,095h,0ech,0eah,002h,091h,0ffh,0feh,001h,0f8h,025h,0e9h,00ah,0eah,00ah	; 7654  .!.........%....
	defb 0ebh,004h,050h,0d4h,053h,0f8h,002h,0d1h,003h,0d2h,0b3h,073h,04dh,0ech,0eah,002h	; 7664  ..P.S......sM...
	defb 041h,0ffh,0feh,001h,0e9h,00ah,0eah,00ah,0ebh,004h,050h,0d3h,003h,0d2h,093h,073h	; 7674  A.........P....s
	defb 023h,0eeh,001h,0f2h,027h,0f1h,042h,0ebh,007h,020h,0eah,006h,0d2h,096h,0d1h,021h	; 7684  #...'.B.. .....!
	defb 044h,0ech,0eah,002h,041h,0ffh,0feh,001h,0f8h,013h,0e9h,00ah,0eah,009h,0ebh,017h	; 7694  D...A...........
	defb 051h,0d4h,05fh,0fah,0feh,004h,0d0h,0e9h,006h,097h,030h,030h,031h,031h,030h,030h	; 76a4  Q._.......001100
	defb 0f9h,054h,07bh,0fbh,008h,0b4h,076h,090h,000h,090h,000h,030h,090h,000h,000h,0fbh	; 76b4  .T{...v....0....
	defb 008h,0bbh,076h,040h,040h,040h,041h,040h,040h,040h,040h,040h,041h,041h,040h,040h	; 76c4  ..v@@@A@@@@@AA@@
	defb 0f9h,054h,07bh,0fbh,002h,0d4h,076h,030h,030h,030h,030h,030h,010h,0fbh,002h,0dbh	; 76d4  .T{...v00000....
	defb 076h,090h,090h,000h,030h,090h,000h,000h,000h,031h,000h,090h,090h,000h,090h,000h	; 76e4  v...0....1......
	defb 031h,000h,090h,030h,030h,030h,030h,030h,000h,0fbh,002h,0f7h,076h,090h,030h,000h	; 76f4  1..00000....v.0.
	defb 030h,030h,030h,030h,030h,000h,000h,030h,030h,030h,030h,000h,000h,000h,030h,030h	; 7704  00000..0000...00
	defb 030h,0f9h,054h,07bh,0fbh,008h,015h,077h,090h,000h,000h,000h,031h,000h,090h,090h	; 7714  0.T{...w....1...
	defb 000h,000h,000h,031h,000h,000h,0fbh,007h,01ch,077h,030h,030h,030h,032h,030h,030h	; 7724  ...1.....w000200
	defb 030h,035h,09fh,099h,090h,000h,090h,000h,090h,030h,030h,0fdh,0b4h,076h,0feh,001h	; 7734  05.......00..v..
	defb 0f2h,00bh,0f1h,042h,0e9h,006h,0c2h,0eah,006h,0ebh,001h,010h,0d1h,020h,000h,0d2h	; 7744  ...B......... ..
	defb 090h,070h,0f9h,063h,07bh,020h,0c2h,0f9h,0b7h,07bh,0f9h,0cbh,07bh,072h,0f9h,0e8h	; 7754  .p.c{ ...{..{r..
	defb 07bh,0c2h,0f9h,0f8h,07bh,040h,041h,0f9h,010h,07ch,042h,0c2h,0f9h,03ch,07ch,090h	; 7764  {...{@A..|B..<|.
	defb 0c2h,0f9h,07dh,07ch,0fdh,05ah,077h,0feh,001h,0f8h,023h,0e9h,006h,0eah,00dh,0ebh	; 7774  ..}|.Zw...#.....
	defb 00ah,030h,0d3h,020h,000h,0d4h,090h,070h,0f9h,063h,07bh,020h,020h,050h,070h,0d4h	; 7784  .0. ...p.c{  Pp.
	defb 090h,070h,090h,021h,020h,050h,070h,090h,070h,090h,0d3h,001h,000h,0d4h,0b0h,0d3h	; 7794  .p.! Pp.p.......
	defb 000h,0fbh,008h,093h,077h,0f9h,06ch,07bh,021h,040h,070h,090h,0d4h,0b1h,0b2h,0d3h	; 77a4  ....w.l{!@p.....
	defb 002h,021h,021h,000h,022h,0f9h,06ch,07bh,041h,050h,070h,090h,0d4h,0b1h,0b2h,0d3h	; 77b4  .!!.".l{APp.....
	defb 002h,023h,073h,0d4h,040h,040h,040h,041h,040h,040h,040h,040h,040h,041h,041h,040h	; 77c4  .#s.@@@A@@@@@AA@
	defb 040h,0d4h,0f9h,076h,07bh,051h,051h,060h,091h,090h,071h,071h,090h,0b1h,0b0h,040h	; 77d4  @..v{QQ`..qq...@
	defb 040h,040h,042h,040h,040h,040h,042h,040h,051h,070h,0f9h,076h,07bh,0b0h,0b0h,0b0h	; 77e4  @@B@@@B@Qp.v{...
	defb 0b2h,0b0h,0b0h,0b0h,0b2h,0b0h,0d3h,001h,020h,0d4h,040h,040h,040h,042h,040h,040h	; 77f4  ........ .@@@B@@
	defb 040h,043h,040h,050h,070h,0d4h,091h,090h,090h,0fbh,004h,00ah,078h,001h,000h,000h	; 7804  @C@Pp.......x...
	defb 0fbh,004h,011h,078h,0f9h,083h,07bh,001h,000h,000h,001h,000h,000h,041h,040h,040h	; 7814  ...x..{......A@@
	defb 020h,040h,050h,070h,091h,090h,090h,0fbh,004h,028h,078h,001h,000h,000h,0fbh,004h	; 7824   @Pp.....(x.....
	defb 02fh,078h,0f9h,083h,07bh,091h,090h,090h,091h,090h,090h,043h,023h,0d4h,0f9h,090h	; 7834  /x..{......C#...
	defb 07bh,000h,000h,001h,001h,022h,0f9h,090h,07bh,020h,040h,060h,060h,061h,022h,0f9h	; 7844  {...."..{ @``a".
	defb 0a0h,07bh,020h,040h,060h,000h,000h,000h,002h,000h,000h,000h,001h,001h,0d5h,0b0h	; 7854  .{ @`...........
	defb 0d4h,000h,020h,0f9h,0a0h,07bh,000h,020h,040h,020h,020h,020h,022h,020h,020h,020h	; 7864  .. ..{. @   "
	defb 023h,020h,050h,0ebh,004h,070h,0d5h,09fh,097h,0ebh,00ah,030h,0c1h,0d4h,041h,051h	; 7874  # P..p.....0..AQ
	defb 052h,0fdh,093h,077h,0feh,001h,0f8h,002h,0e9h,006h,0eah,004h,0ebh,001h,010h,0d1h	; 7884  R..w............
	defb 021h,000h,0d2h,090h,070h,0f9h,063h,07bh,0eah,005h,0ebh,023h,030h,0d2h,070h,090h	; 7894  !...p.c{...#0.p.
	defb 0d1h,000h,0f8h,002h,0e9h,006h,0eah,005h,0ebh,023h,030h,0f9h,0aah,07bh,0f9h,0aah	; 78a4  .........#0..{..
	defb 07bh,0d2h,050h,0b0h,050h,0d1h,000h,0d2h,050h,0d1h,040h,0d2h,050h,0d1h,050h,0d2h	; 78b4  {.P.P...P.@.P.P.
	defb 050h,0d1h,000h,050h,000h,040h,020h,0d2h,0b0h,070h,0fbh,004h,0afh,078h,0d3h,090h	; 78c4  P..P.@ ..p...x..
	defb 0d2h,000h,040h,0d3h,090h,0d2h,000h,020h,050h,0d3h,0b0h,0d2h,000h,040h,070h,0d1h	; 78d4  ..@.... P....@p.
	defb 000h,040h,020h,000h,020h,0d3h,0b0h,0d2h,020h,050h,0d3h,0b0h,0d2h,020h,040h,070h	; 78e4  .@ . ... P... @p
	defb 000h,051h,051h,040h,052h,0eah,004h,0ebh,001h,010h,0d3h,090h,0d2h,000h,040h,0d3h	; 78f4  .QQ@R.........@.
	defb 090h,0d2h,000h,020h,050h,0d3h,0b0h,0d2h,000h,040h,070h,0d1h,000h,040h,020h,000h	; 7904  ... P....@p..@ .
	defb 020h,0d3h,0b0h,0d2h,020h,050h,0d3h,0b0h,0d2h,020h,040h,070h,000h,023h,073h,0feh	; 7914   ... P... @p.#s.
	defb 004h,0d0h,0f8h,005h,080h,080h,080h,081h,080h,080h,080h,060h,060h,061h,061h,060h	; 7924  ...........``aa`
	defb 060h,0feh,001h,0f8h,002h,0f2h,00bh,0f1h,042h,0eah,009h,0ebh,041h,010h,0f9h,0f8h	; 7934  `.......B...A...
	defb 07bh,042h,0f9h,010h,07ch,042h,0f8h,009h,0eah,005h,0d3h,010h,020h,030h,0eah,006h	; 7944  {B..|B...... 0..
	defb 0f9h,0e9h,07ch,0b0h,0d1h,000h,0d2h,090h,0b0h,0d1h,000h,020h,040h,073h,063h,0f8h	; 7954  ..|........ @sc.
	defb 009h,0f9h,0e9h,07ch,090h,091h,090h,0b1h,0d1h,000h,0feh,004h,0d0h,0f8h,005h,061h	; 7964  ...|...........a
	defb 061h,080h,080h,080h,080h,0feh,001h,0f8h,014h,0ebh,041h,010h,0f9h,007h,07dh,000h	; 7974  a.........A...}.
	defb 020h,040h,000h,070h,040h,0b0h,070h,090h,0b0h,0d1h,000h,0d2h,0b0h,0d1h,070h,060h	; 7984   @.p@.p.......p`
	defb 040h,020h,0fbh,003h,080h,079h,0f9h,007h,07dh,0d1h,060h,060h,060h,062h,060h,060h	; 7994  @ ...y..}.```b``
	defb 060h,066h,0f8h,005h,0ech,0e9h,001h,0d3h,080h,070h,060h,050h,040h,030h,020h,010h	; 79a4  `f.......p`P@0 .
	defb 000h,0d4h,0b0h,0a0h,090h,0e9h,00ch,086h,0fbh,002h,0a9h,079h,0fdh,0a6h,078h,0feh	; 79b4  ...........y..x.
	defb 001h,0f8h,002h,0f2h,00bh,0f1h,042h,0e9h,006h,0eah,009h,0ebh,041h,010h,0d1h,020h	; 79c4  ......B.....A..
	defb 000h,0d2h,090h,070h,0f9h,063h,07bh,020h,0d3h,090h,0b0h,0d2h,000h,0ebh,041h,010h	; 79d4  ...p.c{ ......A.
	defb 0f9h,0b7h,07bh,0ebh,051h,010h,0f9h,0cbh,07bh,073h,0f9h,0e8h,07bh,070h,060h,0ebh	; 79e4  ..{.Q...{s..{p`.
	defb 041h,010h,0d2h,043h,040h,051h,070h,0b1h,091h,070h,051h,020h,0d3h,05fh,0d2h,070h	; 79f4  A..C@Qp..pQ ._.p
	defb 070h,070h,072h,070h,070h,070h,070h,071h,070h,091h,0b0h,0d2h,003h,000h,021h,040h	; 7a04  pprppppqp.....!@
	defb 071h,051h,0b0h,091h,070h,050h,050h,050h,050h,051h,050h,050h,050h,050h,051h,050h	; 7a14  qQ..pPPPPQPPPPQP
	defb 051h,050h,0d2h,070h,070h,070h,070h,071h,070h,070h,070h,070h,072h,0d2h,090h,0d1h	; 7a24  QP.ppppqppppr...
	defb 000h,020h,0f9h,03ch,07ch,093h,0f9h,07dh,07ch,072h,0fdh,0e1h,079h,0feh,001h,0e9h	; 7a34  . .<|..}|r..y...
	defb 006h,0eah,009h,0ebh,041h,010h,0d2h,090h,070h,040h,020h,040h,020h,000h,0d3h,0b0h	; 7a44  ....A...p@ @ ...
	defb 0d2h,000h,0d3h,0b0h,090h,070h,090h,020h,050h,070h,0d3h,099h,0d2h,041h,020h,041h	; 7a54  .....p. Pp...A A
	defb 050h,07fh,0d3h,099h,0d2h,041h,020h,041h,050h,00fh,0fbh,002h,05eh,07ah,0ebh,051h	; 7a64  P....A AP...^z.Q
	defb 010h,041h,042h,052h,071h,075h,051h,052h,072h,091h,091h,070h,092h,041h,042h,052h	; 7a74  .ABRquQRr..p.ABR
	defb 071h,075h,051h,052h,072h,093h,0d1h,023h,0eah,005h,0ebh,021h,010h,0c2h,0eeh,001h	; 7a84  quQRr..#...!....
	defb 040h,020h,0b0h,090h,070h,060h,040h,020h,040h,020h,0d2h,0b0h,090h,0b0h,0eah,009h	; 7a94  @ ..p`@ @ ......
	defb 0ebh,041h,010h,0d3h,093h,090h,0b1h,0d2h,000h,041h,021h,000h,0d3h,0b1h,070h,0d2h	; 7aa4  .A.......A!...p.
	defb 053h,050h,071h,090h,0b3h,0d1h,000h,022h,0d2h,0b0h,0b0h,0b0h,0b2h,0b0h,0b0h,0b0h	; 7ab4  SPq...."........
	defb 0b0h,0b1h,0b0h,0d1h,001h,020h,0d3h,043h,040h,051h,070h,0b1h,091h,0d2h,020h,001h	; 7ac4  ..... .C@Qp... .
	defb 0d3h,0b0h,0d2h,02fh,0d2h,0b0h,0b0h,0b0h,0b0h,0b1h,0b0h,0b0h,0b0h,0b0h,0b2h,040h	; 7ad4  .../...........@
	defb 070h,090h,0d2h,0f9h,01bh,07dh,003h,020h,041h,060h,073h,060h,0d2h,040h,070h,090h	; 7ae4  p....}. A`s`.@p.
	defb 0f9h,01bh,07dh,000h,000h,001h,000h,021h,040h,073h,063h,0d2h,0f9h,041h,07dh,022h	; 7af4  ..}....!@sc..A}"
	defb 000h,000h,000h,000h,001h,000h,000h,000h,001h,001h,022h,0f9h,041h,07dh,022h,000h	; 7b04  ..........".A}".
	defb 000h,000h,000h,001h,000h,020h,040h,060h,070h,061h,022h,0f9h,04ch,07dh,062h,0f9h	; 7b14  ..... @`pa".L}b.
	defb 041h,07dh,062h,0f9h,04ch,07dh,092h,090h,090h,090h,092h,090h,090h,090h,093h,040h	; 7b24  A}b.L}.........@
	defb 070h,090h,0b0h,090h,0b0h,041h,040h,070h,090h,0b0h,090h,0b0h,0d1h,021h,020h,020h	; 7b34  p....A@p.....!
	defb 020h,0d2h,0b0h,090h,0b0h,041h,040h,070h,091h,0b1h,0d1h,001h,022h,0fdh,05eh,07ah	; 7b44   ....A@p....".^z
	defb 090h,000h,000h,000h,031h,000h,090h,090h,000h,090h,000h,031h,000h,090h,0fah,090h	; 7b54  ....1......1....
	defb 070h,050h,040h,050h,040h,020h,000h,0fah,0d4h,091h,092h,0b2h,0d3h,001h,0d5h,090h	; 7b64  pP@P@ ..........
	defb 0d4h,0fah,091h,091h,090h,0b1h,0d3h,000h,0d4h,071h,071h,070h,091h,0b0h,0fah,021h	; 7b74  .........qqp...!
	defb 020h,020h,021h,020h,020h,071h,070h,070h,071h,070h,070h,0fah,040h,040h,040h,042h	; 7b84    !  qppqpp.@@@B
	defb 040h,040h,040h,041h,041h,022h,000h,000h,000h,002h,000h,0fah,040h,040h,040h,042h	; 7b94  @@@AA"......@@@B
	defb 040h,040h,040h,041h,041h,0fah,0d2h,020h,070h,020h,090h,020h,0d1h,000h,0d2h,020h	; 7ba4  @@@AA.. p . ...
	defb 0d1h,020h,0fah,0d2h,029h,091h,070h,091h,0b0h,0d1h,00fh,0d2h,029h,091h,070h,091h	; 7bb4  . ..).p.....).p.
	defb 0b0h,05fh,0fbh,002h,0b8h,07bh,0fah,091h,092h,0b2h,0d1h,001h,005h,0d2h,0b1h,0b2h	; 7bc4  ._...{..........
	defb 0d1h,002h,021h,021h,000h,022h,0d2h,091h,092h,0b2h,0d1h,001h,005h,0d2h,0b1h,0b2h	; 7bd4  ..!!."..........
	defb 0d1h,002h,023h,0fah,040h,020h,0b0h,090h,070h,060h,040h,020h,040h,020h,0d2h,0b0h	; 7be4  ..#.@ ..p`@ @ ..
	defb 090h,0b0h,090h,0fah,0d2h,093h,090h,0b1h,0d1h,000h,041h,021h,000h,0d2h,0b1h,070h	; 7bf4  ..........A!...p
	defb 093h,090h,0b1h,0d1h,000h,023h,040h,052h,040h,040h,040h,0fah,040h,040h,040h,040h	; 7c04  .....#@R@@@.@@@@
	defb 041h,040h,051h,070h,0d2h,093h,090h,0b1h,0d1h,000h,041h,021h,070h,051h,040h,0d2h	; 7c14  A@Qp......A!pQ@.
	defb 0b0h,0b0h,0b0h,0b0h,0b1h,0b0h,0b0h,0b0h,0b0h,0b1h,0b0h,0d1h,001h,020h,040h,040h	; 7c24  ............. @@
	defb 040h,040h,041h,040h,040h,040h,040h,0fah,0d9h,055h,07ch,043h,060h,071h,090h,0b3h	; 7c34  @@A@@@@..U|C`q..
	defb 090h,0d2h,090h,0d1h,000h,020h,0d9h,055h,07ch,040h,040h,041h,040h,061h,090h,0b3h	; 7c44  ..... .U|@@A@a..
	defb 0fah,0d1h,040h,020h,040h,0d2h,071h,070h,0d1h,000h,020h,041h,070h,040h,090h,061h	; 7c54  ..@ @.qp.. Ap@.a
	defb 020h,0d2h,070h,060h,070h,041h,061h,070h,0b1h,0d1h,020h,0d2h,0b0h,0d1h,020h,042h	; 7c64   .p`pAap.. ... B
	defb 0d2h,063h,070h,092h,0b3h,0d1h,000h,022h,0dah,0d2h,0d9h,0d3h,07ch,062h,040h,040h	; 7c74  .cp...."....|b@@
	defb 040h,040h,041h,040h,040h,040h,041h,041h,062h,0d9h,0d3h,07ch,062h,040h,040h,040h	; 7c84  @@A@@@AAb..|b@@@
	defb 040h,041h,040h,060h,070h,090h,0b0h,091h,062h,0d9h,0deh,07ch,092h,0d9h,0d3h,07ch	; 7c94  @A@`p...b..|...|
	defb 092h,0d9h,0deh,07ch,0d1h,002h,020h,020h,020h,022h,020h,020h,020h,023h,0d2h,090h	; 7ca4  ...|..   "   #..
	defb 0d1h,000h,020h,040h,020h,040h,0d2h,091h,090h,0d1h,000h,020h,040h,020h,040h,071h	; 7cb4  .. @ @..... @ @q
	defb 070h,060h,070h,040h,020h,040h,0d2h,091h,090h,0d1h,000h,021h,041h,051h,0fah,070h	; 7cc4  p`p@ @.....!AQ.p
	defb 070h,070h,070h,071h,070h,070h,070h,071h,071h,0dah,0b0h,0b0h,0b0h,0b0h,0b1h,0b0h	; 7cd4  pppqpppqq.......
	defb 0b0h,0b0h,0b1h,0b1h,0dah,0ebh,081h,010h,0d3h,04fh,07fh,0f8h,00bh,0ebh,031h,020h	; 7ce4  .........O....1
	defb 0d2h,020h,040h,060h,020h,040h,060h,070h,040h,060h,070h,090h,060h,070h,090h,0b0h	; 7cf4  . @` @`p@`p.`p..
	defb 070h,090h,0fah,0d2h,040h,060h,070h,040h,0b0h,090h,070h,090h,0b0h,070h,0d1h,020h	; 7d04  p...@`p@..p..p.
	defb 000h,0d2h,0b0h,090h,070h,060h,0fah,0b0h,090h,0b0h,041h,040h,070h,090h,0b1h,0d1h	; 7d14  ....p`....A@p...
	defb 020h,0d2h,0b0h,0d1h,020h,021h,0d2h,090h,040h,020h,040h,001h,021h,040h,071h,0b0h	; 7d24   ... !..@ @.!@q.
	defb 070h,0b0h,0d1h,012h,0d2h,023h,040h,062h,073h,090h,0b2h,0d1h,0fah,040h,040h,040h	; 7d34  p....#@bs....@@@
	defb 040h,041h,040h,040h,040h,041h,041h,0fah,070h,070h,070h,070h,071h,070h,070h,070h	; 7d44  @A@@@AA.ppppqppp
	defb 071h,071h,0fah,0feh,001h,0f9h,0bdh,07dh,0f9h,095h,07eh,0f9h,0bdh,07dh,0f9h,038h	; 7d54  qq.....}..~..}.8
	defb 07fh,0fdh,059h,07dh,0feh,001h,0f9h,0e9h,07dh,0f9h,0ach,07eh,0f9h,0e9h,07dh,0f9h	; 7d64  ..Y}....}..~..}.
	defb 056h,07fh,0fdh,06ah,07dh,0feh,001h,0f9h,0f5h,07dh,0f9h,0b2h,07eh,0f9h,0f5h,07dh	; 7d74  V..j}....}..~..}
	defb 0f9h,05ch,07fh,0fdh,07bh,07dh,0feh,001h,0f9h,010h,07eh,0f9h,0d7h,07eh,0f9h,010h	; 7d84  .\..{}....~..~..
	defb 07eh,0f9h,065h,07fh,0fdh,08ch,07dh,0feh,001h,0f9h,021h,07eh,0f9h,0dfh,07eh,0f9h	; 7d94  ~.e...}...!~..~.
	defb 021h,07eh,0f9h,06eh,07fh,0fdh,09dh,07dh,0feh,001h,0f9h,02fh,07eh,0f9h,0e6h,07eh	; 7da4  !~.n...}.../~..~
	defb 0f9h,02fh,07eh,0f9h,074h,07fh,0fdh,0aeh,07dh,0feh,004h,0d0h,0e9h,006h,091h,091h	; 7db4  ./~.t...}.......
	defb 003h,003h,003h,0fbh,003h,0c2h,07dh,091h,091h,093h,093h,030h,030h,030h,030h,091h	; 7dc4  ......}....0000.
	defb 001h,031h,001h,091h,091h,031h,001h,0fbh,003h,0d3h,07dh,091h,001h,031h,001h,091h	; 7dd4  .1...1....}..1..
	defb 091h,031h,030h,030h,0fah,0e9h,006h,0c1h,0eah,005h,0ebh,001h,010h,0d9h,061h,07eh	; 7de4  .100..........a~
	defb 0fah,0f8h,023h,0e9h,006h,0eah,00bh,0ebh,009h,030h,0d5h,091h,091h,0cbh,0fbh,004h	; 7df4  ..#......0......
	defb 0ffh,07dh,0ebh,009h,050h,0b1h,0b1h,0fbh,010h,009h,07eh,0fah,0f8h,00dh,0e9h,006h	; 7e04  .}..P.....~.....
	defb 0eah,007h,0ebh,038h,010h,0dch,001h,0d9h,061h,07eh,0d1h,061h,0fah,0f8h,026h,0e9h	; 7e14  ...8....a~.a..&.
	defb 006h,0eah,007h,0ebh,038h,020h,0d9h,061h,07eh,061h,0fah,0e9h,006h,0eah,007h,0ebh	; 7e24  ....8 .a~a......
	defb 038h,010h,0d3h,041h,041h,071h,041h,0b2h,092h,071h,0fbh,003h,037h,07eh,041h,041h	; 7e34  8..AAqA..q..7~AA
	defb 071h,041h,092h,0b2h,0d2h,001h,0d3h,051h,051h,091h,051h,0d2h,002h,0d3h,0b2h,091h	; 7e44  qA.....QQ.Q.....
	defb 0fbh,003h,04ah,07eh,051h,051h,091h,051h,0b2h,0d2h,002h,011h,0fah,0d3h,091h,091h	; 7e54  ..J~QQ.Q........
	defb 0d2h,001h,0d3h,091h,0d2h,032h,022h,001h,0fbh,003h,061h,07eh,0d3h,091h,091h,0d2h	; 7e64  .....2"...a~....
	defb 001h,0d3h,091h,0d2h,022h,032h,041h,0d3h,0b1h,0b1h,0d2h,021h,0d3h,0b1h,0d2h,052h	; 7e74  ...."2A....!...R
	defb 042h,021h,0fbh,003h,07bh,07eh,0d3h,0b1h,0b1h,0d2h,021h,0d3h,0b1h,0d2h,042h,052h	; 7e84  B!..{~....!...BR
	defb 0dah,0d9h,007h,07fh,091h,091h,031h,011h,0fbh,003h,095h,07eh,0d9h,007h,07fh,030h	; 7e94  ......1....~...0
	defb 030h,000h,000h,0fbh,002h,0a3h,07eh,0fah,0c1h,0d9h,00fh,07fh,040h,0fah,0eah,00ah	; 7ea4  0.....~.....@...
	defb 0ebh,009h,030h,0d4h,090h,090h,0c0h,044h,021h,021h,043h,020h,020h,0c0h,044h,051h	; 7eb4  ..0....D!!C  .DQ
	defb 051h,073h,050h,050h,0c0h,044h,091h,091h,0b3h,020h,020h,0c0h,044h,0d3h,020h,022h	; 7ec4  QsPP.D...  .D. "
	defb 040h,042h,0fah,0f8h,002h,0d9h,00fh,07fh,0d0h,042h,0fah,0f8h,002h,0d9h,00fh,07fh	; 7ed4  @B.......B......
	defb 042h,0fah,0d1h,000h,001h,0d2h,0b4h,091h,091h,0b3h,090h,091h,0b4h,0d1h,001h,001h	; 7ee4  B...............
	defb 023h,000h,001h,0d2h,0b4h,0d1h,041h,041h,053h,0d2h,090h,091h,0b4h,0d1h,090h,092h	; 7ef4  #.....AAS.......
	defb 090h,092h,0fah,090h,090h,000h,030h,000h,000h,011h,0dah,0d2h,050h,051h,044h,0f8h	; 7f04  ......0.....PQD.
	defb 00bh,021h,021h,043h,0f8h,002h,020h,021h,044h,0f8h,00bh,051h,051h,073h,0f8h,002h	; 7f14  .!!C.. !D..QQs..
	defb 050h,051h,044h,0f8h,00bh,091h,091h,0b3h,0f8h,002h,020h,021h,044h,0f8h,00bh,0d1h	; 7f24  PQD....... !D...
	defb 020h,022h,040h,0dah,091h,001h,031h,001h,0fbh,007h,038h,07fh,030h,030h,031h,030h	; 7f34   "@...1...8.0010
	defb 030h,031h,091h,091h,031h,011h,0fbh,007h,046h,07fh,030h,030h,031h,030h,030h,030h	; 7f44  01..1...F.001000
	defb 030h,0fah,0eah,006h,0d9h,08eh,07fh,0fah,0eah,00ah,0ebh,009h,030h,0d9h,0abh,07fh	; 7f54  0...........0...
	defb 0fah,0eah,009h,0ebh,009h,030h,0d9h,0abh,07fh,0fah,0f8h,002h,0d9h,08eh,07fh,0fah	; 7f64  .....0..........
	defb 0ebh,038h,020h,0d2h,073h,043h,083h,043h,0fbh,004h,074h,07fh,0d2h,071h,071h,041h	; 7f74  .8 .sC.C..t..qqA
	defb 041h,081h,081h,041h,041h,0fbh,004h,080h,07fh,0fah,0d1h,003h,0d2h,093h,0d1h,013h	; 7f84  A..AA...........
	defb 0d2h,093h,0fbh,004h,08eh,07fh,0d1h,001h,001h,0d2h,091h,091h,0d1h,011h,011h,0d2h	; 7f94  ................
	defb 091h,091h,0fbh,004h,09ah,07fh,0dah,0d4h,003h,0d5h,093h,0d4h,013h,0d5h,093h,0fbh	; 7fa4  ................
	defb 004h,0abh,07fh,0d4h,001h,001h,0d5h,091h,091h,0d4h,011h,011h,0d5h,091h,091h,0fbh	; 7fb4  ................
	defb 004h,0b7h,07fh,0dah,0feh,004h,0e9h,006h,0d0h,0f9h,02ch,082h,000h,000h,030h,000h	; 7fc4  ..........,...0.
	defb 0f9h,02ch,082h,090h,000h,030h,000h,0fbh,008h,0cdh,07fh,090h,090h,000h,030h,030h	; 7fd4  .,...0........00
	defb 030h,090h,000h,000h,030h,000h,000h,0fbh,00fh,0e5h,07fh,030h,030h,030h,030h,030h	; 7fe4  0...0......00000
	defb 000h,030h,090h,030h,090h,030h,030h,0fdh,0cdh,07fh,0feh,001h	; 7ff4  .0.0.00.....
