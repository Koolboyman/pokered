Route16Object: ; 0x58afc (size=136)
	db $f ; border tile

	db $9 ; warps
	db $a, $11, $0, ROUTE_16_GATE_1F
	db $b, $11, $1, ROUTE_16_GATE_1F
	db $a, $18, $2, ROUTE_16_GATE_1F
	db $b, $18, $3, ROUTE_16_GATE_1F
	db $4, $11, $4, ROUTE_16_GATE_1F
	db $5, $11, $5, ROUTE_16_GATE_1F
	db $4, $18, $6, ROUTE_16_GATE_1F
	db $5, $18, $7, ROUTE_16_GATE_1F
	db $5, $7, $0, ROUTE_16_HOUSE

	db $2 ; signs
	db $b, $1b, $8 ; Route16Text8
	db $11, $5, $9 ; Route16Text9

	db $7 ; people
	db SPRITE_BIKER, $c + 4, $11 + 4, $ff, $d2, $41, BIKER + $C8, $5 ; trainer
	db SPRITE_BIKER, $d + 4, $e + 4, $ff, $d3, $42, CUE_BALL + $C8, $1 ; trainer
	db SPRITE_BIKER, $c + 4, $b + 4, $ff, $d1, $43, CUE_BALL + $C8, $2 ; trainer
	db SPRITE_BIKER, $b + 4, $9 + 4, $ff, $d2, $44, BIKER + $C8, $6 ; trainer
	db SPRITE_BIKER, $a + 4, $6 + 4, $ff, $d3, $45, CUE_BALL + $C8, $3 ; trainer
	db SPRITE_BIKER, $c + 4, $3 + 4, $ff, $d3, $46, BIKER + $C8, $7 ; trainer
	db SPRITE_SNORLAX, $a + 4, $1a + 4, $ff, $d0, $7 ; person

	; warp-to
	EVENT_DISP $14, $a, $11 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $b, $11 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $a, $18 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $b, $18 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $4, $11 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $5, $11 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $4, $18 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $5, $18 ; ROUTE_16_GATE_1F
	EVENT_DISP $14, $5, $7 ; ROUTE_16_HOUSE
