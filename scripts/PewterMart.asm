PewterMartScript: ; 74cad (1d:4cad)
	call EnableAutoTextBoxDrawing
	ld a, $1
	ld [$cf0c], a
	ret

PewterMartTextPointers: ; 74cb6 (1d:4cb6)
	dw PewterMartText1
	dw PewterMartText2
	dw PewterMartText3

PewterMartText2: ; 74cbc (1d:4cbc)
	db $08 ; asm
	ld hl, UnnamedText_74cc6
	call PrintText
	jp TextScriptEnd

UnnamedText_74cc6: ; 74cc6 (1d:4cc6)
	TX_FAR _UnnamedText_74cc6
	db "@"

PewterMartText3: ; 74ccb (1d:4ccb)
	db $08 ; asm
	ld hl, UnnamedText_74cd5
	call PrintText
	jp TextScriptEnd

UnnamedText_74cd5: ; 74cd5 (1d:4cd5)
	TX_FAR _UnnamedText_74cd5
	db "@"
	
