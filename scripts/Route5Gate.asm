Route5GateScript: ; 1df33 (7:5f33)
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE5GATECURSCRIPT]
	ld hl, Route5GateScriptPointers
	jp CallFunctionInTable

Route5GateScriptPointers: ; 1df3f (7:5f3f)
	dw Route5GateScript0
	dw Route5GateScript1

Route5GateScript_1df43: ; 1df43 (7:5f43)
	ld a, $40
	ld [$ccd3], a
	ld a, $1
	ld [$cd38], a
	jp Func_3486

Route5GateScript0: ; 1df50 (7:5f50)
	ld a, [$d728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1df8f
	call ArePlayerCoordsInArray
	ret nc
	ld a, $2
	ld [$d528], a
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld b, BANK(RemoveGuardDrink)
	ld hl, RemoveGuardDrink
	call Bankswitch
	ld a, [$ff00+$db]
	and a
	jr nz, .asm_1df82 ; 0x1df70 $10
	ld a, $2
	ld [$ff00+$8c], a
	call DisplayTextID
	call Route5GateScript_1df43
	ld a, $1
	ld [W_ROUTE5GATECURSCRIPT], a
	ret
.asm_1df82
	ld a, $3
	ld [$ff00+$8c], a
	call DisplayTextID
	ld hl, $d728
	set 6, [hl]
	ret

CoordsData_1df8f: ; 1df8f (7:5f8f)
	db 3,3
	db 3,4
	db $ff

Route5GateScript1: ; 1df94 (7:5f94)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_ROUTE5GATECURSCRIPT], a
	ret
	
Route5GateTextPointers: ; 1dfa4 (7:5fa4)
	dw Route5GateText1
	dw Route5GateText2
	dw Route5GateText3

Route8GateText1: ; 1dfaa (7:5faa)
Route7GateText1: ; 1dfaa (7:5faa)
Route6GateText1: ; 1dfaa (7:5faa)
Route5GateText1: ; 1dfaa (7:5faa)
	db $8
	ld a, [$d728]
	bit 6, a
	jr nz, .asm_88856 ; 0x1dfb0 $2c
	ld b, BANK(RemoveGuardDrink)
	ld hl, RemoveGuardDrink
	call Bankswitch
	ld a, [$ff00+$db]
	and a
	jr nz, .asm_768a2 ; 0x1dfbd $11
	ld hl, UnnamedText_1dfe7
	call PrintText
	call Route5GateScript_1df43
	ld a, $1
	ld [W_ROUTE5GATECURSCRIPT], a
	jp TextScriptEnd
.asm_768a2 ; 0x1dfd0
	ld hl, UnnamedText_1dfec
	call PrintText
	ld hl, $d728
	set 6, [hl]
	jp TextScriptEnd
.asm_88856 ; 0x1dfde
	ld hl, UnnamedText_1dff6
	call PrintText
	jp TextScriptEnd

Route8GateText2: ; 1dfe7 (7:5fe7)
Route7GateText2: ; 1dfe7 (7:5fe7)
Route6GateText2: ; 1dfe7 (7:5fe7)
Route5GateText2: ; 1dfe7 (7:5fe7)
UnnamedText_1dfe7: ; 1dfe7 (7:5fe7)
	TX_FAR _UnnamedText_1dfe7
	db "@"

Route8GateText3: ; 1dfec (7:5fec)
Route7GateText3: ; 1dfec (7:5fec)
Route6GateText3: ; 1dfec (7:5fec)
Route5GateText3: ; 1dfec (7:5fec)
UnnamedText_1dfec: ; 1dfec (7:5fec)
	TX_FAR _UnnamedText_8aaa9 ; 0x8aaa9
	db $11
	TX_FAR _UnnamedText_1dff1 ; 0x8aaef
	db "@"

UnnamedText_1dff6: ; 1dff6 (7:5ff6)
	TX_FAR _UnnamedText_1dff6
	db "@"


