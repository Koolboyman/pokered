Lab4Script: ; 75d31 (1d:5d31)
	jp EnableAutoTextBoxDrawing

Lab4TextPointers: ; 75d34 (1d:5d34)
	dw Lab4Text1
	dw Lab4Text2

Func_75d38: ; 75d38 (1d:5d38)
	xor a
	ld [$cd37], a
	ld de, $cc5b
	ld hl, FossilsList
.asm_75d42
	ld a, [hli]
	and a
	jr z, .asm_75d64
	push hl
	push de
	ld [$d11e], a
	ld b, a
	ld a, $1c
	call Predef ; indirect jump to Func_f8a5 (f8a5 (3:78a5))
	pop de
	pop hl
	ld a, b
	and a
	jr z, .asm_75d42
	ld a, [$d11e]
	ld [de], a
	inc de
	push hl
	ld hl, $cd37
	inc [hl]
	pop hl
	jr .asm_75d42
.asm_75d64
	ld a, $ff
	ld [de], a
	ret

FossilsList: ; 75d68 (1d:5d68)
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db $00

Lab4Text1: ; 75d6c (1d:5d6c)
	db $8
	ld a, [$d7a3]
	bit 0, a
	jr nz, .asm_75d96 ; 0x75d72 $22
	ld hl, UnnamedText_75dc6
	call PrintText
	call Func_75d38
	ld a, [$cd37]
	and a
	jr z, .asm_75d8d ; 0x75d81 $a
	ld b, BANK(GiveFossilToCinnabarLab)
	ld hl, GiveFossilToCinnabarLab
	call Bankswitch
	jr .asm_75d93 ; 0x75d8b $6
.asm_75d8d
	ld hl, UnnamedText_75dcb
	call PrintText
.asm_75d93
	jp TextScriptEnd
.asm_75d96
	bit 1, a
	jr z, .asm_75da2 ; 0x75d98 $8
	ld hl, UnnamedText_75dd0
	call PrintText
	jr .asm_75d93 ; 0x75da0 $f1
.asm_75da2
	call LoadFossilItemAndMonNameBank1D
	ld hl, UnnamedText_75dd5
	call PrintText
	ld hl, $d7a3
	set 2, [hl]
	ld a, [W_FOSSILMON]
	ld b, a
	ld c, $1e
	call GivePokemon
	jr nc, .asm_75d93 ; 0x75db9 $d8
	ld hl, $d7a3
	res 0, [hl]
	res 1, [hl]
	res 2, [hl]
	jr .asm_75d93 ; 0x75dc4 $cd

UnnamedText_75dc6: ; 75dc6 (1d:5dc6)
	TX_FAR _UnnamedText_75dc6
	db "@"

UnnamedText_75dcb: ; 75dcb (1d:5dcb)
	TX_FAR _UnnamedText_75dcb
	db "@"

UnnamedText_75dd0: ; 75dd0 (1d:5dd0)
	TX_FAR _UnnamedText_75dd0
	db "@"

UnnamedText_75dd5: ; 75dd5 (1d:5dd5)
	TX_FAR _UnnamedText_75dd5
	db "@"

Lab4Text2: ; 75dda (1d:5dda)
	db $08 ; asm
	ld a, $3
	ld [wWhichTrade], a
	ld a, $54
	call Predef
	jp TextScriptEnd

LoadFossilItemAndMonNameBank1D: ; 75de8 (1d:5de8)
	ld b, BANK(LoadFossilItemAndMonName)
	ld hl, LoadFossilItemAndMonName
	jp Bankswitch
	
