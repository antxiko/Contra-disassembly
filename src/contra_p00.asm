; ==========================================================================
; CONTRA - Konami (1989) - MSX2 - MegaROM RC-762 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS sin identificar  0x4000..0x402e  (46 bytes)
DATA_4000:
	defb 041h,042h,02eh,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,062h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4010  CD.b............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,081h,001h,000h,002h,080h,0f6h	; 4020  ..............

; ======================================================================
; CODIGO 0x402e..0x4356  (808 bytes)
; ======================================================================


init:		; el arranque del cartucho (INIT de la cabecera AB): RAM a cero, bancos 0-1-2-3, SCREEN 5, sonido y bucle
	di			;402e   ; sin interrupciones mientras se prepara la maquina
	ld sp,0f380h		;402f   ; la pila, debajo de la RAM de sistema
	ld a,0c9h		;4032   ; 0xC9 = ret
	ld (0fd9ah),a		;4034   ; H.KEYI a ret mientras tanto
	ld (0fd9fh),a		;4037   ; y H.TIMI a ret para siempre
	call apaga_pantalla		;403a   ; apaga_pantalla: apaga la pantalla (DISSCR)
	call 00138h		;403d   ; BIOS RSLREG - Reads the primary slot register | A = los slots primarios de las cuatro paginas
	call L_404B		;4040   ; A = la ranura de ESTE cartucho (la de la pagina 1), con H = 0x80
	push af			;4043
	call 00024h		;4044   ; BIOS ENASLT - Switches to specified slot and page definitively | la pone tambien en 0x8000-0xBFFF: el cartucho entero en 0x4000-0xBFFF
	pop af			;4047
	ex af,af'			;4048   ; la ranura queda en A' para guardarla luego en 0xE208
	jr L_4067		;4049
L_404B:
	rrca			;404b   ; el slot de la pagina 1: los bits 2-3 de RSLREG
	rrca			;404c
	and 003h		;404d
	ld c,a			;404f
	ld b,000h		;4050
	ld hl,0fcc1h		;4052   ; EXPTBL: si ese slot esta expandido (bit 7)
	add hl,bc			;4055
	ld c,a			;4056
	ld a,(hl)			;4057
	and 080h		;4058
	or c			;405a
	ld c,a			;405b
	inc hl			;405c   ; cuatro mas: SLTTBL, el subslot de ese slot
	inc hl			;405d
	inc hl			;405e
	inc hl			;405f
	ld a,(hl)			;4060
	and 00ch		;4061   ; el subslot de la pagina 1 (bits 2-3)
	or c			;4063   ; A = expandido | subslot | slot, el formato de ENASLT
	ld h,080h		;4064   ; H = 0x80: la pagina 2 para ENASLT
	ret			;4066
L_4067:
	di			;4067
	ld hl,0c000h		;4068   ; 0xC000-0xC2FF a cero (la RAM del sonido y el mapa de pantalla)
	ld (hl),000h		;406b
	ld de,0c001h		;406d
	ld bc,002ffh		;4070
	ldir		;4073
	ld hl,0e000h		;4075   ; 0xE000-0xF37F a cero (la RAM del juego)
	ld (hl),000h		;4078
	ld de,0e001h		;407a
	ld bc,0137fh		;407d
	ldir		;4080
	xor a			;4082   ; los bancos de arranque: el 0 en 0x4000...
	ld (05000h),a		;4083   ; el mapper: pone en 0x4000 el banco de A
	inc a			;4086   ; ...el 1 en 0x6000...
	call pon_banco_6000		;4087   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	inc a			;408a   ; ...el 2 en 0x8000...
	call pon_banco_8000		;408b   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	inc a			;408e   ; ...y el 3 en 0xA000; el 0 y el 3 ya no se cambian
	ld (0b000h),a		;408f   ; el mapper: pone en 0xA000 el banco de A
	ex af,af'			;4092   ; la ranura de este cartucho, que estaba en A'
	ld (0e208h),a		;4093   ; guarda la ranura del cartucho (para devolverla tras usar el otro)
	ld sp,0f380h		;4096   ; la pila otra vez arriba
	ld a,005h		;4099   ; SCREEN 5
	ld ix,001b5h		;409b   ; CHGMDP de la SUB-ROM: el modo y la paleta de la BIOS
	call 0015fh		;409f   ; BIOS EXTROM - Calls a routine in SUB-ROM. Most common way
	xor a			;40a2   ; color 0 en el texto, el fondo y el borde
	call pon_colores		;40a3   ; pon_colores: pone A en los colores de la BIOS (0xF3E9-0xF3EB) y llama a CHGCLR
	ld a,(0ffe7h)		;40a6   ; RG8SAV con el bit 5 (TP): el color 0 se pinta, no es transparente
	set 5,a		;40a9
	ld (0ffe7h),a		;40ab
	ld b,a			;40ae
	ld c,008h		;40af   ; al registro 8 del VDP
	call 00047h		;40b1   ; BIOS WRTVDP - Writes data in the VDP-register
	call apaga_pantalla		;40b4   ; apaga_pantalla: apaga la pantalla (DISSCR)
	xor a			;40b7   ; la paleta 0
	call pon_paleta		;40b8   ; pon_paleta: pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	ld ix,000f5h		;40bb   ; la rutina 0x00F5 de la SUB-ROM
	call 0015fh		;40bf   ; BIOS EXTROM - Calls a routine in SUB-ROM. Most common way
	ld a,(00007h)		;40c2   ; el puerto 0x99 del VDP (el de la BIOS, + 1)
	inc a			;40c5
	ld c,a			;40c6
	ld a,(0f3e0h)		;40c7   ; RG9SAV con el bit 1: 212 lineas
	set 1,a		;40ca
	ld (0f3e0h),a		;40cc
	out (c),a		;40cf   ; al registro 9 del VDP
	ld a,081h		;40d1
	out (c),a		;40d3
	ld hl,00000h		;40d5   ; la VRAM entera (BC = 0: 64 KB) a cero
	ld bc,00000h		;40d8
	xor a			;40db
	call 0016bh		;40dc   ; BIOS BIGFIL - Same function as FILVRM (with 16-bit VRAM-address)
	call apaga_pantalla		;40df   ; apaga_pantalla: apaga la pantalla (DISSCR)
	di			;40e2
	ld hl,04bd2h		;40e3   ; la interrupcion: H.KEYI salta a p00:4BD2
	ld (0fd9bh),hl		;40e6
	ld a,0c3h		;40e9
	ld (0fd9ah),a		;40eb
	xor a			;40ee
	ld (0f3dbh),a		;40ef   ; 0 en 0xF3DB (CLIKSW): sin el clic de las teclas
	ld a,(0e202h)		;40f2   ; guarda los bancos de 0x6000 y 0x8000...
	push af			;40f5
	ld a,(0e203h)		;40f6   ; lee la copia del banco de 0x8000
	push af			;40f9
	ld a,004h		;40fa   ; ...pone el 4 y el 5 (el motor de sonido)...
	ld (07000h),a		;40fc   ; el mapper: pone en 0x6000 el banco de A
	inc a			;40ff
	ld (09000h),a		;4100   ; el mapper: pone en 0x8000 el banco de A
	call 06000h		;4103   ; ...lo pone a cero (p04:6000)...
	pop af			;4106   ; ...y devuelve los bancos que habia
	call pon_banco_8000		;4107   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	pop af			;410a
	call pon_banco_6000		;410b   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	ld hl,0e200h		;410e   ; 0xE200 y 0xE201 a cero: la interrupcion esta libre
	ld (hl),000h		;4111
	inc hl			;4113
	ld (hl),000h		;4114
	ei			;4116   ; ya puede llegar la interrupcion
bucle_partida:		; el bucle de cada partida: titulo, demostracion o juego
	xor a			;4117   ; cada partida empieza aqui: sin partida en marcha
	ld (0e000h),a		;4118   ; guarda 1 en una partida de verdad, 0 en la demostracion
	ld (0fbd9h),a		;411b   ; 0xFBD9 a cero
	ld (0e006h),a		;411e   ; guarda 1 en la demostracion (la palanca sale de su grabacion)
	call pon_colores		;4121   ; todo a color 0
	call borra_vram		;4124   ; borra_vram: pone a cero los 0x6A00 primeros bytes de la VRAM
	call borra_partida		;4127   ; borra_partida: pantalla apagada, mapa 0xC300 a 0x10 y RAM de la partida a cero
	call L_47D6		;412a   ; la tabla de sprites vacia
	call L_4B83		;412d
	ld a,00dh		;4130   ; el logotipo de Konami: el banco 13 a la VRAM, arriba
	call carga_graficos_arriba		;4132   ; carga_graficos_arriba: copia el banco A a la VRAM en la linea 0 de la pagina de dibujos
	ld a,007h		;4135   ; con la paleta 7
	call pon_paleta		;4137   ; pon_paleta: pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	ld a,004h		;413a   ; en la pagina 4 (0xE1AC suma 4 a la fila de la VRAM)...
	ld (0e1ach),a		;413c
	ld de,043c6h		;413f   ; ...p03:BBA2 pinta la lista de piezas de p00:43C6
	call 0bba2h		;4142
	xor a			;4145
	ld (0e1ach),a		;4146
	ld ix,0e0d2h		;4149   ; IX y IY: la y de origen y de destino de la orden de p00:43D7
	ld iy,0e0d6h		;414d
	ld hl,043d7h		;4151   ; la orden que va bajando el logotipo linea a linea
	ld de,0e0d0h		;4154   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000fh		;4157
	ldir		;415a
	ld b,030h		;415c   ; 0x30 pasos
L_415E:
	xor a			;415e   ; cuenta de cuadros a cero
	ld (0e1c0h),a		;415f   ; guarda cuenta de cuadros (la sube la interrupcion)
	push bc			;4162
	ld b,020h		;4163
	call orden_vdp		;4165   ; manda la orden (0x20 bytes de registros, desde el 32)
	inc (ix+000h)		;4168   ; una linea mas abajo el origen...
	inc (iy+000h)		;416b   ; ...y el destino
L_416E:
	ld a,(0e066h)		;416e   ; con el disparo se salta el logotipo
	and a			;4171
	jr nz,L_418B		;4172
	ld a,(0e1c0h)		;4174   ; dos cuadros por paso (0xE1C0 lo sube la interrupcion)
	cp 002h		;4177
	jr nz,L_416E		;4179
	pop bc			;417b
	djnz L_415E		;417c
L_417E:
	ld a,(0e066h)		;417e   ; el logotipo quieto hasta el cuadro 0xE8, o el disparo
	and a			;4181
	jr nz,L_418B		;4182
	ld a,(0e1c0h)		;4184   ; lee cuenta de cuadros (la sube la interrupcion)
	cp 0e8h		;4187
	jr nz,L_417E		;4189
L_418B:
	xor a			;418b
	ld (0e080h),a		;418c
	ld hl,0e300h		;418f   ; las 32 fichas de objeto a cero
	ld b,020h		;4192
	call borra_b		;4194   ; borra_b: pone a cero B bytes desde HL
	call apaga_pantalla		;4197   ; apaga_pantalla: apaga la pantalla (DISSCR)
	call borra_vram_ff		;419a   ; la VRAM a 0xFF
	ld a,00bh		;419d   ; el titulo: el banco 11 a la VRAM, arriba
	call carga_graficos_arriba		;419f   ; carga_graficos_arriba: copia el banco A a la VRAM en la linea 0 de la pagina de dibujos
	xor a			;41a2   ; la paleta 0
	ld (0e00ah),a		;41a3   ; guarda los cuadros que le quedan al paso de la demostracion
	ld (0e023h),a		;41a6
	call pon_paleta		;41a9   ; pon_paleta: pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	call 0baf8h		;41ac   ; p03:BAF8 pinta las piezas del titulo
	ld a,040h		;41af   ; la hoja de la fila 0x40
	ld (0e01fh),a		;41b1   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	call L_485E		;41b4
	ld de,05035h		;41b7   ; (c) KONAMI 1989
	ld hl,00209h		;41ba
	call escribe		;41bd   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld de,05043h		;41c0   ; PUSH SPACE KEY
	ld hl,00249h		;41c3
	call escribe		;41c6   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	xor a			;41c9   ; sin disparo pulsado
	ld (0e066h),a		;41ca   ; guarda el disparo pulsado
	inc a			;41cd
	ld (0e007h),a		;41ce
	call 00044h		;41d1   ; BIOS ENASCR - Displays the screen
	ld a,002h		;41d4   ; la musica del titulo
	call pide_sonido		;41d6   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_41D9:
	ld a,(0c000h)		;41d9   ; mientras suena (0xC000 es el primer canal del motor)...
	and a			;41dc
	jr z,L_41F9		;41dd
	ld a,(0e066h)		;41df   ; ...espera al disparo
	and a			;41e2
	jr z,L_41D9		;41e3
	call apaga_pantalla		;41e5   ; con el disparo: la partida
	xor a			;41e8
	ld (0e066h),a		;41e9   ; guarda el disparo pulsado
	ld (0e060h),a		;41ec
	ld (0e006h),a		;41ef   ; guarda 1 en la demostracion (la palanca sale de su grabacion)
	ld (0e2bfh),a		;41f2   ; la primera demostracion la proxima vez
	inc a			;41f5   ; 0xE000 = 1: partida de verdad
	ld (0e000h),a		;41f6   ; guarda 1 en una partida de verdad, 0 en la demostracion
L_41F9:
	ld a,00fh		;41f9   ; se acabo la musica sin disparo: la demostracion (0xE000 sigue a 0)
	call pon_colores		;41fb   ; pon_colores: pone A en los colores de la BIOS (0xF3E9-0xF3EB) y llama a CHGCLR
	ld a,001h		;41fe   ; el sonido 1 calla todo
	call pide_sonido		;4200   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld a,(0e2bfh)		;4203   ; la grabacion de la demostracion: la 0 (p12:9C00)...
	ld hl,09c00h		;4206
	and a			;4209
	jr z,L_4216		;420a
	ld hl,09d60h		;420c   ; ...la 1 (p12:9D60)...
	cp 001h		;420f
	jr z,L_4216		;4211
	ld hl,09ec0h		;4213   ; ...o la 2 (p12:9EC0)
L_4216:
	ld (0e008h),hl		;4216   ; guarda el puntero de la grabacion de la demostracion y el byte siguiente (16 bits)
	call borra_vram_ff		;4219   ; la VRAM a 0xFF
	ld hl,0e020h		;421c   ; 0xE020-0xE0CF a cero
	ld b,0b0h		;421f
	call borra_b		;4221   ; borra_b: pone a cero B bytes desde HL
	ld hl,0e180h		;4224   ; 0xE180-0xE1FF a cero
	ld b,080h		;4227
	call borra_b		;4229   ; borra_b: pone a cero B bytes desde HL
	call apaga_pantalla		;422c   ; apaga_pantalla: apaga la pantalla (DISSCR)
	ld a,011h		;422f
	ld (0e2c8h),a		;4231
	ld a,(0e000h)		;4234   ; partida o demostracion
	and a			;4237
	jr nz,L_425F		;4238
	inc a			;423a   ; la demostracion: una vida...
	ld (0e021h),a		;423b   ; guarda las vidas que quedan (en BCD)
	ld (0e2c9h),a		;423e   ; ...y una de energia
	ld (ix-002h),0ffh		;4241
	ld a,(0e2bfh)		;4245   ; la fase de cada demostracion: la 0...
	and a			;4248
	jr z,carga_fase		;4249
	cp 002h		;424b
	jr z,L_4253		;424d
	ld a,003h		;424f   ; ...la 3...
	jr L_425A		;4251
L_4253:
	ld a,0ffh		;4253   ; ...o la 5, y vuelta a empezar
	ld (0e2bfh),a		;4255   ; guarda la cuenta de demostraciones (cual toca)
	ld a,005h		;4258
L_425A:
	ld (0e020h),a		;425a   ; guarda la fase (0-19; la 8 se salta)
	jr carga_fase		;425d
L_425F:
	ld a,003h		;425f   ; la partida: tres vidas (REST/02 en el marcador)...
	ld (0e021h),a		;4261   ; guarda las vidas que quedan (en BCD)
	ld a,010h		;4264   ; ...y la energia llena
	ld (0e2c9h),a		;4266   ; guarda la energia del jugador
	call borra_vram_ff		;4269   ; borra_vram_ff: llena de 0xFF los 0x6800 primeros bytes de la VRAM
	call 00044h		;426c   ; BIOS ENASCR - Displays the screen
	ld a,001h		;426f
	ld (0e093h),a		;4271
	call L_4522		;4274
carga_fase:		; carga la fase de 0xE020: paleta, graficos (p00:4666), pantalla y musica
	ld a,(0e2bfh)		;4277   ; cada fase empieza aqui; la cuenta de demostraciones sube
	inc a			;427a
	ld (0e2bfh),a		;427b   ; guarda la cuenta de demostraciones (cual toca)
	call apaga_pantalla		;427e   ; apaga_pantalla: apaga la pantalla (DISSCR)
	ld hl,04652h		;4281   ; la paleta de la fase: la tabla p00:4652 (una por fase)
	ld a,(0e020h)		;4284   ; lee la fase (0-19; la 8 se salta)
	push af			;4287
	call lee_tabla		;4288   ; lee_tabla: HL = HL + A y A = (HL)
	call pon_paleta		;428b   ; pon_paleta: pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	ld hl,04666h		;428e   ; los graficos de la fase: dos bancos por fase en p00:4666
	pop af			;4291
	add a,a			;4292
	call lee_tabla		;4293   ; lee_tabla: HL = HL + A y A = (HL)
	push hl			;4296
	call carga_graficos_arriba		;4297   ; el primero, arriba en la pagina de dibujos
	pop hl			;429a
	inc hl			;429b
	ld a,(hl)			;429c
	call carga_graficos_abajo		;429d   ; el segundo, en la linea 0x40
	ld ix,0e320h		;42a0   ; la ficha del jugador
	ld (ix+00ch),005h		;42a4   ; el dibujo de arriba del jugador (p00:4B54) = 0x05
	ld (ix+00dh),010h		;42a8   ; el dibujo de abajo del jugador (p00:4B6D) = 0x10
	ld (ix+00ah),030h		;42ac   ; x = 0x30
	call pon_banco_12		;42b0   ; con el banco 12 en 0x8000: p12:9943 pone al jugador
	call 09943h		;42b3
	call devuelve_banco_8000		;42b6   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	call L_4541		;42b9   ; 0xE19C: 0xAB en las fases de la lista p00:4558, 0xFF en las demas
	ld (ix-00ah),000h		;42bc
	ld (ix-00bh),00fh		;42c0
	call L_4B4C		;42c4
	call L_49AB		;42c7
	call 0bb0ch		;42ca   ; la pantalla del tramo y sus objetos
	call L_455D		;42cd
	call 00044h		;42d0   ; BIOS ENASCR - Displays the screen | se enciende la pantalla
	xor a			;42d3   ; a cero lo de la fase anterior: cuadros, disparo, palanca...
	ld (0e03fh),a		;42d4
	ld (0e1c0h),a		;42d7   ; guarda cuenta de cuadros (la sube la interrupcion)
	ld (0e062h),a		;42da
	ld (0e060h),a		;42dd
	ld (0e066h),a		;42e0   ; guarda el disparo pulsado
	ld (0e180h),a		;42e3   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ld (0e2c5h),a		;42e6
	ld (0e007h),a		;42e9
	ld a,(0e000h)		;42ec   ; en la demostracion, 0xE006 = 1: la palanca sale de la grabacion
	and a			;42ef
	jr nz,L_42F6		;42f0
	inc a			;42f2
	ld (0e006h),a		;42f3   ; guarda 1 en la demostracion (la palanca sale de su grabacion)
L_42F6:
	xor a			;42f6
	ld (0e283h),a		;42f7
	ld (0e184h),a		;42fa   ; guarda fase superada (1; 2 ya contada)
	ld (0e33bh),a		;42fd
	ld (0e093h),a		;4300
	inc a			;4303   ; 0xE094 = 1: la fase en marcha
	ld (0e094h),a		;4304   ; guarda 1 mientras dura la fase
	ld a,082h		;4307   ; el sonido 0x82: el motor para lo que sonaba
	call pide_sonido		;4309   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	call L_4311		;430c   ; la musica de la fase
	jr L_4322		;430f
L_4311:
	ld a,(0e080h)		;4311   ; (si 0xE080 no la prohibe)
	and a			;4314
	ret nz			;4315
	ld a,(0e020h)		;4316   ; la musica de cada fase: la tabla p00:4356
	ld hl,04356h		;4319
	call lee_tabla		;431c   ; lee_tabla: HL = HL + A y A = (HL)
	jp pide_sonido		;431f   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_4322:
	ld a,(0e094h)		;4322   ; espera mientras dura la fase (la interrupcion hace el juego)
	and a			;4325
	jr nz,L_4322		;4326
	ld a,(0e207h)		;4328   ; 0xE207: si no es cero, no se mira si se acabo la fase
	and a			;432b
	jr nz,L_4335		;432c
	ld a,(0e184h)		;432e   ; 0xE184: fase superada
	and a			;4331
	jp nz,L_4446		;4332
L_4335:
	ld a,(0e183h)		;4335   ; 0xE183: sin vidas
	and a			;4338
	jp nz,L_43E6		;4339
	ld a,(0e000h)		;433c   ; en la partida, a seguir esperando; la demostracion acaba aqui
	and a			;433f
	jp nz,L_4322		;4340
L_4343:
	ld a,001h		;4343
	ld (0e007h),a		;4345
	call L_4909		;4348
	call L_4B83		;434b
	ld a,001h		;434e   ; callado, y vuelta al titulo
	call pide_sonido		;4350   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jp L_418B		;4353

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4356..0x436a  (20 bytes)
DATA_4356:
	defb 003h,004h,005h,006h,004h,005h,007h,008h,009h,00ah,003h,004h,005h,008h,004h,005h	; 4356  ................
	defb 006h,008h,009h,00ah	; 4366

; ======================================================================
; CODIGO 0x436a..0x4376  (12 bytes)
; ======================================================================


pon_colores:		; pone A en los colores de la BIOS (0xF3E9-0xF3EB) y llama a CHGCLR
	ld (0f3e9h),a		;436a   ; el color del texto, del fondo y del borde
	ld (0f3ebh),a		;436d
	ld (0f3eah),a		;4370
	jp 00062h		;4373   ; BIOS CHGCLR - Changes the screen colors

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4376..0x43e6  (112 bytes)
DATA_4376:
	defb 001h,006h,007h,000h,000h,000h,0c1h,0c2h,0c3h,000h,000h,000h,0c4h,0c5h,0c6h,0c7h	; 4376  ................
	defb 000h,0c8h,0c9h,0cah,0cbh,0d1h,0d2h,0d3h,0cch,0cdh,0ceh,0d4h,0d5h,0d6h,0d7h,000h	; 4386  ................
	defb 000h,0d9h,0dah,0dbh,000h,000h,000h,0dch,0ddh,0deh,000h,000h,000h,001h,002h,00eh	; 4396  ................
	defb 0dfh,0e1h,0e2h,0e3h,0e8h,0e9h,0eah,0ebh,0f0h,0f1h,0f2h,0f3h,0f8h,000h,0e4h,0e5h	; 43a6  ................
	defb 0e6h,0e7h,0ech,0edh,0eeh,0efh,0f4h,0f5h,0f6h,0f7h,0fch,0fdh,001h,001h,001h,0feh	; 43b6  ................
	defb 00ah,006h,006h,015h,0c2h,043h,08ah,006h,076h,043h,08ch,00dh,0a3h,043h,0ffh,0ffh	; 43c6  .....C..vC...C..
	defb 0ffh,030h,000h,050h,001h,030h,000h,040h,000h,0a8h,000h,001h,000h,000h,000h,0d0h	; 43d6  .0.P.0.@........

; ======================================================================
; CODIGO 0x43e6..0x4508  (290 bytes)
; ======================================================================


L_43E6:
	xor a			;43e6   ; sin vidas: espera 0x50 cuadros (0xE1C3 la cuenta)
	ld (0e1c3h),a		;43e7
	inc a			;43ea
	ld (0e093h),a		;43eb
	ld (0e007h),a		;43ee
L_43F1:
	ld a,(0e1c3h)		;43f1
	cp 050h		;43f4
	jr c,L_43F1		;43f6
	ld (ix-002h),000h		;43f8   ; el jugador fuera
	ld (ix-001h),000h		;43fc
	call L_4B83		;4400   ; sin sprites
	ld a,001h		;4403   ; callado
	call pide_sonido		;4405   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	call L_4909		;4408   ; las fichas fuera y los sprites otra vez
	call L_4B83		;440b
	ld a,(0e000h)		;440e   ; la demostracion acaba aqui
	and a			;4411
	jp z,L_4343		;4412   ; en la demostracion, al titulo (p00:4343)
	ld hl,0014bh		;4415   ; GAME OVER
	ld de,0502bh		;4418
	call escribe		;441b   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld a,010h		;441e   ; la musica del fin de la partida
	call pide_sonido		;4420   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	xor a			;4423   ; se acabo la partida
	ld (0e183h),a		;4424   ; guarda sin vidas: se acaba la partida
	ld (0e000h),a		;4427   ; guarda 1 en una partida de verdad, 0 en la demostracion
	ld (0e066h),a		;442a   ; guarda el disparo pulsado
	ld (0e00fh),a		;442d   ; 0xE00F a cero (la cifra de la vida de mas)
L_4430:
	ld a,(0c000h)		;4430   ; espera a que acabe la musica
	and a			;4433
	jr nz,L_4430		;4434
	xor a			;4436
	ld (0e045h),a		;4437   ; 0xE045 a cero
	call pon_paleta		;443a   ; la paleta 0, la pantalla apagada y vuelta al titulo
	call apaga_pantalla		;443d   ; apaga_pantalla: apaga la pantalla (DISSCR)
	call borra_vram_ff		;4440   ; borra_vram_ff: llena de 0xFF los 0x6800 primeros bytes de la VRAM
	jp bucle_partida		;4443   ; bucle_partida: el bucle de cada partida: titulo, demostracion o juego
L_4446:
	ld a,002h		;4446   ; fase superada: 0xE184 = 2
	ld (0e184h),a		;4448   ; guarda fase superada (1; 2 ya contada)
	ld (ix-001h),001h		;444b   ; sin sprites mientras se cuentan los puntos
	ld a,(0e03fh)		;444f   ; con 0xE03F o 0xE035 no hay puntos de final de fase
	and a			;4452
	jr nz,L_4473		;4453
	ld a,(0e035h)		;4455
	and a			;4458
	jr nz,L_4473		;4459
	ld b,005h		;445b   ; los puntos de la fase: 5 (centenas) hasta la 6 y 0x10 desde la 7...
	ld a,(0e020h)		;445d   ; lee la fase (0-19; la 8 se salta)
	cp 007h		;4460   ; (la fase 7 en adelante)
	jr c,L_4466		;4462
	ld b,010h		;4464
L_4466:
	call L_44FC		;4466   ; los puntos de la fase
	ld b,010h		;4469   ; ...y otros 0x10 mas si la suma pasa de 0x10
	cp 010h		;446b
	call nc,L_44FC		;446d   ; (otra vez, si son 0x10 o mas)
	call L_45B5		;4470   ; se escribe el marcador
L_4473:
	ld a,(0c000h)		;4473   ; espera a que acabe la musica de jefe destruido
	and a			;4476
	jr nz,L_4473		;4477
	inc a			;4479   ; callado
	call pide_sonido		;447a   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	xor a			;447d   ; la ficha del jugador a cero
	ld (ix-002h),a		;447e   ; el jugador sin parpadeo, sin golpe ni empujon, fuera del pasillo
	ld (ix-005h),a		;4481
	ld (ix-006h),a		;4484
	ld (ix-007h),a		;4487
	ld (ix-008h),a		;448a
	call vuelca_sprites		;448d   ; vuelca_sprites: lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)
	call L_4909		;4490
	call L_4B83		;4493
	ld a,(0e020h)		;4496   ; la fase siguiente...
	inc a			;4499   ; la siguiente
	cp 008h		;449a   ; ...pero la 8 (TRAP HANGAR) se salta siempre
	jr nz,L_449F		;449c
	inc a			;449e
L_449F:
	ld (0e020h),a		;449f   ; guarda la fase (0-19; la 8 se salta)
	cp 014h		;44a2   ; la 20 es el final
	jr nc,L_44CB		;44a4
	ld hl,0450eh		;44a6   ; el tramo con el que empieza la fase: la tabla p00:450E
	call lee_tabla		;44a9   ; lee_tabla: HL = HL + A y A = (HL)
	ld (0e022h),a		;44ac   ; guarda el tramo: la pantalla de la lista de la fase
	call borra_vram_ff		;44af   ; borra_vram_ff: llena de 0xFF los 0x6800 primeros bytes de la VRAM
	ld a,(0e03fh)		;44b2   ; con 0xE03F a 0xFF (y si no es una base), el tramo de 0xE03E
	cp 0ffh		;44b5
	jr nz,L_44C4		;44b7
	call es_base_3d		;44b9   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_44C4		;44bc
	ld a,(0e03eh)		;44be   ; el tramo guardado al grabar
	ld (0e022h),a		;44c1   ; guarda el tramo: la pantalla de la lista de la fase
L_44C4:
	xor a			;44c4   ; 0xE03F a cero: ya se ha usado
	ld (0e03fh),a		;44c5
	call L_4522		;44c8   ; el rotulo de la fase (p12:9915)
L_44CB:
	ld a,0ffh		;44cb   ; 0xE2CE = 0xFF mientras se carga la fase
	ld (0e2ceh),a		;44cd
	ld a,(0e020h)		;44d0   ; vuelta a cargar fase, hasta la 20
	cp 014h		;44d3
	jp nz,carga_fase		;44d5   ; carga_fase: carga la fase de 0xE020: paleta, graficos (p00:4666), pantalla y musica
	xor a			;44d8   ; el final: la partida acaba...
	ld (0e00fh),a		;44d9
	ld (0e2ceh),a		;44dc
	ld (0e000h),a		;44df   ; guarda 1 en una partida de verdad, 0 en la demostracion
	ld (0e066h),a		;44e2   ; guarda el disparo pulsado
	ld (0e020h),a		;44e5   ; guarda la fase (0-19; la 8 se salta)
	ld (0e1c1h),a		;44e8   ; 0xE1C1 a cero
	ld a,003h		;44eb   ; ...con la musica 0x03...
	call pide_sonido		;44ed   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	call pon_banco_12		;44f0   ; ...y el final de p12:9400 (el texto de p12:9622)
	call 09400h		;44f3
	call devuelve_banco_8000		;44f6   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	jp bucle_partida		;44f9   ; vuelta al titulo
L_44FC:
	push af			;44fc   ; suma B a los puntos (0xE037, cuatro cifras BCD)
	ld hl,0e037h		;44fd   ; apunta a los puntos (BCD; el marcador anade 00)
	ld a,b			;4500   ; B a las cifras de los puntos, desde la de las centenas (C = 4)
	ld c,004h		;4501
	call L_5F6C		;4503
	pop af			;4506
	ret			;4507

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4508..0x4522  (26 bytes)
DATA_4508:
	defb 023h,024h,011h,017h,015h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4508  #$..............
	defb 007h,000h,000h,007h,000h,000h,009h,006h,000h,000h	; 4518  ..........

; ======================================================================
; CODIGO 0x4522..0x4558  (54 bytes)
; ======================================================================


L_4522:
	ld a,001h		;4522   ; callado y, con el banco 12, el rotulo de la fase (STAGE y su nombre)
	call pide_sonido		;4524   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	call pon_banco_12		;4527   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	call 09915h		;452a   ; el rotulo (p12:9915)
devuelve_banco_8000:		; devuelve a 0x8000 el banco guardado en 0xE2CC
	ld a,(0e2cch)		;452d   ; lee el banco de 0x8000 guardado al poner el 12
	jr pon_banco_8000		;4530
pon_banco_12:		; guarda en 0xE2CC el banco de 0x8000 y pone el 12
	ld a,(0e203h)		;4532   ; lee la copia del banco de 0x8000
	ld (0e2cch),a		;4535   ; guarda el banco de 0x8000 guardado al poner el 12
	ld a,00ch		;4538   ; el banco 12
pon_banco_8000:		; pone el banco A en 0x8000 (y su copia en 0xE203)
	ld (0e203h),a		;453a   ; guarda la copia del banco de 0x8000
	ld (09000h),a		;453d   ; el mapper: pone en 0x8000 el banco de A
	ret			;4540
L_4541:
	ld a,(0e020h)		;4541   ; las fases de la lista p00:4558 (5, 9, 19, 12 y 15)...
	ld hl,04558h		;4544   ; la lista p00:4558, 5 fases
	ld bc,00005h		;4547
	cpir		;454a
	jr z,L_4554		;454c
	ld a,0ffh		;454e   ; ...ponen 0xAB en 0xE19C; las demas 0xFF
L_4550:
	ld (0e19ch),a		;4550
	ret			;4553
L_4554:
	ld a,0abh		;4554
	jr L_4550		;4556

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4558..0x455d  (5 bytes)
DATA_4558:
	defb 005h,009h,013h,00ch,00fh	; 4558

; ======================================================================
; CODIGO 0x455d..0x4632  (213 bytes)
; ======================================================================


L_455D:
	call L_456A		;455d   ; el marcador entero: STAGE, REST, SCORE y LIFE
	call L_45A1		;4560   ; REST, SCORE y la energia
	call L_45B5		;4563
	call L_45C3		;4566
	ret			;4569
L_456A:
	ld hl,002efh		;456a   ; STAGE/ en la fila de abajo
	ld de,04637h		;456d   ; STAGE/ (p00:4637)
	call escribe		;4570   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,002f5h		;4573   ; y el numero de fase:
L_4576:
	ld a,(0e020h)		;4576   ; el indice + 1 hasta la 7; desde la 9 el indice (la 8 se salta)
	cp 008h		;4579
	jr nc,L_457E		;457b
	inc a			;457d
L_457E:
	cp 00ah		;457e   ; de 10 en adelante, en BCD (+6)...
	jr c,L_458C		;4580
	cp 014h		;4582   ; ...y la 20 (el final) es 0x20
	jr nz,L_458A		;4584
	ld a,020h		;4586
	jr L_458C		;4588
L_458A:
	add a,006h		;458a
L_458C:
	ld d,a			;458c   ; las dos cifras: la alta...
	and 0f0h		;458d   ; la cifra alta (los 4 bits de arriba)...
	srl a		;458f
	srl a		;4591
	srl a		;4593
	srl a		;4595
	call L_48C7		;4597   ; ...con la letra de la fila 0xD8...
	ld a,d			;459a   ; ...y la baja
	and 00fh		;459b   ; ...y la baja, en la casilla siguiente
	inc hl			;459d
	jp pinta_dibujo		;459e   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
L_45A1:
	ld hl,002f8h		;45a1   ; REST/
	ld de,0463eh		;45a4   ; REST/ (p00:463E)
	call escribe		;45a7   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
L_45AA:
	ld hl,002fdh		;45aa   ; y las vidas menos la que se juega, en BCD
	ld a,(0e021h)		;45ad   ; lee las vidas que quedan (en BCD)
	sub 001h		;45b0   ; la que se juega no cuenta (BCD)
	daa			;45b2
	jr L_458C		;45b3
L_45B5:
	ld hl,002e1h		;45b5   ; SCORE/ y los puntos
	ld de,04644h		;45b8   ; SCORE/ (p00:4644)
	call escribe		;45bb   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	xor a			;45be   ; y los puntos (p00:5F33 con 0)
	call suma_puntos		;45bf   ; suma_puntos: suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas
	ret			;45c2
L_45C3:
	ld hl,00301h		;45c3   ; LIFE y la barra de energia, entera
	ld de,04632h		;45c6   ; LIFE (p00:4632)
	call escribe		;45c9   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld a,0aah		;45cc   ; 0xAA: dos puntos del color 10 por byte
	ld (0e2bbh),a		;45ce   ; el byte de la barra: 0xAA (lleno)
	ld hl,0609ch		;45d1   ; la barra empieza en el byte 0x609C de la VRAM
	ld a,(0e2c9h)		;45d4   ; lee la energia del jugador
	ld b,a			;45d7
	jr L_45EF		;45d8
L_45DA:
	ld a,0ffh		;45da   ; borra la barra desde la energia que queda hasta el final:
	ld (0e2bbh),a		;45dc   ; 0xFF, el color 15 (el negro de esta paleta)
	ld hl,0609ch		;45df   ; la barra en la VRAM
	ld a,(0e2c9h)		;45e2   ; lee la energia del jugador
	and a			;45e5
	jr z,L_45ED		;45e6
	ld b,a			;45e8
L_45E9:
	inc hl			;45e9   ; dos bytes (cuatro puntos) por punto de energia
	inc hl			;45ea
	djnz L_45E9		;45eb
L_45ED:
	ld b,008h		;45ed   ; los 8 que quedan hasta el final de la barra
L_45EF:
	push hl			;45ef
	push bc			;45f0
	ld b,007h		;45f1   ; siete lineas de alto
L_45F3:
	push hl			;45f3
	di			;45f4
	ld a,(00007h)		;45f5   ; la direccion de la VRAM por el puerto 0x99: los bits altos a R#14...
	inc a			;45f8
	ld c,a			;45f9
	ld a,h			;45fa
	rlca			;45fb
	rlca			;45fc
	and 003h		;45fd
	out (c),a		;45ff   ; los bits altos de la direccion, a R#14
	ld a,08eh		;4601
	out (c),a		;4603
	out (c),l		;4605   ; ...y la baja, para escribir
	res 7,h		;4607   ; la baja y la alta, con el bit 6 (escribir)
	set 6,h		;4609
	out (c),h		;460b
	dec c			;460d
	ld a,(0e2bbh)		;460e   ; un byte de la barra y luego el de su borde (color 15 en la mitad baja)
	out (c),a		;4611   ; el byte de la barra...
	and 0f0h		;4613   ; ...y el de debajo, con el borde
	add a,00fh		;4615
	out (c),a		;4617
	ei			;4619
	pop hl			;461a
	ld a,080h		;461b   ; la linea siguiente: 128 bytes mas abajo
	call lee_tabla		;461d   ; lee_tabla: HL = HL + A y A = (HL)
	djnz L_45F3		;4620
	pop bc			;4622
	pop hl			;4623
	inc hl			;4624   ; el siguiente punto de energia
	inc hl			;4625
	djnz L_45EF		;4626
	ret			;4628
borra:		; pone a cero BC bytes desde HL
	ld (hl),000h		;4629
	inc hl			;462b
	dec bc			;462c
	ld a,c			;462d
	or b			;462e
	jr nz,borra		;462f
	ret			;4631

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4632..0x468e  (92 bytes)
DATA_4632:
	defb 01ch,019h,016h,015h,0ffh,023h,024h,011h,017h,015h,02bh,0ffh,022h,015h,023h,024h	; 4632  .....#$...+.".#$
	defb 02bh,0ffh,023h,013h,01fh,022h,015h,02bh,010h,010h,010h,010h,010h,000h,000h,0ffh	; 4642  +.#..".+........
	defb 001h,001h,001h,001h,001h,001h,002h,002h,002h,003h,004h,001h,001h,005h,001h,001h	; 4652  ................
	defb 004h,005h,004h,006h,001h,008h,006h,008h,009h,008h,001h,008h,006h,008h,009h,008h	; 4662  ................
	defb 00ah,009h,00ah,009h,00ah,009h,007h,009h,006h,008h,006h,008h,009h,008h,006h,008h	; 4672  ................
	defb 006h,008h,009h,008h,006h,008h,006h,008h,006h,008h,007h,009h	; 4682  ............

; ======================================================================
; CODIGO 0x468e..0x46be  (48 bytes)
; ======================================================================


pon_paleta:		; pone la paleta A (16 colores de 0x46BE + 32 x A) con SETPLT de la SUB-ROM
	ld hl,046beh		;468e   ; la paleta A: 32 bytes (16 colores) por paleta desde p00:46BE
	and a			;4691
	jr z,L_469C		;4692
	ld b,a			;4694
L_4695:
	ld a,020h		;4695
	call lee_tabla		;4697   ; lee_tabla: HL = HL + A y A = (HL)
	djnz L_4695		;469a
L_469C:
	ld de,0e1d0h		;469c   ; se copia a 0xE1D0
	ld bc,00020h		;469f
	ldir		;46a2
L_46A4:
	ld hl,0e1d0h		;46a4   ; los 16 colores, de dos en dos bytes...
	ld d,000h		;46a7
	ld b,010h		;46a9
L_46AB:
	ld a,(hl)			;46ab   ; A = rojo x 16 + azul, E = verde
	inc hl			;46ac
	ld e,(hl)			;46ad
	inc hl			;46ae
	push ix		;46af
	ld ix,0014dh		;46b1   ; SETPLT de la SUB-ROM: el color D
	call 0015fh		;46b5   ; BIOS EXTROM - Calls a routine in SUB-ROM. Most common way
	pop ix		;46b8
	inc d			;46ba   ; el color siguiente
	djnz L_46AB		;46bb
	ret			;46bd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x46be..0x47be  (256 bytes)
DATA_46BE:
	defb 000h,000h,074h,005h,063h,004h,052h,003h,041h,002h,070h,005h,060h,003h,060h,002h	; 46be  ..t.c.R.A.p.`.`.
	defb 033h,003h,055h,005h,077h,007h,004h,004h,030h,001h,012h,001h,040h,000h,000h,000h	; 46ce  3.U.w...0...@...
	defb 001h,001h,010h,001h,040h,002h,011h,001h,005h,003h,003h,002h,003h,007h,045h,004h	; 46de  ....@.........E.
	defb 034h,003h,023h,002h,077h,007h,001h,004h,030h,001h,012h,001h,061h,004h,000h,000h	; 46ee  4.#.w...0...a...
	defb 001h,000h,062h,003h,034h,004h,001h,001h,004h,003h,033h,004h,045h,005h,044h,005h	; 46fe  ..b.4.....3.E.D.
	defb 051h,002h,022h,003h,077h,007h,001h,002h,023h,003h,012h,002h,074h,005h,000h,000h	; 470e  Q.".w...#...t...
	defb 022h,000h,044h,000h,063h,002h,011h,001h,031h,000h,033h,000h,055h,000h,055h,005h	; 471e  ".D.c...1.3.U.U.
	defb 044h,004h,033h,003h,077h,007h,052h,001h,020h,001h,022h,002h,074h,003h,000h,000h	; 472e  D.3.w.R. .".t...
	defb 000h,000h,063h,005h,041h,003h,011h,001h,004h,003h,002h,002h,040h,002h,045h,004h	; 473e  ..c.A.......@.E.
	defb 034h,003h,023h,002h,077h,007h,020h,001h,030h,002h,010h,000h,052h,004h,000h,000h	; 474e  4.#.w. .0...R...
	defb 022h,000h,072h,005h,050h,003h,011h,001h,051h,001h,002h,002h,045h,005h,044h,004h	; 475e  ".r.P...Q...E.D.
	defb 033h,003h,022h,002h,077h,007h,040h,000h,040h,002h,020h,000h,061h,004h,000h,000h	; 476e  3.".w.@.@. .a...
	defb 030h,000h,051h,002h,063h,002h,010h,000h,031h,000h,040h,001h,062h,003h,053h,003h	; 477e  0.Q.c...1.@.b.S.
	defb 042h,002h,031h,001h,077h,007h,052h,001h,020h,001h,021h,001h,074h,003h,000h,000h	; 478e  B.1.w.R. .!.t...
	defb 077h,007h,070h,003h,060h,001h,044h,004h,077h,007h,000h,000h,000h,000h,000h,000h	; 479e  w.p.`.D.w.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 47ae  ................

; ======================================================================
; CODIGO 0x47be..0x4843  (133 bytes)
; ======================================================================


carga_graficos:		; pone el banco A en 0x6000 y lo copia entero a la VRAM con HMMC
	ld (0e018h),a		;47be   ; guarda el banco de graficos que se carga
	call pon_banco_6000_graficos		;47c1   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld hl,06000h		;47c4   ; HL = 0x6000: el banco se copia desde el principio
	ld a,001h		;47c7   ; 0xE01C = 1: a la pagina 1 de la VRAM (la de los dibujos)
	ld (0e01ch),a		;47c9   ; 0xE01C = 1: la pagina de dibujos
	ret			;47cc
carga_graficos_arriba:		; copia el banco A a la VRAM en la linea 0 de la pagina de dibujos
	call carga_graficos		;47cd   ; carga_graficos: pone el banco A en 0x6000 y lo copia entero a la VRAM con HMMC
	xor a			;47d0   ; a la linea 0 de la pagina
	ld (0e1cbh),a		;47d1
	jr L_47E7		;47d4
L_47D6:
	call pon_banco_12		;47d6   ; con el banco 12, p12:98BF: la tabla de sprites del jugador
	call 098bfh		;47d9   ; p12:98BF
	jp devuelve_banco_8000		;47dc   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
carga_graficos_abajo:		; copia el banco A a la VRAM en la linea 0x40 de la pagina de dibujos
	call carga_graficos		;47df   ; carga_graficos: pone el banco A en 0x6000 y lo copia entero a la VRAM con HMMC
	ld a,040h		;47e2   ; a la linea 0x40 de la pagina
	ld (0e1cbh),a		;47e4
L_47E7:
	push hl			;47e7
	ld hl,04843h		;47e8   ; la orden HMMC de p00:4843: 256 x 64 puntos, de la CPU a la VRAM
	ld de,0e0d0h		;47eb   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000bh		;47ee
	ldir		;47f1   ; la orden a 0xE0D0
	ld a,(0e1cbh)		;47f3   ; la y de destino...
	ld (0e0d2h),a		;47f6
	ld a,(0e01ch)		;47f9   ; ...y la pagina (el byte alto de la y)
	ld (0e0d3h),a		;47fc
	pop hl			;47ff
	di			;4800
	ld a,(hl)			;4801   ; el primer byte va con la orden (en R#44, el color)
	ld (0e0d8h),a		;4802   ; en R#44 (el color) el primer byte
	inc hl			;4805
	push hl			;4806
	ld a,(00007h)		;4807
	inc a			;480a
	ld c,a			;480b
	ld a,024h		;480c   ; R#17 = 36 con autoincremento: los registros 36 a 46 seguidos
	out (c),a		;480e   ; R#17 = 36...
	ld a,091h		;4810   ; ...con autoincremento (0x80) y al registro 17 (0x11)
	out (c),a		;4812
	ld b,00bh		;4814   ; 11 registros
	ld hl,0e0d0h		;4816   ; apunta a la orden del VDP que se manda (registros 32-46)
	inc c			;4819
	inc c			;481a
	otir		;481b   ; los 11 bytes de la orden, al puerto 0x9B
	dec c			;481d
	dec c			;481e
	pop hl			;481f
L_4820:
	ld a,002h		;4820   ; S#2: mira el VDP
	out (c),a		;4822   ; R#15 = 2: S#2
	ld a,08fh		;4824
	out (c),a		;4826
	in a,(c)		;4828   ; lee S#2
	bit 0,a		;482a   ; CE a cero: la orden acabo
	jr z,L_483A		;482c
	bit 7,a		;482e   ; TR a uno: quiere otro byte
	jr z,L_4820		;4830
	outi		;4832   ; el byte siguiente del banco, a R#44 (el puerto 0x9B)
	ld a,0ach		;4834   ; R#17 = 44 sin autoincremento, para el siguiente
	out (c),a		;4836   ; R#17 = 44
	jr L_4820		;4838
L_483A:
	xor a			;483a   ; S#0 otra vez en R#15
	out (c),a		;483b   ; R#15 = 0: S#0 otra vez
	ld a,08fh		;483d
	out (c),a		;483f
	ei			;4841
	ret			;4842

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4843..0x484e  (11 bytes)
DATA_4843:
	defb 000h,000h,000h,003h,000h,001h,040h,000h,000h,000h,0f0h	; 4843  ......@....

; ======================================================================
; CODIGO 0x484e..0x48a9  (91 bytes)
; ======================================================================


orden_copia:		; prepara en 0xE0D0 la orden HMMM de copiar un dibujo de 8 x 8
	push hl			;484e   ; la orden de p00:48A9: HMMM de 8 x 8 desde la pagina 1 (la de los dibujos)
	push de			;484f
	ld hl,048a9h		;4850   ; la orden de copiar de la pagina 1
L_4853:
	ld de,0e0d0h		;4853   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000fh		;4856
	ldir		;4859
	pop de			;485b
	pop hl			;485c
	ret			;485d
L_485E:
	call orden_copia		;485e   ; la misma con LMMM y TIMP (0x98): el color 0 no tapa lo de debajo
	ld a,098h		;4861   ; LMMM con TIMP
	ld (0e0deh),a		;4863
	ret			;4866
L_4867:
	push hl			;4867   ; la orden de p00:48B8: HMMM de 8 x 8 desde la linea 0xD8 de la pagina 0 (las letras)
	push de			;4868
	ld hl,048b8h		;4869   ; la orden de copiar de las letras
	jr L_4853		;486c
pinta_dibujo:		; pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	push hl			;486e
	push bc			;486f
	push af			;4870
	ld a,l			;4871   ; la casilla HL (fila x 32 + columna): la y de destino = fila x 8...
	and 0e0h		;4872   ; la fila de la casilla: los 3 bits altos de L...
	rrc h		;4874   ; ...y los 2 bajos de H, x 8
	rra			;4876
	rrc h		;4877
	rra			;4879
	ld (0e0d6h),a		;487a   ; ...en R#38-39...
	ld a,h			;487d
	ld (0e0d7h),a		;487e
	ld a,l			;4881   ; ...y la x = columna x 8, en R#36
	and 01fh		;4882
	rlca			;4884
	rlca			;4885
	rlca			;4886
	ld (0e0d4h),a		;4887   ; la x (R#36)
	pop af			;488a
	ld l,a			;488b   ; el dibujo A: su fila de la hoja (A / 32) x 8...
	and 0e0h		;488c
	rrca			;488e
	rrca			;488f
	ld h,a			;4890
	ld a,(0e01fh)		;4891   ; ...mas la fila de la hoja (0xE01F), en R#34...
	add a,h			;4894   ; la fila de la hoja (R#34)
	ld (0e0d2h),a		;4895
	ld a,l			;4898   ; ...y la x = (A mod 32) x 8, en R#32
	and 01fh		;4899
	rlca			;489b
	rlca			;489c
	rlca			;489d
	ld (0e0d0h),a		;489e   ; guarda la orden del VDP que se manda (registros 32-46)
	ld b,020h		;48a1   ; los registros 32 a 46, y la orden
	call orden_vdp		;48a3   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	pop bc			;48a6
	pop hl			;48a7
	ret			;48a8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x48a9..0x48c7  (30 bytes)
DATA_48A9:
	defb 000h,000h,000h,001h,000h,000h,000h,000h,008h,000h,008h,000h,000h,000h,0d0h,000h	; 48a9  ................
	defb 000h,0d8h,000h,000h,000h,000h,000h,008h,000h,008h,000h,000h,000h,0d0h	; 48b9  ..............

; ======================================================================
; CODIGO 0x48c7..0x49d3  (268 bytes)
; ======================================================================


L_48C7:
	push af			;48c7   ; una cifra con la letra de la fila 0xD8
	ld a,0d8h		;48c8   ; las letras
	ld (0e01fh),a		;48ca   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	call L_4867		;48cd
	pop af			;48d0
	jr $-99		;48d1
escribe:		; escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld a,0d8h		;48d3   ; las letras estan en la linea 0xD8 de la pagina 0
	ld (0e01fh),a		;48d5   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	call L_4867		;48d8
L_48DB:
	ld a,(de)			;48db   ; cada byte de la cadena es un dibujo de la hoja; 0xFF acaba
	inc de			;48dc
	cp 0ffh		;48dd
	ret z			;48df
	call pinta_dibujo		;48e0   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	inc hl			;48e3   ; la casilla siguiente
	jr L_48DB		;48e4
borra_partida:		; pantalla apagada, mapa 0xC300 a 0x10 y RAM de la partida a cero
	call apaga_pantalla		;48e6   ; apaga_pantalla: apaga la pantalla (DISSCR)
	ld hl,0c300h		;48e9   ; el mapa de 0xC300 (0x9C0 bytes) a 0x10
	ld bc,009c0h		;48ec
L_48EF:
	ld (hl),010h		;48ef   ; 0x10: casilla vacia
	inc hl			;48f1
	dec bc			;48f2
	ld a,c			;48f3
	or b			;48f4
	jr nz,L_48EF		;48f5
	ld hl,0e100h		;48f7   ; 0xE100-0xE1FF a cero
	ld bc,00100h		;48fa
	call borra		;48fd   ; borra: pone a cero BC bytes desde HL
	ld hl,0e220h		;4900   ; 0xE220-0xE3FF a cero
	ld bc,001e0h		;4903
	call borra		;4906   ; borra: pone a cero BC bytes desde HL
L_4909:
	ld a,0ech		;4909   ; las fichas del jugador con y = 0xEC: fuera de la pantalla
	ld (0e300h),a		;490b   ; guarda las 32 fichas de objeto de 16 bytes (las 4 primeras, el jugador)
	ld (0e310h),a		;490e   ; las cuatro del jugador fuera
	ld (0e320h),a		;4911
	ld (0e330h),a		;4914
	call L_4937		;4917
	call L_492E		;491a
	xor a			;491d   ; sin disparo ni palanca
	ld (0e066h),a		;491e   ; guarda el disparo pulsado
	ld (0e060h),a		;4921   ; sin disparo, salto ni 0xE064
	ld (0e062h),a		;4924
	ld (0e064h),a		;4927
	ld (0e180h),a		;492a   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ret			;492d
L_492E:
	ld hl,0e500h		;492e   ; 0xE500-0xE5FF a cero (los objetos de la fase)
	ld bc,00100h		;4931
	jp borra		;4934   ; borra: pone a cero BC bytes desde HL
L_4937:
	ld hl,0e340h		;4937   ; las 28 fichas que no son del jugador a cero...
	ld bc,001c0h		;493a
	call borra		;493d   ; borra: pone a cero BC bytes desde HL
	ld hl,0e340h		;4940   ; desde 0xE340, 28 fichas
	ld de,00010h		;4943
	ld b,01ch		;4946
L_4948:
	ld (hl),0ech		;4948   ; ...y fuera de la pantalla (y = 0xEC)
	add hl,de			;494a
	djnz L_4948		;494b
	jp vuelca_sprites		;494d   ; y a la VRAM
L_4950:
	ld hl,0c980h		;4950   ; los colores de los sprites del jugador: 0xC980...
	call L_496A		;4953
	jr L_495E		;4956
L_4958:
	ld hl,0c9a0h		;4958   ; ...o 0xC9A0
	call L_496A		;495b
L_495E:
	ld hl,0c980h		;495e   ; 0x40 bytes a la tabla de colores de los sprites 0-3 (0x7400): el jugador
	ld de,07400h		;4961   ; los colores de los sprites 0-3 (el jugador)
	ld bc,00040h		;4964
	jp 0005ch		;4967   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_496A:
	ld a,b			;496a
	and a			;496b
	jr z,L_4971		;496c
L_496E:
	inc hl			;496e
	djnz L_496E		;496f
L_4971:
	ld (hl),060h		;4971   ; 0x60 en la linea B de los colores...
	ld a,010h		;4973   ; ...y en la misma del sprite siguiente (16 mas)
	call lee_tabla		;4975   ; lee_tabla: HL = HL + A y A = (HL)
	ld (hl),060h		;4978
	ret			;497a
L_497B:
	ld bc,00400h		;497b   ; los colores de los 32 sprites (0x400 bytes)...
	push bc			;497e
	ld hl,0c980h		;497f
	ld de,04b2ch		;4982   ; ...desde la tabla p00:4B2C: un color por sprite...
	ld c,020h		;4985
L_4987:
	ld a,(de)			;4987
	ld b,010h		;4988   ; ...repetido en sus 16 lineas, en 0xC980
L_498A:
	ld (hl),a			;498a
	inc hl			;498b
	djnz L_498A		;498c
	inc de			;498e
	dec c			;498f
	jr nz,L_4987		;4990
	ld hl,0c980h		;4992   ; a la tabla de colores de los sprites de la VRAM (0x7400)
	ld de,07400h		;4995
	pop bc			;4998
	call 0005ch		;4999   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_499C:
	ld a,06bh		;499c   ; tres lineas de colores de 0x741D a 0x6B...
	jr L_49A2		;499e
L_49A0:
	ld a,067h		;49a0   ; ...o a 0x67
L_49A2:
	ld hl,0741dh		;49a2
	ld bc,00003h		;49a5
	jp 00056h		;49a8   ; BIOS FILVRM - Fills VRAM with value
L_49AB:
	ld a,00bh		;49ab   ; los dibujos de sprite del banco 11...
	call pon_banco_6000_graficos		;49ad   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld hl,06a40h		;49b0   ; ...0x1A0 bytes de 0x6A40 a la tabla de dibujos de la VRAM (0x7880)
	ld de,07880h		;49b3
	ld bc,001a0h		;49b6
	call 0005ch		;49b9   ; BIOS LDIRVM - Block transfers to VRAM from memory
	call L_497B		;49bc   ; y los colores
L_49BF:
	ld a,00ch		;49bf   ; con el banco 12 en 0x6000, mas dibujos de sprite segun 0xE097:
	call pon_banco_6000_graficos		;49c1   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld hl,049d3h		;49c4   ; la tabla p00:49D3 (8 destinos)
	ld a,(0e097h)		;49c7
	add a,a			;49ca
	call lee_tabla		;49cb   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;49ce
	inc hl			;49cf
	ld d,(hl)			;49d0
	ex de,hl			;49d1
	jp (hl)			;49d2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x49d3..0x49e3  (16 bytes)
DATA_49D3:
	defb 0e3h,049h,0e9h,049h,004h,04ah,02eh,04ah,03dh,04ah,05ah,04ah,06bh,04ah,088h,04ah	; 49d3  .I.I.J.J=JZJkJ.J

; ======================================================================
; CODIGO 0x49e3..0x4ad8  (245 bytes)
; ======================================================================


L_49E3:
	call L_4AE4		;49e3
	jp L_4AC7		;49e6
L_49E9:
	ld hl,06480h		;49e9   ; 0x480 bytes de 0x6480 a 0x7AC0 y 0x60 de 0x6D40 a 0x7F40
	ld de,07ac0h		;49ec
	ld bc,00480h		;49ef
	call 0005ch		;49f2   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06d40h		;49f5
	ld de,07f40h		;49f8
	ld bc,00060h		;49fb
	call 0005ch		;49fe   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jp L_4AC7		;4a01
L_4A04:
	call L_4AE4		;4a04
	ld hl,06900h		;4a07   ; 0x140 de 0x6900 a 0x7E40, 0x20 de 0x6CC0 a 0x7F80 y 0x40 de 0x6CE0 a 0x7FC0
	ld de,07e40h		;4a0a
	ld bc,00140h		;4a0d
	call 0005ch		;4a10   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06cc0h		;4a13
	ld de,07f80h		;4a16
	ld bc,00020h		;4a19
	call 0005ch		;4a1c   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06ce0h		;4a1f
	ld de,07fc0h		;4a22
	ld bc,00040h		;4a25
	call 0005ch		;4a28   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jp L_4AC7		;4a2b
L_4A2E:
	ld hl,06a40h		;4a2e   ; 0x280 de 0x6A40 a 0x7AC0
	ld de,07ac0h		;4a31
	ld bc,00280h		;4a34
	call 0005ch		;4a37   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jp L_4AC7		;4a3a
L_4A3D:
	call L_4AE4		;4a3d
	ld hl,06fe0h		;4a40   ; 0x80 de 0x6FE0 a 0x7E40 y 0xC0 de 0x6EA0 a 0x7EC0
	ld de,07e40h		;4a43
	ld bc,00080h		;4a46
	call 0005ch		;4a49   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06ea0h		;4a4c
	ld de,07ec0h		;4a4f
	ld bc,000c0h		;4a52
	call 0005ch		;4a55   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jr L_4AC7		;4a58
L_4A5A:
	call L_4AE4		;4a5a
	ld hl,07060h		;4a5d   ; 0x140 de 0x7060 a 0x7E40
	ld de,07e40h		;4a60
	ld bc,00140h		;4a63
	call 0005ch		;4a66   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jr L_4AC7		;4a69
L_4A6B:
	call L_4AE4		;4a6b
	ld hl,06fe0h		;4a6e   ; 0x80 de 0x6FE0 a 0x7E40 y 0x80 de 0x6F60 a 0x7EC0
	ld de,07e40h		;4a71
	ld bc,00080h		;4a74
	call 0005ch		;4a77   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06f60h		;4a7a
	ld de,07ec0h		;4a7d
	ld bc,00080h		;4a80
	call 0005ch		;4a83   ; BIOS LDIRVM - Block transfers to VRAM from memory
	jr L_4AC7		;4a86
L_4A88:
	call L_4AE4		;4a88
	ld hl,06900h		;4a8b   ; 0x80 de 0x6900 a 0x7E40 y 0xC0 de 0x71E0 a 0x7EC0
	ld de,07e40h		;4a8e
	ld bc,00080h		;4a91
	call 0005ch		;4a94   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,071e0h		;4a97
	ld de,07ec0h		;4a9a
	ld bc,000c0h		;4a9d
	call 0005ch		;4aa0   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06cc0h		;4aa3
	ld de,07f80h		;4aa6
	ld bc,00020h		;4aa9
	call 0005ch		;4aac   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06e40h		;4aaf
	ld de,07fa0h		;4ab2
	ld bc,00020h		;4ab5
	call 0005ch		;4ab8   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06ce0h		;4abb
	ld de,07fc0h		;4abe
	ld bc,00040h		;4ac1
	call 0005ch		;4ac4   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_4AC7:
	ld hl,07320h		;4ac7   ; y en todas, 0x80 bytes de 0x7320 a 0x7A40
	ld de,07a40h		;4aca
	ld bc,00080h		;4acd
	call 0005ch		;4ad0   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld a,001h		;4ad3   ; el banco 1 otra vez en 0x6000
	jp pon_banco_6000_graficos		;4ad5   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4ad8..0x4ae4  (12 bytes)
DATA_4AD8:
	defb 021h,0e0h,071h,011h,080h,079h,001h,040h,000h,0c3h,05ch,000h	; 4ad8  !.q..y.@..\.

; ======================================================================
; CODIGO 0x4ae4..0x4b2c  (72 bytes)
; ======================================================================


L_4AE4:
	ld hl,06000h		;4ae4   ; lo comun a varias: 0x380 de 0x6000 a 0x7AC0, 0x100 de 0x6380 a 0x7E40...
	ld de,07ac0h		;4ae7
	ld bc,00380h		;4aea
	call 0005ch		;4aed   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06380h		;4af0
	ld de,07e40h		;4af3
	ld bc,00100h		;4af6
	call 0005ch		;4af9   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06dc0h		;4afc   ; ...0x60 de 0x6DC0 a 0x7F40 y tres de 0x20 a 0x7FA0, 0x7FC0 y 0x7FE0
	ld de,07f40h		;4aff
	ld bc,00060h		;4b02
	call 0005ch		;4b05   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06e40h		;4b08
	ld de,07fa0h		;4b0b
	ld bc,00020h		;4b0e
	call 0005ch		;4b11   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06da0h		;4b14
	ld de,07fc0h		;4b17
	ld bc,00020h		;4b1a
	call 0005ch		;4b1d   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06e20h		;4b20
	ld de,07fe0h		;4b23
	ld bc,00020h		;4b26
	jp 0005ch		;4b29   ; BIOS LDIRVM - Block transfers to VRAM from memory

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4b2c..0x4b4c  (32 bytes)
DATA_4B2C:
	defb 00eh,067h,005h,06bh,00eh,00eh,00eh,067h,005h,06bh,00eh,06bh,00eh,06bh,005h,06bh	; 4b2c  .g.k...g.k.k.k.k
	defb 005h,06bh,005h,06bh,00eh,067h,005h,06bh,00eh,067h,005h,06bh,00eh,00eh,00eh,00eh	; 4b3c  .k.k.g.k.g.k....

; ======================================================================
; CODIGO 0x4b4c..0x4d95  (585 bytes)
; ======================================================================


L_4B4C:
	ld a,00bh		;4b4c   ; los dibujos del jugador, del banco 11:
	call pon_banco_6000_graficos		;4b4e   ; pon_banco_6000_graficos: apunta A en 0xE017 y lo pone en 0x6000
	ld hl,06000h		;4b51   ; la parte de arriba: el dibujo IX+0C (0x40 bytes cada uno)...
	ld a,(ix+00ch)		;4b54
	ld de,00040h		;4b57
	and a			;4b5a
	jr z,L_4B61		;4b5b
	ld b,a			;4b5d
L_4B5E:
	add hl,de			;4b5e
	djnz L_4B5E		;4b5f
L_4B61:
	ld de,07800h		;4b61   ; ...a los dibujos de sprite 0-3 (0x7800)
	ld bc,00040h		;4b64
	call 0005ch		;4b67   ; BIOS LDIRVM - Block transfers to VRAM from memory
	ld hl,06000h		;4b6a   ; la de abajo: el dibujo IX+0D...
	ld a,(ix+00dh)		;4b6d
	and a			;4b70
	jr z,L_4B7A		;4b71
	ld de,00040h		;4b73
	ld b,a			;4b76
L_4B77:
	add hl,de			;4b77
	djnz L_4B77		;4b78
L_4B7A:
	ld de,07840h		;4b7a   ; ...a los dibujos 4-7 (0x7840)
	ld bc,00040h		;4b7d
	jp 0005ch		;4b80   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_4B83:
	call copia_sprites		;4b83   ; copia_sprites: copia y, x y dibujo de las 32 fichas de 0xE300 a la tabla de 0xE100
vuelca_sprites:		; lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)
	ld a,(ix-001h)		;4b86   ; IX-1 (0xE31F) no cero: todos los sprites fuera
	and a			;4b89
	jr nz,L_4BB0		;4b8a
	ld a,(ix-002h)		;4b8c   ; IX-2 (0xE31E) impar: el jugador parpadea (sus 4 sprites fuera este cuadro)
	and a			;4b8f
	jr z,L_4BA4		;4b90
	bit 0,a		;4b92
	jr z,L_4BA4		;4b94
	ld a,0ech		;4b96
	ld (0e100h),a		;4b98   ; guarda la copia de los atributos de sprite (32 x 4 bytes)
	ld (0e104h),a		;4b9b
	ld (0e108h),a		;4b9e
	ld (0e10ch),a		;4ba1
L_4BA4:
	ld de,07600h		;4ba4   ; los 32 atributos a la VRAM (0x7600)
	ld hl,0e100h		;4ba7   ; apunta a la copia de los atributos de sprite (32 x 4 bytes)
	ld bc,00080h		;4baa
	jp 0005ch		;4bad   ; BIOS LDIRVM - Block transfers to VRAM from memory
L_4BB0:
	ld hl,07600h		;4bb0   ; todos los sprites con y = 0xEC (fuera)
	ld a,0ech		;4bb3
	ld bc,00080h		;4bb5
	jp 00056h		;4bb8   ; BIOS FILVRM - Fills VRAM with value
copia_sprites:		; copia y, x y dibujo de las 32 fichas de 0xE300 a la tabla de 0xE100
	ld hl,0e300h		;4bbb   ; apunta a las 32 fichas de objeto de 16 bytes (las 4 primeras, el jugador)
	ld de,0e100h		;4bbe   ; apunta a la copia de los atributos de sprite (32 x 4 bytes)
	ld b,020h		;4bc1
L_4BC3:
	push bc			;4bc3   ; y, x y dibujo de cada ficha...
	ld bc,00003h		;4bc4
	ldir		;4bc7
	inc de			;4bc9   ; ...el cuarto byte del atributo no se toca...
	ld bc,0000dh		;4bca   ; ...y la ficha siguiente (16 bytes)
	add hl,bc			;4bcd
	pop bc			;4bce
	djnz L_4BC3		;4bcf
	ret			;4bd1
interrupcion:		; la interrupcion (H.KEYI): el cuadro del juego con los bancos 1-2 y el sonido con 4-5
	pop af			;4bd2   ; el retorno a la BIOS fuera: la interrupcion acaba aqui, no en la BIOS
	ld a,(00007h)		;4bd3   ; lee S#0 del VDP (y con eso la interrupcion queda atendida)
	inc a			;4bd6
	ld c,a			;4bd7
	in a,(c)		;4bd8
	ld a,002h		;4bda   ; el cuadro del juego, con los bancos 1-2
	call L_4BEF		;4bdc
	pop ix		;4bdf   ; los registros que guardo la BIOS en 0x0038, al reves
	pop iy		;4be1
	pop af			;4be3
	pop bc			;4be4
	pop de			;4be5
	pop hl			;4be6
	exx			;4be7
	ex af,af'			;4be8
	pop af			;4be9
	pop bc			;4bea
	pop de			;4beb
	pop hl			;4bec
	ei			;4bed   ; y vuelta a lo que se interrumpio
	ret			;4bee
L_4BEF:
	ld a,(0e202h)		;4bef   ; guarda los bancos de 0x6000 y 0x8000...
	push af			;4bf2
	ld a,(0e203h)		;4bf3   ; lee la copia del banco de 0x8000
	push af			;4bf6
	ld a,001h		;4bf7   ; ...y pone el 1 y el 2
	ld (0e202h),a		;4bf9   ; guarda la copia del banco de 0x6000
	ld (07000h),a		;4bfc   ; el mapper: pone en 0x6000 el banco de A
	inc a			;4bff
	call pon_banco_8000		;4c00   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	call L_4C0E		;4c03   ; el cuadro del juego (p00:4C0E)
	pop af			;4c06   ; y los bancos que habia
	call pon_banco_8000		;4c07   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	pop af			;4c0a
	jp pon_banco_6000		;4c0b   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
L_4C0E:
	ld a,(0e200h)		;4c0e   ; 0xE200: si el cuadro anterior no ha acabado, este no se hace
	and a			;4c11
	ret nz			;4c12
	ld a,001h		;4c13
	ld (0e200h),a		;4c15
	push af			;4c18
	push bc			;4c19
	push de			;4c1a
	push hl			;4c1b
	push iy		;4c1c
	push ix		;4c1e
	ld a,004h		;4c20   ; el motor de sonido: bancos 4 y 5...
	call pon_banco_6000		;4c22   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	inc a			;4c25
	call pon_banco_8000		;4c26   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	call 06006h		;4c29   ; ...su cuadro (p04:6006)...
	ld a,002h		;4c2c   ; ...y otra vez el 2 y el 1
	call pon_banco_8000		;4c2e   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	dec a			;4c31
	call pon_banco_6000		;4c32   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	pop ix		;4c35
	pop iy		;4c37
	pop hl			;4c39
	pop de			;4c3a
	pop bc			;4c3b
	pop af			;4c3c
	xor a			;4c3d   ; el cuadro ya ha acabado
	ld (0e200h),a		;4c3e
	ld a,(0e066h)		;4c41   ; en la demostracion, el disparo la acaba (0xE094 = 0)
	and a			;4c44
	jr z,L_4C4B		;4c45
	xor a			;4c47
	ld (0e094h),a		;4c48   ; guarda 1 mientras dura la fase
L_4C4B:
	ld a,(0e094h)		;4c4b   ; sin fase en marcha no hay mas que hacer
	and a			;4c4e
	jp z,L_4E39		;4c4f
	ld a,(0e093h)		;4c52   ; 0xE093 no cero: el cuadro del juego ya esta en marcha (la interrupcion lo pilla a medias)
	and a			;4c55
	jp nz,L_4E39		;4c56
	ld a,001h		;4c59
	ld (0e093h),a		;4c5b
	ld a,(0e2c6h)		;4c5e   ; 0xE2C6: el juego parado
	and a			;4c61
	jp nz,L_4E35		;4c62
	ld a,001h		;4c65
	ld (0e2e0h),a		;4c67
	ld a,(0e2c1h)		;4c6a   ; 0xE2C1 no cero: p03:BEAC
	and a			;4c6d
	jp nz,0beach		;4c6e
	ld a,(0e2c2h)		;4c71   ; 0xE2C2: se ha cogido una capsula (p02:9583)...
	and a			;4c74
	jr z,L_4C95		;4c75
	ld a,(0e030h)		;4c77   ; ...y sube el contador que dice p00:4DB4 por 0xE030 (0xE033 las dos primeras, 0xE031 las dos siguientes; hasta 4)
	cp 004h		;4c7a
	jr nc,L_4C90		;4c7c
	push af			;4c7e
	ld hl,04db4h		;4c7f
	add a,a			;4c82
	call lee_tabla		;4c83   ; lee_tabla: HL = HL + A y A = (HL)
	ld e,(hl)			;4c86
	inc hl			;4c87
	ld d,(hl)			;4c88
	ex de,hl			;4c89
	inc (hl)			;4c8a
	pop af			;4c8b
	inc a			;4c8c
	ld (0e030h),a		;4c8d
L_4C90:
	ld a,021h		;4c90   ; el sonido de coger la capsula
	call pide_sonido		;4c92   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_4C95:
	xor a			;4c95
	ld (0e2c2h),a		;4c96
	ld (0e2e0h),a		;4c99
	call vuelca_sprites		;4c9c   ; los sprites a la VRAM y los dibujos del jugador
	call L_4B4C		;4c9f
	ld a,(0e207h)		;4ca2   ; 0xE207 no cero: la pausa
	and a			;4ca5
	jp z,L_4E18		;4ca6
	ld (ix-001h),001h		;4ca9   ; en la pausa, los sprites fuera
	ld a,005h		;4cad   ; la tecla S (fila 5, bit 0): grabar
	call 00141h		;4caf   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 0,a		;4cb2
	jr z,L_4D1A		;4cb4
	ld a,004h		;4cb6   ; la tecla L (fila 4, bit 1): cargar
	call 00141h		;4cb8   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;4cbb
	jp nz,L_4E35		;4cbd
	call L_4D9E		;4cc0   ; sin el otro cartucho (el Game Master 2) no se carga nada
	and a			;4cc3
	jp z,L_4E35		;4cc4
	ld hl,04e07h		;4cc7   ; el nombre del fichero, CONTRA (p00:4E07), a 0xC200
	ld de,0c200h		;4cca
	ld bc,00010h		;4ccd
	ldir		;4cd0
	ld c,00bh		;4cd2   ; la orden 0x0B del otro cartucho: cargar
	call L_4DCB		;4cd4
	and a			;4cd7   ; si falla, el mensaje de error
	jp nz,L_4D6A		;4cd8
	ld a,(0e03ah)		;4cdb   ; lo cargado: las vidas...
	ld (0e021h),a		;4cde   ; guarda las vidas que quedan (en BCD)
	ld a,(0e037h)		;4ce1   ; ...los puntos (solo las cifras altas)...
	and 0f0h		;4ce4
	ld (0e00fh),a		;4ce6
	call L_5F85		;4ce9
	ld hl,0014ah		;4cec   ; LOAD COMPLETED
	ld de,053fah		;4cef
	call escribe		;4cf2   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,0e020h		;4cf5   ; ...la fase (menos una: al acabar esta se suma)...
	ld a,(0e03bh)		;4cf8
	dec a			;4cfb
	ld (hl),a			;4cfc
	ld a,(0e03ch)		;4cfd   ; ...y la energia
	ld (0e2c9h),a		;4d00   ; guarda la energia del jugador
	xor a			;4d03   ; la fase acaba ya, como superada (0xE184 = 1): se carga la guardada
	ld (0e094h),a		;4d04   ; guarda 1 mientras dura la fase
	ld (0e2c5h),a		;4d07
	ld (0c000h),a		;4d0a
	ld (0e045h),a		;4d0d
	ld (0e2cdh),a		;4d10
	inc a			;4d13
	ld (0e184h),a		;4d14   ; guarda fase superada (1; 2 ya contada)
	jp L_4E35		;4d17
L_4D1A:
	call L_4D9E		;4d1a   ; grabar: hace falta el otro cartucho...
	and a			;4d1d
	jp z,L_4E35		;4d1e
	ld a,(0e2c9h)		;4d21   ; ...y energia
	and a			;4d24
	jp z,L_4E35		;4d25
	ld a,(0e021h)		;4d28   ; lo que se graba: las vidas, la fase, la energia y el tramo, en 0xE03A-0xE03E...
	ld (0e03ah),a		;4d2b
	ld a,(0e020h)		;4d2e   ; lee la fase (0-19; la 8 se salta)
	ld (0e03bh),a		;4d31
	ld a,(0e2c9h)		;4d34   ; lee la energia del jugador
	ld (0e03ch),a		;4d37
	ld a,(0e022h)		;4d3a   ; lee el tramo: la pantalla de la lista de la fase
	ld (0e03eh),a		;4d3d
	ld a,0ffh		;4d40   ; ...y 0xE03F = 0xFF: al cargar se empieza en ese tramo (p00:44B2)
	ld (0e03fh),a		;4d42
	ld hl,04e07h		;4d45   ; el nombre del fichero, CONTRA
	ld de,0c200h		;4d48
	ld bc,00010h		;4d4b
	ldir		;4d4e
	ld c,00ah		;4d50   ; la orden 0x0A del otro cartucho: grabar
	ld b,001h		;4d52
	call L_4DCB		;4d54   ; si falla, el mensaje de error
	and a			;4d57
	jr nz,L_4D6A		;4d58
	ld hl,0014ah		;4d5a   ; SAVE COMPLETED
	ld de,053ebh		;4d5d
	call escribe		;4d60   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	xor a			;4d63
	ld (0e03fh),a		;4d64
	jp L_4E35		;4d67
L_4D6A:
	and a			;4d6a   ; el mensaje de error que da el otro cartucho en A:
	jr nz,L_4D72		;4d6b
	ld de,054bbh		;4d6d   ; 0: NO ERROR
	jr L_4D8C		;4d70
L_4D72:
	cp 001h		;4d72   ; 1: FILE ALREADY EXIT
	jr nz,L_4D7B		;4d74
	ld de,05409h		;4d76
	jr L_4D8C		;4d79
L_4D7B:
	ld de,0541bh		;4d7b   ; de 0xF6 en adelante, uno de la lista de p00:541B (16 bytes cada uno)
	sub 0f6h		;4d7e
	jr z,L_4D8C		;4d80
	ld b,a			;4d82
L_4D83:
	ld a,e			;4d83
	add a,010h		;4d84
	jr nc,L_4D89		;4d86
	inc d			;4d88
L_4D89:
	ld e,a			;4d89
	djnz L_4D83		;4d8a
L_4D8C:
	ld hl,00149h		;4d8c   ; en la fila 10 de la pantalla
	call escribe		;4d8f   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	jp L_4E35		;4d92

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4d95..0x4d9e  (9 bytes)
DATA_4D95:
	defb 079h,00eh,00dh,0cdh,0cbh,04dh,0c3h,035h,04eh	; 4d95  y....M.5N

; ======================================================================
; CODIGO 0x4d9e..0x4db4  (22 bytes)
; ======================================================================


L_4D9E:
	ld hl,04010h		;4d9e   ; busca el otro cartucho: 'Y' en 0x4010 de cada ranura (0x80-0xFF, con subranura)
	ld c,080h		;4da1
	ld b,080h		;4da3
L_4DA5:
	ld a,c			;4da5
	push bc			;4da6
	call 0000ch		;4da7   ; BIOS RDSLT - Reads the value of an address in another slot
	pop bc			;4daa
	cp 059h		;4dab   ; 0x59 = 'Y'
	jr z,$+15		;4dad
	inc c			;4daf   ; la ranura siguiente
	djnz L_4DA5		;4db0
	xor a			;4db2   ; no hay: A = 0
	ret			;4db3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4db4..0x4dbc  (8 bytes)
DATA_4DB4:
	defb 033h,0e0h,033h,0e0h,031h,0e0h,031h,0e0h	; 4db4  3.3.1.1.

; ======================================================================
; CODIGO 0x4dbc..0x4e07  (75 bytes)
; ======================================================================


L_4DBC:
	inc hl			;4dbc   ; y 'Z' en 0x4011
	ld a,c			;4dbd
	ld (0e209h),a		;4dbe   ; la ranura que contesta
	push bc			;4dc1
	call 0000ch		;4dc2   ; BIOS RDSLT - Reads the value of an address in another slot
	pop bc			;4dc5
	cp 05ah		;4dc6   ; 0x5A = 'Z': encontrado (A no es cero)
	jr nz,$-35		;4dc8
	ret			;4dca
L_4DCB:
	push ix		;4dcb   ; la orden C al otro cartucho:
	push iy		;4dcd
	ld h,080h		;4dcf   ; su ranura en 0x8000-0xBFFF
	push bc			;4dd1
	ld a,(0e209h)		;4dd2   ; lee la ranura del otro cartucho (el que contesta Y y Z por RDSLT)
	call 00024h		;4dd5   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop bc			;4dd8
	ld a,(0e203h)		;4dd9   ; lee la copia del banco de 0x8000
	push af			;4ddc
	ld a,004h		;4ddd   ; su banco 4 en 0x8000 (su mapper, 0x8000)...
	ld (08000h),a		;4ddf
	ld de,0c200h		;4de2   ; ...DE = el nombre del fichero (0xC200)...
	ld a,010h		;4de5   ; ...0x10 en su 0xA000...
	ld (0a000h),a		;4de7
	ld a,0ffh		;4dea   ; ...0xFF en 0xB240...
	ld (0b240h),a		;4dec
	call 08000h		;4def   ; ...y su rutina de 0x8000; vuelve con el error en A
	push af			;4df2
	ld a,(0e208h)		;4df3   ; este cartucho otra vez en 0x8000-0xBFFF
	ld h,080h		;4df6
	call 00024h		;4df8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;4dfb
	ld c,a			;4dfc
	pop af			;4dfd   ; y su banco de 0x8000
	call pon_banco_8000		;4dfe   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	ld a,c			;4e01
	pop iy		;4e02
	pop ix		;4e04
	ret			;4e06

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4e07..0x4e18  (17 bytes)
DATA_4E07:
	defb 043h,04fh,04eh,054h,052h,000h,000h,000h,000h,000h,000h,000h,000h,030h,0e0h,012h	; 4e07  CONTR........0..
	defb 000h	; 4e17

; ======================================================================
; CODIGO 0x4e18..0x502b  (531 bytes)
; ======================================================================


L_4E18:
	ld (ix-001h),000h		;4e18   ; fuera de la pausa: el jugador (p03:AE38)...
	call 0ae38h		;4e1c
	push ix		;4e1f
	ld a,(0e19ch)		;4e21   ; ...cada ocho cuadros (0xE19C da la vuelta) p00:5DAC...
	rlca			;4e24
	ld (0e19ch),a		;4e25
	bit 0,a		;4e28
	call nz,L_5DAC		;4e2a
	pop ix		;4e2d
	call L_528A		;4e2f   ; ...los objetos (p00:528A) y los sprites
	call copia_sprites		;4e32   ; copia_sprites: copia y, x y dibujo de las 32 fichas de 0xE300 a la tabla de 0xE100
L_4E35:
	xor a			;4e35   ; el cuadro del juego acabo
	ld (0e093h),a		;4e36
L_4E39:
	ld a,(0e180h)		;4e39   ; sin palanca, 0xE2C6 a cero
	and a			;4e3c
	jr nz,L_4E42		;4e3d
	ld (0e2c6h),a		;4e3f
L_4E42:
	ld a,001h		;4e42
	call pon_banco_6000		;4e44   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	ld hl,0e1c0h		;4e47   ; ocho cuentas de cuadros (0xE1C0-0xE1C7) suben a la vez
	ld b,008h		;4e4a
L_4E4C:
	inc (hl)			;4e4c
	inc hl			;4e4d
	djnz L_4E4C		;4e4e
	ld a,(0e006h)		;4e50   ; en la demostracion, F5 (fila 7, bit 1) calla la musica o la vuelve a poner (0xE080)
	and a			;4e53
	jr z,L_4E89		;4e54
	ld a,(0e007h)		;4e56
	and a			;4e59
	jr nz,L_4E89		;4e5a
	ld a,007h		;4e5c
	call 00141h		;4e5e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;4e61
	jr nz,L_4E85		;4e63
	ld a,(0e081h)		;4e65
	and a			;4e68
	jr nz,L_4E89		;4e69
	inc a			;4e6b
	ld (0e081h),a		;4e6c
	ld a,(0e080h)		;4e6f
	cpl			;4e72
	ld (0e080h),a		;4e73
	and a			;4e76
	jr z,L_4E80		;4e77
	ld a,001h		;4e79
	call pide_sonido		;4e7b   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	jr L_4E89		;4e7e
L_4E80:
	call L_4311		;4e80
	jr L_4E89		;4e83
L_4E85:
	xor a			;4e85
	ld (0e081h),a		;4e86
L_4E89:
	ld a,(0e000h)		;4e89   ; en la demostracion, la palanca de la grabacion (p00:4F82)
	and a			;4e8c
	jp z,L_4F82		;4e8d
	ld a,(0e03fh)		;4e90   ; la pausa solo con la fase en marcha (o recien cargada una partida)
	and a			;4e93
	jr nz,L_4E9C		;4e94
	ld a,(0e094h)		;4e96   ; lee 1 mientras dura la fase
	and a			;4e99
	jr z,L_4EFB		;4e9a
L_4E9C:
	ld a,006h		;4e9c   ; F1 (fila 6, bit 5): la pausa
	call 00141h		;4e9e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 5,a		;4ea1
	jr z,L_4EAB		;4ea3
	xor a			;4ea5   ; suelta: se puede volver a pulsar
	ld (0e06fh),a		;4ea6
	jr L_4EFB		;4ea9
L_4EAB:
	ld a,(0e184h)		;4eab   ; no hay pausa con la fase superada...
	cp 002h		;4eae
	jr z,L_4EFB		;4eb0
	ld a,(0e093h)		;4eb2   ; ...ni a medio cuadro...
	and a			;4eb5
	jr nz,L_4EFB		;4eb6
	ld a,(0e2e0h)		;4eb8
	and a			;4ebb
	jr nz,L_4EFB		;4ebc
	ld a,(0e06fh)		;4ebe   ; ...ni si F1 sigue pulsada desde la vez anterior
	and a			;4ec1
	jr nz,L_4EFB		;4ec2
	inc a			;4ec4
	ld (0e06fh),a		;4ec5
	ld a,(0e207h)		;4ec8   ; la pausa cambia de estado (bit 0 de 0xE207)
	xor 0ffh		;4ecb
	and 001h		;4ecd
	ld (0e207h),a		;4ecf   ; guarda la pausa (bit 0)
	or 080h		;4ed2
	ld (0e2d1h),a		;4ed4
	call pide_sonido		;4ed7   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld a,(0e2d1h)		;4eda   ; en pausa: PAUSE en la pantalla
	cp 081h		;4edd
	jr nz,L_4EF4		;4edf
	ld a,001h		;4ee1
	ld (0e2dfh),a		;4ee3
	call L_50E0		;4ee6
	ld hl,0014eh		;4ee9
	ld de,053e5h		;4eec
	call escribe		;4eef   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	jr L_4EFB		;4ef2
L_4EF4:
	call L_517A		;4ef4   ; fuera de la pausa: se borra el letrero
	xor a			;4ef7
	ld (0e2dfh),a		;4ef8
L_4EFB:
	ld a,(0e000h)		;4efb   ; lee 1 en una partida de verdad, 0 en la demostracion
	and a			;4efe
	jp z,L_4F82		;4eff
	ld a,001h		;4f02   ; el disparo: el boton A del mando 1 (GTTRIG 1)...
	call 000d8h		;4f04   ; BIOS GTTRIG - Returns current trigger status
	push af			;4f07
	ld a,008h		;4f08   ; ...o el espacio (fila 8, bit 0)
	call 00141h		;4f0a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 0,a		;4f0d
	jr z,L_4F14		;4f0f
	xor a			;4f11
	jr L_4F16		;4f12
L_4F14:
	ld a,0ffh		;4f14
L_4F16:
	pop bc			;4f16
	or b			;4f17
	jr z,L_4F21		;4f18
	ld a,(0e061h)		;4f1a   ; el disparo seguido: cada 0x20 cuadros se puede volver a disparar
	and a			;4f1d
	jr nz,L_4F29		;4f1e
	dec a			;4f20
L_4F21:
	ld (0e060h),a		;4f21   ; 0xE060 = 0xFF: disparo nuevo este cuadro
	ld (0e061h),a		;4f24
	jr L_4F38		;4f27
L_4F29:
	ld a,(0e06dh)		;4f29
	inc a			;4f2c
	cp 020h		;4f2d
	jr c,L_4F35		;4f2f
	xor a			;4f31
	ld (0e061h),a		;4f32
L_4F35:
	ld (0e06dh),a		;4f35
L_4F38:
	ld a,003h		;4f38   ; el salto: el boton B (GTTRIG 3)...
	call 000d8h		;4f3a   ; BIOS GTTRIG - Returns current trigger status
	push af			;4f3d
	ld a,004h		;4f3e   ; ...o M o N (fila 4, bits 2 y 3)
	call 00141h		;4f40   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;4f43
	and 00ch		;4f44
	jr nz,L_4F4B		;4f46
	xor a			;4f48
	jr L_4F4D		;4f49
L_4F4B:
	ld a,0ffh		;4f4b
L_4F4D:
	pop bc			;4f4d
	or b			;4f4e
	jr z,L_4F58		;4f4f
	ld a,(0e063h)		;4f51   ; solo cuenta al pulsarlo (0xE063 recuerda que ya estaba)
	and a			;4f54
	jr nz,lee_palanca		;4f55
	dec a			;4f57
L_4F58:
	ld (0e062h),a		;4f58   ; 0xE062 = 0xFF: salto
	ld (0e063h),a		;4f5b
lee_palanca:		; lee las dos palancas (GTSTCK 0 y 1) y deja la direccion en 0xE180
	xor a			;4f5e
	call 000d5h		;4f5f   ; BIOS GTSTCK - Returns the joystick status
	ld (0e181h),a		;4f62   ; guarda la palanca 0 (los cursores)
	ld a,001h		;4f65
	call 000d5h		;4f67   ; BIOS GTSTCK - Returns the joystick status
	ld c,a			;4f6a
	ld a,(0e181h)		;4f6b   ; lee la palanca 0 (los cursores)
	or c			;4f6e   ; las dos palancas juntas; si salen mas de 8 (dos a la vez), ninguna
	cp 009h		;4f6f
	jr c,L_4F74		;4f71
	xor a			;4f73
L_4F74:
	ld (0e180h),a		;4f74   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	ret			;4f77
pon_banco_6000_graficos:		; apunta A en 0xE017 y lo pone en 0x6000
	ld (0e017h),a		;4f78   ; guarda el banco de graficos puesto en 0x6000
pon_banco_6000:		; pone el banco A en 0x6000 (y su copia en 0xE202)
	ld (07000h),a		;4f7b   ; el mapper: pone en 0x6000 el banco de A
	ld (0e202h),a		;4f7e   ; guarda la copia del banco de 0x6000
	ret			;4f81
L_4F82:
	ld a,(0e006h)		;4f82   ; la demostracion: cada 6 cuadros (0xE1C4) un paso de su grabacion
	and a			;4f85
	jr z,L_4FB8		;4f86
	ld a,(0e1c4h)		;4f88
	cp 006h		;4f8b
	jr c,lee_disparo		;4f8d
	xor a			;4f8f
	ld (0e1c4h),a		;4f90
	di			;4f93
	call pon_banco_12		;4f94   ; pon_banco_12: guarda en 0xE2CC el banco de 0x8000 y pone el 12
	ld a,(0e00ah)		;4f97   ; lee los cuadros que le quedan al paso de la demostracion
	and a			;4f9a
	jr nz,L_4FC4		;4f9b
	ld a,002h		;4f9d   ; cada byte de la grabacion vale para dos pasos (una cifra cada uno)
	ld (0e00ah),a		;4f9f   ; guarda los cuadros que le quedan al paso de la demostracion
	ld hl,(0e008h)		;4fa2   ; lee el puntero de la grabacion de la demostracion y el byte siguiente (16 bits)
	ld a,(hl)			;4fa5
	cp 0ffh		;4fa6   ; 0xFF: la grabacion se acabo, y la demostracion con ella
	jr nz,L_4FBD		;4fa8
	ld a,001h		;4faa
	ld (0e183h),a		;4fac   ; guarda sin vidas: se acaba la partida
	xor a			;4faf
	ld (0e094h),a		;4fb0   ; guarda 1 mientras dura la fase
	call devuelve_banco_8000		;4fb3   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	ei			;4fb6
	ret			;4fb7
L_4FB8:
	call lee_disparo		;4fb8   ; lee_disparo: el disparo: GTTRIG(1) o el espacio (fila 8 de SNSMAT), en 0xE066
	jr lee_palanca		;4fbb
L_4FBD:
	ld (0e00bh),a		;4fbd   ; el byte siguiente de la grabacion
	inc hl			;4fc0
	ld (0e008h),hl		;4fc1   ; guarda el puntero de la grabacion de la demostracion y el byte siguiente (16 bits)
L_4FC4:
	ld a,(0e00ah)		;4fc4   ; lee los cuadros que le quedan al paso de la demostracion
	dec a			;4fc7
	ld (0e00ah),a		;4fc8   ; guarda los cuadros que le quedan al paso de la demostracion
	call L_4FF8		;4fcb   ; la cifra de este paso a 0xE180 (p00:4FF8)
	call devuelve_banco_8000		;4fce   ; devuelve_banco_8000: devuelve a 0x8000 el banco guardado en 0xE2CC
	ei			;4fd1
lee_disparo:		; el disparo: GTTRIG(1) o el espacio (fila 8 de SNSMAT), en 0xE066
	ld a,001h		;4fd2   ; el disparo: el boton A del mando 1 o el espacio
	call 000d8h		;4fd4   ; BIOS GTTRIG - Returns current trigger status
	push af			;4fd7
	ld a,008h		;4fd8
	call 00141h		;4fda   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 0,a		;4fdd
	jr z,L_4FE4		;4fdf
	xor a			;4fe1
	jr L_4FE6		;4fe2
L_4FE4:
	ld a,0ffh		;4fe4
L_4FE6:
	pop bc			;4fe6
	or b			;4fe7
	jr z,L_4FF1		;4fe8
	ld a,(0e065h)		;4fea   ; solo al pulsarlo
	and a			;4fed
	jr nz,L_4FF7		;4fee
	dec a			;4ff0
L_4FF1:
	ld (0e066h),a		;4ff1   ; 0xE066 = 0xFF: disparo nuevo
	ld (0e065h),a		;4ff4
L_4FF7:
	ret			;4ff7
L_4FF8:
	and a			;4ff8   ; la cifra alta del byte de la grabacion en el primer paso, la baja en el segundo
	jr z,L_5008		;4ff9
	ld a,(0e00bh)		;4ffb
	srl a		;4ffe
	srl a		;5000
	srl a		;5002
	srl a		;5004
	jr L_500D		;5006
L_5008:
	ld a,(0e00bh)		;5008   ; la cifra del paso: la direccion (bits 0-2)...
	and 00fh		;500b
L_500D:
	cp 008h		;500d   ; ...8 solo: salto
	jr z,L_5025		;500f
	push af			;5011   ; ...sin el bit 3, a la palanca
	res 3,a		;5012
	ld (0e180h),a		;5014   ; guarda la direccion de la palanca (GTSTCK: 1 arriba, 3 derecha, 5 abajo, 7 izquierda)
	pop af			;5017
	bit 3,a		;5018   ; bit 3 a cero: dispara
	jr nz,L_5022		;501a
	ld a,001h		;501c
	ld (0e060h),a		;501e
	ret			;5021
L_5022:
	bit 0,a		;5022   ; bit 3 y bit 0: salta
	ret z			;5024
L_5025:
	ld a,001h		;5025
	ld (0e062h),a		;5027
	ret			;502a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x502b..0x5052  (39 bytes)
DATA_502B:
	defb 017h,011h,01dh,015h,010h,01fh,026h,015h,022h,0ffh,010h,00ah,01bh,01fh,01eh,011h	; 502b  ......&.".......
	defb 01dh,019h,010h,001h,009h,008h,009h,0ffh,020h,025h,023h,018h,010h,023h,020h,011h	; 503b  ........ %#..# .
	defb 013h,015h,010h,01bh,015h,029h,0ffh	; 504b

; ======================================================================
; CODIGO 0x5052..0x521f  (461 bytes)
; ======================================================================


pide_sonido:		; pide el sonido A al motor (p04:6003, con los bancos 4-5)
	di			;5052   ; pide un sonido: guarda los bancos...
	push iy		;5053
	push ix		;5055
	ld c,a			;5057
	ld a,(0e203h)		;5058   ; lee la copia del banco de 0x8000
	push af			;505b
	ld a,(0e202h)		;505c   ; lee la copia del banco de 0x6000
	push af			;505f
	ld a,004h		;5060   ; ...pone el 4 y el 5 (el motor)...
	call pon_banco_6000		;5062   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	inc a			;5065
	call pon_banco_8000		;5066   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	ld a,c			;5069   ; ...el numero, a p04:6003...
	call 06003h		;506a
	pop af			;506d   ; ...y devuelve los bancos
	call pon_banco_6000		;506e   ; pon_banco_6000: pone el banco A en 0x6000 (y su copia en 0xE202)
	pop af			;5071
	call pon_banco_8000		;5072   ; pon_banco_8000: pone el banco A en 0x8000 (y su copia en 0xE203)
	pop ix		;5075
	pop iy		;5077
	ei			;5079
	ret			;507a
orden_vdp:		; manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld hl,0e0d0h		;507b   ; la orden de 0xE0D0, a partir del registro B:
	ld a,(00007h)		;507e
	ld c,a			;5081
	inc c			;5082
	di			;5083
	out (c),b		;5084   ; R#17 = B con autoincremento
	ld a,091h		;5086
	out (c),a		;5088
	ld a,02fh		;508a   ; los registros de B a 46...
	sub b			;508c
	ld b,a			;508d
	inc c			;508e
	inc c			;508f
	otir		;5090   ; ...por el puerto 0x9B
	dec c			;5092
	dec c			;5093
L_5094:
	di			;5094   ; S#2 en R#15 para mirar el VDP...
	ld a,002h		;5095
	out (c),a		;5097
	ld a,08fh		;5099
	out (c),a		;509b
	in a,(c)		;509d   ; ...lo lee...
	push af			;509f
	xor a			;50a0   ; ...y deja otra vez S#0
	out (c),a		;50a1
	ld a,08fh		;50a3
	out (c),a		;50a5
	ld a,(0e2c1h)		;50a7
	and a			;50aa
	jr nz,L_50B4		;50ab
	ld a,(0e2c2h)		;50ad
	and a			;50b0
	jr nz,L_50B4		;50b1
	ei			;50b3
L_50B4:
	pop af			;50b4   ; CE a uno: la orden sigue, se espera
	bit 0,a		;50b5
	jr nz,L_5094		;50b7
	ld a,(0e2c1h)		;50b9
	and a			;50bc
	ret nz			;50bd
	ld a,(0e2c2h)		;50be
	and a			;50c1
	ret nz			;50c2
	ei			;50c3
	ret			;50c4
borra_vram_ff:		; llena de 0xFF los 0x6800 primeros bytes de la VRAM
	ld bc,06800h		;50c5   ; la VRAM 0-0x67FF a 0xFF
	ld a,0ffh		;50c8
	jr L_50D0		;50ca
borra_vram:		; pone a cero los 0x6A00 primeros bytes de la VRAM
	xor a			;50cc   ; la VRAM 0-0x69FF a cero
	ld bc,06a00h		;50cd
L_50D0:
	ld hl,00000h		;50d0
	jp 0016bh		;50d3   ; BIOS BIGFIL - Same function as FILVRM (with 16-bit VRAM-address)
apaga_pantalla:		; apaga la pantalla (DISSCR)
	xor a			;50d6   ; sin pantalla, y 0xE2D3-0xE2D4 a cero
	ld (0e2d3h),a		;50d7
	ld (0e2d4h),a		;50da
	jp 00041h		;50dd   ; BIOS DISSCR - Inhibits the screen display
L_50E0:
	ld a,(0e093h)		;50e0   ; el menu de la pausa, con 0xE093 a 1 mientras se pinta
	push af			;50e3
	ld a,001h		;50e4
	ld (0e093h),a		;50e6
	call L_50F1		;50e9
	pop af			;50ec
	ld (0e093h),a		;50ed
	ret			;50f0
L_50F1:
	call vuelca_sprites		;50f1   ; vuelca_sprites: lleva la tabla de 0xE100 a los atributos de sprite de la VRAM (0x7600)
	push hl			;50f4
	push de			;50f5
	ld a,(0e2dfh)		;50f6   ; la orden que guarda (0xE2DF = 1) o devuelve el trozo de pantalla del menu
	and a			;50f9
	jr z,L_5101		;50fa
	ld hl,05377h		;50fc
	jr L_5104		;50ff
L_5101:
	ld hl,05368h		;5101
L_5104:
	ld de,0e0d0h		;5104   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000fh		;5107
	ldir		;510a
	ld b,020h		;510c
	call orden_vdp		;510e   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld a,(0e2dfh)		;5111   ; al devolverlo no se escribe nada mas
	and a			;5114
	jp nz,L_5177		;5115
	ld hl,05386h		;5118   ; la caja del menu (p00:5386)
	ld de,0e0d0h		;511b   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000bh		;511e
	ldir		;5121
	ld b,024h		;5123
	call orden_vdp		;5125   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld hl,000c4h		;5128   ; NORMAL  GUN
	ld de,053d9h		;512b
	call escribe		;512e   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,00044h		;5131   ; MACHINE GUN: las dos de siempre
	ld de,053c3h		;5134
	call escribe		;5137   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld a,(0e020h)		;513a   ; REAR  GUN desde la fase 3 (la cuarta, HELL FALL)
	cp 003h		;513d
	jr c,L_5163		;513f
	ld hl,00064h		;5141
	ld de,053cfh		;5144
	call escribe		;5147   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld a,(0e020h)		;514a   ; LASER GUN y FIRE GUN desde la 6 (TUNDRA AREA)
	cp 006h		;514d
	jr c,L_5163		;514f
	ld hl,00084h		;5151
	ld de,053afh		;5154
	call escribe		;5157   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
	ld hl,000a4h		;515a
	ld de,053b9h		;515d
	call escribe		;5160   ; escribe: escribe la cadena DE (acaba en 0xFF) en la casilla HL con la letra de la fila 0xD8
L_5163:
	call L_4867		;5163
	ld hl,00042h		;5166   ; el cursor, en la primera arma
	ld a,l			;5169
	ld (0e2c4h),a		;516a
	ld a,00bh		;516d
	call pinta_dibujo		;516f   ; pinta_dibujo: pinta el dibujo A (de la hoja de la fila 0xE01F) en la casilla HL de la pantalla
	ld a,001h		;5172
	ld (0e2c3h),a		;5174
L_5177:
	pop de			;5177
	pop hl			;5178
	ret			;5179
L_517A:
	ld a,(0e093h)		;517a   ; quita el menu de la pausa, con 0xE093 a 1 mientras tanto
	push af			;517d
	ld a,001h		;517e
	ld (0e093h),a		;5180
	push hl			;5183
	push de			;5184
	call L_518F		;5185
	pop de			;5188
	pop hl			;5189
	pop af			;518a
	ld (0e093h),a		;518b
	ret			;518e
L_518F:
	ld hl,05391h		;518f   ; la orden que devuelve el trozo de pantalla guardado (p00:53A0) o lo guarda (p00:5391)
	ld a,(0e2dfh)		;5192
	and a			;5195
	jr nz,L_519B		;5196
	ld hl,053a0h		;5198
L_519B:
	ld de,0e0d0h		;519b   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000fh		;519e
	ldir		;51a1
	ld b,020h		;51a3
	call orden_vdp		;51a5   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld a,(0e2dfh)		;51a8
	and a			;51ab
	ret nz			;51ac
	ld hl,0e2c1h		;51ad   ; y 0xE2C1-0xE2C4 a cero: sin menu
	ld b,004h		;51b0
borra_b:		; pone a cero B bytes desde HL
	ld (hl),000h		;51b2   ; B bytes a cero desde HL
	inc hl			;51b4
	djnz borra_b		;51b5
	ret			;51b7
lee_tabla:		; HL = HL + A y A = (HL)
	add a,l			;51b8   ; HL + A...
	ld l,a			;51b9
	jr nc,L_51BD		;51ba
	inc h			;51bc
L_51BD:
	ld a,(hl)			;51bd   ; ...y A = lo que hay ahi
	ret			;51be
L_51BF:
	ld hl,05330h		;51bf   ; la orden de p00:5330, tres veces...
	ld de,0e0d0h		;51c2   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000dh		;51c5
	ldir		;51c8
	ld b,003h		;51ca
L_51CC:
	push bc			;51cc
	ld b,022h		;51cd
	call orden_vdp		;51cf   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld a,(0e0d4h)		;51d2   ; ...16 puntos mas a la derecha cada vez
	add a,010h		;51d5
	ld (0e0d4h),a		;51d7
	pop bc			;51da
	djnz L_51CC		;51db
	call L_5238		;51dd   ; los dos dibujos de p00:527A y p00:5282 en la VRAM (p00:5238)
	ld b,004h		;51e0   ; y cuatro veces p00:51EA
L_51E2:
	push bc			;51e2
	call L_51EA		;51e3
	pop bc			;51e6
	djnz L_51E2		;51e7
	ret			;51e9
L_51EA:
	push bc			;51ea
	ld hl,05229h		;51eb   ; la orden de p00:5229 con la x y la y de las tablas p00:521F y p00:5224
	ld de,0e0d0h		;51ee   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000fh		;51f1
	ldir		;51f4
	pop bc			;51f6
	ld a,b			;51f7
	ld hl,0521fh		;51f8
	call lee_tabla		;51fb   ; lee_tabla: HL = HL + A y A = (HL)
	ld (0e0d0h),a		;51fe   ; guarda la orden del VDP que se manda (registros 32-46)
	ld a,b			;5201
	ld hl,05224h		;5202
	call lee_tabla		;5205   ; lee_tabla: HL = HL + A y A = (HL)
	ld (0e0d6h),a		;5208
	ld b,00eh		;520b   ; 14 veces, 8 puntos mas a la derecha cada vez
L_520D:
	push bc			;520d
	ld b,020h		;520e
	call orden_vdp		;5210   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ld a,(0e0d4h)		;5213
	add a,008h		;5216
	ld (0e0d4h),a		;5218
	pop bc			;521b
	djnz L_520D		;521c
	ret			;521e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x521f..0x5238  (25 bytes)
DATA_521F:
	defb 000h,000h,008h,008h,000h,000h,0c8h,0d0h,0d8h,0e0h,000h,000h,0c8h,001h,048h,000h	; 521f  ..............H.
	defb 0c8h,001h,008h,000h,008h,000h,000h,000h,098h	; 522f  .........

; ======================================================================
; CODIGO 0x5238..0x527a  (66 bytes)
; ======================================================================


L_5238:
	ld hl,0e400h		;5238   ; dos dibujos de 8 lineas: p00:527A en 0xE400 de la VRAM y p00:5282 en 0xE404
	ld de,0527ah		;523b
	ld b,008h		;523e
	call L_524B		;5240
	ld hl,0e404h		;5243
	ld de,05282h		;5246
	ld b,008h		;5249
L_524B:
	push bc			;524b
	ld a,(de)			;524c   ; cada byte de la tabla son cuatro parejas de bits, cuatro bytes de VRAM:
	ld b,004h		;524d
L_524F:
	push bc			;524f
	push af			;5250
	ld b,a			;5251
	bit 7,b		;5252   ; el bit alto pone el color 10 a la izquierda (0xA0)...
	jr z,L_525A		;5254
	ld a,0a0h		;5256
	jr L_525B		;5258
L_525A:
	xor a			;525a
L_525B:
	bit 6,b		;525b   ; ...y el otro a la derecha (0x0A)
	jr z,L_5261		;525d
	add a,00ah		;525f
L_5261:
	call 00177h		;5261   ; BIOS NWRVRM - Writes to VRAM like in WRTVRM (with 16-bit VRAM-address)
	pop af			;5264
	rlca			;5265
	rlca			;5266
	inc hl			;5267   ; el byte siguiente de la VRAM
	pop bc			;5268
	djnz L_524F		;5269
	ld a,07ch		;526b
	call lee_tabla		;526d   ; lee_tabla: HL = HL + A y A = (HL)
	inc de			;5270
	ld a,(de)			;5271
	pop bc			;5272
	djnz L_524B		;5273
	xor a			;5275
	ld (0e33ch),a		;5276
	ret			;5279

; ----------------------------------------------------------------------
; DATOS sin identificar  0x527a..0x528a  (16 bytes)
DATA_527A:
	defb 000h,000h,082h,06dh,038h,010h,000h,000h,000h,000h,010h,038h,06dh,082h,000h,000h	; 527a  ...m8......8m...

; ======================================================================
; CODIGO 0x528a..0x532c  (162 bytes)
; ======================================================================


L_528A:
	call es_base_3d		;528a   ; solo en las bases 3D, cada 8 cuadros (0xE1C3):
	ret nc			;528d
	ld a,(ix+01ch)		;528e
	and a			;5291
	ret nz			;5292
	ld a,(0e020h)		;5293   ; (en la fase 14 tambien en el primer tramo)
	cp 00eh		;5296
	jr z,L_529F		;5298
	ld a,(0e022h)		;529a   ; lee el tramo: la pantalla de la lista de la fase
	and a			;529d
	ret z			;529e
L_529F:
	ld a,(0e1c3h)		;529f
	cp 008h		;52a2
	ret c			;52a4
	xor a			;52a5
	ld (0e1c3h),a		;52a6
	ld hl,0533dh		;52a9   ; la orden de p00:533D...
	ld de,0e0d0h		;52ac   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld bc,0000dh		;52af
	ldir		;52b2
	ld a,(0e18bh)		;52b4   ; ...con los blancos de la sala por destruir (0xE18B) parpadea (0xE301 a ratos)...
	and a			;52b7
	jr nz,L_52CF		;52b8
	ld a,(ix-015h)		;52ba
	cpl			;52bd
	ld (ix-015h),a		;52be
	and a			;52c1
	jr z,L_52C9		;52c2
	ld hl,0e0d0h		;52c4   ; apunta a la orden del VDP que se manda (registros 32-46)
	ld (hl),0d8h		;52c7
L_52C9:
	ld b,022h		;52c9
	call orden_vdp		;52cb   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	ret			;52ce
L_52CF:
	ld hl,0e0d0h		;52cf   ; ...y destruidos, se queda puesta (0xE8)
	ld (hl),0e8h		;52d2
	ld b,022h		;52d4
	call orden_vdp		;52d6   ; orden_vdp: manda al VDP la orden de 0xE0D0 (registros 32-46) y espera a que acabe
	inc (ix+01ch)		;52d9
	ret			;52dc
L_52DD:
	push hl			;52dd   ; la vida de mas por puntos: con 0xE035 no hay
	push bc			;52de
	push af			;52df
	ld a,(0e035h)		;52e0
	and a			;52e3
	jr nz,L_52F5		;52e4
	ld a,(0e037h)		;52e6   ; la cifra alta de 0xE037 (los puntos)...
	and 0f0h		;52e9
	and a			;52eb
	jr z,L_52F9		;52ec
	cp 050h		;52ee   ; ...cuando pasa a 0 o a 5...
	jr z,L_52F9		;52f0
L_52F2:
	ld (0e00fh),a		;52f2
L_52F5:
	pop af			;52f5
	pop bc			;52f6
	pop hl			;52f7
	ret			;52f8
L_52F9:
	ld b,a			;52f9   ; ...y no es la de la vez anterior (0xE00F la recuerda)...
	ld a,(0e00fh)		;52fa
	cp b			;52fd
	jr z,L_52F2		;52fe
	ld a,b			;5300
	ld (0e00fh),a		;5301
	ld a,(0e021h)		;5304   ; ...una vida mas, hasta 99
	cp 099h		;5307
	jr z,L_52F5		;5309
	add a,001h		;530b
	daa			;530d
	ld (0e021h),a		;530e   ; guarda las vidas que quedan (en BCD)
	ld a,025h		;5311   ; el sonido de la vida de mas, y REST en el marcador
	call pide_sonido		;5313   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	call L_45A1		;5316
	jr L_52F5		;5319
es_base_3d:		; acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	ld a,(0e020h)		;531b   ; la fase en la lista de las bases (p00:532C)?
	ld hl,0532ch		;531e
	ld bc,00004h		;5321
	cpir		;5324
	jr z,L_532A		;5326
	xor a			;5328
	ret			;5329
L_532A:
	scf			;532a
	ret			;532b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x532c..0x54cb  (415 bytes)
DATA_532C:
	defb 001h,004h,00bh,00eh,080h,000h,048h,000h,0c8h,001h,000h,000h,010h,000h,000h,000h	; 532c  ......H.........
	defb 0e0h,0c8h,001h,048h,000h,080h,000h,000h,000h,010h,000h,000h,000h,0e0h,000h,004h	; 533c  ...H............
	defb 002h,000h,000h,002h,001h,000h,001h,000h,001h,000h,000h,000h,000h,002h,002h,002h	; 534c  ................
	defb 004h,004h,004h,004h,002h,004h,004h,002h,002h,004h,002h,004h,000h,000h,000h,000h	; 535c  ................
	defb 000h,000h,080h,001h,080h,000h,048h,000h,000h,000h,0d0h,038h,000h,050h,000h,000h	; 536c  ......H....8.P..
	defb 000h,080h,001h,0a0h,000h,008h,000h,000h,000h,0d0h,000h,000h,000h,000h,080h,000h	; 537c  ................
	defb 048h,000h,0ffh,000h,0c0h,000h,000h,080h,001h,038h,000h,050h,000h,0a0h,000h,008h	; 538c  H........8.P....
	defb 000h,000h,000h,0d0h,000h,000h,080h,001h,000h,000h,000h,000h,080h,000h,048h,000h	; 539c  ..............H.
	defb 000h,000h,0d0h,01ch,011h,023h,015h,022h,010h,017h,025h,01eh,0ffh,016h,019h,022h	; 53ac  .....#."..%...."
	defb 015h,010h,010h,017h,025h,01eh,0ffh,01dh,011h,013h,018h,019h,01eh,015h,010h,017h	; 53bc  ....%...........
	defb 025h,01eh,0ffh,022h,015h,011h,022h,010h,010h,017h,025h,01eh,0ffh,01eh,01fh,022h	; 53cc  %..".."...%...."
	defb 01dh,011h,01ch,010h,010h,017h,025h,01eh,0ffh,020h,011h,025h,023h,015h,0ffh,023h	; 53dc  ......%.. .%#..#
	defb 011h,026h,015h,010h,013h,01fh,01dh,020h,01ch,015h,024h,015h,014h,0ffh,01ch,01fh	; 53ec  .&..... ..$.....
	defb 011h,014h,010h,013h,01fh,01dh,020h,01ch,015h,024h,015h,014h,0ffh,016h,019h,01ch	; 53fc  ...... ..$......
	defb 015h,010h,011h,01ch,022h,015h,011h,014h,029h,010h,015h,028h,019h,024h,0ffh,010h	; 540c  ...."...)..(.$..
	defb 012h,011h,014h,010h,016h,019h,01ch,015h,010h,01eh,011h,01dh,015h,010h,0ffh,010h	; 541c  ................
	defb 016h,019h,01ch,015h,010h,01eh,01fh,024h,010h,016h,01fh,025h,01eh,014h,0ffh,010h	; 542c  .......$...%....
	defb 016h,019h,01ch,015h,010h,01eh,01fh,024h,010h,01fh,020h,015h,01eh,010h,0ffh,010h	; 543c  .......$.. .....
	defb 010h,010h,023h,022h,011h,01dh,010h,016h,025h,01ch,01ch,010h,010h,010h,0ffh,010h	; 544c  ..#"....%.......
	defb 010h,022h,015h,011h,014h,010h,015h,022h,022h,01fh,022h,010h,010h,010h,0ffh,010h	; 545c  ."....."".".....
	defb 010h,027h,022h,019h,024h,015h,010h,015h,022h,022h,01fh,022h,010h,010h,0ffh,010h	; 546c  .'".$...""."....
	defb 010h,01fh,025h,024h,010h,01fh,016h,010h,014h,011h,024h,011h,010h,010h,0ffh,016h	; 547c  ..%$......$.....
	defb 019h,01ch,015h,010h,013h,01ch,01fh,023h,015h,010h,016h,011h,019h,01ch,0ffh,010h	; 548c  .......#........
	defb 010h,025h,01eh,016h,01fh,022h,01dh,011h,024h,015h,014h,010h,010h,010h,0ffh,010h	; 549c  .%..."..$.......
	defb 023h,029h,023h,024h,015h,01dh,010h,015h,022h,022h,01fh,022h,010h,010h,0ffh,010h	; 54ac  #)#$....""."....
	defb 010h,010h,01eh,01fh,010h,015h,022h,022h,01fh,022h,010h,010h,010h,0ffh,0c3h	; 54bc  ......"".".....

; ======================================================================
; CODIGO 0x54cb..0x5509  (62 bytes)
; ======================================================================


L_54CB:
	inc (iy+005h)		;54cb
	call 09a24h		;54ce
	ld bc,0a8ddh		;54d1
	call L_5E15		;54d4
	jp 09f6eh		;54d7
L_54DA:
	ld a,020h		;54da
	jp suma_puntos		;54dc   ; suma_puntos: suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas
L_54DF:
	call es_base_3d		;54df   ; una bala del jugador (IY): en las bases, aparte (p00:58D7)
	jp c,L_58D7		;54e2
	ld a,(iy+005h)		;54e5   ; al salir: su dibujo segun el arma (0xE032, la tabla p00:5519)...
	and a			;54e8
	jp nz,L_55CD		;54e9
	ld a,(0e032h)		;54ec
	ld e,a			;54ef
	ld d,000h		;54f0
	ld hl,05519h		;54f2
	add hl,de			;54f5
	ld a,(hl)			;54f6
	call pide_sonido		;54f7   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	ld (iy+005h),001h		;54fa   ; ...estado 1, dibujo 0x20...
	ld (iy+002h),020h		;54fe   ; el dibujo del objeto (p00:4BBB) = 0x20
	ld e,(iy+004h)		;5502   ; ...y lo propio de cada arma (su tipo - 1, la tabla de detras)
	dec e			;5505
	call 0a041h		;5506   ; despacha_e: salta por la tabla que va detras del call, con el indice en E

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5509..0x5521  (24 bytes)
DATA_5509:
	defb 0cdh,055h,085h,055h,0a0h,055h,026h,055h,021h,055h,02ch,055h,0cdh,055h,0cdh,055h	; 5509  .U.U.U&U!U,U.U.U
	defb 036h,018h,019h,01ah,01bh,01dh,01dh,01dh	; 5519  6.......

; ======================================================================
; CODIGO 0x5521..0x5597  (118 bytes)
; ======================================================================


L_5521:
	ld (iy+00eh),006h		;5521
	ret			;5525
L_5526:
	ld a,008h		;5526   ; 0xE2D0 = 8
	ld (0e2d0h),a		;5528
	ret			;552b
L_552C:
	push ix		;552c   ; una ficha libre para un trozo de bala: las dos de 0xE340 y las cuatro de 0xE4C0
	ld ix,0e340h		;552e
	ld de,00010h		;5532
	call L_5556		;5535
	add ix,de		;5538
	call L_5556		;553a
	ld ix,0e4c0h		;553d
	call L_5556		;5541
	add ix,de		;5544
	call L_5556		;5546
	add ix,de		;5549
	call L_5556		;554b
	add ix,de		;554e
	call L_5556		;5550
	pop ix		;5553
	ret			;5555
L_5556:
	ld a,(ix+004h)		;5556   ; libre (tipo 0): la ocupa con la posicion de IY, tipo 1, estado 2, dibujo 0x20...
	and a			;5559
	ret nz			;555a
	pop hl			;555b
	ld a,(iy+001h)		;555c   ; lee la x del objeto (p00:4BBB)
	ld (ix+001h),a		;555f
	ld a,(iy+000h)		;5562   ; lee la y del objeto (p00:4BBB)
	ld (ix+000h),a		;5565
	ld (ix+004h),001h		;5568
	ld (ix+005h),002h		;556c
	ld (ix+002h),020h		;5570
	ld a,(iy+003h)		;5574   ; ...y la direccion de IY + 4 (de 1 a 8, dando la vuelta)
	add a,004h		;5577
	cp 009h		;5579
	jr c,L_557F		;557b
	res 3,a		;557d
L_557F:
	ld (ix+003h),a		;557f
	pop ix		;5582
	ret			;5584
L_5585:
	ld e,(iy+003h)		;5585   ; el dibujo de la bala segun su direccion (la tabla p00:5597)
	ld d,000h		;5588
	ld hl,05597h		;558a
	add hl,de			;558d
	ld a,(hl)			;558e
	ld (iy+002h),a		;558f   ; guarda el dibujo del objeto (p00:4BBB)
	ld (iy+00eh),000h		;5592
	ret			;5596

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5597..0x55a0  (9 bytes)
DATA_5597:
	defb 040h,038h,03ch,034h,040h,038h,03ch,034h,040h	; 5597  @8<4@8<4@

; ======================================================================
; CODIGO 0x55a0..0x55d4  (52 bytes)
; ======================================================================


L_55A0:
	ld a,(0e301h)		;55a0   ; con el jugador a la izquierda del todo (x < 9), fuera
	cp 009h		;55a3
	jp c,0ba4fh		;55a5
	ld a,00ch		;55a8   ; la bala hacia abajo: 0x0C mas abajo...
	add a,(iy+000h)		;55aa   ; le suma la y del objeto (p00:4BBB)
	ld (iy+000h),a		;55ad   ; guarda la y del objeto (p00:4BBB)
	ld (iy+00ch),000h		;55b0   ; la cuenta del objeto (p02:9915) = 0x00
	ld a,(iy+001h)		;55b4   ; ...y en los bordes, 8 hacia dentro
	cp 010h		;55b7
	jr c,L_55BF		;55b9
	cp 0dah		;55bb
	ret c			;55bd
	ret			;55be
L_55BF:
	ld a,(ix+00fh)		;55bf
	and a			;55c2
	ret z			;55c3
	ld a,008h		;55c4
	add a,(iy+001h)		;55c6   ; le suma la x del objeto (p00:4BBB)
	ld (iy+001h),a		;55c9   ; guarda la x del objeto (p00:4BBB)
	ret			;55cc
L_55CD:
	ld e,(iy+004h)		;55cd   ; cada cuadro, segun el tipo de bala (el arma + 1), la tabla de detras
	dec e			;55d0
	call 0a041h		;55d1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x55d4..0x55e4  (16 bytes)
DATA_55D4:
	defb 021h,057h,044h,056h,0e4h,055h,021h,057h,0e4h,055h,021h,057h,0a2h,057h,01eh,058h	; 55d4  !WDV.U!W.U!W.W.X

; ======================================================================
; CODIGO 0x55e4..0x5634  (80 bytes)
; ======================================================================


L_55E4:
	inc (iy+00ch)		;55e4   ; la bala que serpentea: cada 8 cuadros...
	ld a,(iy+00ch)		;55e7   ; lee la cuenta del objeto (p02:9915)
	and 007h		;55ea
	push af			;55ec
	call z,L_560A		;55ed
	pop af			;55f0
	sla a		;55f1   ; ...su paso de la tabla p00:5634 (x e y de cada uno de los 8)
	ld e,a			;55f3
	ld d,000h		;55f4
	ld hl,05634h		;55f6
	add hl,de			;55f9
	ld a,(hl)			;55fa
	add a,(iy+001h)		;55fb   ; le suma la x del objeto (p00:4BBB)
	ld (iy+001h),a		;55fe   ; guarda la x del objeto (p00:4BBB)
	inc hl			;5601
	ld a,(hl)			;5602
	add a,(iy+000h)		;5603   ; le suma la y del objeto (p00:4BBB)
	ld (iy+000h),a		;5606   ; guarda la y del objeto (p00:4BBB)
	ret			;5609
L_560A:
	call L_573C		;560a   ; avanza dos veces (p00:573C)
	call L_573C		;560d
	ld c,(iy+001h)		;5610   ; fuera de la pantalla por su lado, fuera (p03:BA4F)
	ld a,(iy+003h)		;5613
	cp 001h		;5616
	jp z,L_5721		;5618
	cp 004h		;561b
	jr c,L_562B		;561d
	jp z,L_5721		;561f
	ld a,c			;5622
	cp 0dah		;5623
	jp nc,0ba4fh		;5625
	jp L_5721		;5628
L_562B:
	ld a,c			;562b
	cp 010h		;562c
	jp c,0ba4fh		;562e
	jp L_5721		;5631

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5634..0x5644  (16 bytes)
DATA_5634:
	defb 005h,0fdh,003h,0fbh,0fdh,0fbh,0fbh,0fdh,0fbh,003h,0fdh,005h,003h,005h,005h,003h	; 5634  ................

; ======================================================================
; CODIGO 0x5644..0x570f  (203 bytes)
; ======================================================================


L_5644:
	ld a,(iy+005h)		;5644   ; la que se abre en dos: estado 3, ya partida
	cp 003h		;5647
	jp z,L_5721		;5649
	ld a,(iy+003h)		;564c   ; hacia arriba o hacia abajo, siempre...
	cp 001h		;564f
	jr z,L_5669		;5651
	cp 005h		;5653
	jr z,L_5669		;5655
	jr c,L_5662		;5657
	ld a,(ix+00bh)		;5659   ; ...a los lados, solo con el jugador lejos del borde (x 0x1C-0xD6)
	cp 01ch		;565c
	jr c,L_56A7		;565e
	jr L_5669		;5660
L_5662:
	ld a,(ix+00bh)		;5662
	cp 0d7h		;5665
	jr nc,L_56A7		;5667
L_5669:
	ld a,(iy+005h)		;5669   ; al partirse: una segunda bala en 0xE4C0 desde la de 0xE350 (p00:56E8)...
	inc (iy+005h)		;566c   ; sube el estado del objeto (p03:A03E)
	cp 001h		;566f
	jr z,L_56BE		;5671
	push ix		;5673
	push iy		;5675
	ld iy,0e4c0h		;5677
	ld ix,0e350h		;567b
	ld hl,0570fh		;567f
	call L_56E8		;5682
	jr nc,L_56E0		;5685
	ld a,(ix+002h)		;5687   ; lee el dibujo del sprite
	ld (iy+002h),a		;568a   ; guarda el dibujo del objeto (p00:4BBB)
	ld a,(ix+003h)		;568d
	ld (iy+003h),a		;5690
	pop iy		;5693
	pop ix		;5695
	ld a,003h		;5697   ; ...y las dos avanzan tres pasos
	push iy		;5699
	ld iy,0e340h		;569b
	call L_573C		;569f
	pop iy		;56a2
	jp L_573C		;56a4
L_56A7:
	push iy		;56a7   ; junto al borde: las dos fuera
	ld iy,0e350h		;56a9
	call 0ba4fh		;56ad
	ld iy,0e4c0h		;56b0
	call 0ba4fh		;56b4
	pop iy		;56b7
	ld (iy+005h),003h		;56b9
	ret			;56bd
L_56BE:
	push ix		;56be   ; la primera vez, la de 0xE350 sale de la de 0xE340
	push iy		;56c0
	ld iy,0e350h		;56c2
	ld ix,0e340h		;56c6
	ld hl,0570fh		;56ca
	call L_56E8		;56cd
	jr nc,L_56E0		;56d0
	ld a,(ix+002h)		;56d2   ; lee el dibujo del sprite
	ld (iy+002h),a		;56d5   ; guarda el dibujo del objeto (p00:4BBB)
	ld a,(ix+003h)		;56d8
	ld (iy+003h),a		;56db
	jr L_56E3		;56de
L_56E0:
	call 0ba4fh		;56e0
L_56E3:
	pop iy		;56e3
	pop ix		;56e5
	ret			;56e7
L_56E8:
	ld e,(ix+003h)		;56e8   ; la bala IY a la posicion de IX + la tabla HL por su direccion (si cabe en la pantalla)
	sla e		;56eb
	ld d,000h		;56ed
	add hl,de			;56ef
	ld a,(hl)			;56f0
	add a,(ix+001h)		;56f1
	cp 0f0h		;56f4
	ret nc			;56f6
	ld (iy+001h),a		;56f7   ; guarda la x del objeto (p00:4BBB)
	inc hl			;56fa
	ld a,(hl)			;56fb
	add a,(ix+000h)		;56fc
	cp 0c0h		;56ff
	ret nc			;5701
	ld (iy+000h),a		;5702   ; guarda la y del objeto (p00:4BBB)
	ld (iy+005h),003h		;5705   ; estado 3, tipo 2
	ld (iy+004h),002h		;5709   ; el tipo del objeto (p02:8000, p02:8063) = 0x02
	scf			;570d
	ret			;570e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x570f..0x5721  (18 bytes)
DATA_570F:
	defb 000h,000h,000h,0f0h,010h,0f0h,010h,000h,010h,010h,000h,010h,0f0h,010h,0f0h,000h	; 570f  ................
	defb 0f0h,0f0h	; 571f

; ======================================================================
; CODIGO 0x5721..0x576c  (75 bytes)
; ======================================================================


L_5721:
	call L_573C		;5721   ; avanza; fuera de la pantalla, fuera
	ld a,(iy+000h)		;5724   ; lee la y del objeto (p00:4BBB)
	cp 0b0h		;5727
	jr c,L_572E		;5729
	jp 0ba4fh		;572b
L_572E:
	ld a,(iy+001h)		;572e   ; lee la x del objeto (p00:4BBB)
	cp 005h		;5731
	jp c,0ba4fh		;5733
	cp 0f4h		;5736
	jp nc,0ba4fh		;5738
	ret			;573b
L_573C:
	ld a,(0e034h)		;573c   ; un paso de la bala en su direccion: el paso de la tabla segun la velocidad (0xE034)...
	cp 000h		;573f
	jr z,L_574C		;5741
	cp 001h		;5743
	jr z,L_5751		;5745
	ld hl,0576ch		;5747   ; ...p00:576C, p00:5790 (0) o p00:577E (1)
	jr L_5754		;574a
L_574C:
	ld hl,05790h		;574c
	jr L_5754		;574f
L_5751:
	ld hl,0577eh		;5751
L_5754:
	ld e,(iy+003h)		;5754
	ld d,000h		;5757
	sla e		;5759
	add hl,de			;575b
	ld a,(hl)			;575c
	add a,(iy+001h)		;575d   ; le suma la x del objeto (p00:4BBB)
	ld (iy+001h),a		;5760   ; la x + su paso...
	inc hl			;5763
	ld a,(hl)			;5764   ; ...y la y + el suyo
	add a,(iy+000h)		;5765   ; le suma la y del objeto (p00:4BBB)
	ld (iy+000h),a		;5768   ; guarda la y del objeto (p00:4BBB)
	ret			;576b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x576c..0x57a2  (54 bytes)
DATA_576C:
	defb 000h,000h,000h,0fah,005h,0fbh,006h,000h,005h,005h,000h,006h,0fbh,005h,0fah,000h	; 576c  ................
	defb 0fah,0fah,000h,000h,000h,0fbh,004h,0fch,005h,000h,004h,004h,000h,005h,0fbh,004h	; 577c  ................
	defb 0fch,000h,0fbh,0fbh,000h,000h,000h,0fch,003h,0fdh,004h,000h,003h,003h,000h,004h	; 578c  ................
	defb 0fdh,003h,0fch,000h,0fdh,0fdh	; 579c

; ======================================================================
; CODIGO 0x57a2..0x58f2  (336 bytes)
; ======================================================================


L_57A2:
	ld a,(iy+005h)		;57a2   ; la que se abre en abanico: la primera vez...
	cp 002h		;57a5
	jr z,L_5818		;57a7
	push iy		;57a9
	ld (iy+005h),002h		;57ab   ; ...estado 2 y su direccion entre 32 (la de la bala x 4, menos 2)...
	ld a,(iy+003h)		;57af
	dec a			;57b2
	sla a		;57b3
	sla a		;57b5
	ld (iy+008h),a		;57b7
	dec (iy+008h)		;57ba
	dec (iy+008h)		;57bd
	ld a,(iy+008h)		;57c0
	ld (iy+002h),020h		;57c3   ; ...dibujo 0x20, velocidad 0x0B...
	call paso_de_direccion		;57c7   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,00bh		;57ca
	ld (iy+006h),a		;57cc
	call velocidad		;57cf   ; velocidad: la velocidad A del objeto IY
	ld b,004h		;57d2   ; ...y cuatro balas mas en 0xE4C0 (tipo 7), cada una una direccion mas alla
	ld c,(iy+008h)		;57d4
	inc c			;57d7
	ld de,00010h		;57d8
	ld l,(iy+001h)		;57db   ; lee la x del objeto (p00:4BBB)
	ld h,(iy+000h)		;57de   ; lee la y del objeto (p00:4BBB)
	ld iy,0e4c0h		;57e1
L_57E5:
	push bc			;57e5
	push de			;57e6
	push hl			;57e7
	ld (iy+004h),007h		;57e8   ; el tipo del objeto (p02:8000, p02:8063) = 0x07
	ld (iy+005h),002h		;57ec   ; el estado del objeto (p03:A03E) = 0x02
	ld (iy+002h),020h		;57f0   ; el dibujo del objeto (p00:4BBB) = 0x20
	ld (iy+001h),l		;57f4   ; guarda la x del objeto (p00:4BBB)
	ld (iy+000h),h		;57f7   ; guarda la y del objeto (p00:4BBB)
	ld (iy+00ah),002h		;57fa   ; la y guardada del objeto (p02:9A24) = 0x02
	ld a,c			;57fe
	ld (iy+008h),a		;57ff
	call paso_de_direccion		;5802   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,00bh		;5805
	ld (iy+006h),a		;5807
	call velocidad		;580a   ; velocidad: la velocidad A del objeto IY
	pop hl			;580d
	pop de			;580e
	pop bc			;580f
	inc c			;5810
	add iy,de		;5811
	djnz L_57E5		;5813
	pop iy		;5815
	ret			;5817
L_5818:
	call avanza		;5818   ; avanza: mueve la ficha IY un paso en su direccion
	jp 0a7b9h		;581b   ; dentro_o_fuera: si la ficha IY sale de la pantalla la libera; acarreo si sigue dentro
L_581E:
	ld a,(iy+005h)		;581e   ; el fuego: estado 1, al salir...
	cp 001h		;5821
	jr z,L_5831		;5823
	cp 003h		;5825
	jr z,L_5818		;5827
	dec (iy+00dh)		;5829   ; ...estado 2, cuenta IY+0D hasta que estalla...
	jp nz,L_5818		;582c
	jr L_5854		;582f
L_5831:
	ld (iy+005h),002h		;5831   ; ...su direccion (x 4), velocidad 0x0B, 0x10 cuadros hasta estallar
	ld a,(iy+003h)		;5835
	dec a			;5838
	sla a		;5839
	sla a		;583b
	ld (iy+008h),a		;583d
	call paso_de_direccion		;5840   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,00bh		;5843
	ld (iy+006h),a		;5845
	call velocidad		;5848   ; velocidad: la velocidad A del objeto IY
	ld (iy+00ah),002h		;584b   ; la y guardada del objeto (p02:9A24) = 0x02
	ld (iy+00dh),010h		;584f   ; la segunda cuenta del objeto (p02:9921) = 0x10
	ret			;5853
L_5854:
	push iy		;5854   ; al estallar: dos trozos aqui (tipo 8) y cuatro en 0xE4C0, cada uno 5 direcciones mas alla
	ld c,000h		;5856
	ld de,00010h		;5858
	ld l,(iy+001h)		;585b   ; lee la x del objeto (p00:4BBB)
	ld h,(iy+000h)		;585e   ; lee la y del objeto (p00:4BBB)
	ld b,002h		;5861
L_5863:
	push bc			;5863
	push de			;5864
	push hl			;5865
	ld (iy+004h),008h		;5866   ; el tipo del objeto (p02:8000, p02:8063) = 0x08
	ld (iy+005h),003h		;586a   ; el estado del objeto (p03:A03E) = 0x03
	ld (iy+002h),020h		;586e   ; el dibujo del objeto (p00:4BBB) = 0x20
	ld (iy+001h),l		;5872   ; guarda la x del objeto (p00:4BBB)
	ld (iy+000h),h		;5875   ; guarda la y del objeto (p00:4BBB)
	ld (iy+00ah),003h		;5878   ; la y guardada del objeto (p02:9A24) = 0x03
	ld a,c			;587c
	ld (iy+008h),a		;587d
	call paso_de_direccion		;5880   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,00bh		;5883
	ld (iy+006h),a		;5885
	call velocidad		;5888   ; velocidad: la velocidad A del objeto IY
	pop hl			;588b
	pop de			;588c
	pop bc			;588d
	ld a,005h		;588e
	add a,c			;5890
	ld c,a			;5891
	add iy,de		;5892
	djnz L_5863		;5894
	ld b,004h		;5896
	ld iy,0e4c0h		;5898
L_589C:
	push bc			;589c
	push de			;589d
	push hl			;589e
	ld (iy+004h),008h		;589f   ; el tipo del objeto (p02:8000, p02:8063) = 0x08
	ld (iy+005h),003h		;58a3   ; el estado del objeto (p03:A03E) = 0x03
	ld (iy+002h),020h		;58a7   ; el dibujo del objeto (p00:4BBB) = 0x20
	ld (iy+001h),l		;58ab   ; guarda la x del objeto (p00:4BBB)
	ld (iy+000h),h		;58ae   ; guarda la y del objeto (p00:4BBB)
	ld (iy+00ah),003h		;58b1   ; la y guardada del objeto (p02:9A24) = 0x03
	ld a,c			;58b5
	ld (iy+008h),a		;58b6
	call paso_de_direccion		;58b9   ; paso_de_direccion: el paso en x y en y de la direccion IY+8 (32 direcciones)
	ld a,00bh		;58bc
	ld (iy+006h),a		;58be
	call velocidad		;58c1   ; velocidad: la velocidad A del objeto IY
	pop hl			;58c4
	pop de			;58c5
	pop bc			;58c6
	ld a,005h		;58c7
	add a,c			;58c9
	ld c,a			;58ca
	add iy,de		;58cb
	djnz L_589C		;58cd
	ld a,01fh		;58cf   ; el sonido 0x1F
	call pide_sonido		;58d1   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
	pop iy		;58d4
	ret			;58d6
L_58D7:
	ld a,(iy+005h)		;58d7   ; la bala en las bases: al salir, el sonido 0x36 y dibujo 0x20
	and a			;58da
	jr nz,L_58E2		;58db
	ld a,036h		;58dd
	call pide_sonido		;58df   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)
L_58E2:
	ld (iy+002h),020h		;58e2   ; el dibujo del objeto (p00:4BBB) = 0x20
	ld a,(iy+005h)		;58e6   ; lee el estado del objeto (p03:A03E)
	and a			;58e9
	jr nz,$+14		;58ea
	inc (iy+005h)		;58ec   ; sube el estado del objeto (p03:A03E)
	jp L_5526		;58ef

; ----------------------------------------------------------------------
; DATOS sin identificar  0x58f2..0x58f8  (6 bytes)
DATA_58F2:
	defb 03eh,003h,032h,0d0h,0e2h,0c9h	; 58f2

; ======================================================================
; CODIGO 0x58f8..0x597b  (131 bytes)
; ======================================================================


L_58F8:
	ld a,(iy+00eh)		;58f8   ; hacia el fondo: su paso en x hacia el centro (p00:596A)...
	cp 002h		;58fb
	jr z,L_5939		;58fd
	ld (iy+00eh),002h		;58ff
	ld a,(iy+001h)		;5903   ; lee la x del objeto (p00:4BBB)
	sub 030h		;5906
	call L_596A		;5908
	ld (iy+007h),e		;590b
	ld (iy+009h),d		;590e
	ld a,(0e180h)		;5911   ; ...y en y segun la palanca (arriba en diagonal o recto, p00:5965 o p00:596A)
	cp 001h		;5914
	jr z,L_5928		;5916
	cp 002h		;5918
	jr z,L_5928		;591a
	cp 008h		;591c
	jr z,L_5928		;591e
	ld a,(iy+000h)		;5920   ; lee la y del objeto (p00:4BBB)
	call L_596A		;5923
	jr L_592E		;5926
L_5928:
	ld a,(iy+000h)		;5928   ; lee la y del objeto (p00:4BBB)
	call L_5965		;592b
L_592E:
	ld (iy+008h),e		;592e
	ld (iy+00ah),d		;5931   ; guarda la y guardada del objeto (p02:9A24)
	ld (iy+00bh),028h		;5934   ; 0x28 pasos
	ret			;5938
L_5939:
	call L_593C		;5939   ; dos pasos por cuadro (p00:593C)
L_593C:
	ld a,(iy+002h)		;593c   ; sin dibujo, nada; al acabar los pasos, fuera
	and a			;593f
	ret z			;5940
	dec (iy+00bh)		;5941   ; baja la x guardada del objeto (p02:9A24)
	jp z,0ba4fh		;5944
	rlc (iy+007h)		;5947   ; en x y en y, un paso cuando le toca a su mascara de bits (IY+7, IY+8)
	jr nc,L_5956		;594b
	ld a,(iy+009h)		;594d
	add a,(iy+001h)		;5950   ; le suma la x del objeto (p00:4BBB)
	ld (iy+001h),a		;5953   ; guarda la x del objeto (p00:4BBB)
L_5956:
	rlc (iy+008h)		;5956
	ret nc			;595a
	ld a,(iy+00ah)		;595b   ; lee la y guardada del objeto (p02:9A24)
	add a,(iy+000h)		;595e   ; le suma la y del objeto (p00:4BBB)
	ld (iy+000h),a		;5961   ; guarda la y del objeto (p00:4BBB)
	ret			;5964
L_5965:
	ld hl,05a36h		;5965   ; la mascara y el paso de la tabla p00:5A36...
	jr L_596D		;5968
L_596A:
	ld hl,05a12h		;596a   ; ...o de p00:5A12, por A / 4
L_596D:
	srl a		;596d
	srl a		;596f
	and 0feh		;5971
	ld e,a			;5973
	ld d,000h		;5974
	add hl,de			;5976
	ld e,(hl)			;5977
	inc hl			;5978
	ld d,(hl)			;5979
	ret			;597a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x597b..0x5a5a  (223 bytes)
DATA_597B:
	defb 0fdh,07eh,00eh,0feh,001h,028h,042h,0fdh,036h,00eh,001h,0fdh,036h,00bh,029h,03eh	; 597b  .~...(B.6...6.)>
	defb 0f8h,0fdh,086h,000h,0fdh,077h,000h,0fdh,07eh,001h,0d6h,030h,0cdh,06ah,059h,0fdh	; 598b  .....w..~..0.jY.
	defb 073h,007h,0fdh,072h,009h,03ah,080h,0e1h,0feh,001h,028h,010h,0feh,002h,028h,00ch	; 599b  s..r.:....(...(.
	defb 0feh,008h,028h,008h,0fdh,07eh,000h,0cdh,06ah,059h,018h,006h,0fdh,07eh,000h,0cdh	; 59ab  ..(..~..jY...~..
	defb 065h,059h,0fdh,073h,008h,0fdh,072h,00ah,0c9h,0fdh,034h,00ch,0fdh,07eh,00ch,0e6h	; 59bb  eY.s..r...4..~..
	defb 007h,0f5h,0cch,0eah,059h,0f1h,0cbh,027h,05fh,016h,000h,021h,002h,05ah,019h,07eh	; 59cb  ....Y..'_..!.Z.~
	defb 0fdh,086h,001h,0fdh,077h,001h,023h,07eh,0fdh,086h,000h,0fdh,077h,000h,0c9h,0cdh	; 59db  ....w.#~....w...
	defb 03ch,059h,0cdh,03ch,059h,0cdh,03ch,059h,0cdh,03ch,059h,0cdh,03ch,059h,0cdh,03ch	; 59eb  <Y.<Y.<Y.<Y.<Y.<
	defb 059h,0cdh,03ch,059h,0c3h,03ch,059h,005h,0fdh,003h,0fbh,0fdh,0fbh,0fbh,0fdh,0fbh	; 59fb  Y.<Y.<Y.........
	defb 003h,0fdh,005h,003h,005h,005h,003h,0ffh,001h,07fh,001h,077h,001h,06dh,001h,055h	; 5a0b  ...........w.m.U
	defb 001h,092h,001h,088h,001h,080h,001h,000h,001h,000h,0ffh,080h,0ffh,088h,0ffh,092h	; 5a1b  ................
	defb 0ffh,055h,0ffh,06dh,0ffh,077h,0ffh,07fh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,080h	; 5a2b  .U.m.w..........
	defb 0ffh,088h,0ffh,092h,0ffh,055h,0ffh,06dh,0ffh,077h,0ffh,07fh,0ffh,0aah,0feh,0aah	; 5a3b  .....U.m.w......
	defb 0feh,0dah,0feh,0dah,0feh,0eeh,0feh,0eeh,0feh,07fh,0feh,0ffh,0feh,0ffh,0feh	; 5a4b  ...............

; ======================================================================
; CODIGO 0x5a5a..0x5ae8  (142 bytes)
; ======================================================================


toca_al_jugador_2:		; como p00:5A68 con otro dano
	ld a,006h		;5a5a
	ld (0e2d1h),a		;5a5c
	jr L_5A6D		;5a5f
L_5A61:
	ld a,008h		;5a61
	ld (0e2d1h),a		;5a63
	jr L_5A6D		;5a66
toca_al_jugador:		; acarreo si la caja HL de la ficha IY toca al jugador (y le quita energia)
	ld a,004h		;5a68
	ld (0e2d1h),a		;5a6a
L_5A6D:
	ld a,(0e5c2h)		;5a6d   ; el jugador tocado: no con 0xE5C2...
	and a			;5a70
	jr z,L_5A75		;5a71
	xor a			;5a73
	ret			;5a74
L_5A75:
	push hl			;5a75
	call es_base_3d		;5a76   ; ...ni saltando en las bases
	pop hl			;5a79
	jr nc,L_5A84		;5a7a
	ld a,(ix+006h)		;5a7c
	and a			;5a7f
	jr z,L_5A84		;5a80
	xor a			;5a82
	ret			;5a83
L_5A84:
	ld a,(ix+00ch)		;5a84   ; su caja segun la postura: agachado (0x12), tumbado (0x0D), en el agua (0xE326) o de pie
	cp 00dh		;5a87
	jr z,L_5A9F		;5a89
	cp 012h		;5a8b
	jr z,L_5A9A		;5a8d
	ld a,(0e326h)		;5a8f
	and a			;5a92
	jr nz,L_5AA4		;5a93
	ld de,05ae8h		;5a95
	jr L_5AA7		;5a98
L_5A9A:
	ld de,05af0h		;5a9a
	jr L_5AA7		;5a9d
L_5A9F:
	ld de,05af4h		;5a9f
	jr L_5AA7		;5aa2
L_5AA4:
	ld de,05aech		;5aa4
L_5AA7:
	call se_tocan		;5aa7   ; si se tocan (p00:5BD5)...
	ret nc			;5aaa
	ld a,(ix-002h)		;5aab   ; ...y no parpadea, ni 0xE30F, ni esta ya golpeado...
	and a			;5aae
	ret nz			;5aaf
	ld a,(0e30fh)		;5ab0
	and a			;5ab3
	ret nz			;5ab4
	ld a,(ix-006h)		;5ab5
	and a			;5ab8
	ret nz			;5ab9
	ld (ix-006h),040h		;5aba   ; ...el golpe: 0x40 cuadros, el empujon hacia el lado B...
	ld (ix-005h),b		;5abe
	ld a,(0e2d1h)		;5ac1   ; ...el dano de 0xE2D1 a 0xE025...
	ld (0e025h),a		;5ac4
	ld a,026h		;5ac7   ; ...y el sonido 0x26
	call pide_si_banco_14		;5ac9   ; pide_si_banco_14: con el banco 14 en 0x6000 apunta el sonido A en 0xE2D2; si no, lo pide
	scf			;5acc
	ret			;5acd
L_5ACE:
	ld a,(0e5c2h)		;5ace   ; lo toca algo que se coge? la caja del jugador de pie (o en el agua)
	and a			;5ad1
	jr z,L_5AD6		;5ad2
	xor a			;5ad4
	ret			;5ad5
L_5AD6:
	ld a,(0e326h)		;5ad6
	and a			;5ad9
	jr nz,L_5AE1		;5ada
	ld de,05ae8h		;5adc
	jr L_5AE4		;5adf
L_5AE1:
	ld de,05aech		;5ae1
L_5AE4:
	call se_tocan		;5ae4   ; se_tocan: acarreo si la caja HL de la ficha IY y la caja DE de la ficha IX se tocan (B: el lado)
	ret			;5ae7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5ae8..0x5af8  (16 bytes)
DATA_5AE8:
	defb 009h,01ah,004h,009h,010h,010h,004h,008h,00ah,007h,003h,016h,00ah,007h,0f1h,016h	; 5ae8  ................

; ======================================================================
; CODIGO 0x5af8..0x5b9d  (165 bytes)
; ======================================================================


le_da_un_disparo:		; acarreo si un disparo del jugador (0xE340 y siguientes) toca la caja HL de la ficha IY
	ld a,(0e18bh)		;5af8   ; le da un disparo del jugador: con blancos en la sala vivos no
	and a			;5afb
	jr z,L_5B00		;5afc
	scf			;5afe
	ret			;5aff
L_5B00:
	push ix		;5b00   ; las dos balas de 0xE340...
	ld b,002h		;5b02
	ld ix,0e340h		;5b04
	ld de,05bd1h		;5b08
L_5B0B:
	push bc			;5b0b
	call L_5BA1		;5b0c
	jr c,L_5B32		;5b0f
	ld bc,00010h		;5b11
	add ix,bc		;5b14
	pop bc			;5b16
	djnz L_5B0B		;5b17
	xor a			;5b19   ; ...y las cuatro de 0xE4C0
	ld b,004h		;5b1a
	ld ix,0e4c0h		;5b1c
L_5B20:
	push bc			;5b20
	call L_5BA1		;5b21
	jr c,L_5B32		;5b24
	ld bc,00010h		;5b26
	add ix,bc		;5b29
	pop bc			;5b2b
	djnz L_5B20		;5b2c
	xor a			;5b2e
	pop ix		;5b2f
	ret			;5b31
L_5B32:
	push iy		;5b32   ; le ha dado: si el objeto no es de 0xE500 y la bala es de las que atraviesan (tipos 2 y 3), sigue
	pop hl			;5b34
	ld a,h			;5b35
	cp 0e5h		;5b36
	jr z,L_5B45		;5b38
	ld a,(ix+004h)		;5b3a
	cp 002h		;5b3d
	jr z,L_5B87		;5b3f
	cp 003h		;5b41
	jr z,L_5B87		;5b43
L_5B45:
	ld c,(ix+001h)		;5b45   ; la bala desaparece...
	ld b,(ix+000h)		;5b48
	push ix		;5b4b
	push bc			;5b4d
	ld (ix+001h),0ech		;5b4e
	ld (ix+000h),0ech		;5b52
	ld (ix+004h),000h		;5b56
	call 08479h		;5b5a   ; busca_una: IX = una ficha libre de 0xE380 (de 19); acarreo si no hay
	pop bc			;5b5d
	jr c,L_5B85		;5b5e
	ld (ix+001h),c		;5b60   ; ...y en su sitio un destello (tipo 0x2B, dibujo 0x10)...
	ld (ix+000h),b		;5b63
	ld (ix+004h),02bh		;5b66
	ld (ix+002h),010h		;5b6a
	ld (ix+005h),000h		;5b6e
	push iy		;5b72
	push ix		;5b74
	pop iy		;5b76
	ld bc,05b9dh		;5b78   ; ...con sus colores, y el sonido 0x2F
	call colores_ficha		;5b7b   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	pop iy		;5b7e
	ld a,02fh		;5b80
	call pide_si_banco_14		;5b82   ; pide_si_banco_14: con el banco 14 en 0x6000 apunta el sonido A en 0xE2D2; si no, lo pide
L_5B85:
	pop ix		;5b85
L_5B87:
	pop bc			;5b87
	pop ix		;5b88
	scf			;5b8a
	ret			;5b8b
pide_si_banco_14:		; con el banco 14 en 0x6000 apunta el sonido A en 0xE2D2; si no, lo pide
	push af			;5b8c   ; el sonido A: con el banco 14 puesto se deja en 0xE2D2 para luego
	ld a,(0e202h)		;5b8d   ; lee la copia del banco de 0x6000
	cp 00eh		;5b90
	jr nz,L_5B99		;5b92
	pop af			;5b94
	ld (0e2d2h),a		;5b95
	ret			;5b98
L_5B99:
	pop af			;5b99
	jp pide_sonido		;5b9a   ; pide_sonido: pide el sonido A al motor (p04:6003, con los bancos 4-5)

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5b9d..0x5ba1  (4 bytes)
DATA_5B9D:
	defb 00ah,00ah,00fh,00fh	; 5b9d

; ======================================================================
; CODIGO 0x5ba1..0x5bd1  (48 bytes)
; ======================================================================


L_5BA1:
	ld a,(ix+004h)		;5ba1   ; la bala IX contra la caja HL: libre no
	and a			;5ba4
	ret z			;5ba5
	push hl			;5ba6
	push iy		;5ba7
	pop hl			;5ba9
	ld a,h			;5baa
	pop hl			;5bab
	cp 0e5h		;5bac
	jr z,L_5BC3		;5bae
	ld a,(iy+004h)		;5bb0   ; las del tipo 5 solo con IX+0D
	cp 005h		;5bb3
	jr nz,L_5BBC		;5bb5
	ld a,(ix+00dh)		;5bb7
	and a			;5bba
	ret z			;5bbb
L_5BBC:
	ld a,(iy+004h)		;5bbc
	cp 005h		;5bbf
	jr z,L_5BC9		;5bc1
L_5BC3:
	ld a,(ix+00bh)		;5bc3   ; las de los objetos de 0xE500, solo las primeras 4 de vida (IX+0B)
	cp 004h		;5bc6
	ret nc			;5bc8
L_5BC9:
	push hl			;5bc9
	push de			;5bca
	call se_tocan		;5bcb   ; se_tocan: acarreo si la caja HL de la ficha IY y la caja DE de la ficha IX se tocan (B: el lado)
	pop de			;5bce
	pop hl			;5bcf
	ret			;5bd0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5bd1..0x5bd5  (4 bytes)
DATA_5BD1:
	defb 006h,004h,006h,004h	; 5bd1

; ======================================================================
; CODIGO 0x5bd5..0x5c27  (82 bytes)
; ======================================================================


se_tocan:		; acarreo si la caja HL de la ficha IY y la caja DE de la ficha IX se tocan (B: el lado)
	ld a,(hl)			;5bd5   ; las dos cajas: (dy, alto, dx, ancho) de HL para IY y de DE para IX...
	add a,(iy+000h)		;5bd6
	ld b,a			;5bd9
	ld a,(de)			;5bda   ; ...se tocan en y?...
	add a,(ix+000h)		;5bdb
	sub b			;5bde
	jr nc,L_5BF0		;5bdf
	ld c,b			;5be1
	ld a,(de)			;5be2
	add a,(ix+000h)		;5be3
	ld b,a			;5be6
	ld a,c			;5be7
	sub b			;5be8
	inc hl			;5be9
	inc de			;5bea
	cp (hl)			;5beb
	jr c,L_5BF9		;5bec
	xor a			;5bee
	ret			;5bef
L_5BF0:
	ex de,hl			;5bf0
	inc hl			;5bf1
	inc de			;5bf2
	cp (hl)			;5bf3
	ex de,hl			;5bf4
	jr c,L_5BF9		;5bf5
	xor a			;5bf7
	ret			;5bf8
L_5BF9:
	inc hl			;5bf9   ; ...y en x?
	inc de			;5bfa
	ld a,(de)			;5bfb
	add a,(ix+001h)		;5bfc
	ld b,a			;5bff
	ld a,(hl)			;5c00
	add a,(iy+001h)		;5c01
	sub b			;5c04
	jr nc,L_5C14		;5c05
	ld c,b			;5c07
	ld a,(hl)			;5c08
	add a,(iy+001h)		;5c09
	ld b,a			;5c0c
	ld a,c			;5c0d
	sub b			;5c0e
	inc hl			;5c0f
	cp (hl)			;5c10
	ld b,003h		;5c11   ; B = 3: tocado desde la izquierda; B = 7 desde la derecha
	ret			;5c13
L_5C14:
	ex de,hl			;5c14
	inc hl			;5c15
	cp (hl)			;5c16
	ld b,007h		;5c17
	ret			;5c19
L_5C1A:
	call hacia_el_jugador		;5c1a   ; hacia_el_jugador: A = la direccion desde la ficha IY hasta el jugador
	ld b,a			;5c1d   ; A = la tabla p00:5C27 (A)
	ld e,a			;5c1e
	ld d,000h		;5c1f
	ld hl,05c27h		;5c21
	add hl,de			;5c24
	ld a,(hl)			;5c25
	ret			;5c26

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5c27..0x5c48  (33 bytes)
DATA_5C27:
	defb 000h,000h,000h,001h,001h,001h,001h,002h,002h,002h,003h,003h,003h,003h,004h,004h	; 5c27  ................
	defb 004h,004h,004h,005h,005h,005h,005h,006h,006h,006h,007h,007h,007h,007h,000h,000h	; 5c37  ................
	defb 000h	; 5c47

; ======================================================================
; CODIGO 0x5c48..0x5c8f  (71 bytes)
; ======================================================================


L_5C48:
	ld a,c			;5c48   ; B = 1 si la direccion C es de las cuatro rectas
	and 003h		;5c49
	jr z,L_5C50		;5c4b
	ld b,000h		;5c4d
	ret			;5c4f
L_5C50:
	ld b,001h		;5c50
	ret			;5c52
avanza:		; mueve la ficha IY un paso en su direccion
	bit 7,(iy+006h)		;5c53   ; avanza: con velocidad negativa, un paso cada vez que toca la mascara (IY+7)...
	jr z,L_5C61		;5c57
L_5C59:
	rrc (iy+007h)		;5c59
	ret nc			;5c5d
	jp un_paso		;5c5e   ; un_paso: mueve la ficha IY un punto en su direccion (IY+8, 32 direcciones, la tabla p00:5D0D)
L_5C61:
	ld a,(iy+006h)		;5c61   ; ...con positiva, tantos pasos como diga p00:5C96
	ld e,a			;5c64
	ld d,000h		;5c65
	ld hl,05c96h		;5c67
	add hl,de			;5c6a
	ld b,(hl)			;5c6b
L_5C6C:
	push bc			;5c6c
	call un_paso		;5c6d   ; un_paso: mueve la ficha IY un punto en su direccion (IY+8, 32 direcciones, la tabla p00:5D0D)
	pop bc			;5c70
	djnz L_5C6C		;5c71
	jr L_5C59		;5c73
velocidad:		; la velocidad A del objeto IY
	ld (iy+006h),a		;5c75   ; la velocidad A (IY+6) y su mascara de pasos (p00:5C8F o p00:5CA6)
	bit 7,a		;5c78
	jr z,L_5C83		;5c7a
	neg		;5c7c
	ld hl,05c8fh		;5c7e
	jr L_5C86		;5c81
L_5C83:
	ld hl,05ca6h		;5c83
L_5C86:
	ld e,a			;5c86
	ld d,000h		;5c87
	add hl,de			;5c89
	ld a,(hl)			;5c8a
	ld (iy+007h),a		;5c8b
	ret			;5c8e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5c8f..0x5cb6  (39 bytes)
DATA_5C8F:
	defb 0eeh,0dah,0aah,092h,088h,020h,000h,001h,001h,001h,001h,002h,002h,002h,003h,003h	; 5c8f  ..... ..........
	defb 004h,005h,006h,008h,00ah,00ch,00eh,000h,088h,092h,0aah,000h,092h,0aah,000h,092h	; 5c9f  ................
	defb 0aah,000h,000h,000h,000h,000h,000h	; 5caf

; ======================================================================
; CODIGO 0x5cb6..0x5cc4  (14 bytes)
; ======================================================================


paso_de_direccion:		; el paso en x y en y de la direccion IY+8 (32 direcciones)
	and 007h		;5cb6   ; la mascara del paso en la otra coordenada (p00:5CC4, por la direccion)
	ld hl,05cc4h		;5cb8
	ld e,a			;5cbb
	ld d,000h		;5cbc
	add hl,de			;5cbe
	ld a,(hl)			;5cbf
	ld (iy+009h),a		;5cc0
	ret			;5cc3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5cc4..0x5ccc  (8 bytes)
DATA_5CC4:
	defb 000h,088h,055h,077h,0ffh,077h,055h,088h	; 5cc4  ..Uw.wU.

; ======================================================================
; CODIGO 0x5ccc..0x5d0d  (65 bytes)
; ======================================================================


un_paso:		; mueve la ficha IY un punto en su direccion (IY+8, 32 direcciones, la tabla p00:5D0D)
	ld a,(iy+008h)		;5ccc   ; un paso: la direccion (IY+8, 32) elige en p00:5D0D el paso en y y en x...
	and 01ch		;5ccf
	ld e,a			;5cd1
	ld d,000h		;5cd2
	srl e		;5cd4
	ld hl,05d0dh		;5cd6
	add hl,de			;5cd9
	ld d,(hl)			;5cda
	inc hl			;5cdb
	ld e,(hl)			;5cdc
	and 00ch		;5cdd   ; ...las direcciones casi horizontales mueven la x siempre y la y segun la mascara...
	jr z,L_5CF9		;5cdf
	cp 00ch		;5ce1
	jr z,L_5CF9		;5ce3
	ld a,(iy+001h)		;5ce5
	add a,e			;5ce8
	ld (iy+001h),a		;5ce9
	rrc (iy+009h)		;5cec
	ret nc			;5cf0
	ld a,(iy+000h)		;5cf1
	add a,d			;5cf4
	ld (iy+000h),a		;5cf5
	ret			;5cf8
L_5CF9:
	ld a,(iy+000h)		;5cf9   ; ...las casi verticales, al reves
	add a,d			;5cfc
	ld (iy+000h),a		;5cfd
	rrc (iy+009h)		;5d00
	ret nc			;5d04
	ld a,(iy+001h)		;5d05
	add a,e			;5d08
	ld (iy+001h),a		;5d09
	ret			;5d0c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5d0d..0x5d1d  (16 bytes)
DATA_5D0D:
	defb 0ffh,001h,0ffh,001h,001h,001h,001h,001h,001h,0ffh,001h,0ffh,0ffh,0ffh,0ffh,0ffh	; 5d0d  ................

; ======================================================================
; CODIGO 0x5d1d..0x5eb0  (403 bytes)
; ======================================================================


hacia_el_jugador:		; A = la direccion desde la ficha IY hasta el jugador
	call L_5D48		;5d1d   ; la direccion (de 32) desde IY hacia IX: el octante (p00:5D48)...
	srl b		;5d20   ; ...y dentro de el, cuanto se aparta (de 0 a 4, por la razon entre los lados)
	srl b		;5d22
	srl b		;5d24
	ld a,c			;5d26
	ld c,000h		;5d27
	sub b			;5d29
	jr c,L_5D3B		;5d2a
	inc c			;5d2c
	sla b		;5d2d
	sub b			;5d2f
	jr c,L_5D3B		;5d30
	inc c			;5d32
	sub b			;5d33
	jr c,L_5D3B		;5d34
	inc c			;5d36
	sub b			;5d37
	jr c,L_5D3B		;5d38
	inc c			;5d3a
L_5D3B:
	bit 0,l		;5d3b   ; ...sumado o restado segun el octante
	jr z,L_5D43		;5d3d
	ld a,h			;5d3f
	sub c			;5d40
	ld c,a			;5d41
	ret			;5d42
L_5D43:
	ld a,h			;5d43
	add a,c			;5d44
	ld b,a			;5d45
	ld c,a			;5d46
	ret			;5d47
L_5D48:
	ld a,(iy+000h)		;5d48   ; el octante: las diferencias en y (B) y en x (C), el mayor en B, y H la direccion base, L el sentido
	sub (ix+000h)		;5d4b
	jr c,L_5D7B		;5d4e
	ld b,a			;5d50
	ld a,(iy+001h)		;5d51
	sub (ix+001h)		;5d54
	jr c,L_5D67		;5d57
	ld c,a			;5d59
	cp b			;5d5a
	jr c,L_5D63		;5d5b
	ld hl,01806h		;5d5d
	ld c,b			;5d60
	ld b,a			;5d61
	ret			;5d62
L_5D63:
	ld hl,02007h		;5d63
	ret			;5d66
L_5D67:
	ld a,(ix+001h)		;5d67
	sub (iy+001h)		;5d6a
	ld c,a			;5d6d
	cp b			;5d6e
	jr c,L_5D77		;5d6f
	ld hl,00801h		;5d71
	ld c,b			;5d74
	ld b,a			;5d75
	ret			;5d76
L_5D77:
	ld hl,00000h		;5d77
	ret			;5d7a
L_5D7B:
	ld a,(ix+000h)		;5d7b
	sub (iy+000h)		;5d7e
	ld b,a			;5d81
	ld a,(iy+001h)		;5d82
	sub (ix+001h)		;5d85
	jr c,L_5D98		;5d88
	ld c,a			;5d8a
	cp b			;5d8b
	jr c,L_5D94		;5d8c
	ld hl,01805h		;5d8e
	ld c,b			;5d91
	ld b,a			;5d92
	ret			;5d93
L_5D94:
	ld hl,01004h		;5d94
	ret			;5d97
L_5D98:
	ld a,(ix+001h)		;5d98
	sub (iy+001h)		;5d9b
	ld c,a			;5d9e
	cp b			;5d9f
	jr c,L_5DA8		;5da0
	ld hl,00802h		;5da2
	ld c,b			;5da5
	ld b,a			;5da6
	ret			;5da7
L_5DA8:
	ld hl,01003h		;5da8
	ret			;5dab
L_5DAC:
	ld a,(0e282h)		;5dac   ; cada ocho cuadros: con el arma 3 (o cualquiera en las bases) el disparo seguido...
	and a			;5daf
	ret nz			;5db0
	call es_base_3d		;5db1   ; es_base_3d: acarreo si la fase es una base en 3D (la lista p00:532C: 1, 4, 11 y 14)
	jr c,L_5DBD		;5db4
	ld a,(0e032h)		;5db6
	cp 003h		;5db9
	jr nz,L_5DD2		;5dbb
L_5DBD:
	ld a,(0e032h)		;5dbd
	and a			;5dc0
	jr z,L_5DD2		;5dc1
	ld a,(0e2d0h)		;5dc3   ; ...cada 0xE2D0 cuadros se repite solo (0xE061 a cero)
	and a			;5dc6
	jr z,L_5DCF		;5dc7
	dec a			;5dc9
	ld (0e2d0h),a		;5dca
	jr nz,L_5DD2		;5dcd
L_5DCF:
	ld (0e061h),a		;5dcf
L_5DD2:
	ld iy,0e360h		;5dd2   ; los 21 objetos de sprite (0xE360-0xE4AF): p02:8000 con los que tienen tipo
	ld ix,0e320h		;5dd6
	ld de,00010h		;5dda
	ld b,015h		;5ddd
L_5DDF:
	push bc			;5ddf
	push iy		;5de0
	push de			;5de2
	ld a,(iy+004h)		;5de3   ; lee el tipo del objeto (p02:8000, p02:8063)
	and a			;5de6
	jr z,L_5DEC		;5de7
	call 08000h		;5de9
L_5DEC:
	pop de			;5dec
	pop iy		;5ded
	add iy,de		;5def
	pop bc			;5df1
	djnz L_5DDF		;5df2
L_5DF4:
	ld ix,0e320h		;5df4   ; y los 14 de 0xE500: p02:8063
	ld iy,0e500h		;5df8   ; apunta a las fichas de los objetos de la fase (16 bytes)
	ld de,00010h		;5dfc
	ld b,00eh		;5dff
L_5E01:
	push bc			;5e01
	push iy		;5e02
	push de			;5e04
	ld a,(iy+004h)		;5e05   ; lee el tipo del objeto (p02:8000, p02:8063)
	and a			;5e08
	call nz,08063h		;5e09   ; mueve_objetos: la rutina del objeto IY (de 0xE500) segun su tipo IY+4 (la tabla de detras)
	pop de			;5e0c
	pop iy		;5e0d
	add iy,de		;5e0f
	pop bc			;5e11
	djnz L_5E01		;5e12
	ret			;5e14
L_5E15:
	push iy		;5e15   ; los colores de cuatro fichas (BC una tabla) y las partes de cuerpo de las tres de debajo (tipo 0x2D)
	call L_5E31		;5e17
	ld de,00020h		;5e1a
	add iy,de		;5e1d
	call L_5E31		;5e1f
	pop iy		;5e22
L_5E24:
	ld (iy+014h),02dh		;5e24
	ld (iy+024h),02dh		;5e28
	ld (iy+034h),02dh		;5e2c
	ret			;5e30
L_5E31:
	push iy		;5e31   ; los de dos fichas: la de debajo, tipo 0x2D
	call colores_ficha		;5e33   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	ld de,00010h		;5e36
	add iy,de		;5e39
	call colores_ficha		;5e3b   ; colores_ficha: pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	pop iy		;5e3e
L_5E40:
	ld (iy+014h),02dh		;5e40
	ret			;5e44
colores_ficha:		; pone el color de (BC) en las 16 lineas del sprite de la ficha IY (VRAM 0x7400 + ...)
	push iy		;5e45   ; el color de (BC) en las 16 lineas de la tabla de colores (0x7400 + la ficha - 0xE300...)
	pop hl			;5e47
	ld a,(bc)			;5e48
L_5E49:
	ld de,09100h		;5e49
	add hl,de			;5e4c
	push bc			;5e4d
	ld bc,00010h		;5e4e
	call 00056h		;5e51   ; BIOS FILVRM - Fills VRAM with value
	pop bc			;5e54
	inc bc			;5e55
	ret			;5e56
L_5E57:
	push iy		;5e57   ; lo mismo con A
	pop hl			;5e59
	jr L_5E49		;5e5a
L_5E5C:
	call L_5F0C		;5e5c   ; hay pared a la derecha? la casilla de (y, x + 0x0C) (en la fase 18, 4 mas abajo)
	ld a,(iy+00bh)		;5e5f
	add a,00ch		;5e62
	jr L_5E6E		;5e64
L_5E66:
	call L_5F0C		;5e66   ; a la izquierda: (y, x - 3)
	ld a,(iy+00bh)		;5e69
	sub 003h		;5e6c
L_5E6E:
	ld c,a			;5e6e
	ld a,(iy+00ah)		;5e6f
	add a,d			;5e72
	inc a			;5e73
	ld b,a			;5e74
	call 0b5d0h		;5e75
	cp 003h		;5e78
	ret			;5e7a
L_5E7B:
	call L_5F0C		;5e7b   ; un paso a la derecha si no hay pared...
	ld a,(iy+00bh)		;5e7e
	add a,00ch		;5e81
	ld c,a			;5e83
	ld a,(iy+00ah)		;5e84
	add a,d			;5e87
	ld b,a			;5e88
	call 0b5d0h		;5e89
	cp 003h		;5e8c
	jp c,L_5EB2		;5e8e
	inc (iy+00bh)		;5e91   ; ...y si la hay, p00:5EB2
	xor a			;5e94
	ret			;5e95
L_5E96:
	call L_5F0C		;5e96   ; un paso a la izquierda si no hay pared
	ld a,(iy+00bh)		;5e99
	add a,003h		;5e9c
	ld c,a			;5e9e
	ld a,(iy+00ah)		;5e9f
	add a,d			;5ea2
	ld b,a			;5ea3
	call 0b5d0h		;5ea4
	cp 003h		;5ea7
	jr c,$+9		;5ea9
	dec (iy+00bh)		;5eab
	xor a			;5eae
	ret			;5eaf

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5eb0..0x5eb2  (2 bytes)
DATA_5EB0:
	defb 037h,0c9h	; 5eb0

; ======================================================================
; CODIGO 0x5eb2..0x5f29  (119 bytes)
; ======================================================================


L_5EB2:
	ld a,(iy+016h)		;5eb2   ; con pared: se da la vuelta (y los del tipo 0x17 saltan)
	and a			;5eb5
	jr nz,L_5ECB		;5eb6
	ld a,(iy+008h)		;5eb8
	neg		;5ebb
	ld (iy+008h),a		;5ebd
	ld a,(iy+004h)		;5ec0
	cp 017h		;5ec3
	jr nz,L_5ECB		;5ec5
	ld (iy+016h),001h		;5ec7
L_5ECB:
	xor a			;5ecb
	ret			;5ecc
L_5ECD:
	ld a,(iy+00ah)		;5ecd   ; cae: hasta 3 puntos, mientras no haya suelo bajo sus pies (x + 4 y x + 0x0B)...
	cp 0b8h		;5ed0
	ret nc			;5ed2
	ld b,003h		;5ed3
L_5ED5:
	push bc			;5ed5
	call L_5F0C		;5ed6
	ld a,(iy+00ah)		;5ed9
	add a,d			;5edc
	ld b,a			;5edd
	and 007h		;5ede
	cp 007h		;5ee0
	jr nz,L_5F01		;5ee2
	inc b			;5ee4
	ld a,(iy+00bh)		;5ee5
	add a,004h		;5ee8
	ld c,a			;5eea
	push bc			;5eeb
	call 0b5d0h		;5eec
	pop bc			;5eef
	cp 003h		;5ef0
	jr c,L_5F09		;5ef2
	ld a,(iy+00bh)		;5ef4
	add a,00bh		;5ef7
	ld c,a			;5ef9
	call 0b5d0h		;5efa
	cp 003h		;5efd
	jr c,L_5F09		;5eff
L_5F01:
	inc (iy+00ah)		;5f01   ; ...un punto mas abajo cada vez; acarreo si sigue cayendo
	pop bc			;5f04
	djnz L_5ED5		;5f05
	scf			;5f07
	ret			;5f08
L_5F09:
	pop bc			;5f09
	xor a			;5f0a
	ret			;5f0b
L_5F0C:
	ld a,(0e020h)		;5f0c   ; D = 4 en la fase 18 (el suelo esta 4 mas abajo); 0 en las demas
	cp 012h		;5f0f
	jr nz,L_5F16		;5f11
	ld d,004h		;5f13
	ret			;5f15
L_5F16:
	ld d,000h		;5f16
	ret			;5f18
suma_100:		; suma 1 a los puntos
	ld a,001h		;5f19   ; los puntos: 1, 2, 3, 4 o 0x10 (centenas en BCD)
	jr $+20		;5f1b
suma_200:		; suma 2 a los puntos
	ld a,002h		;5f1d
	jr $+16		;5f1f
suma_300:		; suma 3 a los puntos
	ld a,003h		;5f21
	jr $+12		;5f23
suma_400:		; suma 4 a los puntos
	ld a,004h		;5f25
	jr $+8		;5f27

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5f29..0x5f2d  (4 bytes)
DATA_5F29:
	defb 03eh,005h,018h,002h	; 5f29

; ======================================================================
; CODIGO 0x5f2d..0x6000  (211 bytes)
; ======================================================================


suma_1000:		; suma 0x10 a los puntos
	ld a,010h		;5f2d
L_5F2F:
	ld b,000h		;5f2f
	jr L_5F35		;5f31
suma_puntos:		; suma A a los puntos (0xE037-0xE038, BCD) y mira la vida de mas
	ld b,a			;5f33   ; suma A (y B) a los puntos: solo en la partida y sin 0xE035...
	xor a			;5f34
L_5F35:
	ld (0e5c8h),a		;5f35
	ld a,(0e000h)		;5f38   ; lee 1 en una partida de verdad, 0 en la demostracion
	and a			;5f3b
	ret z			;5f3c
	ld a,(0e035h)		;5f3d
	and a			;5f40
	jr nz,L_5F85		;5f41
	push hl			;5f43
	ld hl,0e038h		;5f44   ; ...las dos cifras bajas en 0xE038...
	ld c,002h		;5f47
	call L_5F6C		;5f49
	ld hl,0e037h		;5f4c   ; ...y las altas en 0xE037 (con la vida de mas, p00:52DD)
	ld a,(0e5c8h)		;5f4f
	ld b,a			;5f52
	ld c,004h		;5f53
	call L_5F6C		;5f55
	ld a,(0e035h)		;5f58   ; con 0xE035, los puntos se quedan en 999999
	and a			;5f5b
	jr z,L_5F69		;5f5c
	ld a,099h		;5f5e
	ld (0e038h),a		;5f60
	ld (0e037h),a		;5f63   ; guarda los puntos (BCD; el marcador anade 00)
	ld (0e036h),a		;5f66
L_5F69:
	pop hl			;5f69
	jr L_5F85		;5f6a
L_5F6C:
	ld a,(hl)			;5f6c   ; suma B en BCD a (HL), y el acarreo a la cifra de mas arriba
	add a,b			;5f6d
	daa			;5f6e
	ld (hl),a			;5f6f
	push af			;5f70
	ld a,c			;5f71
	cp 004h		;5f72
	call z,L_52DD		;5f74
	pop af			;5f77
	ret nc			;5f78
	dec hl			;5f79
	ld a,002h		;5f7a
	add a,c			;5f7c
	cp 00ah		;5f7d
	ret z			;5f7f
	ld c,a			;5f80
	ld b,001h		;5f81
	jr L_5F6C		;5f83
L_5F85:
	xor a			;5f85   ; y el marcador: los puntos a cifras (p00:5F92)
	ld (0e050h),a		;5f86
	ld a,c			;5f89
	ld (0e051h),a		;5f8a
	call L_5F92		;5f8d
	jr L_5FDE		;5f90
L_5F92:
	ld hl,0e056h		;5f92   ; los puntos (0xE035-0xE038, cuatro bytes BCD) a ocho cifras en 0xE056...
	ld de,0e035h		;5f95
	ld b,004h		;5f98
	xor a			;5f9a
	ld (0e1a1h),a		;5f9b
L_5F9E:
	ld a,(de)			;5f9e   ; ...la cifra alta de cada byte...
	ld c,a			;5f9f
	and 0f0h		;5fa0
	rrca			;5fa2
	rrca			;5fa3
	rrca			;5fa4
	rrca			;5fa5
	and a			;5fa6   ; ...los ceros de la izquierda como espacio (0x10) hasta la primera cifra...
	jr nz,L_5FB3		;5fa7
	ld a,(0e1a1h)		;5fa9
	and a			;5fac
	jr nz,L_5FB8		;5fad
	ld a,010h		;5faf
	jr L_5FB9		;5fb1
L_5FB3:
	ld (0e1a1h),a		;5fb3
	jr L_5FB9		;5fb6
L_5FB8:
	xor a			;5fb8
L_5FB9:
	ld (hl),a			;5fb9
	inc hl			;5fba
	ld a,c			;5fbb   ; ...y la baja, igual
	and 00fh		;5fbc
	and a			;5fbe
	jr nz,L_5FCB		;5fbf
	ld a,(0e1a1h)		;5fc1
	and a			;5fc4
	jr nz,L_5FD0		;5fc5
	ld a,010h		;5fc7
	jr L_5FD1		;5fc9
L_5FCB:
	ld (0e1a1h),a		;5fcb
	jr L_5FD1		;5fce
L_5FD0:
	xor a			;5fd0
L_5FD1:
	ld (hl),a			;5fd1
	inc hl			;5fd2
	inc de			;5fd3
	djnz L_5F9E		;5fd4
	dec hl			;5fd6   ; la ultima, si es espacio, un 0
	ld a,(hl)			;5fd7
	cp 010h		;5fd8
	ret nz			;5fda
	ld (hl),000h		;5fdb
	ret			;5fdd
L_5FDE:
	call L_4867		;5fde   ; las seis cifras que se ven (0xE058-0xE05D) en la fila del marcador...
	ld a,040h		;5fe1   ; ...con la letra de la hoja de la fila 0x40, en la pagina 1
	ld (0e01fh),a		;5fe3   ; guarda la fila de la hoja de dibujos (0xD8 la de las letras)
	ld a,001h		;5fe6
	ld (0e0d3h),a		;5fe8
	ld hl,002e7h		;5feb
	ld de,0e058h		;5fee
	ld b,006h		;5ff1
L_5FF3:
	ld a,(de)			;5ff3
	push de			;5ff4
	push bc			;5ff5
	call L_48C7		;5ff6   ; ...una a una (p00:48C7)
	pop bc			;5ff9
	pop de			;5ffa
	inc hl			;5ffb
	inc de			;5ffc
	djnz L_5FF3		;5ffd
	ret			;5fff
