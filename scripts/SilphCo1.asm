SilphCo1Script: ; 5d44e (17:544e)
	call EnableAutoTextBoxDrawing
	ld a, [$d838]
	bit 7, a
	ret z
	ld hl, $d7b9
	bit 7, [hl]
	set 7, [hl]
	ret nz
	ld a, $4c
	ld [$cc4d], a
	ld a, $15
	jp Predef

SilphCo1TextPointers: ; 5d469 (17:5469)
	dw SilphCo1Text1

SilphCo1Text1: ; 5d46b (17:546b)
	TX_FAR _SilphCo1Text1
	db "@"
	
