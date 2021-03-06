Route22Script: ; 50eb2 (14:4eb2)
	call EnableAutoTextBoxDrawing
	ld hl, Route22ScriptPointers
	ld a, [W_ROUTE22CURSCRIPT]
	jp CallFunctionInTable

Route22ScriptPointers: ; 50ebe (14:4ebe)
	dw Route22Script0
	dw Route22Script1
	dw Route22Script2
	dw Route22Script3
	dw Route22Script4
	dw Route22Script5
	dw Route22Script6
	dw Route22Script7

Func_50ece: ; 50ece (14:4ece)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_ROUTE22CURSCRIPT], a
Route22Script7: ; 50ed5 (14:4ed5)
	ret

Func_50ed6: ; 50ed6 (14:4ed6)
	ld a, [W_RIVALSTARTER] ; $d715
	ld b, a
.asm_50eda
	ld a, [hli]
	cp b
	jr z, .asm_50ee1
	inc hl
	jr .asm_50eda
.asm_50ee1
	ld a, [hl]
	ld [W_TRAINERNO], a ; $d05d
	ret

Func_50ee6: ; 50ee6 (14:4ee6)
	ld de, MovementData_50efb ; $4efb
	ld a, [$cf0d]
	cp $1
	jr z, .asm_50ef1
	inc de
.asm_50ef1
	call MoveSprite
	ld a, $c
	ld [$FF00+$8d], a
	jp Func_34a6

MovementData_50efb: ; 50efb (14:4efb)
	db $C0,$C0,$C0,$C0,$FF

Route22Script0: ; 50f00 (14:4f00)
	ld a, [$d7eb]
	bit 7, a
	ret z
	ld hl, .CoordsData_50f2d ; $4f2d
	call ArePlayerCoordsInArray
	ret nc
	ld a, [$cd3d]
	ld [$cf0d], a
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $2
	ld [$d528], a
	ld a, [$d7eb]
	bit 0, a
	jr nz, .asm_50f32 ; 0x50f25 $b
	bit 1, a
	jp nz, Func_5104e
	ret

.CoordsData_50f2d
	db $04, $1D
	db $05, $1D
	db $FF

.asm_50f32
	ld a, $1
	ld [$cd4f], a
	xor a
	ld [$cd50], a
	ld a, $4c
	call Predef
	ld a, [$d700]
	and a
	jr z, .asm_50f4e ; 0x50f44 $8
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
.asm_50f4e
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld a, $1
	ld [$ff00+$8c], a
	call Func_50ee6
	ld a, $1
	ld [W_ROUTE22CURSCRIPT], a
	ret

Route22Script1: ; 50f62 (14:4f62)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_50f78 ; 0x50f6d $9
	ld a, $4
	ld [$d528], a
	ld a, $4
	jr .asm_50f7a ; 0x50f76 $2
.asm_50f78
	ld a, $c
.asm_50f7a
	ld [$ff00+$8d], a
	ld a, $1
	ld [$ff00+$8c], a
	call Func_34a6
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_511b7
	ld de, UnnamedText_511bc
	call PreBattleSaveRegisters
	ld a, $e1
	ld [$d059], a
	ld hl, StarterMons_50faf ; $4faf
	call Func_50ed6
	ld a, $2
	ld [W_ROUTE22CURSCRIPT], a
	ret

StarterMons_50faf: ; 50faf (14:4faf)
	db SQUIRTLE,$04
	db BULBASAUR,$05
	db CHARMANDER,$06

Route22Script2: ; 50fb5 (14:4fb5)
	ld a, [$d057]
	cp $ff
	jp z, Func_50ece
	ld a, [$c109]
	and a
	jr nz, .asm_50fc7 ; 0x50fc1 $4
	ld a, $4
	jr .asm_50fc9 ; 0x50fc5 $2
.asm_50fc7
	ld a, $c
.asm_50fc9
	ld [$ff00+$8d], a
	ld a, $1
	ld [$ff00+$8c], a
	call Func_34a6
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d7eb
	set 5, [hl]
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateStart)
	ld hl, Music_RivalAlternateStart
	call Bankswitch
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_50fff ; 0x50ff8 $5
	call Func_51008
	jr .asm_51002 ; 0x50ffd $3
.asm_50fff
	call Func_5100d
.asm_51002
	ld a, $3
	ld [W_ROUTE22CURSCRIPT], a
	ret

Func_51008: ; 51008 (14:5008)
	ld de, MovementData_51017 ; $5017
	jr asm_51010

Func_5100d: ; 5100d (14:500d)
	ld de, MovementData_5101f ; $501f
asm_51010
	ld a, $1
	ld [H_SPRITEHEIGHT], a
	jp MoveSprite

MovementData_51017: ; 51017 (14:5017)
	db $C0,$C0,$00,$00,$00,$00,$00,$FF

MovementData_5101f: ; 5101f (14:501f)
	db $40,$C0,$C0,$C0,$00,$00,$00,$00,$00,$00,$FF

Route22Script3: ; 5102a (14:502a)
	ld a, [$d730]
	bit 0, a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $22
	ld [$cc4d], a
	ld a, $11
	call Predef
	call Func_2307
	ld hl, $d7eb
	res 0, [hl]
	res 7, [hl]
	ld a, $0
	ld [W_ROUTE22CURSCRIPT], a
	ret

Func_5104e: ; 5104e (14:504e)
	ld a, $2
	ld [$cd4f], a
	xor a
	ld [$cd50], a
	ld a, $4c
	call Predef ; indirect jump to Func_17c47 (17c47 (5:7c47))
	ld a, [$d700]
	and a
	jr z, .skipYVisibilityTesta
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
.skipYVisibilityTesta
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateTempo)
	ld hl, Music_RivalAlternateTempo
	call Bankswitch ; indirect jump to Music_RivalAlternateTempo (9b65 (2:5b65))
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call Func_50ee6
	ld a, $4
	ld [W_ROUTE22CURSCRIPT], a
	ret

Route22Script4: ; 51087 (14:5087)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_510a1
	ld a, $4
	ld [$d528], a
	ld a, $4
	jr .asm_510a8
.asm_510a1
	ld a, $2
	ld [$d528], a
	ld a, $c
.asm_510a8
	ld [$FF00+$8d], a
	call Func_34a6
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_511cb ; $51cb
	ld de, UnnamedText_511d0 ; $51d0
	call PreBattleSaveRegisters
	ld a, $f2
	ld [W_CUROPPONENT], a ; $d059
	ld hl, StarterMons_510d9 ; $50d9
	call Func_50ed6
	ld a, $5
	ld [W_ROUTE22CURSCRIPT], a
	ret

StarterMons_510d9: ; 510d9 (14:50d9)
	db SQUIRTLE,$0a
	db BULBASAUR,$0b
	db CHARMANDER,$0c

Route22Script5: ; 510df (14:50df)
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_50ece
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_510fb
	ld a, $4
	ld [$d528], a
	ld a, $4
	jr .asm_51102
.asm_510fb
	ld a, $2
	ld [$d528], a
	ld a, $c
.asm_51102
	ld [$FF00+$8d], a
	call Func_34a6
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d7eb
	set 6, [hl]
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateStartAndTempo)
	ld hl, Music_RivalAlternateStartAndTempo
	call Bankswitch ; indirect jump to Music_RivalAlternateStartAndTempo (9b75 (2:5b75))
	ld a, [$cf0d]
	cp $1
	jr nz, .asm_51134
	call Func_5113d
	jr .asm_51137
.asm_51134
	call Func_51142
.asm_51137
	ld a, $6
	ld [W_ROUTE22CURSCRIPT], a
	ret

Func_5113d: ; 5113d (14:513d)
	ld de, MovementData_5114c ; $514c
	jr asm_51145

Func_51142: ; 51142 (14:5142)
	ld de, MovementData_5114d ; $514d
asm_51145: ; 51145 (14:5145)
	ld a, $2
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	jp MoveSprite

MovementData_5114c: ; 5114c (14:514c)
	db $80

MovementData_5114d: ; 5114d (14:514d)
	db $80,$80,$80,$FF

Route22Script6: ; 51151 (14:5151)
	ld a, [$d730]
	bit 0, a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $23
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	call Func_2307
	ld hl, $d7eb
	res 1, [hl]
	res 7, [hl]
	ld a, $7
	ld [W_ROUTE22CURSCRIPT], a
	ret

Route22TextPointers: ; 51175 (14:5175)
	dw Route22Text1
	dw Route22Text2
	dw Route22Text3

Route22Text1: ; 5117b (14:517b)
	db $08 ; asm
	ld a, [$d7eb]
	bit 5, a
	jr z, .asm_a88cf ; 0x51181
	ld hl, UnnamedText_511b2
	call PrintText
	jr .asm_48088 ; 0x51189
.asm_a88cf ; 0x5118b
	ld hl, UnnamedText_511ad
	call PrintText
.asm_48088 ; 0x51191
	jp TextScriptEnd

Route22Text2: ; 51194 (14:5194)
	db $08 ; asm
	ld a, [$d7eb]
	bit 6, a
	jr z, .asm_58c0a ; 0x5119a
	ld hl, UnnamedText_511c6
	call PrintText
	jr .asm_673ee ; 0x511a2
.asm_58c0a ; 0x511a4
	ld hl, UnnamedText_511c1
	call PrintText
.asm_673ee ; 0x511aa
	jp TextScriptEnd

UnnamedText_511ad: ; 511ad (14:51ad)
	TX_FAR _UnnamedText_511ad
	db "@"

UnnamedText_511b2: ; 511b2 (14:51b2)
	TX_FAR _UnnamedText_511b2
	db "@"

UnnamedText_511b7: ; 511b7 (14:51b7)
	TX_FAR _UnnamedText_511b7
	db "@"

UnnamedText_511bc: ; 511bc (14:51bc)
	TX_FAR _UnnamedText_511bc
	db "@"

UnnamedText_511c1: ; 511c1 (14:51c1)
	TX_FAR _UnnamedText_511c1
	db "@"

UnnamedText_511c6: ; 511c6 (14:51c6)
	TX_FAR _UnnamedText_511c6
	db "@"

UnnamedText_511cb: ; 511cb (14:51cb)
	TX_FAR _UnnamedText_511cb
	db "@"

UnnamedText_511d0: ; 511d0 (14:51d0)
	TX_FAR _UnnamedText_511d0
	db "@"

Route22Text3: ; 511d5 (14:51d5)
	TX_FAR _Route22Text3
	db "@"

