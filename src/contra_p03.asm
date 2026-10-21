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
	ld (iy+010h),a		;a001   ; la de debajo, con la misma y + dy...
	inc hl			;a004
	ld a,(hl)			;a005   ; el dx de la figura
	add a,(iy+00bh)		;a006   ; ...la x + dx...
	ld (iy+001h),a		;a009   ; guarda la x del objeto (p00:4BBB)
	ld (iy+011h),a		;a00c   ; la x de la de debajo
	inc hl			;a00f
	ld a,(hl)			;a010   ; el dibujo de la figura
	ld (iy+002h),a		;a011   ; ...y el dibujo (el de debajo, 4 mas)
	add a,004h		;a014
	ld (iy+012h),a		;a016   ; el de debajo, 4 mas
	ret			;a019
pon_figura_4:		; como p02:9FFA y ademas las dos fichas siguientes (IY+20 e IY+30)
	call 09ffah		;a01a   ; dos fichas mas (IY+20 e IY+30) con la segunda mitad de la figura
	inc hl			;a01d
	ld a,(hl)			;a01e   ; el dy de la segunda mitad
	add a,(iy+00ah)		;a01f   ; le suma la y guardada del objeto (p02:9A24)
	ld (iy+020h),a		;a022   ; las dos fichas de la derecha a esa y
	ld (iy+030h),a		;a025
	inc hl			;a028
	ld a,(hl)			;a029   ; el dx de la segunda mitad
	add a,(iy+00bh)		;a02a   ; le suma la x guardada del objeto (p02:9A24)
	ld (iy+021h),a		;a02d
	ld (iy+031h),a		;a030
	inc hl			;a033
	ld a,(hl)			;a034   ; y su dibujo (el de debajo, 4 mas)
	ld (iy+022h),a		;a035
	add a,004h		;a038
	ld (iy+032h),a		;a03a
	ret			;a03d
despacha_estado:		; salta por la tabla que va detras del call, con el estado del objeto (IY+5)
	ld e,(iy+005h)		;a03e   ; el estado del objeto (IY+5) elige en la tabla que va detras del call
despacha_e:		; salta por la tabla que va detras del call, con el indice en E
	pop hl			;a041   ; HL = la tabla (la vuelta del call); E x 2...
	rlc e		;a042   ; cada destino, dos bytes
	ld d,000h		;a044
	add hl,de			;a046
	ld e,(hl)			;a047   ; ...y salta al destino
	inc hl			;a048
	ld d,(hl)			;a049
	ex de,hl			;a04a
	jp (hl)			;a04b
L_A04C:
	inc (iy+017h)		;a04c   ; el salto: cada cuadro un paso mas de la tabla (IY+17)...
	ld e,(iy+017h)		;a04f   ; el paso del salto
	ld a,(iy+004h)		;a052   ; ...los del tipo 0x17 por p03:A098 (24 pasos), los demas por p03:A0A0 (15)...
	cp 017h		;a055   ; los del tipo 0x17 saltan mas alto
	jr nz,L_A065		;a057
	ld a,(iy+017h)		;a059
	cp 018h		;a05c   ; 24 pasos
	jr nc,L_A074		;a05e
	ld hl,0a098h		;a060
	jr L_A06F		;a063
L_A065:
	ld a,(iy+017h)		;a065
	cp 00fh		;a068   ; los demas, 15
	jr nc,L_A074		;a06a
	ld hl,0a0a0h		;a06c
L_A06F:
	ld d,000h		;a06f   ; ...B = cuanto sube en este paso
	add hl,de			;a071   ; B = lo que sube en este paso
	ld b,(hl)			;a072
	ret			;a073
L_A074:
	ld (iy+016h),002h		;a074   ; acabado: a caer (IY+16 = 2)
	ret			;a078
L_A079:
	dec (iy+017h)		;a079   ; la caida: la tabla del salto al reves
	ld a,(iy+017h)		;a07c   ; bajando, del paso de ahora hacia atras
	ld e,a			;a07f
	cp 001h		;a080
	jr nc,L_A087		;a082
	inc (iy+017h)		;a084   ; sin pasar del primero
L_A087:
	ld a,(iy+004h)		;a087   ; lee el tipo del objeto (p02:8000, p02:8063)
	cp 017h		;a08a
	jr nz,L_A093		;a08c
	ld hl,0a098h		;a08e   ; la tabla de los del tipo 0x17...
	jr L_A06F		;a091
L_A093:
	ld hl,0a0b0h		;a093   ; ...o la de bajar (p03:A0B0)
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
	ld e,001h		;a0d0   ; p14:7800 con E = 1, o con E = 2...
	jp L_A0D7		;a0d2
L_A0D5:
	ld e,002h		;a0d5   ; p14:7800 con E = 2
L_A0D7:
	call rutina_banco_14		;a0d7   ; rutina_banco_14: llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia
	ld a,(0e2d2h)		;a0da   ; ...y acarreo si p14:7800 dejo 0xE2D2 distinto de cero
	and a			;a0dd
	ret z			;a0de   ; sin 0xE2D2: sin acarreo
	call 05052h		;a0df   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	xor a			;a0e2
	ret			;a0e3
rutina_banco_14:		; llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia
	xor a			;a0e4   ; la rutina del banco 14 (p14:7800, E lo que hace): el 14 en 0x6000...
	ld (0e2d2h),a		;a0e5   ; 0xE2D2 a cero antes
	ld a,(0e202h)		;a0e8   ; lee la copia del banco de 0x6000
	push af			;a0eb
	ld a,00eh		;a0ec   ; el banco 14
	ld (0e202h),a		;a0ee   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;a0f1   ; el mapper: pone en 0x6000 el banco de A
	call 07800h		;a0f4   ; p14:7800 hace lo que diga E
	pop af			;a0f7   ; ...y despues el banco que habia
	ld (0e202h),a		;a0f8   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;a0fb   ; el mapper: pone en 0x6000 el banco de A
	ret			;a0fe
explota:		; la ficha IY pasa a ser una explosion (tipo 0x0B)
	ld (iy+004h),00bh		;a0ff   ; explota (tipo 0x0B)
	ld (iy+005h),000h		;a103   ; el estado del objeto (p03:A03E) = 0x00
	jp L_A8AF		;a107   ; y libera la ficha de debajo
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
	ld e,003h		;a115   ; p14:7800 con E = 3
	jp rutina_banco_14		;a117   ; rutina_banco_14: llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia
L_A11A:
	ld a,(iy+00dh)		;a11a   ; cada IY+0D cuadros (p03:A869) la figura p03:A92F
	call espera_c		;a11d   ; espera_c: cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar
	jr nc,L_A170		;a120
	ld hl,0a92fh		;a122   ; la figura de apuntar
	call 09ffah		;a125   ; pon_figura: pone la figura HL (dy, dx, dibujo) en la ficha IY y en la de debajo (IY+10, dibujo + 4)
	jr L_A170		;a128
L_A12A:
	ld a,010h		;a12a   ; a los 0x10 cuadros dispara (tipo 0x22, dibujo 0xF4)...
	call 09915h		;a12c   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A170		;a12f
	push ix		;a131   ; una ficha libre para el disparo
	call 0847eh		;a133   ; busca_una_de_8: IX = una ficha libre de 0xE380 (de 8); acarreo si no hay
	jr c,L_A15C		;a136
	ld de,00000h		;a138
	ld hl,0a196h		;a13b   ; que sale de la boca (p03:A196)
	call 08713h		;a13e
	ld (ix+004h),022h		;a141   ; tipo 0x22, dibujo 0xF4
	ld (ix+005h),000h		;a145
	ld (ix+002h),0f4h		;a149
	ld a,(iy+008h)		;a14d   ; ...en la direccion de IY+8, con la figura de disparar (p03:A92C)
	ld (ix+00eh),a		;a150   ; con la direccion del que dispara
	inc (iy+005h)		;a153   ; sube el estado del objeto (p03:A03E)
	ld hl,0a92ch		;a156   ; la figura de disparar
	call 09ffah		;a159   ; pon_figura: pone la figura HL (dy, dx, dibujo) en la ficha IY y en la de debajo (IY+10, dibujo + 4)
L_A15C:
	pop ix		;a15c
	jr L_A170		;a15e
L_A160:
	ld a,020h		;a160   ; a los 0x20 cuadros (p03:A881), otra vez
	ld b,001h		;a162
	call espera_d_b		;a164   ; espera_d_b: cada A cuadros (IY+0D) el estado B; acarreo al llegar
	call 09915h		;a167   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A170		;a16a
	ld (iy+005h),001h		;a16c   ; el estado del objeto (p03:A03E) = 0x01
L_A170:
	ld hl,0a198h		;a170   ; si toca al jugador (p03:A198)...
	call 05a68h		;a173   ; toca_al_jugador: acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)
	ld hl,0a198h		;a176   ; su caja, p03:A198
	call 05af8h		;a179   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;a17c
	ld (iy+00dh),000h		;a17d   ; ...explota con 0x10 puntos y sale la ficha de debajo tambien
	ld (iy+004h),00bh		;a181   ; el tipo del objeto (p02:8000, p02:8063) = 0x0B
	ld (iy+005h),000h		;a185   ; el estado del objeto (p03:A03E) = 0x00
	ld a,010h		;a189   ; 0x10 puntos
	call 05f33h		;a18b   ; suma_puntos: suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas
	ld de,00010h		;a18e   ; y la ficha de debajo
	add iy,de		;a191
	jp libera		;a193   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa196..0xa19c  (6 bytes)
DATA_A196:
	defb 001h,0f2h,00eh,00ch,002h,00ch	; a196

; ======================================================================
; CODIGO 0xa19c..0xa203  (103 bytes)
; ======================================================================


L_A19C:
	ld a,(iy+005h)		;a19c   ; la bala que va de lado: sus colores y el dibujo 0xF4
	and a			;a19f
	jp nz,L_A1B1		;a1a0
	ld (iy+005h),001h		;a1a3   ; el estado del objeto (p03:A03E) = 0x01
	ld bc,0a8d3h		;a1a7   ; sus colores (p03:A8D3)
	call 05e45h		;a1aa   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld (iy+002h),0f4h		;a1ad   ; el dibujo del objeto (p00:4BBB) = 0xF4
L_A1B1:
	ld a,(0e18bh)		;a1b1   ; sin blancos en la sala, fuera
	and a			;a1b4
	jp z,libera		;a1b5   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	ld a,(iy+00eh)		;a1b8   ; dos a la derecha (hasta 0xE8) o a la izquierda (hasta 4)...
	cp 0ffh		;a1bb   ; IY+0E = -1: hacia la izquierda
	jr z,L_A1CF		;a1bd
	inc (iy+001h)		;a1bf   ; sube la x del objeto (p00:4BBB)
	inc (iy+001h)		;a1c2   ; sube la x del objeto (p00:4BBB)
	ld a,(iy+001h)		;a1c5   ; lee la x del objeto (p00:4BBB)
	cp 0e8h		;a1c8   ; a la derecha hasta 0xE8
	jp nc,libera		;a1ca   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	jr L_A1DD		;a1cd
L_A1CF:
	dec (iy+001h)		;a1cf   ; baja la x del objeto (p00:4BBB)
	dec (iy+001h)		;a1d2   ; baja la x del objeto (p00:4BBB)
	ld a,(iy+001h)		;a1d5   ; lee la x del objeto (p00:4BBB)
	cp 004h		;a1d8   ; a la izquierda hasta 4
	jp c,libera		;a1da   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
L_A1DD:
	inc (iy+00ch)		;a1dd   ; ...y cada tres cuadros, uno a la izquierda
	ld a,(iy+00ch)		;a1e0   ; lee la cuenta del objeto (p02:9915)
	cp 003h		;a1e3   ; cada tres cuadros uno mas a la izquierda (va mas despacio hacia la derecha)
	jr c,L_A1EE		;a1e5
	ld (iy+00ch),000h		;a1e7   ; la cuenta del objeto (p02:9915) = 0x00
	dec (iy+001h)		;a1eb   ; baja la x del objeto (p00:4BBB)
L_A1EE:
	ld hl,0a203h		;a1ee   ; si toca al jugador (p03:A203 con p00:5A61), explota
	push hl			;a1f1
	call 05a61h		;a1f2   ; si toca al jugador...
	pop hl			;a1f5
	call 05af8h		;a1f6   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;a1f9
	ld (iy+004h),00bh		;a1fa   ; el tipo del objeto (p02:8000, p02:8063) = 0x0B
	ld (iy+005h),000h		;a1fe   ; el estado del objeto (p03:A03E) = 0x00
	ret			;a202

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa203..0xa207  (4 bytes)
DATA_A203:
	defb 010h,010h,000h,010h	; a203

; ======================================================================
; CODIGO 0xa207..0xa287  (128 bytes)
; ======================================================================


L_A207:
	ld a,(iy+005h)		;a207   ; la granada: cuanto tarda segun la distancia al jugador (/16)...
	and a			;a20a
	jp nz,L_A237		;a20b
	inc (iy+005h)		;a20e   ; sube el estado del objeto (p03:A03E)
	ld a,(iy+001h)		;a211   ; lee la x del objeto (p00:4BBB)
	sub (ix+001h)		;a214   ; la distancia al jugador / 16, impar: cuanto tarda en caer
	srl a		;a217
	srl a		;a219
	srl a		;a21b
	srl a		;a21d
	set 0,a		;a21f
	ld (iy+00dh),a		;a221   ; guarda la segunda cuenta del objeto (p02:9921)
	ld bc,0a8dbh		;a224   ; ...sus colores, la direccion 0x14 (arriba a la izquierda) y la velocidad -4
	call 05e45h		;a227   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld a,014h		;a22a   ; la direccion 0x14: arriba a la izquierda
	ld (iy+008h),a		;a22c
	call 05cb6h		;a22f   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,0fch		;a232   ; velocidad -4
	call 05c75h		;a234   ; velocidad: la velocidad A del objeto IY
L_A237:
	ld a,(0e18bh)		;a237   ; sin blancos en la sala, fuera
	and a			;a23a
	jp nz,libera		;a23b   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	dec (iy+001h)		;a23e   ; dos a la izquierda por cuadro
	dec (iy+001h)		;a241   ; baja la x del objeto (p00:4BBB)
	ld a,(iy+00dh)		;a244   ; cada IY+0D cuadros la direccion gira (cae) y acelera
	call 09915h		;a247   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A25D		;a24a
	ld a,(iy+008h)		;a24c   ; la direccion gira hacia abajo...
	inc a			;a24f
	ld (iy+008h),a		;a250
	call 05cb6h		;a253   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,(iy+006h)		;a256   ; ...y acelera
	inc a			;a259
	call 05c75h		;a25a   ; velocidad: la velocidad A del objeto IY
L_A25D:
	call 05c53h		;a25d   ; avanza
	ld a,(iy+000h)		;a260   ; por abajo o por la izquierda, fuera
	cp 0b0h		;a263   ; por abajo, fuera
	jp nc,libera		;a265   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	ld a,(iy+001h)		;a268   ; lee la x del objeto (p00:4BBB)
	cp 004h		;a26b   ; por la izquierda, fuera
	jp c,libera		;a26d   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	inc (iy+00ah)		;a270   ; el dibujo parpadea (0xF8 o 0xFC) cada 4 cuadros
	ld a,(iy+00ah)		;a273   ; lee la y guardada del objeto (p02:9A24)
	and 004h		;a276   ; 0xF8 o 0xFC cada 4 cuadros
	add a,0f8h		;a278
	ld (iy+002h),a		;a27a   ; guarda el dibujo del objeto (p00:4BBB)
	ld hl,0a287h		;a27d   ; si toca al jugador (p03:A287), fuera
	call 05a68h		;a280   ; toca_al_jugador: acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)
	ret nc			;a283
	jp libera		;a284   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa287..0xa28b  (4 bytes)
DATA_A287:
	defb 00ch,008h,004h,008h	; a287

; ======================================================================
; CODIGO 0xa28b..0xa295  (10 bytes)
; ======================================================================


L_A28B:
	ld a,(0e18bh)		;a28b   ; la bala de los soldados: sin blancos en la sala, fuera
	and a			;a28e
	jp nz,libera		;a28f   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	call despacha_estado		;a292   ; despacha_estado: salta por la tabla que va detras del call, con el estado del objeto (IY+5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa295..0xa29b  (6 bytes)
DATA_A295:
	defb 09bh,0a2h,0e0h,0a2h,0e8h,0a2h	; a295

; ======================================================================
; CODIGO 0xa29b..0xa33f  (164 bytes)
; ======================================================================


L_A29B:
	inc (iy+005h)		;a29b   ; sube el estado del objeto (p03:A03E)
	ld a,(0e020h)		;a29e   ; 0x10 mas arriba (salvo en la fase 6)
	cp 006h		;a2a1   ; en la fase 6 sale donde esta
	jr z,L_A2AD		;a2a3
	ld a,(iy+000h)		;a2a5   ; lee la y del objeto (p00:4BBB)
	sub 010h		;a2a8   ; en las demas, 0x10 mas arriba
	ld (iy+000h),a		;a2aa   ; guarda la y del objeto (p00:4BBB)
L_A2AD:
	ld a,r		;a2ad   ; un retraso al azar (1 o 3)...
	and 003h		;a2af   ; el retraso: 1 o 3
	set 0,a		;a2b1
	ld (iy+00dh),a		;a2b3   ; guarda la segunda cuenta del objeto (p02:9921)
	ld (iy+00eh),a		;a2b6
	ld bc,0a8d3h		;a2b9   ; ...sus colores, velocidad -3...
	call 05e45h		;a2bc   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld (iy+008h),000h		;a2bf   ; la direccion 0 para la velocidad
	ld a,0fdh		;a2c3   ; velocidad -3
	call 05c75h		;a2c5   ; velocidad: la velocidad A del objeto IY
	ld a,010h		;a2c8   ; ...hacia arriba (direccion 0x10) y el dibujo 0xFC (0xF4 en la fase 6)
	ld (iy+008h),a		;a2ca   ; hacia arriba (0x10)
	ld (iy+002h),0fch		;a2cd   ; el dibujo del objeto (p00:4BBB) = 0xFC
	ld a,(0e020h)		;a2d1   ; lee la fase (0-19; la 8 se salta)
	cp 006h		;a2d4   ; en la fase 6 el dibujo 0xF4
	jp nz,05cb6h		;a2d6   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld (iy+002h),0f4h		;a2d9   ; el dibujo del objeto (p00:4BBB) = 0xF4
	jp 05cb6h		;a2dd   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
L_A2E0:
	inc (iy+005h)		;a2e0   ; el sonido 0x3A
	ld a,03ah		;a2e3   ; el sonido 0x3A
	call 05052h		;a2e5   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_A2E8:
	dec (iy+001h)		;a2e8   ; a la izquierda cada IY+0E cuadros
	dec (iy+00eh)		;a2eb   ; cada IY+0E cuadros...
	jr nz,L_A2F9		;a2ee
	ld a,(iy+00dh)		;a2f0   ; lee la segunda cuenta del objeto (p02:9921)
	ld (iy+00eh),a		;a2f3   ; ...uno mas a la izquierda
	dec (iy+001h)		;a2f6   ; baja la x del objeto (p00:4BBB)
L_A2F9:
	inc (iy+00ch)		;a2f9   ; cada 4 cuadros, mas lenta hasta 0x0C
	ld a,(iy+00ch)		;a2fc   ; lee la cuenta del objeto (p02:9915)
	cp 004h		;a2ff   ; cada 4 cuadros...
	jr c,L_A312		;a301
	ld (iy+00ch),000h		;a303   ; la cuenta del objeto (p02:9915) = 0x00
	ld a,(iy+006h)		;a307   ; ...un poco mas lenta, hasta 0x0C
	inc a			;a30a
	cp 00ch		;a30b
	jr z,L_A312		;a30d
	call 05c75h		;a30f   ; velocidad: la velocidad A del objeto IY
L_A312:
	call 05c53h		;a312   ; avanza
	ld a,(iy+001h)		;a315   ; por la derecha, fuera
	cp 0e8h		;a318   ; por la derecha (0xE8), fuera
	jp nc,libera_2		;a31a   ; libera_2: libera la ficha IY y la de debajo
	ld a,(0e020h)		;a31d   ; por abajo, fuera (en la fase 6, por debajo de 0x5C pasa al tipo 0x20)
	cp 006h		;a320   ; en la fase 6...
	jr z,L_A332		;a322
	ld a,(iy+000h)		;a324   ; lee la y del objeto (p00:4BBB)
	cp 0b0h		;a327   ; por abajo (0xB0), fuera
	jp nc,libera_2		;a329   ; libera_2: libera la ficha IY y la de debajo
L_A32C:
	ld hl,05bd1h		;a32c   ; si toca al jugador (p00:5BD1)
	jp 05a5ah		;a32f   ; toca_al_jugador_2: como p00:5A68 con otro dano
L_A332:
	ld a,(iy+000h)		;a332   ; lee la y del objeto (p00:4BBB)
	cp 05ch		;a335   ; ...por debajo de 0x5C se hace del tipo 0x20
	jr c,L_A32C		;a337
	ld (iy+004h),020h		;a339   ; el tipo del objeto (p02:8000, p02:8063) = 0x20
	jr L_A32C		;a33d

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa33f..0xa34e  (15 bytes)
DATA_A33F:
	defb 0fdh,07eh,00bh,0fdh,077h,001h,0fdh,07eh,00ah,0d6h,010h,0fdh,077h,000h,0c9h	; a33f  .~..w..~....w..

; ======================================================================
; CODIGO 0xa34e..0xa3b2  (100 bytes)
; ======================================================================


L_A34E:
	ld a,(iy+005h)		;a34e   ; el que vuela en zigzag: sus colores, a un lado al azar...
	and a			;a351
	jp nz,L_A37F		;a352   ; ya en marcha: p03:A37F
	inc (iy+005h)		;a355   ; sube el estado del objeto (p03:A03E)
	call 09a24h		;a358
	ld a,r		;a35b
	and 001h		;a35d
	ld (iy+00ah),a		;a35f   ; guarda la y guardada del objeto (p02:9A24)
	ld bc,0a8d9h		;a362
	call 05e31h		;a365
	ld a,(iy+000h)		;a368   ; ...hacia arriba o hacia abajo segun su y, sin velocidad
	xor 0ffh		;a36b
	and 080h		;a36d
	srl a		;a36f
	srl a		;a371
	srl a		;a373
	ld (iy+008h),a		;a375
	call 05cb6h		;a378   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	xor a			;a37b
	call 05c75h		;a37c   ; velocidad: la velocidad A del objeto IY
L_A37F:
	ld a,010h		;a37f   ; cada 0x10 cuadros gira hacia el jugador, hasta velocidad 8 (p03:A3B6)
	ld b,008h		;a381
	call L_A3B6		;a383
	call 05c53h		;a386   ; avanza: mueve la ficha IY un paso en su direccion
	ld a,084h		;a389   ; su dibujo alterna 0x84 y 0x8C cada 8 cuadros
	inc (iy+007h)		;a38b
	bit 3,(iy+007h)		;a38e
	jr z,L_A396		;a392
	ld a,08ch		;a394
L_A396:
	ld (iy+002h),a		;a396   ; guarda el dibujo del objeto (p00:4BBB)
	call 09abfh		;a399
	call dentro_o_fuera_2		;a39c   ; fuera de la pantalla (p03:A7D5): fuera
	ret nc			;a39f
	ld hl,0a3b2h		;a3a0   ; si toca al jugador (p03:A3B2): su figura rota (p02:9FF5) y explota
	push hl			;a3a3
	call 05a5ah		;a3a4   ; toca_al_jugador_2: como p00:5A68 con otro dano
	pop hl			;a3a7
	call 05af8h		;a3a8   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;a3ab
	call 09ff5h		;a3ac
	jp explota		;a3af   ; explota: la ficha IY pasa a ser una explosion (tipo 0x0B)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa3b2..0xa3b6  (4 bytes)
DATA_A3B2:
	defb 008h,008h,000h,010h	; a3b2

; ======================================================================
; CODIGO 0xa3b6..0xa420  (106 bytes)
; ======================================================================


L_A3B6:
	call 09915h		;a3b6   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	ret nc			;a3b9
	ld a,(iy+001h)		;a3ba   ; gira un paso hacia el lado del jugador...
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
	call 05cb6h		;a3d0   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,(iy+006h)		;a3d3   ; ...y acelera de dos en dos hasta B
	inc a			;a3d6
	inc a			;a3d7
	cp b			;a3d8
	ret nc			;a3d9
	ld (iy+006h),a		;a3da
	jp 05c75h		;a3dd   ; velocidad: la velocidad A del objeto IY
L_A3E0:
	ld (iy+009h),018h		;a3e0   ; la bala del jefe que cae: dibujo 0x18...
	ld a,(iy+005h)		;a3e4   ; lee el estado del objeto (p03:A03E)
	and a			;a3e7
	jr nz,L_A3F8		;a3e8
	ld (iy+00ch),000h		;a3ea   ; la cuenta del objeto (p02:9915) = 0x00
	ld (iy+005h),001h		;a3ee   ; el estado del objeto (p03:A03E) = 0x01
	ld bc,0a8d3h		;a3f2
	call 05e45h		;a3f5   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
L_A3F8:
	ld a,018h		;a3f8   ; ...a los 0x18 cuadros, fuera
	call 09915h		;a3fa   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jp c,libera		;a3fd   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	ld a,(iy+009h)		;a400   ; parpadea (0x18 y 0x1C) cada 8 cuadros
	bit 3,(iy+00ch)		;a403   ; mira el bit 3 de la cuenta del objeto (p02:9915)
	jr z,L_A40B		;a407
	ld a,01ch		;a409
L_A40B:
	ld (iy+002h),a		;a40b   ; guarda el dibujo del objeto (p00:4BBB)
	ld bc,0a8d3h		;a40e
	jp 05e45h		;a411   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
L_A414:
	ld (iy+009h),010h		;a414
	ld hl,0a420h		;a418   ; si toca al jugador (p03:A420)
	call 05a68h		;a41b   ; toca_al_jugador: acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)
	jr L_A3E0		;a41e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa420..0xa424  (4 bytes)
DATA_A420:
	defb 000h,010h,000h,010h	; a420

; ======================================================================
; CODIGO 0xa424..0xa4a6  (130 bytes)
; ======================================================================


L_A424:
	ld a,(iy+005h)		;a424   ; la bomba que rebota: sus colores, velocidad 4, direccion 0...
	and a			;a427
	jp nz,L_A459		;a428
	ld (iy+005h),001h		;a42b   ; el estado del objeto (p03:A03E) = 0x01
	ld bc,0a8d3h		;a42f
	call 05e45h		;a432   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld (iy+00eh),000h		;a435
	ld a,004h		;a439
	ld (iy+006h),a		;a43b
	call 05c75h		;a43e   ; velocidad: la velocidad A del objeto IY
	xor a			;a441
	ld (iy+008h),a		;a442
	call 05cb6h		;a445   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld (iy+002h),0fch		;a448   ; ...dibujo 0xFC, el sonido 0x2A
	ld (iy+00ah),002h		;a44c   ; la y guardada del objeto (p02:9A24) = 0x02
	ld (iy+00dh),003h		;a450   ; la segunda cuenta del objeto (p02:9921) = 0x03
	ld a,02ah		;a454
	call 05052h		;a456   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_A459:
	call L_A74A		;a459   ; avanza (p03:A74A)
	inc (iy+00bh)		;a45c   ; su dibujo da la vuelta: 0xE8, 0xEC y 0xF0, ocho cuadros cada uno
	ld a,(iy+00bh)		;a45f   ; lee la x guardada del objeto (p02:9A24)
	ld b,0e8h		;a462
	cp 008h		;a464
	jr c,L_A478		;a466
	ld b,0ech		;a468
	cp 010h		;a46a
	jr c,L_A478		;a46c
	ld b,0f0h		;a46e
	cp 018h		;a470
	jr c,L_A478		;a472
	ld (iy+00bh),000h		;a474   ; la x guardada del objeto (p02:9A24) = 0x00
L_A478:
	ld (iy+002h),b		;a478   ; guarda el dibujo del objeto (p00:4BBB)
	ld hl,0a4a6h		;a47b   ; si toca al jugador, explota (tipo 0x20, 0x30 puntos)
	call 05af8h		;a47e   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	jp c,L_A499		;a481
	ld a,(iy+008h)		;a484   ; al llegar hacia arriba y lento, si ha pasado por encima del jugador, explota
	cp 010h		;a487
	ret nz			;a489
	ld a,(iy+006h)		;a48a
	cp 004h		;a48d
	ret c			;a48f
	ld a,(iy+000h)		;a490   ; lee la y del objeto (p00:4BBB)
	add a,018h		;a493
	cp (ix+00ah)		;a495
	ret c			;a498
L_A499:
	ld (iy+004h),020h		;a499   ; el tipo del objeto (p02:8000, p02:8063) = 0x20
	ld (iy+005h),000h		;a49d   ; el estado del objeto (p03:A03E) = 0x00
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
	ld a,(0e031h)		;a4aa   ; el bicho que sale del suelo (no con 0xE031 = 2): sus colores cambian (p00:5E57)
	cp 002h		;a4ad
	jp z,libera		;a4af   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
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
	inc (iy+005h)		;a4c6   ; dibujo 0x24, hacia arriba (direccion 0) a velocidad 7
	ld (iy+002h),024h		;a4c9   ; el dibujo del objeto (p00:4BBB) = 0x24
	ld a,000h		;a4cd
	ld (iy+008h),a		;a4cf
	call 05cb6h		;a4d2   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,007h		;a4d5
L_A4D7:
	call 05c75h		;a4d7   ; velocidad: la velocidad A del objeto IY
	jr L_A510		;a4da
L_A4DC:
	ld a,003h		;a4dc   ; cada 3 cuadros frena...
	call 09915h		;a4de   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A510		;a4e1
	ld a,(iy+006h)		;a4e3
	dec a			;a4e6
	cp 0f9h		;a4e7
	jr nz,L_A4D7		;a4e9
	inc (iy+005h)		;a4eb   ; ...y al pararse da la vuelta (direccion 0 o 0x10)...
	ld a,(iy+008h)		;a4ee
	xor 0ffh		;a4f1
	and 010h		;a4f3
	ld (iy+008h),a		;a4f5
	call 05cb6h		;a4f8   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	jr L_A510		;a4fb
L_A4FD:
	ld a,003h		;a4fd   ; ...y acelera hasta 7 otra vez
	call 09915h		;a4ff   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A510		;a502
	ld a,(iy+006h)		;a504
	inc a			;a507
	cp 007h		;a508
	jr nz,L_A4D7		;a50a
	ld (iy+005h),001h		;a50c   ; el estado del objeto (p03:A03E) = 0x01
L_A510:
	call 05c53h		;a510   ; avanza, y cada 2 cuadros uno a la derecha
	ld a,002h		;a513
	call 09921h		;a515   ; cuenta_d: lo mismo con la cuenta IY+0D (p02:9915 con IY + 1)
	jr nc,L_A51D		;a518
	inc (iy+001h)		;a51a   ; sube la x del objeto (p00:4BBB)
L_A51D:
	ld a,(iy+001h)		;a51d   ; por la derecha, fuera
	cp 0f0h		;a520
	jp nc,libera_2		;a522   ; libera_2: libera la ficha IY y la de debajo
	ld hl,0a531h		;a525   ; si toca al jugador: p14:7800 con E = 8
	call 05af8h		;a528   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;a52b
	ld e,008h		;a52c
	jp rutina_banco_14		;a52e   ; rutina_banco_14: llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa531..0xa535  (4 bytes)
DATA_A531:
	defb 00ch,008h,004h,008h	; a531

; ======================================================================
; CODIGO 0xa535..0xa5a0  (107 bytes)
; ======================================================================


L_A535:
	ld a,(iy+005h)		;a535   ; el que persigue en las bases: sus colores, velocidad -2, direccion 0x10
	and a			;a538
	jp nz,L_A557		;a539
	inc (iy+005h)		;a53c   ; sube el estado del objeto (p03:A03E)
	ld bc,0a8d3h		;a53f
	call 05e45h		;a542   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld a,010h		;a545
	ld (iy+008h),a		;a547
	ld a,0feh		;a54a
	call 05c75h		;a54c   ; velocidad: la velocidad A del objeto IY
	ld a,010h		;a54f
	ld (iy+008h),a		;a551
	call 05cb6h		;a554   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
L_A557:
	ld a,(0e18bh)		;a557   ; sin blancos en la sala, fuera
	and a			;a55a
	jp nz,libera		;a55b   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	ld a,010h		;a55e   ; cada 0x10 cuadros gira hacia el jugador (hasta velocidad 4)
	ld b,004h		;a560
	call L_A3B6		;a562
L_A565:
	inc (iy+00ah)		;a565   ; su dibujo da la vuelta: 0xE8, 0xEC y 0xF0, seis cuadros cada uno
	ld a,(iy+00ah)		;a568   ; lee la y guardada del objeto (p02:9A24)
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
	ld (iy+00ah),000h		;a581   ; la y guardada del objeto (p02:9A24) = 0x00
L_A585:
	ld (iy+002h),c		;a585   ; guarda el dibujo del objeto (p00:4BBB)
	call 05c53h		;a588   ; avanza; si toca al jugador (p03:A5A0) explota; fuera de la pantalla, fuera
	ld hl,0a5a0h		;a58b
	push hl			;a58e
	call 05a68h		;a58f   ; toca_al_jugador: acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)
	pop hl			;a592
	call 05af8h		;a593   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	jp nc,dentro_o_fuera		;a596   ; dentro_o_fuera: si la ficha IY sale de la pantalla la libera; acarreo si sigue dentro
	ld (iy+004h),00bh		;a599   ; el tipo del objeto (p02:8000, p02:8063) = 0x0B
	jp dentro_o_fuera		;a59d   ; dentro_o_fuera: si la ficha IY sale de la pantalla la libera; acarreo si sigue dentro

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
	ld a,(iy+005h)		;a5a5   ; el soldado que baja en las bases: p14:7800 con E = 4 y sus colores (p03:A60C)
	and a			;a5a8
	jp nz,L_A5BA		;a5a9
	inc (iy+005h)		;a5ac   ; sube el estado del objeto (p03:A03E)
	ld e,004h		;a5af
	call rutina_banco_14		;a5b1   ; rutina_banco_14: llama a p14:7800 con el banco 14 en 0x6000 (E = lo que hace) y devuelve el que habia
	ld bc,0a60ch		;a5b4
	jp 05e45h		;a5b7   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
L_A5BA:
	ld a,(iy+000h)		;a5ba   ; abajo del todo, o sin blancos en la sala, fuera
	cp 098h		;a5bd
	jp nc,libera_2		;a5bf   ; libera_2: libera la ficha IY y la de debajo
	ld a,(0e18bh)		;a5c2   ; lee los blancos de la sala que quedan (bases 3D)
	and a			;a5c5
	jp nz,libera_2		;a5c6   ; libera_2: libera la ficha IY y la de debajo
	inc (iy+00eh)		;a5c9   ; su dibujo alterna 0xD8 y 0xE0 cada 4 cuadros (el de abajo, +4)
	ld a,0d8h		;a5cc
	bit 2,(iy+00eh)		;a5ce
	jr z,L_A5D6		;a5d2
	ld a,0e0h		;a5d4
L_A5D6:
	ld (iy+002h),a		;a5d6   ; guarda el dibujo del objeto (p00:4BBB)
	add a,004h		;a5d9
	ld (iy+012h),a		;a5db
	call 05c53h		;a5de   ; avanza, con su ficha de debajo
	call 09abfh		;a5e1
	ld hl,0a608h		;a5e4   ; tres disparos y explota
	call 05af8h		;a5e7   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	jr nc,L_A5F7		;a5ea
	inc (iy+00ch)		;a5ec   ; sube la cuenta del objeto (p02:9915)
	ld a,(iy+00ch)		;a5ef   ; lee la cuenta del objeto (p02:9915)
	cp 003h		;a5f2
	jp nc,explota		;a5f4   ; explota: la ficha IY pasa a ser una explosion (tipo 0x0B)
L_A5F7:
	ld a,(iy+000h)		;a5f7   ; cerca del suelo (0x90) le puede dar al jugador
	cp 098h		;a5fa
	jp nc,libera_2		;a5fc   ; libera_2: libera la ficha IY y la de debajo
	cp 090h		;a5ff
	ret c			;a601
	ld hl,0a608h		;a602
	jp 05a5ah		;a605   ; toca_al_jugador_2: como p00:5A68 con otro dano

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
	ld (iy+005h),001h		;a61f   ; el que se esconde: guarda donde esta y se va fuera de la pantalla...
	ld a,(iy+000h)		;a623   ; lee la y del objeto (p00:4BBB)
	ld (iy+01eh),a		;a626
	ld a,(iy+001h)		;a629   ; lee la x del objeto (p00:4BBB)
	ld (iy+01dh),a		;a62c
	ld (iy+001h),0ech		;a62f   ; la x del objeto (p00:4BBB) = 0xEC
	ld (iy+000h),0ech		;a633   ; la y del objeto (p00:4BBB) = 0xEC
	ld a,r		;a637   ; ...una espera al azar de 0x60 a 0x9F, con sus colores
	and 03fh		;a639
	add a,060h		;a63b
	ld (iy+00dh),a		;a63d   ; guarda la segunda cuenta del objeto (p02:9921)
	ld bc,09d18h		;a640
	jp 05e31h		;a643
L_A646:
	dec (iy+00dh)		;a646   ; al acabar la espera vuelve a su sitio (estado 2), dibujos 0xC8 y 0xCC
	ret nz			;a649
	ld (iy+005h),002h		;a64a   ; el estado del objeto (p03:A03E) = 0x02
	ld a,(iy+01dh)		;a64e
	ld (iy+001h),a		;a651   ; guarda la x del objeto (p00:4BBB)
	ld a,(iy+01eh)		;a654
	ld (iy+000h),a		;a657   ; guarda la y del objeto (p00:4BBB)
	ld (iy+00ch),000h		;a65a   ; la cuenta del objeto (p02:9915) = 0x00
	call 09abfh		;a65e
L_A661:
	ld (iy+002h),0c8h		;a661   ; el dibujo del objeto (p00:4BBB) = 0xC8
	ld (iy+012h),0cch		;a665
	ret			;a669
L_A66A:
	ld a,020h		;a66a   ; a los 0x20 cuadros, dibujos 0xD0 y 0xD4 (apunta)
	call espera_c		;a66c   ; espera_c: cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar
	jr nc,L_A6BA		;a66f
	ld (iy+002h),0d0h		;a671   ; el dibujo del objeto (p00:4BBB) = 0xD0
	ld (iy+012h),0d4h		;a675
	jr L_A6BA		;a679
L_A67B:
	ld a,010h		;a67b   ; a los 0x10, dispara (tipo 3, dibujo 0xF8)
	call espera_c		;a67d   ; espera_c: cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar
	jr L_A6BA		;a680
L_A682:
	ld hl,00300h		;a682
	ld bc,0f803h		;a685
	call 08383h		;a688
	ret nc			;a68b
	ld (iy+005h),005h		;a68c   ; el estado del objeto (p03:A03E) = 0x05
	jr L_A6BA		;a690
L_A692:
	ld a,020h		;a692   ; a los 0x20, otra vez a apuntar (6 veces)...
	ld b,006h		;a694
	call espera_c_b		;a696   ; espera_c_b: cada A cuadros (IY+0C) el estado B; acarreo al llegar
	jr nc,L_A6BA		;a699
	jr L_A661		;a69b
L_A69D:
	ld a,010h		;a69d   ; ...y se esconde otra vez, con una espera de 0xC0
	ld b,001h		;a69f
	call espera_c_b		;a6a1   ; espera_c_b: cada A cuadros (IY+0C) el estado B; acarreo al llegar
	jr nc,L_A6BA		;a6a4
	ld (iy+001h),0ech		;a6a6   ; la x del objeto (p00:4BBB) = 0xEC
	ld (iy+000h),0ech		;a6aa   ; la y del objeto (p00:4BBB) = 0xEC
	ld (iy+011h),0ech		;a6ae
	ld (iy+010h),0ech		;a6b2
	ld (iy+00dh),0c0h		;a6b6   ; la segunda cuenta del objeto (p02:9921) = 0xC0
L_A6BA:
	ld hl,0a6ceh		;a6ba   ; si le dan (p03:A6CE), explota con 0x10 puntos
	push hl			;a6bd
	call 05a5ah		;a6be   ; toca_al_jugador_2: como p00:5A68 con otro dano
	pop hl			;a6c1
	call 05af8h		;a6c2   ; le_da_un_disparo: acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ret nc			;a6c5
	ld a,010h		;a6c6
	call 05f33h		;a6c8   ; suma_puntos: suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas
	jp explota		;a6cb   ; explota: la ficha IY pasa a ser una explosion (tipo 0x0B)

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
	inc (iy+005h)		;a6db   ; la bala que sube: sus colores y el dibujo 0xF8
	ld bc,0a8d3h		;a6de
	call 05e45h		;a6e1   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld (iy+002h),0f8h		;a6e4   ; el dibujo del objeto (p00:4BBB) = 0xF8
	ret			;a6e8
L_A6E9:
	ld a,(iy+000h)		;a6e9   ; sube dos por cuadro; arriba (0x18) estalla en tres (estado 2, 8 cuadros)
	sub 002h		;a6ec
	ld (iy+000h),a		;a6ee   ; guarda la y del objeto (p00:4BBB)
	cp 018h		;a6f1
	ret nc			;a6f3
	ld (iy+005h),002h		;a6f4   ; el estado del objeto (p03:A03E) = 0x02
	ld (iy+00dh),008h		;a6f8   ; la segunda cuenta del objeto (p02:9921) = 0x08
	ret			;a6fc
L_A6FD:
	ld a,018h		;a6fd   ; el dibujo parpadea (0x18/0x1C) mientras estalla...
	bit 1,(iy+00dh)		;a6ff   ; mira el bit 1 de la segunda cuenta del objeto (p02:9921)
	jr z,L_A707		;a703
	ld a,01ch		;a705
L_A707:
	ld (iy+002h),a		;a707   ; guarda el dibujo del objeto (p00:4BBB)
	dec (iy+00dh)		;a70a   ; baja la segunda cuenta del objeto (p02:9921)
	ret nz			;a70d
	push ix		;a70e   ; ...y salen tres trozos: a la izquierda, recto y a la derecha (IX+0E -1, 0 y 1)
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
	jp libera		;a72d   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)

; ----------------------------------------------------------------------
; DATOS sin identificar  0xa730..0xa731  (1 bytes)
DATA_A730:
	defb 0c9h	; a730

; ======================================================================
; CODIGO 0xa731..0xa74d  (28 bytes)
; ======================================================================


L_A731:
	call 0847eh		;a731   ; un trozo: en su sitio, tipo 4, dibujo 0xF8
	ret c			;a734
	ld a,(iy+000h)		;a735   ; lee la y del objeto (p00:4BBB)
	ld (ix+000h),a		;a738
	ld a,(iy+001h)		;a73b   ; lee la x del objeto (p00:4BBB)
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
	ld (iy+005h),001h		;a753   ; el que va de lado y vuelve: velocidad 6, direccion 0, dibujo 0xFC
	ld bc,0a8d3h		;a757
	call 05e45h		;a75a   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld a,006h		;a75d
	call 05c75h		;a75f   ; velocidad: la velocidad A del objeto IY
	ld a,000h		;a762
	ld (iy+008h),a		;a764
	call 05cb6h		;a767   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld (iy+002h),0fch		;a76a   ; el dibujo del objeto (p00:4BBB) = 0xFC
	ld (iy+00ah),002h		;a76e   ; la y guardada del objeto (p02:9A24) = 0x02
L_A772:
	ld a,(iy+00dh)		;a772   ; cada IY+0D cuadros frena hasta -6 y da la vuelta (direccion 0x10)...
	call 09915h		;a775   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A7A1		;a778
	ld a,(iy+006h)		;a77a
	cp 0fah		;a77d
	jr z,L_A784		;a77f
	dec a			;a781
	jr L_A79B		;a782
L_A784:
	ld (iy+008h),010h		;a784
	inc (iy+005h)		;a788   ; sube el estado del objeto (p03:A03E)
L_A78B:
	ld a,(iy+00ah)		;a78b   ; ...y cada IY+0A acelera hasta 7
	call 09915h		;a78e   ; cuenta_c: sube la cuenta IY+0C; al llegar a A vuelve a 0 y da acarreo (cada A cuadros)
	jr nc,L_A7A1		;a791
	ld a,(iy+006h)		;a793
	cp 007h		;a796
	jr z,L_A7A1		;a798
	inc a			;a79a
L_A79B:
	ld (iy+006h),a		;a79b
	call 05c75h		;a79e   ; velocidad: la velocidad A del objeto IY
L_A7A1:
	call 05c53h		;a7a1   ; avanza
	ld a,(iy+004h)		;a7a4   ; lee el tipo del objeto (p02:8000, p02:8063)
	cp 00ah		;a7a7
	ret z			;a7a9
	ld a,(iy+00eh)		;a7aa   ; si toca al jugador (p03:A80D), fuera
	call 081bbh		;a7ad   ; suma_x: suma A a la x de la ficha IY
	ld hl,0a80dh		;a7b0
	call 05a5ah		;a7b3   ; toca_al_jugador_2: como p00:5A68 con otro dano
	jp c,libera		;a7b6   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
dentro_o_fuera:		; si la ficha IY sale de la pantalla la libera; acarreo si sigue dentro
	ld a,(iy+000h)		;a7b9   ; fuera de la pantalla (y 1-0xAF, x 4-0xEF): libera la ficha y sin acarreo
	cp 0b0h		;a7bc
	jp nc,libera		;a7be   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	cp 001h		;a7c1
	jp c,libera		;a7c3   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	ld a,(iy+001h)		;a7c6   ; lee la x del objeto (p00:4BBB)
	cp 0f0h		;a7c9
	jp nc,libera		;a7cb   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	cp 004h		;a7ce
	jp c,libera		;a7d0   ; libera: libera la ficha IY (a cero, y fuera de la pantalla)
	scf			;a7d3   ; dentro: acarreo
	ret			;a7d4
dentro_o_fuera_2:		; lo mismo, liberando dos fichas
	ld a,(iy+000h)		;a7d5   ; lee la y del objeto (p00:4BBB)
	cp 0b0h		;a7d8
	jp nc,libera_2		;a7da   ; libera_2: libera la ficha IY y la de debajo
	cp 001h		;a7dd
	jp c,libera_2		;a7df   ; libera_2: libera la ficha IY y la de debajo
	ld a,(iy+001h)		;a7e2   ; lee la x del objeto (p00:4BBB)
	cp 0f0h		;a7e5
	jp nc,libera_2		;a7e7   ; libera_2: libera la ficha IY y la de debajo
	cp 004h		;a7ea
	jp c,libera_2		;a7ec   ; libera_2: libera la ficha IY y la de debajo
	scf			;a7ef
	ret			;a7f0
dentro_o_fuera_4:		; lo mismo con el suelo en 0xA7 (o B), liberando cuatro fichas
	ld b,0a7h		;a7f1   ; lo mismo, con el suelo en 0xA7 (o en B), para cuatro fichas
L_A7F3:
	ld a,(iy+000h)		;a7f3   ; lee la y del objeto (p00:4BBB)
	cp 0f0h		;a7f6
	jr nc,L_A7FE		;a7f8
	cp b			;a7fa
	jp nc,libera_4		;a7fb   ; libera_4: libera la ficha IY y las tres siguientes (fuera de la pantalla)
L_A7FE:
	ld a,(iy+001h)		;a7fe   ; lee la x del objeto (p00:4BBB)
	cp 0f0h		;a801
	jp nc,libera_4		;a803   ; libera_4: libera la ficha IY y las tres siguientes (fuera de la pantalla)
	cp 004h		;a806
	jp c,libera_4		;a808   ; libera_4: libera la ficha IY y las tres siguientes (fuera de la pantalla)
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
	ld a,(iy+005h)		;a811   ; el soldado que corre en la fase 9: sus colores (p03:A865)...
	and a			;a814
	jr nz,L_A831		;a815
	inc (iy+005h)		;a817   ; sube el estado del objeto (p03:A03E)
	call 09a24h		;a81a
	ld (iy+01bh),003h		;a81d
	ld bc,0a865h		;a821
	call 05e15h		;a824
	ld hl,0a974h		;a827   ; ...su figura de cuatro fichas (p03:A974) y a caer
	ld (iy+016h),002h		;a82a
	jp pon_figura_4		;a82e   ; pon_figura_4: como p02:9FFA y ademas las dos fichas siguientes (IY+20 e IY+30)
L_A831:
	ld a,(iy+016h)		;a831   ; si no esta cayendo, salta cuando el jugador esta cerca (0x8A a la derecha, 0x60 a la izquierda)
	and a			;a834
	jp nz,09ce3h		;a835
	ld a,(iy+00ah)		;a838   ; lee la y guardada del objeto (p02:9A24)
	cp 080h		;a83b
	jp nc,09ce3h		;a83d
	ld a,(iy+00bh)		;a840   ; lee la x guardada del objeto (p02:9A24)
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


espera_c:		; cada A cuadros (la cuenta IY+0C) el estado siguiente; acarreo al llegar
	call 09915h		;a869   ; cada A cuadros (IY+0C), el estado siguiente
	ret nc			;a86c
	inc (iy+005h)		;a86d   ; sube el estado del objeto (p03:A03E)
	ret			;a870
espera_c_b:		; cada A cuadros (IY+0C) el estado B; acarreo al llegar
	call 09915h		;a871   ; cada A cuadros (IY+0C), el estado B
	ret nc			;a874
	ld (iy+005h),b		;a875   ; guarda el estado del objeto (p03:A03E)
	ret			;a878
espera_d:		; cada A cuadros (la cuenta IY+0D) el estado siguiente; acarreo al llegar
	call 09921h		;a879   ; lo mismo con la cuenta IY+0D
	ret nc			;a87c
	inc (iy+005h)		;a87d   ; sube el estado del objeto (p03:A03E)
	ret			;a880
espera_d_b:		; cada A cuadros (IY+0D) el estado B; acarreo al llegar
	call 09921h		;a881   ; cuenta_d: lo mismo con la cuenta IY+0D (p02:9915 con IY + 1)
	ret nc			;a884
	ld (iy+005h),b		;a885   ; guarda el estado del objeto (p03:A03E)
	ret			;a888
libera_4:		; libera la ficha IY y las tres siguientes (fuera de la pantalla)
	ld bc,0003fh		;a889   ; libera cuatro fichas: las dos de arriba y las dos de abajo...
	call L_A8C0		;a88c
L_A88F:
	ld (iy+021h),0ech		;a88f
	ld (iy+031h),0ech		;a893
	ld (iy+020h),0ech		;a897
	ld (iy+030h),0ech		;a89b
	ld (iy+024h),000h		;a89f
	ld (iy+034h),000h		;a8a3
	jr L_A8AF		;a8a7
libera_2:		; libera la ficha IY y la de debajo
	ld bc,0001fh		;a8a9   ; ...dos...
	call L_A8C0		;a8ac
L_A8AF:
	ld (iy+010h),0ech		;a8af
	ld (iy+011h),0ech		;a8b3
	ld (iy+014h),000h		;a8b7
	and a			;a8bb
	ret			;a8bc
libera:		; libera la ficha IY (a cero, y fuera de la pantalla)
	ld bc,0000fh		;a8bd   ; ...o una: sus 16 bytes a cero...
L_A8C0:
	push iy		;a8c0
	pop hl			;a8c2
	push hl			;a8c3
	pop de			;a8c4
	inc de			;a8c5
	ld (hl),000h		;a8c6
	ldir		;a8c8
	ld (iy+000h),0ech		;a8ca   ; ...y fuera de la pantalla (y, x = 0xEC)
	ld (iy+001h),0ech		;a8ce   ; la x del objeto (p00:4BBB) = 0xEC
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
	di			;ae38   ; el jugador, cada cuadro. 0xE2CD: la cuenta de volver a salir tras perder una vida
	ld a,(0e2cdh)		;ae39
	and a			;ae3c
	jr z,L_AE74		;ae3d   ; sin cuenta: el jugador normal
	dec a			;ae3f
	ld (0e2cdh),a		;ae40
	jr z,L_AE56		;ae43   ; al llegar a cero: sale otra vez
	ei			;ae45
	ld (ix+00ah),0fch		;ae46   ; mientras cuenta, el jugador fuera (y 0xFC) y p12:9943 lo pinta llegando
	call L_BA10		;ae4a   ; sus balas siguen
	call 04532h		;ae4d   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	call 09943h		;ae50
	jp 0452dh		;ae53   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
L_AE56:
	xor a			;ae56   ; al acabar: sin palanca, sin salto...
	ld (0e180h),a		;ae57   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix+009h),a		;ae5a   ; sin caer ni hundirse
	ld (ix+01bh),a		;ae5d
	inc a			;ae60   ; un salto al salir (0xE062)
	ld (0e062h),a		;ae61
	ld a,010h		;ae64   ; ...la energia llena (0x10), la barra en el marcador y p03:BFF1
	ld (0e2c9h),a		;ae66   ; guarda la energia del jugador
	ei			;ae69
	call 045c3h		;ae6a
	call L_BFF1		;ae6d   ; y sus colores
	xor a			;ae70
	ld (0e2cdh),a		;ae71
L_AE74:
	ei			;ae74
	call 0531bh		;ae75   ; fuera de las bases, sin las botas (0xE033), uno de cada dos cuadros no se mueve (0xE2C8)
	jr c,L_AE8A		;ae78
	ld a,(0e033h)		;ae7a   ; con las botas (0xE033) todos los cuadros
	and a			;ae7d
	jr nz,L_AE8A		;ae7e
	ld a,(0e2c8h)		;ae80   ; sin ellas, uno si y otro no (0xE2C8 rota)
	rrca			;ae83
	ld (0e2c8h),a		;ae84
	jp c,L_B1F2		;ae87
L_AE8A:
	ld a,(0e020h)		;ae8a   ; en las fases 13 y 17, al entrar desde arriba (y 0x9F-0xFB)...
	cp 00dh		;ae8d   ; (en las fases 13 y 17)
	jr z,L_AE95		;ae8f
	cp 011h		;ae91
	jr nz,L_AED7		;ae93
L_AE95:
	ld a,(ix+00ah)		;ae95   ; lee la y del jugador (p03:B176)
	cp 0fch		;ae98   ; en la pantalla y por debajo de 0x9F: no esta entrando
	jr nc,L_AED7		;ae9a
	cp 09fh		;ae9c
	jr c,L_AED7		;ae9e
	ld b,(ix-00bh)		;aea0   ; ...baja poco a poco con su color (p00:4950/4958) hasta ponerse en pie
	ld a,(ix-00ah)		;aea3   ; IX-0A: 0 o 1 el color de entrar...
	cp 002h		;aea6
	jr nc,L_AECB		;aea8
	and a			;aeaa
	push af			;aeab
	call z,04958h		;aeac
	pop af			;aeaf
	call nz,04950h		;aeb0
	inc (ix+00ah)		;aeb3   ; sube la y del jugador (p03:B176)
	dec (ix-00bh)		;aeb6   ; ...IX-0B: 16 cuadros cada uno
	ld a,(ix-00bh)		;aeb9
	cp 0ffh		;aebc
	jp nz,L_B262		;aebe
	ld (ix-00bh),00fh		;aec1
	inc (ix-00ah)		;aec5
	jp L_B262		;aec8
L_AECB:
	xor a			;aecb   ; entrado: sin golpe
	ld (ix-00ah),a		;aecc
	ld (ix+00dh),a		;aecf   ; guarda el dibujo de abajo del jugador (p00:4B6D)
	ld (ix-006h),a		;aed2
	jr L_AF22		;aed5
L_AED7:
	ld a,(ix-005h)		;aed7   ; un golpe (IX-5 la direccion del empujon): el empujon manda en la palanca
	and a			;aeda   ; sin empujon, normal
	jp z,L_AF61		;aedb
	ld (0e180h),a		;aede   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	dec (ix-006h)		;aee1   ; cuenta del golpe (IX-6); los primeros cuadros, solo el empujon
	jr z,L_AF01		;aee4   ; al acabar el golpe, la energia
	ld a,(ix-006h)		;aee6
	add a,002h		;aee9   ; al principio del golpe, quieto
	cp 02fh		;aeeb
	jp c,L_B1F2		;aeed
	ld a,(ix-005h)		;aef0   ; lee la direccion del empujon del ultimo golpe (p03:AEDE)
	ld (0e180h),a		;aef3   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	call L_AF61		;aef6
	ld a,(ix-005h)		;aef9   ; lee la direccion del empujon del ultimo golpe (p03:AEDE)
	ld (0e180h),a		;aefc   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	jr L_AF61		;aeff
L_AF01:
	ld a,(0e025h)		;af01   ; al acabar el golpe, la energia baja lo que dice 0xE025...
	ld c,a			;af04
	ld a,(0e031h)		;af05   ; ...dos menos con el escudo (0xE031 o 0xE033)
	ld b,a			;af08
	ld a,(0e033h)		;af09
	or b			;af0c
	jr z,L_AF11		;af0d
	dec c			;af0f   ; escudo: dos menos de dano
	dec c			;af10
L_AF11:
	ld a,(0e2c9h)		;af11   ; lee la energia del jugador
	sub c			;af14
	jr nc,L_AF18		;af15   ; sin pasar de cero
	xor a			;af17
L_AF18:
	ld (0e2c9h),a		;af18   ; guarda la energia del jugador
	push af			;af1b
	call 045dah		;af1c   ; la barra de energia; si queda, sigue
	pop af			;af1f
	jr nz,L_AF53		;af20   ; si queda energia, sigue
L_AF22:
	ld a,001h		;af22   ; sin energia: una vida menos, con el sonido 0x27
	ld (0e2ceh),a		;af24   ; 0xE2CE = 1: el jugador muerto
	ld a,027h		;af27
	call 05052h		;af29   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld a,(0e021h)		;af2c   ; lee las vidas que quedan (en BCD)
	sub 001h		;af2f   ; una vida menos (BCD)
	daa			;af31
	ld (0e021h),a		;af32   ; guarda las vidas que quedan (en BCD)
	jr nz,L_AF3F		;af35   ; sin vidas: la fase acaba y la partida tambien (0xE183)
	ld (0e094h),a		;af37   ; guarda 1 mientras dura la fase
	inc a			;af3a
	ld (0e183h),a		;af3b   ; guarda sin vidas: se acaba la partida
	ret			;af3e
L_AF3F:
	ld a,080h		;af3f   ; con vidas: 0x80 cuadros para volver a salir...
	ld (0e2cdh),a		;af41   ; 0x80 cuadros de vuelta
	ld b,005h		;af44   ; ...y se pierden las armas y lo cogido (0xE030-0xE034)
	ld hl,0e030h		;af46   ; las armas (0xE030-0xE034) a cero
	call 051b2h		;af49   ; borra_b: pone a cero B bytes desde HL
	call 045aah		;af4c   ; REST en el marcador, y el jugador parpadea 0x80 cuadros
	ld (ix-002h),080h		;af4f   ; el parpadeo del jugador (bit 0: sin sprites este cuadro, p00:4B8C) = 0x80
L_AF53:
	ld a,(ix+00fh)		;af53   ; tras el golpe mira al otro lado y sin palanca
	cpl			;af56   ; da la vuelta
	ld (ix+00fh),a		;af57   ; guarda hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123)
	xor a			;af5a
	ld (0e180h),a		;af5b   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix-005h),a		;af5e   ; guarda la direccion del empujon del ultimo golpe (p03:AEDE)
L_AF61:
	ld a,(ix-007h)		;af61   ; en las bases y ya en el pasillo: a las puertas (p03:B0FC)
	and a			;af64
	jp nz,L_B0FC		;af65
	ld a,(0e2ceh)		;af68   ; con 0xE2CE o 0xE5C2 no se mueve
	and a			;af6b   ; muerto: a p03:AF98
	jr nz,$+44		;af6c
	ld a,(0e5c2h)		;af6e
	and a			;af71
	jr nz,$+38		;af72
	ld a,(0e180h)		;af74   ; la palanca elige que hacer: la tabla p03:AF86 (quieto, arriba, derecha, abajo, izquierda...)
	ld (ix+019h),a		;af77   ; guarda hacia donde dispara el jugador (la direccion de la palanca; p03:B7E4)
	ld hl,0af86h		;af7a   ; la tabla de lo que hace cada direccion
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
	ld (ix+005h),000h		;af98   ; quieto: la postura 0 (en las bases, la 0x17)
	ld a,(ix-007h)		;af9c   ; lee 1 si el jugador ha entrado en el pasillo (bases 3D; p03:AFE2, p03:B0FF)
	and a			;af9f
	jp nz,L_B0FC		;afa0
	call 0531bh		;afa3   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_AFAC		;afa6   ; fuera de las bases: la postura de pie
	ld (ix+005h),017h		;afa8   ; la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda) = 0x17
L_AFAC:
	jp L_B1F2		;afac
L_AFAF:
	ld a,(ix-007h)		;afaf   ; arriba: fuera de las bases mira hacia arriba (postura 0x0D)...
	and a			;afb2
	jp nz,L_B0FC		;afb3
	call 0531bh		;afb6   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_AFC1		;afb9   ; en las bases: a mirar si entra
	ld (ix+005h),00dh		;afbb   ; la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda) = 0x0D
	jr L_AFAC		;afbf
L_AFC1:
	ld a,(ix+006h)		;afc1   ; ...en las bases, entra en el pasillo si se puede:
	and a			;afc4   ; saltando no
	jr nz,L_AFAC		;afc5
	ld a,(0e022h)		;afc7   ; en la primera sala (salvo en la fase 14) siempre...
	and a			;afca   ; en la primera sala...
	jr nz,L_AFD4		;afcb
	ld a,(0e020h)		;afcd   ; lee la fase (0-19; la 8 se salta)
	cp 00eh		;afd0   ; ...de las bases anteriores a la 14...
	jr c,L_AFDA		;afd2
L_AFD4:
	ld a,(0e18bh)		;afd4   ; ...en las demas, con los blancos destruidos (0xE18B = 0xFF)
	inc a			;afd7   ; en las otras, si 0xE18B = 0xFF
	jr nz,L_AF98		;afd8
L_AFDA:
	ld (ix+00bh),078h		;afda   ; en medio (x 0x78), sin parpadear, dentro del pasillo (IX-7 = 1)
	ld (ix-002h),000h		;afde   ; el parpadeo del jugador (bit 0: sin sprites este cuadro, p00:4B8C) = 0x00
	ld (ix-007h),001h		;afe2   ; 1 si el jugador ha entrado en el pasillo (bases 3D; p03:AFE2, p03:B0FF) = 0x01
	ld (ix-008h),000h		;afe6   ; empieza a contar la entrada (IX-8)
L_AFEA:
	ld a,(0e062h)		;afea   ; el salto (0xE062): no con 0xE5C2...
	and a			;afed   ; sin boton de salto, nada
	jr z,L_B01E		;afee
	ld a,(0e5c2h)		;aff0
	and a			;aff3
	jr nz,L_B01E		;aff4
	ld a,(ix+009h)		;aff6   ; ...ni ya en el aire (IX+9) o cayendo (IX+6)
	and a			;aff9
	jr nz,L_B03B		;affa
	ld a,(ix+006h)		;affc   ; lee la fase del salto del jugador (0 en el suelo, 1 subiendo, 2 bajando; p03:B61F)
	and a			;afff
	jr nz,L_B03B		;b000
	ld a,(ix+00ah)		;b002   ; en el suelo de abajo (y 0xAF) no salta
	cp 0afh		;b005   ; en el suelo de abajo no
	jr z,L_AFAC		;b007
	call hay_suelo		;b009   ; hay suelo debajo? (p03:B4FA)
	jr nc,L_B03B		;b00c
	cp 001h		;b00e   ; en una plataforma fina:
	jr nz,L_B01E		;b010
	ld a,(ix+015h)		;b012   ; sobre una plataforma fina (IX+15 = 1) se deja caer: un punto mas abajo
	cp 001h		;b015
	jr nz,L_B01E		;b017
	inc (ix+00ah)		;b019   ; sube la y del jugador (p03:B176)
	jr L_B03B		;b01c
L_B01E:
	ld a,(ix+009h)		;b01e   ; ya en el aire o cayendo: no
	and a			;b021
	jr nz,L_B03B		;b022
	ld a,(ix+006h)		;b024   ; lee la fase del salto del jugador (0 en el suelo, 1 subiendo, 2 bajando; p03:B61F)
	and a			;b027
	jr nz,L_B03B		;b028
	ld a,(0e020h)		;b02a   ; en la fase 0, desde el agua (y >= 0xAF) no salta
	and a			;b02d   ; en la fase 0...
	jr nz,L_B042		;b02e
	ld a,(ix+00ah)		;b030   ; lee la y del jugador (p03:B176)
	cp 0afh		;b033   ; ...desde el agua no
	jr c,L_B042		;b035
	ld (ix+005h),000h		;b037   ; la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda) = 0x00
L_B03B:
	xor a			;b03b   ; el salto ya esta atendido
	ld (0e062h),a		;b03c   ; el boton ya atendido
	jp L_B1F2		;b03f
L_B042:
	ld (ix+005h),00ch		;b042   ; el salto: postura 0x0C (0x18 en las bases)
	call 0531bh		;b046   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_B03B		;b049   ; fuera de las bases, la postura de saltar normal
	ld (ix+005h),018h		;b04b   ; la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda) = 0x18
	jr L_B03B		;b04f
L_B051:
	call paso_de_andar		;b051   ; las posturas de andar: p03:B3A2 + 8, + 4, + 0x1F o + 0
	add a,008h		;b054   ; andando a la derecha: el paso + 8
	ld (ix+005h),a		;b056   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	jr L_B074		;b059
L_B05B:
	call paso_de_andar		;b05b   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	add a,004h		;b05e   ; en diagonal arriba: + 4
	ld (ix+005h),a		;b060   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	jr L_B074		;b063
L_B065:
	call paso_de_andar		;b065   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	add a,01fh		;b068   ; en las bases: + 0x1F
	ld (ix+005h),a		;b06a   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	ret			;b06d
L_B06E:
	call paso_de_andar		;b06e   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	ld (ix+005h),a		;b071   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
L_B074:
	call 0531bh		;b074   ; en las bases, la de las bases
	call c,L_B065		;b077
	ld (ix+00fh),000h		;b07a   ; mira a la derecha
	ld a,(ix+00bh)		;b07e   ; al llegar al borde derecho (x 0xEA)...
	cp 0eah		;b081   ; aun no en el borde: anda (p03:B38A)
	jp c,L_B38A		;b083
	ld a,(0e020h)		;b086   ; ...en las fases que van a la derecha (p03:B18B: 0, 6, 7, 8, 9 y 19)...
	ld hl,0b18bh		;b089   ; las fases que van a la derecha (p03:B18B)
	ld bc,00006h		;b08c
	cpir		;b08f
	jp nz,L_B1F2		;b091
	ld a,(0e045h)		;b094   ; ...y sin 0xE045 (el jefe de la pantalla vivo)...
	and a			;b097   ; con el jefe vivo (0xE045) no se pasa
	ld a,(0e020h)		;b098   ; lee la fase (0-19; la 8 se salta)
	jp nz,L_B1F2		;b09b
	ld b,001h		;b09e   ; ...la pantalla siguiente (p03:B58B con B = 1)...
	call cambia_tramo		;b0a0   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;b0a3   ; si no hay pantalla siguiente, no
	jp z,L_B1F2		;b0a4
	ld (ix+00bh),00ch		;b0a7   ; ...y el jugador a la izquierda del todo (x 0x0C)
	call pantalla_nueva		;b0ab   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	jp L_B1F2		;b0ae
L_B0B1:
	call paso_de_andar		;b0b1   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	add a,008h		;b0b4
	ld (ix+005h),a		;b0b6   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	jr L_B0CB		;b0b9
L_B0BB:
	call paso_de_andar		;b0bb   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	add a,004h		;b0be
	ld (ix+005h),a		;b0c0   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	jr L_B0CB		;b0c3
L_B0C5:
	call paso_de_andar		;b0c5   ; paso_de_andar: A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	ld (ix+005h),a		;b0c8   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
L_B0CB:
	call 0531bh		;b0cb   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	call c,L_B065		;b0ce
	ld (ix+00fh),0ffh		;b0d1   ; mira a la izquierda
	ld a,(ix+00bh)		;b0d5   ; al llegar al borde izquierdo (x 0x0A) en las fases 13 y 17...
	cp 00ah		;b0d8   ; aun no en el borde: anda (p03:B396)
	jp nc,L_B396		;b0da
	ld a,(0e020h)		;b0dd   ; lee la fase (0-19; la 8 se salta)
	cp 00dh		;b0e0
	jr z,L_B0E9		;b0e2
	cp 011h		;b0e4
	jp nz,L_B1F2		;b0e6
L_B0E9:
	ld b,0ffh		;b0e9   ; ...la pantalla anterior (B = -1)...
	call cambia_tramo		;b0eb   ; cambia_tramo: suma B al tramo (0xE022) si la lista de la fase sigue; acarreo si no
	and a			;b0ee   ; si no hay pantalla anterior, no
	jp z,L_B1F2		;b0ef
	ld (ix+00bh),0e8h		;b0f2   ; ...y el jugador a la derecha del todo (x 0xE8)
	call pantalla_nueva		;b0f6   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	jp L_B1F2		;b0f9
L_B0FC:
	call L_BA10		;b0fc   ; en las bases: ya dentro del pasillo, a una puerta
	ld a,(ix-007h)		;b0ff   ; lee 1 si el jugador ha entrado en el pasillo (bases 3D; p03:AFE2, p03:B0FF)
	cp 001h		;b102   ; entrando (IX-7 = 1): andando hacia el fondo
	jp z,L_B1AE		;b104
	ld a,(0e180h)		;b107   ; a la derecha: hasta x 0x90 anda; alli, la puerta derecha (p03:B191)
	cp 003h		;b10a
	jr nz,L_B11F		;b10c
	ld (ix+00fh),000h		;b10e   ; hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123) = 0x00
	ld a,(ix+00bh)		;b112   ; lee la x del jugador (p03:B17A; medida jugando)
	cp 090h		;b115
	jp nc,sale_derecha		;b117   ; sale_derecha: en una base: sale por la puerta derecha a la sala de la tabla (FF: no hay)
	inc (ix+00bh)		;b11a   ; sube la x del jugador (p03:B17A; medida jugando)
	jr L_B137		;b11d
L_B11F:
	cp 007h		;b11f   ; a la izquierda: hasta x 0x60; alli, la puerta izquierda
	jr nz,L_B133		;b121
	ld (ix+00fh),0ffh		;b123   ; hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123) = 0xFF
	ld a,(ix+00bh)		;b127   ; lee la x del jugador (p03:B17A; medida jugando)
	cp 060h		;b12a
	jr c,sale_izquierda		;b12c
	dec (ix+00bh)		;b12e   ; baja la x del jugador (p03:B17A; medida jugando)
	jr L_B137		;b131
L_B133:
	ld a,01eh		;b133   ; quieto: la postura 0x1E
	jr L_B144		;b135
L_B137:
	ld a,(0e1c1h)		;b137   ; andando: la postura 0x1D o 0x1E segun la cuenta de cuadros (cada 8)
	and 008h		;b13a   ; el paso de andar de lado, cada 8 cuadros
	srl a		;b13c
	srl a		;b13e
	srl a		;b140
	add a,01dh		;b142
L_B144:
	ld (ix+005h),a		;b144   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	jp L_B247		;b147
sale_izquierda:		; en una base: sale por la puerta izquierda a la sala de la tabla (FF: no hay)
	ld hl,0b45dh		;b14a   ; la tabla de la puerta izquierda de la base: fase 1 p03:B45D, 4 p03:B467, 11 p03:B475, 14 p03:B489
	ld a,(0e020h)		;b14d   ; lee la fase (0-19; la 8 se salta)
	cp 001h		;b150   ; la base de la fase 1, la 4, la 11 o la 14
	jr z,L_B165		;b152
	ld hl,0b467h		;b154
	cp 004h		;b157
	jr z,L_B165		;b159
	ld hl,0b475h		;b15b
	cp 00bh		;b15e
	jr z,L_B165		;b160
	ld hl,0b489h		;b162
L_B165:
	ld a,(0e022h)		;b165   ; la sala a la que lleva desde la sala de ahora (FF: no hay puerta)
	call 051b8h		;b168   ; lee_tabla: HL = HL + A y A = (HL)
	cp 0ffh		;b16b   ; sin puerta: sigue andando
	jr z,L_B137		;b16d
	ld (0e022h),a		;b16f   ; la sala nueva: fuera del pasillo, al fondo y en medio (y 0x9F, x 0x78)...
	ld (ix-007h),000h		;b172   ; 1 si el jugador ha entrado en el pasillo (bases 3D; p03:AFE2, p03:B0FF) = 0x00
	ld (ix+00ah),09fh		;b176   ; la y del jugador (p03:B176) = 0x9F
	ld (ix+00bh),078h		;b17a   ; la x del jugador (p03:B17A; medida jugando) = 0x78
	set 0,a		;b17e   ; ...y se construye (p03:BB0C)
	call pantalla_nueva		;b180   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	xor a			;b183   ; sin disparo ni salto pendientes
	ld (0e060h),a		;b184   ; sin disparo ni salto pendientes
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
	ld hl,0b462h		;b191   ; la de la puerta derecha: p03:B462, B46E, B47F o B497
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
	ld a,(0e1c1h)		;b1ae   ; entrando en el pasillo: 0x2F cuadros andando hacia el fondo...
	and 008h		;b1b1   ; el paso de andar hacia el fondo
	srl a		;b1b3
	srl a		;b1b5
	srl a		;b1b7
	ld b,a			;b1b9
	ld a,(ix-008h)		;b1ba   ; la cuenta de la entrada (IX-8)
	inc (ix-008h)		;b1bd
	cp 02fh		;b1c0   ; 0x2F cuadros
	jr c,L_B1CA		;b1c2
	inc (ix-007h)		;b1c4   ; ...y ya dentro (IX-7 = 2)
	jp L_B0FC		;b1c7
L_B1CA:
	ld a,(ix-008h)		;b1ca   ; la postura de andar hacia el fondo, segun la cuenta de cuadros
	cp 018h		;b1cd   ; los 0x18 primeros, una postura...
	jr c,L_B1E7		;b1cf
	ld a,01bh		;b1d1   ; ...luego otra
	add a,b			;b1d3
	ld (ix+005h),a		;b1d4   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
	inc (ix-009h)		;b1d7   ; sube un punto cada dos cuadros
	ld a,(ix-009h)		;b1da   ; y sube cada dos cuadros (IX-9)
	cp 002h		;b1dd
	jr c,L_B247		;b1df
	ld (ix-009h),000h		;b1e1
	jr L_B1ED		;b1e5
L_B1E7:
	ld a,019h		;b1e7
	add a,b			;b1e9
	ld (ix+005h),a		;b1ea   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
L_B1ED:
	dec (ix+00ah)		;b1ed   ; baja la y del jugador (p03:B176)
	jr L_B247		;b1f0
L_B1F2:
	ld a,(0e033h)		;b1f2   ; con 0xE033 = 2, uno de cada dos cuadros se repite p03:AE38 (el jugador va mas deprisa)
	cp 002h		;b1f5   ; 0xE033 = 2: las botas rapidas
	jr nz,L_B203		;b1f7
	ld a,(0e2c8h)		;b1f9
	rrca			;b1fc
	ld (0e2c8h),a		;b1fd
	jp c,L_AE38		;b200
L_B203:
	call L_B5EE		;b203   ; el disparo (p03:B5EE), los choques (p03:BA5C, p03:BADB, p03:B7B7) y p03:BA10
	call L_BA5C		;b206   ; los choques con el suelo y las paredes, el parpadeo y el disparo
	call L_BADB		;b209
	call L_B7B7		;b20c
	call L_BA10		;b20f
	ld a,(ix-006h)		;b212   ; el golpe (IX-6): parpadea 0x60 cuadros...
	and a			;b215   ; sin golpe, la postura que toca
	jr z,L_B247		;b216
	cp 003h		;b218   ; las tres primeras veces...
	jr nc,L_B220		;b21a
	ld (ix-002h),060h		;b21c   ; el parpadeo del jugador (bit 0: sin sprites este cuadro, p00:4B8C) = 0x60
L_B220:
	ld b,014h		;b220   ; ...y la postura del golpe (0x14, 0x13 o 0x12 segun lo que dure)
	cp 028h		;b222   ; ...hasta 0x28 cuadros...
	jr nc,L_B22D		;b224
	push bc			;b226
	call hay_suelo		;b227   ; hay_suelo: acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)
	pop bc			;b22a
	jr c,L_B235		;b22b
L_B22D:
	ld b,013h		;b22d
	cp 03ch		;b22f   ; ...hasta 0x3C
	jr c,L_B235		;b231
	ld b,012h		;b233
L_B235:
	ld a,(0e020h)		;b235   ; en el agua de la fase 0, la 0x13
	and a			;b238   ; en la fase 0...
	jr nz,L_B244		;b239
	ld a,(ix+00ah)		;b23b   ; lee la y del jugador (p03:B176)
	cp 0afh		;b23e   ; ...en el agua
	jr c,L_B244		;b240
	ld b,013h		;b242
L_B244:
	ld (ix+005h),b		;b244   ; guarda la postura del jugador (la tabla de dibujos p03:B3AE, o p03:B3F4 mirando a la izquierda)
L_B247:
	ld hl,0b3aeh		;b247   ; los dibujos de la postura: la tabla de mirar a la derecha (p03:B3AE)...
	ld a,(ix+00fh)		;b24a   ; ...o a la izquierda (p03:B3F4)
	and a			;b24d   ; mirando a la izquierda: la otra tabla
	jr z,L_B253		;b24e
	ld hl,0b3f4h		;b250
L_B253:
	ld a,(ix+005h)		;b253   ; dos bytes por postura: el dibujo de arriba y el de abajo
	add a,a			;b256   ; dos bytes por postura
	call 051b8h		;b257   ; lee_tabla: HL = HL + A y A = (HL)
	ld (ix+00ch),a		;b25a   ; guarda el dibujo de arriba del jugador (p00:4B54)
	inc hl			;b25d
	ld a,(hl)			;b25e
	ld (ix+00dh),a		;b25f   ; guarda el dibujo de abajo del jugador (p00:4B6D)
L_B262:
	ld hl,0b43ah		;b262   ; los sprites del jugador segun la postura: la tabla de alturas p03:B43A
	ld a,(ix+005h)		;b265   ; las posturas 0x0C y 0x15 (saltando), 0x0E-0x11 y 0x14 (agachado, de lado) van aparte
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
	ld a,(0e020h)		;b284   ; en el agua de la fase 0 (y >= 0xAF) se hunde poco a poco (IX+1B hasta 6)...
	and a			;b287
	jr nz,L_B2B8		;b288
	ld a,(ix+00ah)		;b28a   ; lee la y del jugador (p03:B176)
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
	ld (ix+00dh),024h		;b29e   ; ...con el dibujo de abajo 0x24 (el agua)...
	push bc			;b2a2
	push af			;b2a3
	ld a,(0e2cfh)		;b2a4   ; ...y la primera vez el sonido 0x39 (0xE2CF)
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
	ld a,(ix+00ah)		;b2b8   ; lee la y del jugador (p03:B176)
L_B2BB:
	ld (ix+01bh),000h		;b2bb
L_B2BF:
	sub b			;b2bf   ; la y de arriba = la del jugador menos la altura de la postura (2 menos en la fase 18)
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
	ld (ix-020h),a		;b2cd   ; los cuatro sprites: los dos de arriba (IX-20, IX-10) a esa y, los de abajo 0x10 mas
	ld (ix-010h),a		;b2d0
	add a,010h		;b2d3
	ld (ix+000h),a		;b2d5
	ld (ix+010h),a		;b2d8
L_B2DB:
	ld a,(ix+00bh)		;b2db   ; la misma x en los cuatro
	ld (ix+001h),a		;b2de
	ld (ix+011h),a		;b2e1
	ld (ix-01fh),a		;b2e4
	ld (ix-00fh),a		;b2e7
L_B2EA:
	ld (ix-01eh),000h		;b2ea   ; los dibujos 0, 4, 8 y 0x0C (los cuatro de 16 x 16 del jugador)
	ld (ix-00eh),004h		;b2ee
	ld (ix+002h),008h		;b2f2
	ld (ix+012h),00ch		;b2f6
	ld a,(ix+00ah)		;b2fa   ; lee la y del jugador (p03:B176)
	ret			;b2fd
L_B2FE:
	call 051b8h		;b2fe   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,(hl)			;b301   ; saltando: la y de la postura...
	ld a,(ix+00ah)		;b302   ; lee la y del jugador (p03:B176)
	sub b			;b305
	ld b,a			;b306
	ld a,(ix+00fh)		;b307   ; ...y los sprites de lado segun hacia donde mira
	and a			;b30a
	jp nz,L_B375		;b30b
	jr L_B33A		;b30e
L_B310:
	call 051b8h		;b310   ; lee_tabla: HL = HL + A y A = (HL)
	ld b,(hl)			;b313
	ld a,(ix+00ah)		;b314   ; lee la y del jugador (p03:B176)
	sub b			;b317
	ld b,a			;b318
	ld a,(ix+005h)		;b319   ; agachado o tumbado: cada postura su colocacion
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
	ld a,(ix+00fh)		;b334   ; lee hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123)
	and a			;b337
	jr nz,L_B375		;b338
L_B33A:
	ld a,(ix+00bh)		;b33a   ; tumbado mirando a la derecha: los de arriba a la izquierda (x - 8) y los otros 0x10 a la derecha
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
	ld a,b			;b35d   ; de pie: los de arriba 0x10 por encima
	ld (ix+000h),a		;b35e
	ld (ix+010h),a		;b361
	add a,010h		;b364
	ld (ix-020h),a		;b366
	ld (ix-010h),a		;b369
	jp L_B2DB		;b36c
L_B36F:
	ld a,(ix+00fh)		;b36f   ; lee hacia donde mira el jugador (0 derecha, 0xFF izquierda; p03:B10E, p03:B123)
	and a			;b372
	jr nz,L_B33A		;b373
L_B375:
	ld a,(ix+00bh)		;b375   ; tumbado mirando a la izquierda, al reves
	sub 008h		;b378
	ld (ix-01fh),a		;b37a
	ld (ix-00fh),a		;b37d
	add a,010h		;b380
	ld (ix+001h),a		;b382
	ld (ix+011h),a		;b385
	jr L_B34D		;b388
L_B38A:
	call choca_derecha		;b38a   ; a la derecha: si no hay pared, un paso
	jp c,L_B1F2		;b38d
	inc (ix+00bh)		;b390   ; sube la x del jugador (p03:B17A; medida jugando)
	jp L_B1F2		;b393
L_B396:
	call choca_izquierda		;b396   ; a la izquierda: si no hay pared, un paso
	jp c,L_B1F2		;b399
	dec (ix+00bh)		;b39c   ; baja la x del jugador (p03:B17A; medida jugando)
	jp L_B1F2		;b39f
paso_de_andar:		; A = el paso de la animacion de andar (bits 3-4 de la cuenta 0xE1C2)
	ld a,(0e1c2h)		;b3a2   ; el paso de andar: la cuenta de cuadros 0xE1C2 / 8 (de 0 a 3)
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
	ld bc,0e804h		;b4a5   ; en una plataforma fina? dos casillas bajo los pies (IX+15 la de la izquierda)
	call casilla_bajo		;b4a8   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld (ix+015h),a		;b4ab
	ld bc,0e80ah		;b4ae
	call casilla_bajo		;b4b1   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
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
choca_derecha:		; acarreo si a la derecha del jugador hay pared (dibujos por debajo de 3)
	ld a,(ix+00ah)		;b4c3   ; pared a la derecha: fuera de la pantalla por arriba o por abajo, no
	cp 010h		;b4c6
	jr c,L_B4C1		;b4c8
	cp 0ech		;b4ca
	jr nc,L_B4C1		;b4cc
	ld bc,0000ch		;b4ce   ; la casilla de la derecha (12 a la derecha) y las dos de encima
	call casilla_bajo		;b4d1   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
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
	ld b,(ix+014h)		;b4ed   ; y la de los pies
	ld c,00ch		;b4f0
	call casilla_bajo		;b4f2   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld (ix+015h),a		;b4f5
	jr L_B55D		;b4f8
hay_suelo:		; acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)
	ld a,(ix+00ah)		;b4fa   ; suelo: solo en la ultima linea de una casilla (y de 8 en 8)...
	and 007h		;b4fd
	cp 007h		;b4ff
	jp nz,L_B572		;b501
	ld bc,00104h		;b504   ; ...las dos casillas bajo los pies (4 y 0x0A a la derecha)...
	call casilla_bajo		;b507   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld (ix+015h),a		;b50a
	ld bc,0010ah		;b50d
	call casilla_bajo		;b510   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld (ix+016h),a		;b513
	cp 003h		;b516   ; ...un dibujo por debajo de 3 es suelo...
	jr c,L_B529		;b518
	ld a,(ix+015h)		;b51a
	cp 003h		;b51d
	jr c,L_B529		;b51f
	ld a,(0e2c5h)		;b521   ; ...y encima de una plataforma que se mueve (0xE2C5) tambien
	and a			;b524
	jr nz,L_B529		;b525
L_B527:
	xor a			;b527
	ret			;b528
L_B529:
	scf			;b529
	ret			;b52a
choca_izquierda:		; acarreo si a la izquierda del jugador hay pared
	ld a,(ix+00ah)		;b52b   ; pared a la izquierda: lo mismo 2 a la izquierda
	cp 010h		;b52e
	jr c,L_B527		;b530
	cp 0ech		;b532
	jr nc,L_B527		;b534
	ld bc,00002h		;b536
	call casilla_bajo		;b539   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
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
	call casilla_bajo		;b557   ; casilla_bajo: A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld (ix+015h),a		;b55a
L_B55D:
	ld a,(ix+00ah)		;b55d   ; si los dos son suelo o las dos paredes
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
	cp 001h		;b574   ; 1 (el suelo fino) solo cuenta sin estar cayendo
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
	di			;b58b   ; cambia de tramo: el banco de la fase en 0x6000 (p03:BAE4)...
	ld hl,0bae4h		;b58c
	ld a,(0e020h)		;b58f   ; lee la fase (0-19; la 8 se salta)
	call 051b8h		;b592   ; lee_tabla: HL = HL + A y A = (HL)
	call 04f78h		;b595   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld a,(0e022h)		;b598   ; ...el tramo + B (si pasa de 0xF0, no)...
	add a,b			;b59b
	cp 0f0h		;b59c
	jr nc,L_B5BF		;b59e
	ld (0e022h),a		;b5a0   ; guarda el tramo: la pantalla de la lista de la fase
	push af			;b5a3
	ld hl,06000h		;b5a4   ; ...la lista de pantallas de la fase (0x6000 + 2 x fase)...
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
	and a			;b5b5   ; ...y si la de ese tramo es 0 (el final de la lista), se deja como estaba: sin cambio (A = 0)
	jr nz,L_B5C2		;b5b6
	ld a,(0e022h)		;b5b8   ; lee el tramo: la pantalla de la lista de la fase
	sub b			;b5bb
	ld (0e022h),a		;b5bc   ; guarda el tramo: la pantalla de la lista de la fase
L_B5BF:
	ei			;b5bf
	xor a			;b5c0
	ret			;b5c1
L_B5C2:
	ei			;b5c2   ; cambiado: A = 1
	ld a,001h		;b5c3
	ret			;b5c5
casilla_bajo:		; A = el dibujo del mapa 0xC300 bajo el jugador + (B, C) en y, x (HL, su casilla)
	ld a,(ix+00ah)		;b5c6   ; la casilla de (y + B, x + C): fila (y / 8) x 32...
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
	ld a,c			;b5e4   ; ...mas la columna (x / 8)
	srl a		;b5e5
	srl a		;b5e7
	srl a		;b5e9
	jp 051b8h		;b5eb   ; lee_tabla: HL = HL + A y A = (HL)
L_B5EE:
	ld a,(ix+00ch)		;b5ee   ; el salto: agachado (dibujos 0x0D o 0x12) no salta
	cp 00dh		;b5f1
	jr z,L_B5F9		;b5f3
	cp 012h		;b5f5
	jr nz,L_B5FE		;b5f7
L_B5F9:
	ld (ix+006h),000h		;b5f9
	ret			;b5fd
L_B5FE:
	ld a,(ix+006h)		;b5fe   ; ya en el aire, a seguir
	and a			;b601
	jr nz,L_B642		;b602
	ld a,(0e062h)		;b604   ; con el boton de salto (0xE062)...
	and a			;b607
	ret z			;b608
	xor a			;b609
	ld (0e062h),a		;b60a
	ld (0e2cfh),a		;b60d
	ld a,(0e5c2h)		;b610   ; ...y sin 0xE5C2, sin empujon y en el suelo...
	and a			;b613
	ret nz			;b614
	ld a,(ix-005h)		;b615
	and a			;b618
	ret nz			;b619
	ld a,(ix+009h)		;b61a
	and a			;b61d
	ret nz			;b61e
	inc (ix+006h)		;b61f   ; ...empieza a subir; el sonido 1 por p00:49A0
	ld (ix+01bh),000h		;b622
	ld a,001h		;b626
	call 049a0h		;b628
	ld a,(0e180h)		;b62b   ; hacia donde salta: derecha (IX+8 = 2) o izquierda (1) segun la palanca
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
	ld hl,0b757h		;b642   ; la tabla del salto: la de siempre (p03:B757), o mas alta con 0xE031 1 (p03:B777) o 2 (p03:B797)
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
	ld a,(0e000h)		;b65d   ; subiendo: en la partida, con el boton soltado y algo subido, deja de subir (salto corto)
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
	ld a,(ix+007h)		;b677   ; hasta 0x20 pasos de subida
	cp 020h		;b67a
	jr nc,L_B6DF		;b67c
	inc (ix+007h)		;b67e
	call 051b8h		;b681   ; lee_tabla: HL = HL + A y A = (HL)
	and a			;b684   ; cuanto sube en este paso (la tabla), punto a punto...
	jp z,L_B746		;b685
	ld b,a			;b688
L_B689:
	push bc			;b689
	ld a,(ix+00ah)		;b68a   ; ...por arriba de la pantalla en las fases que suben (p03:B6C1)...
	cp 010h		;b68d
	jr nc,L_B694		;b68f
	call L_B6C1		;b691
L_B694:
	ld a,(ix+00ah)		;b694
	cp 0f8h		;b697
	jr nc,L_B6A3		;b699
	call L_B4A5		;b69b   ; ...y si choca con el techo, no sube
	jr c,L_B6A3		;b69e
	dec (ix+00ah)		;b6a0
L_B6A3:
	pop bc			;b6a3
	djnz L_B689		;b6a4
	jp L_B746		;b6a6
L_B6A9:
	push af			;b6a9   ; con 0xE032 = 2, B = -8 (la x del disparo)
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
	ld a,(0e020h)		;b6c1   ; en las fases 3 y 18, al llegar arriba, la pantalla siguiente (p03:B58B con B = 1) y abajo del todo
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
	inc (ix+006h)		;b6df   ; arriba del todo: a bajar
L_B6E2:
	ld a,(ix+007h)		;b6e2   ; bajando: la misma tabla al reves...
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
	ld a,(ix+00ah)		;b6fa   ; ...punto a punto, mirando el suelo en cada linea de casilla...
	and 007h		;b6fd
	and a			;b6ff
	jr z,L_B712		;b700
	ld a,(ix+00ah)		;b702
	cp 0f8h		;b705
	jr nc,L_B717		;b707
	cp 010h		;b709
	jr c,L_B717		;b70b
	call hay_suelo		;b70d   ; hay_suelo: acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)
	jr c,L_B71F		;b710
L_B712:
	call L_BAAD		;b712
	jr L_B71A		;b715
L_B717:
	inc (ix+00ah)		;b717   ; ...fuera de la pantalla, sin mirar
L_B71A:
	pop bc			;b71a
	djnz L_B6F9		;b71b
	jr L_B746		;b71d
L_B71F:
	pop bc			;b71f
L_B720:
	xor a			;b720   ; en el suelo: acaba el salto
	ld (ix+008h),a		;b721
	ld (ix+006h),a		;b724
	ld (ix+007h),a		;b727
	ld (0e062h),a		;b72a
	ld a,(0e094h)		;b72d   ; al caer en el suelo, el sonido (p00:499C); al agua, el 0x15
	and a			;b730
	jp z,0499ch		;b731
	call hay_suelo		;b734   ; hay_suelo: acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)
	jp nc,0499ch		;b737
	xor a			;b73a
	ld (0e2ceh),a		;b73b
	ld a,015h		;b73e
	call 05052h		;b740   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 0499ch		;b743
L_B746:
	ld a,(0e1c2h)		;b746   ; en el aire, la postura de dar vueltas (0x0E-0x11, cada 8 cuadros)
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
	ld a,(ix+01ah)		;b7b7   ; el disparo: la cuenta del arma (IX+1A) entre disparo y disparo
	and a			;b7ba
	jr z,L_B7C4		;b7bb
	dec (ix+01ah)		;b7bd
	xor a			;b7c0
	ld (0e060h),a		;b7c1
L_B7C4:
	ld a,(0e060h)		;b7c4   ; sin el boton (0xE060), nada
	and a			;b7c7
	ret z			;b7c8
	ld a,(0e2ceh)		;b7c9
	and a			;b7cc
	ret nz			;b7cd
	ld (0e060h),a		;b7ce
	ld a,(0e5c2h)		;b7d1
	and a			;b7d4
	ret nz			;b7d5
	ld a,(ix-006h)		;b7d6   ; ni con el golpe
	and a			;b7d9
	ret nz			;b7da
	ld a,(ix+005h)		;b7db   ; la postura de disparar y la direccion de la palanca (IX+19)
	ld (ix+004h),a		;b7de
	ld a,(0e180h)		;b7e1   ; lee la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (ix+019h),a		;b7e4
	ld hl,0b7f3h		;b7e7   ; la direccion elige en la tabla p03:B7F3 (9 entradas, una por direccion)
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
	ld (ix+019h),003h		;b805   ; a la derecha: en las bases, hacia el fondo (9), 0x1A por encima
	call 0531bh		;b809   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr nc,L_B81D		;b80c
	ld (ix+019h),009h		;b80e
	ld a,(ix+00ah)		;b812
	sub 01ah		;b815
	ld b,a			;b817
	ld c,(ix+00bh)		;b818
	jr L_B84E		;b81b
L_B81D:
	ld a,(ix+00fh)		;b81d   ; quieto y mirando a la izquierda: a la izquierda (7)
	and a			;b820
	jr z,L_B86C		;b821
	ld (ix+019h),007h		;b823
	jp L_B926		;b827
L_B82A:
	call 0531bh		;b82a   ; arriba: (en las bases, al fondo) la postura 0x16 y el disparo 0x25 por encima, recto
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
	call 0531bh		;b851   ; arriba a la derecha: 0x24 por encima y 6 a la derecha
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
	call 0531bh		;b86c   ; a la derecha: la postura 1, 0x1D por encima y 7 a la derecha
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
	call 0531bh		;b891   ; abajo a la derecha: 0x1A por encima y 6 a la derecha
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
	ld a,(ix+006h)		;b8ac   ; abajo: en el aire, hacia abajo; en el agua de la fase 0, como a la derecha
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
	call 0531bh		;b8c8   ; en las bases, al fondo (9)
	jr nc,L_B8DD		;b8cb
	ld (ix+019h),009h		;b8cd
	ld a,(ix+00ah)		;b8d1
	sub 010h		;b8d4
	ld b,a			;b8d6
	ld c,(ix+00bh)		;b8d7
L_B8DA:
	jp L_B97D		;b8da
L_B8DD:
	ld (ix+005h),015h		;b8dd   ; en el suelo: tumbado (postura 0x15), hacia donde mira, 0x0C por encima
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
	and a			;b8ff   ; 0x10 a la izquierda si mira a la izquierda
	jr z,L_B904		;b900
	ld c,0f0h		;b902
L_B904:
	ld a,(ix+00bh)		;b904
	add a,c			;b907
	ld c,a			;b908
	jr L_B97D		;b909
L_B90B:
	call 0531bh		;b90b   ; abajo a la izquierda: 0x1A por encima y 6 a la izquierda
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
	call 0531bh		;b926   ; a la izquierda: la postura 1, 0x1D por encima y 3 a la izquierda
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
	call 0531bh		;b94b   ; arriba a la izquierda: 0x24 por encima y 6 a la izquierda
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
	ld a,(ix+006h)		;b966   ; hacia abajo (5), en el aire: 0x10 por encima
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
	ld iy,0e340h		;b97d   ; la bala nueva: primero las dos fichas de 0xE340...
	ld d,002h		;b981
L_B983:
	ld a,(iy+004h)		;b983   ; lee el tipo del objeto (p02:8000, p02:8063)
	and a			;b986
	jr z,L_B9C3		;b987
	push bc			;b989
	call 0531bh		;b98a   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	pop bc			;b98d
	jr c,L_B99C		;b98e
	ld a,(0e032h)		;b990   ; ...con el arma 1, 6 o 7 (0xE032) solo esas dos (fuera de las bases)
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
	ld iy,0e4c0h		;b9a6   ; ...con las demas, tambien las cuatro de 0xE4C0
	ld d,004h		;b9aa
L_B9AC:
	ld a,(iy+004h)		;b9ac   ; lee el tipo del objeto (p02:8000, p02:8063)
	and a			;b9af
	jr z,L_B9C3		;b9b0
	push de			;b9b2
	ld de,00010h		;b9b3
	add iy,de		;b9b6
	pop de			;b9b8
	dec d			;b9b9
	jr nz,L_B9AC		;b9ba
	ld a,(ix+004h)		;b9bc   ; sin ficha libre: la postura de antes
	ld (ix+005h),a		;b9bf
	ret			;b9c2
L_B9C3:
	ld a,(0e032h)		;b9c3   ; el tipo de la bala: el arma + 1 (en las bases, el 4)
	inc a			;b9c6
	ld (iy+004h),a		;b9c7   ; guarda el tipo del objeto (p02:8000, p02:8063)
	dec a			;b9ca
	and a			;b9cb
	jr z,L_B9D9		;b9cc
	push bc			;b9ce
	call 0531bh		;b9cf   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	pop bc			;b9d2
	jr nc,L_B9D9		;b9d3
	ld (iy+004h),004h		;b9d5   ; el tipo del objeto (p02:8000, p02:8063) = 0x04
L_B9D9:
	ld (iy+005h),000h		;b9d9   ; en la boca del arma (B, C)...
	ld (iy+000h),b		;b9dd   ; guarda la y del objeto (p00:4BBB)
	ld (iy+001h),c		;b9e0   ; guarda la x del objeto (p00:4BBB)
	ld (iy+00fh),001h		;b9e3   ; ...y si el jugador esta tumbado en el agua (dibujo 0x33), IY+0D = 1
	ld a,(ix+00dh)		;b9e7
	cp 033h		;b9ea
	jr nz,L_B9F2		;b9ec
	ld (iy+00dh),001h		;b9ee   ; la segunda cuenta del objeto (p02:9921) = 0x01
L_B9F2:
	ld a,(ix+019h)		;b9f2   ; su direccion, la del disparo
	ld (iy+003h),a		;b9f5
	cp 009h		;b9f8
	ret nz			;b9fa
	ld a,(ix+00bh)		;b9fb   ; hacia el fondo de la base con las armas 6 y 7: estado 0
	ld a,(0e032h)		;b9fe
	cp 006h		;ba01
	jr z,L_BA08		;ba03
	cp 007h		;ba05
	ret nz			;ba07
L_BA08:
	xor a			;ba08
	ld (iy+005h),a		;ba09   ; guarda el estado del objeto (p03:A03E)
	ld (iy+00ah),a		;ba0c   ; guarda la y guardada del objeto (p02:9A24)
	ret			;ba0f
L_BA10:
	ld iy,0e340h		;ba10   ; las balas del jugador, cada cuadro (p00:54DF): las dos de 0xE340...
	ld b,002h		;ba14
L_BA16:
	push bc			;ba16
	ld a,(iy+004h)		;ba17   ; lee el tipo del objeto (p02:8000, p02:8063)
	and a			;ba1a
	call nz,054dfh		;ba1b
	ld de,00010h		;ba1e
	add iy,de		;ba21
	pop bc			;ba23
	djnz L_BA16		;ba24
	ld iy,0e4c0h		;ba26   ; ...y las cuatro de 0xE4C0
	ld b,004h		;ba2a
L_BA2C:
	push bc			;ba2c
	ld a,(iy+004h)		;ba2d   ; lee el tipo del objeto (p02:8000, p02:8063)
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
	push iy		;ba4f   ; libera la bala: sus 16 bytes y fuera de la pantalla
	pop hl			;ba51
	ld b,010h		;ba52
	call 051b2h		;ba54   ; borra_b: pone a cero B bytes desde HL
	ld (iy+000h),0ech		;ba57   ; la y del objeto (p00:4BBB) = 0xEC
	ret			;ba5b
L_BA5C:
	ld a,(ix+006h)		;ba5c   ; la caida: saltando no
	and a			;ba5f
	ret nz			;ba60
	ld a,(ix+009h)		;ba61
	and a			;ba64
	jr nz,L_BA7F		;ba65
	ld a,(ix+00ah)		;ba67   ; en el agua (y >= 0xB0), sigue cayendo (p03:BAAD)
	cp 0b0h		;ba6a
	jr c,L_BA77		;ba6c
	call L_BAAD		;ba6e
	ret c			;ba71
	ld (ix+009h),001h		;ba72
	ret			;ba76
L_BA77:
	call hay_suelo		;ba77   ; sin suelo debajo: a caer (IX+9 = 1)
	ret c			;ba7a
	ld (ix+009h),001h		;ba7b
L_BA7F:
	call hay_suelo		;ba7f   ; cayendo: hasta encontrar suelo, dos puntos por cuadro...
	jr c,L_BA9E		;ba82
	call L_BAAD		;ba84
	jr c,L_BA9E		;ba87
	call hay_suelo		;ba89   ; hay_suelo: acarreo si bajo los pies del jugador hay suelo (un dibujo por debajo de 3 en el mapa)
	jr c,L_BA9E		;ba8c
	call L_BAAD		;ba8e
	jr c,L_BA9E		;ba91
	ld a,(0e1c0h)		;ba93   ; ...con la postura de caer (por la cuenta de cuadros)
	and 00ch		;ba96
	rrca			;ba98
	rrca			;ba99
	ld (ix+005h),a		;ba9a
	ret			;ba9d
L_BA9E:
	xor a			;ba9e   ; en el suelo: el sonido 0x15
	ld (0e2ceh),a		;ba9f
	ld (ix+009h),a		;baa2
	ld (ix+008h),a		;baa5
	ld a,015h		;baa8
	jp 05052h		;baaa   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_BAAD:
	ld a,(ix+00ah)		;baad   ; un punto mas abajo, hasta el fondo (0xAF)...
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
	ld a,(0e020h)		;babd   ; ...y en las fases verticales (p03:BAB9: 3, 10, 16 y 18) la pantalla de abajo (B = -1)
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
	ld (ix+00ah),010h		;bad2   ; con el jugador arriba del todo (y 0x10)
	call pantalla_nueva		;bad6   ; pantalla_nueva: construye la pantalla del tramo y sus objetos
	xor a			;bad9
	ret			;bada
L_BADB:
	ld a,(ix-002h)		;badb   ; el parpadeo del jugador baja (IX-2)
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
	ld a,00eh		;baf8   ; el titulo: el banco 14 en 0x6000 y la lista de piezas de 0xE023 en p14:6040
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
	ld a,(0e093h)		;bb0c   ; la pantalla nueva: con 0xE093 a 1 mientras se construye
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
	xor a			;bb26   ; sin 0xE33C
	ld (0e33ch),a		;bb27
	pop af			;bb2a
	ld (0e093h),a		;bb2b
	call 04532h		;bb2e   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	call 09966h		;bb31
	call 0452dh		;bb34   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	xor a			;bb37   ; 0xE30F a cero
	ld (0e30fh),a		;bb38
	ret			;bb3b
construye_pantalla:		; construye la pantalla del tramo 0xE022: mapa 0xC300 y dibujos en la VRAM
	xor a			;bb3c   ; 0xE18A y 0xE18B (destruidos y blancos) a cero; 0xE30F a 0xFF mientras tanto
	ld (0e18ah),a		;bb3d
	ld (0e18bh),a		;bb40   ; guarda los blancos de la sala que quedan (bases 3D)
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
	call L_BFD2		;bb66   ; una columna de borde (p03:BFD2)
	ld hl,0bae4h		;bb69   ; el banco de la fase en 0x6000 (la tabla p03:BAE4)
	ld a,(0e020h)		;bb6c   ; lee la fase (0-19; la 8 se salta)
	call 051b8h		;bb6f   ; lee_tabla: HL = HL + A y A = (HL)
	call 04f78h		;bb72   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld (ix-001h),001h		;bb75
	call 0492eh		;bb79   ; los objetos fuera (p00:492E, p00:4937) y los sprites
	call 04937h		;bb7c
	call 04b86h		;bb7f   ; vuelca_sprites: lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)
	ld hl,06000h		;bb82   ; la lista de pantallas de la fase: el puntero de 0x6000 + 2 x fase...
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
	ld hl,06100h		;bb95   ; ...y sus ordenes: el puntero de 0x6100 + 2 x pantalla
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
	ld a,(de)			;bba2   ; las ordenes: 0xFF acaba (y siguen los objetos, p03:BD7B)...
	inc de			;bba3
	cp 0ffh		;bba4
	jp z,L_BD7B		;bba6
	cp 0feh		;bba9   ; ...0xFE y un puntero: las ordenes de otro sitio, hasta su 0xFF (piezas compartidas)...
	jr z,L_BBB2		;bbab
	call L_BBC8		;bbad   ; ...y si no, una pieza (p03:BBC8)
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
	cp 080h		;bbc8   ; una pieza: con el bit 7, la forma corta (repetida); sin el, la larga
	jr c,L_BC14		;bbca
	sub 080h		;bbcc   ; la fila (p03:BCE8) y su casilla en 0xE1B1...
	call L_BCE8		;bbce
	ld (0e1b1h),hl		;bbd1
	ld a,(de)			;bbd4   ; ...el puntero a su dibujo...
	inc de			;bbd5
	ld l,a			;bbd6
	ld a,(de)			;bbd7
	inc de			;bbd8
	ld h,a			;bbd9
	ld (0e1a3h),de		;bbda
	ex de,hl			;bbde
	ld a,(de)			;bbdf   ; ...el bit 0 del primer byte: copia normal (p00:484E) o con el color 0 transparente (p00:485E)...
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
	ld a,(de)			;bbef   ; ...la fila de la hoja (los 4 bits altos)...
	inc de			;bbf0
	and 0f0h		;bbf1
	ld (0e01fh),a		;bbf3   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	ld a,(de)			;bbf6   ; ...las veces en vertical (0xE1A1) y en horizontal (0xE1A2)...
	inc de			;bbf7
	ld (0e1a1h),a		;bbf8
	ld (0e1a5h),a		;bbfb
	ld (0e1b5h),a		;bbfe
	ld a,(de)			;bc01
	inc de			;bc02
	ld (0e1a2h),a		;bc03
	ld (0e1a6h),a		;bc06
	ld (0e1a7h),de		;bc09   ; ...y donde empiezan sus dibujos
	ld (0e1b3h),de		;bc0d
	jp L_BC59		;bc11
L_BC14:
	call L_BCE8		;bc14   ; la forma larga: la fila y la columna (p03:BCE8)...
	ld (0e1b1h),hl		;bc17
	ld a,(de)			;bc1a   ; ...las veces en vertical y en horizontal...
	inc de			;bc1b
	ld (0e1a1h),a		;bc1c
	ld a,(de)			;bc1f
	inc de			;bc20
	ld (0e1a2h),a		;bc21
	ld a,(de)			;bc24   ; ...el puntero a la pieza...
	inc de			;bc25
	ld l,a			;bc26
	ld a,(de)			;bc27
	inc de			;bc28
	ld (0e1a3h),de		;bc29
	ld h,a			;bc2d
	ex de,hl			;bc2e
	ld a,(de)			;bc2f   ; ...su forma de copiar, su fila de la hoja, su alto y su ancho
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
	ld hl,(0e1b1h)		;bc59   ; la pieza: filas...
	ld a,(0e1a2h)		;bc5c
	ld b,a			;bc5f
L_BC60:
	ld de,(0e1b3h)		;bc60   ; ...columnas...
	ld a,(0e1a6h)		;bc64
	ld c,a			;bc67
L_BC68:
	ld a,(de)			;bc68   ; ...cada dibujo: 0 deja lo que hay; si no, al mapa (HL)...
	and a			;bc69
	jr z,L_BC7F		;bc6a
	ld (hl),a			;bc6c
	push hl			;bc6d
	push de			;bc6e
	push bc			;bc6f
	ld hl,(0e1b7h)		;bc70   ; ...y a la VRAM: la casilla de la pantalla (0xE1B7, mas la pagina de 0xE1AC)...
	ld a,(0e1ach)		;bc73
	add a,h			;bc76
	ld h,a			;bc77
	ld a,(de)			;bc78
	call 0486eh		;bc79   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	pop bc			;bc7c
	pop de			;bc7d
	pop hl			;bc7e
L_BC7F:
	inc de			;bc7f   ; la casilla siguiente
	inc hl			;bc80
	push hl			;bc81
	ld hl,(0e1b7h)		;bc82
	inc hl			;bc85
	ld (0e1b7h),hl		;bc86
	pop hl			;bc89
	dec b			;bc8a   ; al acabar el ancho de la pieza, la fila siguiente de la pieza
	jr z,L_BC96		;bc8b
	dec c			;bc8d
	jr nz,L_BC68		;bc8e
	ld de,(0e1a7h)		;bc90
	jr L_BC60		;bc94
L_BC96:
	ld a,(0e1a1h)		;bc96   ; al acabar el bloque: una repeticion menos en vertical...
	dec a			;bc99
	ld (0e1a1h),a		;bc9a
	and a			;bc9d
	jr nz,L_BCA5		;bc9e   ; ...y si no quedan, la orden siguiente
	ld de,(0e1a3h)		;bca0
	ret			;bca4
L_BCA5:
	dec c			;bca5   ; si no, la siguiente fila de la pieza desde el principio...
	jr z,L_BCAB		;bca6
	inc de			;bca8
	jr L_BCA5		;bca9
L_BCAB:
	ld (0e1b3h),de		;bcab
	ld a,(0e1b5h)		;bcaf   ; ...y al acabar su alto, otra vez desde arriba (la pieza se repite hacia abajo)
	dec a			;bcb2
	ld (0e1b5h),a		;bcb3
	and a			;bcb6
	jr z,L_BCD7		;bcb7
L_BCB9:
	ld hl,(0e1b1h)		;bcb9   ; la fila siguiente del mapa y de la pantalla (0x20 casillas)
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
	ld a,(de)			;bcf8   ; ...la columna del byte siguiente...
	inc de			;bcf9
	ld b,a			;bcfa
	call 051b8h		;bcfb   ; lee_tabla: HL = HL + A y A = (HL)
	push hl			;bcfe
	ld hl,00000h		;bcff   ; ...y la casilla en la pantalla (fila x 32 + columna) en 0xE1AE y 0xE1B7
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
pinta_pieza_en:		; pinta la pieza DE en la casilla HL (de 0xC300) con 0xE093 a 1
	ld a,(0e093h)		;bd1f   ; una pieza en la casilla HL del mapa, con 0xE093 a 1
	push af			;bd22
	ld a,001h		;bd23
	ld (0e093h),a		;bd25
	call L_BD30		;bd28
	pop af			;bd2b
	ld (0e093h),a		;bd2c
	ret			;bd2f
L_BD30:
	ld a,h			;bd30   ; la casilla en la pantalla (HL - 0xC300)
	sub 0c3h		;bd31
	ld h,a			;bd33
	ld (0e1a5h),hl		;bd34
	ld a,(de)			;bd37   ; la fila de la hoja y la forma de copiar del primer byte...
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
	ld a,(de)			;bd4a   ; ...el alto (B) y el ancho (0xE1A1)
	inc de			;bd4b
	ld b,a			;bd4c
	ld a,(de)			;bd4d
	inc de			;bd4e
	ld (0e1a1h),a		;bd4f
L_BD52:
	ld hl,(0e1a5h)		;bd52   ; cada fila de la pieza...
	ld (0e1b5h),hl		;bd55
	ld a,(0e1a1h)		;bd58
	ld c,a			;bd5b
L_BD5C:
	ld a,(de)			;bd5c   ; ...cada dibujo distinto de cero, a la pantalla...
	and a			;bd5d
	call nz,0486eh		;bd5e   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	inc de			;bd61
	ld hl,(0e1b5h)		;bd62
	inc hl			;bd65
	ld (0e1b5h),hl		;bd66
	dec c			;bd69
	jr nz,L_BD5C		;bd6a
	push de			;bd6c   ; ...y la fila siguiente (0x20 casillas)
	ld hl,(0e1a5h)		;bd6d
	ld de,00020h		;bd70
	add hl,de			;bd73
	ld (0e1a5h),hl		;bd74
	pop de			;bd77
	djnz L_BD52		;bd78
	ret			;bd7a
L_BD7B:
	ld iy,0e500h		;bd7b   ; los objetos de la pantalla: cada byte de la lista DE (hasta 0xFF) es el tipo de uno...
L_BD7F:
	ld a,(de)			;bd7f
	inc de			;bd80
	cp 0ffh		;bd81
	jp z,L_BDD6		;bd83
	call L_BD8B		;bd86
	jr L_BD7F		;bd89
L_BD8B:
	push af			;bd8b   ; ...en la primera ficha libre de 0xE500 (si no hay, se pierde)
	push de			;bd8c
	ld de,00010h		;bd8d
	ld b,010h		;bd90
L_BD92:
	ld a,(iy+004h)		;bd92   ; lee el tipo del objeto (p02:8000, p02:8063)
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
	ld (iy+004h),a		;bda1   ; guarda el tipo del objeto (p02:8000, p02:8063)
	ld a,(de)			;bda4   ; ...y detras: IY+3, la fila (y = fila x 8) y la columna (x = (columna + 1) x 8)...
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
	ld (iy+000h),a		;bdb2   ; guarda la y del objeto (p00:4BBB)
	ld a,(de)			;bdb5
	ld b,a			;bdb6
	inc b			;bdb7
	xor a			;bdb8
L_BDB9:
	add a,008h		;bdb9
	djnz L_BDB9		;bdbb
	ld (iy+001h),a		;bdbd   ; guarda la x del objeto (p00:4BBB)
	pop de			;bdc0
	ld a,(de)			;bdc1   ; ...y su casilla en el mapa (p03:BCE8) en IY+6/7 y la de la VRAM en IY+8/9
	inc de			;bdc2
	call L_BCE8		;bdc3
	ld (iy+006h),l		;bdc6
	ld (iy+007h),h		;bdc9
	ld hl,(0e1b7h)		;bdcc
	ld (iy+008h),l		;bdcf
	ld (iy+009h),h		;bdd2
	ret			;bdd5
L_BDD6:
	ld a,00ah		;bdd6   ; los sprites de la pantalla en 0xE400 (como mucho 0x14): tipo, cuantos, y, x
	ld (0e1afh),a		;bdd8
	ld iy,0e400h		;bddb
L_BDDF:
	cp 014h		;bddf
	jr nc,L_BE1E		;bde1
	ld a,(de)			;bde3
	cp 0ffh		;bde4
	jr z,L_BE1E		;bde6
	ld (iy+004h),a		;bde8   ; guarda el tipo del objeto (p02:8000, p02:8063)
	inc de			;bdeb
	ld hl,0534ah		;bdec
	call 051b8h		;bdef   ; lee_tabla: HL = HL + A y A = (HL)
	ld (iy+003h),a		;bdf2
	inc de			;bdf5
	ld a,(de)			;bdf6
	cp 000h		;bdf7   ; una y de 0 es fuera de la pantalla (0xEC)
	jr nz,L_BDFD		;bdf9
	ld a,0ech		;bdfb
L_BDFD:
	ld (iy+000h),a		;bdfd   ; guarda la y del objeto (p00:4BBB)
	inc de			;be00
	ld a,(de)			;be01
	inc de			;be02
	ld (iy+001h),a		;be03   ; guarda la x del objeto (p00:4BBB)
	ld a,(0e1afh)		;be06   ; IY+0F el numero de cada uno, seguidos desde 0x0A
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
	ld hl,0be83h		;be1e   ; los dibujos de sprite de la pantalla: en las fases 6, 9, 10, 16 y 17 por tramo...
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
	ld hl,0be6fh		;be44   ; ...en las demas, uno por fase (p03:BE6F)
	call 051b8h		;be47   ; lee_tabla: HL = HL + A y A = (HL)
	jr L_BE52		;be4a
L_BE4C:
	ld a,(0e022h)		;be4c   ; lee el tramo: la pantalla de la lista de la fase
	call 051b8h		;be4f   ; lee_tabla: HL = HL + A y A = (HL)
L_BE52:
	ld b,(hl)			;be52   ; si cambian (0xE097), se cargan (p00:49BF)
	ld a,(0e097h)		;be53
	cp b			;be56
	jr z,L_BE60		;be57
	ld a,b			;be59
	ld (0e097h),a		;be5a
	call 049bfh		;be5d
L_BE60:
	ld (ix-001h),000h		;be60   ; los sprites otra vez, el banco 1 en 0x6000 y la pantalla encendida
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
	ld a,(0e283h)		;beac   ; el menu de armas de la pausa (0xE2C1): 0xE283 = 2 lo cierra
	cp 002h		;beaf
	jp z,L_BF92		;beb1
	ld a,(0e2c3h)		;beb4   ; la primera vez se pinta (p00:50E0) con el sonido 0x21
	and a			;beb7
	jr nz,L_BEC9		;beb8
	ld (ix-001h),001h		;beba
	call 050e0h		;bebe
	ld a,021h		;bec1
	call 05052h		;bec3   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 04e35h		;bec6
L_BEC9:
	ld a,(0e180h)		;bec9   ; la palanca: arriba o abajo mueve el cursor (0xE2C4, la fila de 0x42 a 0xC2)
	and a			;becc
	jp z,L_BF61		;becd
	cp 005h		;bed0
	jr z,L_BF1A		;bed2
	cp 001h		;bed4
	jp nz,L_BF61		;bed6
	ld a,(0e2c4h)		;bed9   ; arriba: una fila (0x20) menos...
	cp 042h		;bedc
	jp z,L_BF61		;bede
	ld b,020h		;bee1
	cp 0c2h		;bee3   ; ...desde la ultima salta las que no hay: hasta la fase 3 solo MACHINE y NORMAL, hasta la 6 tambien REAR
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
	push hl			;bef9   ; el cursor en su sitio y 0xE2C6 = 1 (la palanca, atendida)
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
	ld a,(0e2c4h)		;bf1a   ; abajo, lo mismo hacia el otro lado
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
	ld a,(0e062h)		;bf61   ; con el boton de salto se elige:
	and a			;bf64
	jp z,04e35h		;bf65
	xor a			;bf68
	ld (0e062h),a		;bf69
	ld a,(0e2c4h)		;bf6c   ; el arma = la fila del cursor / 0x20 - 2 (0 la primera fila, 4 la ultima)
	and 0e0h		;bf6f
	rlca			;bf71
	rlca			;bf72
	rlca			;bf73
	sub 002h		;bf74
	ld hl,0bfabh		;bf76
	call 051b8h		;bf79   ; lee_tabla: HL = HL + A y A = (HL)
	call L_BFB0		;bf7c   ; si no se puede en esta fase (p03:BFB0), nada
	jp c,04e35h		;bf7f
	ld (0e032h),a		;bf82   ; el arma nueva en 0xE032, el menu se cierra y el sonido 0x23
	ld a,002h		;bf85
	ld (0e283h),a		;bf87
	ld a,023h		;bf8a
	call 05052h		;bf8c   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp 04e35h		;bf8f
L_BF92:
	di			;bf92   ; cerrar: se quita el menu (p00:517A)
	call 0517ah		;bf93
	xor a			;bf96
	ld (0e283h),a		;bf97
	ld (ix-001h),a		;bf9a
	ei			;bf9d
	jp 04e35h		;bf9e
L_BFA1:
	push hl			;bfa1   ; el sonido 0x22 del cursor
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
	ld c,a			;bfb0   ; el arma A se puede elegir? la 0 y la 3 siempre...
	and a			;bfb1
	jr z,L_BFCC		;bfb2
	cp 003h		;bfb4
	jr z,L_BFCC		;bfb6
	cp 005h		;bfb8   ; ...la 5 desde la fase 2...
	jr z,L_BFC5		;bfba
	ld a,(0e020h)		;bfbc   ; ...las demas desde la 6; acarreo si no
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
	ld a,0d8h		;bfd2   ; una columna de casillas a 0x10 (el borde de la pantalla)
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
	ld bc,00040h		;bff1   ; los colores de los sprites del jugador (cuatro, de p00:4B2C)
	push bc			;bff4
	ld hl,0c980h		;bff5
	ld de,04b2ch		;bff8
	ld c,004h		;bffb
	jp 04987h		;bffd
