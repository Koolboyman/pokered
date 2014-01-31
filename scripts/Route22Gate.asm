Route22GateScript: ; 1e683 (7:6683)
	call EnableAutoTextBoxDrawing
	ld hl, Route22GateScriptPointers
	ld a, [W_ROUTE22GATECURSCRIPT]
	call CallFunctionInTable
	ld a, [$d361]
	cp $4
	ld a, $22
	jr c, .asm_1e69a ; 0x1e696 $2
	ld a, $21
.asm_1e69a
	ld [$d365], a
	ret

Route22GateScriptPointers: ; 1e69e (7:669e)
	dw Route22GateScript0
	dw Route22GateScript1
	dw Route22GateScript2

Route22GateScript0: ; 1e6a4 (7:66a4)
	ld hl, Route22GateScriptCoords
	call ArePlayerCoordsInArray
	ret nc
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $1
	ld [$ff00+$8c], a
	jp DisplayTextID

Route22GateScriptCoords: ; 1e6b5 (7:66b5)
	db 2,4
	db 2,5
	db $ff

Func_1e6ba: ; 1e6ba (7:66ba)
	ld a, $1
	ld [$cd38], a
	ld a, $80
	ld [$ccd3], a
	ld [$c109], a
	ld [wJoypadForbiddenButtonsMask], a
	jp Func_3486

Route22GateScript1: ; 1e6cd (7:66cd)
	ld a, [$cd38]
	and a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	call Delay3
	ld a, $0
	ld [W_ROUTE22GATECURSCRIPT], a
Route22GateScript2: ; 1e6de (7:66de)
	ret

Route22GateTextPointers: ; 1e6df (7:66df)
	dw Route22GateText1

Route22GateText1: ; 1e6e1 (7:66e1)
	db $8
	ld a, [$d356]
	bit 0, a
	jr nz, .asm_8a809 ; 0x1e6e7 $d
	ld hl, UnnamedText_1e704
	call PrintText
	call Func_1e6ba
	ld a, $1
	jr .asm_20f7e ; 0x1e6f4 $8
.asm_8a809 ; 0x1e6f6
	ld hl, UnnamedText_1e71a
	call PrintText
	ld a, $2
.asm_20f7e ; 0x1e6fe
	ld [W_ROUTE22GATECURSCRIPT], a
	jp TextScriptEnd

UnnamedText_1e704: ; 1e704 (7:6704)
	TX_FAR _UnnamedText_1e704 ; 0x8cfbb
	db $8
	ld a, $a5
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, UnnamedText_1e715 ; $6715
	ret

UnnamedText_1e715: ; 1e715 (7:6715)
	TX_FAR _UnnamedText_1e715
	db "@"

UnnamedText_1e71a: ; 1e71a (7:671a)
	TX_FAR _UnnamedText_1e71a ; 0x8d03e
	db $0B, "@"


