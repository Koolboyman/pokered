SilphCo4Object: ; 0x19e35 (size=111)
	db $2e ; border tile

	db $7 ; warps
	db $0, $18, $1, SILPH_CO_3F
	db $0, $1a, $1, SILPH_CO_5F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $7, $b, $3, SILPH_CO_10F
	db $3, $11, $3, SILPH_CO_6F
	db $f, $3, $4, SILPH_CO_10F
	db $b, $11, $5, SILPH_CO_10F

	db $0 ; signs

	db $7 ; people
	db SPRITE_LAPRAS_GIVER, $2 + 4, $6 + 4, $ff, $ff, $1 ; person
	db SPRITE_ROCKET, $e + 4, $9 + 4, $ff, $d3, $42, ROCKET + $C8, $1a ; trainer
	db SPRITE_OAK_AIDE, $6 + 4, $e + 4, $ff, $d2, $43, SCIENTIST + $C8, $5 ; trainer
	db SPRITE_ROCKET, $a + 4, $1a + 4, $ff, $d1, $44, ROCKET + $C8, $1b ; trainer
	db SPRITE_BALL, $9 + 4, $3 + 4, $ff, $ff, $85, FULL_HEAL ; item
	db SPRITE_BALL, $7 + 4, $4 + 4, $ff, $ff, $86, MAX_REVIVE ; item
	db SPRITE_BALL, $8 + 4, $5 + 4, $ff, $ff, $87, ESCAPE_ROPE ; item

	; warp-to
	EVENT_DISP $f, $0, $18 ; SILPH_CO_3F
	EVENT_DISP $f, $0, $1a ; SILPH_CO_5F
	EVENT_DISP $f, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP $f, $7, $b ; SILPH_CO_10F
	EVENT_DISP $f, $3, $11 ; SILPH_CO_6F
	EVENT_DISP $f, $f, $3 ; SILPH_CO_10F
	EVENT_DISP $f, $b, $11 ; SILPH_CO_10F

