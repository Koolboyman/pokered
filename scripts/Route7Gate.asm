Route7GateScript: ; 1e100 (7:6100)
	call EnableAutoTextBoxDrawing
	ld a, [W_ROUTE7GATECURSCRIPT]
	ld hl, Route7GateScriptPointers
	call CallFunctionInTable
	ret

Route7GateScriptPointers: ; 1e10d (7:610d)
	dw Route7GateScript0
	dw Route7GateScript1

Route7GateScript_1e111: ; 1e111 (7:6111)
	ld hl, $d730
	set 7, [hl]
	ld a, $20
	ld [$ccd3], a
	ld a, $1
	ld [$cd38], a
	xor a
	ld [$c206], a
	ld [$cd3b], a
	ret

Route7GateScript0: ; 1e128 (7:6128)
	ld a, [$d728]
	bit 6, a
	ret nz
	ld hl, CoordsData_1e167
	call ArePlayerCoordsInArray
	ret nc
	ld a, $8
	ld [$d528], a
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld b, BANK(RemoveGuardDrink)
	ld hl, RemoveGuardDrink
	call Bankswitch
	ld a, [$ff00+$db]
	and a
	jr nz, .asm_1e15a ; 0x1e148 $10
	ld a, $2
	ld [$ff00+$8c], a
	call DisplayTextID
	call Route7GateScript_1e111
	ld a, $1
	ld [W_ROUTE7GATECURSCRIPT], a
	ret
.asm_1e15a
	ld a, $3
	ld [$ff00+$8c], a
	call DisplayTextID
	ld hl, $d728
	set 6, [hl]
	ret

CoordsData_1e167: ; 1e167 (7:6167)
	db 3,3
	db 4,3
	db $ff

Route7GateScript1: ; 1e16c (7:616c)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_ROUTE7GATECURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret
	
Route7GateTextPointers: ; 1e17f (7:617f)
	dw Route7GateText1
	dw Route7GateText2
	dw Route7GateText3


