SilphCo11Object: ; 0x62380 (size=72)
	db $d ; border tile

	db $4 ; warps
	db $0, $9, $1, SILPH_CO_10F
	db $0, $d, $0, SILPH_CO_ELEVATOR
	db $5, $5, $9, $ff
	db $2, $3, $3, SILPH_CO_7F

	db $0 ; signs

	db $5 ; people
	db SPRITE_MR_MASTERBALL, $5 + 4, $7 + 4, $ff, $d0, $1 ; person
	db SPRITE_FOULARD_WOMAN, $5 + 4, $a + 4, $ff, $d0, $2 ; person
	db SPRITE_GIOVANNI, $9 + 4, $6 + 4, $ff, $d0, $43, GIOVANNI + $C8, $2 ; trainer
	db SPRITE_ROCKET, $10 + 4, $3 + 4, $ff, $d1, $44, ROCKET + $C8, $29 ; trainer
	db SPRITE_ROCKET, $9 + 4, $f + 4, $ff, $d1, $45, ROCKET + $C8, $28 ; trainer

	; warp-to
	EVENT_DISP $9, $0, $9 ; SILPH_CO_10F
	EVENT_DISP $9, $0, $d ; SILPH_CO_ELEVATOR
	EVENT_DISP $9, $5, $5
	EVENT_DISP $9, $2, $3 ; SILPH_CO_7F

