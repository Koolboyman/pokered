Route12GateUpstairsObject: ; 0x495de (size=24)
	db $a ; border tile

	db $1 ; warps
	db $7, $7, $4, ROUTE_12_GATE

	db $2 ; signs
	db $2, $1, $2 ; Route12GateUpstairsText2
	db $2, $6, $3 ; Route12GateUpstairsText3

	db $1 ; people
	db SPRITE_BRUNETTE_GIRL, $4 + 4, $3 + 4, $fe, $1, $1 ; person

	; warp-to
	EVENT_DISP $4, $7, $7 ; ROUTE_12_GATE
