Route15GateObject: ; 0x4960c (size=50)
	db $a ; border tile

	db $5 ; warps
	db $4, $0, $0, $ff
	db $5, $0, $1, $ff
	db $4, $7, $2, $ff
	db $5, $7, $3, $ff
	db $8, $6, $0, ROUTE_15_GATE_2F

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $1 + 4, $4 + 4, $ff, $ff, $1 ; person

	; warp-to
	EVENT_DISP $4, $4, $0
	EVENT_DISP $4, $5, $0
	EVENT_DISP $4, $4, $7
	EVENT_DISP $4, $5, $7
	EVENT_DISP $4, $8, $6
