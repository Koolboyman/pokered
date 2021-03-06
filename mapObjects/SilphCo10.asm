SilphCo10Object: ; 0x5a1fb (size=95)
	db $2e ; border tile

	db $6 ; warps
	db $0, $8, $0, SILPH_CO_9F
	db $0, $a, $0, SILPH_CO_11F
	db $0, $c, $0, SILPH_CO_ELEVATOR
	db $b, $9, $3, SILPH_CO_4F
	db $f, $d, $5, SILPH_CO_4F
	db $7, $d, $6, SILPH_CO_4F

	db $0 ; signs

	db $6 ; people
	db SPRITE_ROCKET, $9 + 4, $1 + 4, $ff, $d3, $41, ROCKET + $C8, $27 ; trainer
	db SPRITE_OAK_AIDE, $2 + 4, $a + 4, $ff, $d2, $42, SCIENTIST + $C8, $b ; trainer
	db SPRITE_ERIKA, $f + 4, $9 + 4, $fe, $0, $3 ; person
	db SPRITE_BALL, $c + 4, $2 + 4, $ff, $ff, $84, TM_26 ; item
	db SPRITE_BALL, $e + 4, $4 + 4, $ff, $ff, $85, RARE_CANDY ; item
	db SPRITE_BALL, $b + 4, $5 + 4, $ff, $ff, $86, CARBOS ; item

	; warp-to
	EVENT_DISP $8, $0, $8 ; SILPH_CO_9F
	EVENT_DISP $8, $0, $a ; SILPH_CO_11F
	EVENT_DISP $8, $0, $c ; SILPH_CO_ELEVATOR
	EVENT_DISP $8, $b, $9 ; SILPH_CO_4F
	EVENT_DISP $8, $f, $d ; SILPH_CO_4F
	EVENT_DISP $8, $7, $d ; SILPH_CO_4F

