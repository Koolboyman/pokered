SSAnne5Object: ; 0x6172b (size=54)
	db $23 ; border tile

	db $2 ; warps
	db $6, $d, $0, SS_ANNE_3
	db $7, $d, $0, SS_ANNE_3

	db $0 ; signs

	db $5 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $5 + 4, $ff, $d1, $1 ; person
	db SPRITE_SAILOR, $9 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $b + 4, $7 + 4, $ff, $ff, $3 ; person
	db SPRITE_SAILOR, $4 + 4, $4 + 4, $ff, $d0, $44, SAILOR + $C8, $1 ; trainer
	db SPRITE_SAILOR, $8 + 4, $a + 4, $ff, $d1, $45, SAILOR + $C8, $2 ; trainer

	; warp-to
	EVENT_DISP $a, $6, $d ; SS_ANNE_3
	EVENT_DISP $a, $7, $d ; SS_ANNE_3

