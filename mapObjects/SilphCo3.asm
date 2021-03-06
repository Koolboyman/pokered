SilphCo3Object: ; 0x5a035 (size=113)
	db $2e ; border tile

	db $a ; warps
	db $0, $1a, $1, SILPH_CO_2F
	db $0, $18, $0, SILPH_CO_4F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $b, $17, $9, SILPH_CO_3F
	db $3, $3, $5, SILPH_CO_5F
	db $f, $3, $6, SILPH_CO_5F
	db $3, $1b, $3, SILPH_CO_2F
	db $b, $3, $3, SILPH_CO_9F
	db $b, $b, $4, SILPH_CO_7F
	db $f, $1b, $3, SILPH_CO_3F

	db $0 ; signs

	db $4 ; people
	db SPRITE_LAPRAS_GIVER, $8 + 4, $18 + 4, $ff, $ff, $1 ; person
	db SPRITE_ROCKET, $7 + 4, $14 + 4, $ff, $d2, $42, ROCKET + $C8, $19 ; trainer
	db SPRITE_OAK_AIDE, $9 + 4, $7 + 4, $ff, $d0, $43, SCIENTIST + $C8, $4 ; trainer
	db SPRITE_BALL, $5 + 4, $8 + 4, $ff, $ff, $84, HYPER_POTION ; item

	; warp-to
	EVENT_DISP $f, $0, $1a ; SILPH_CO_2F
	EVENT_DISP $f, $0, $18 ; SILPH_CO_4F
	EVENT_DISP $f, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP $f, $b, $17 ; SILPH_CO_3F
	EVENT_DISP $f, $3, $3 ; SILPH_CO_5F
	EVENT_DISP $f, $f, $3 ; SILPH_CO_5F
	EVENT_DISP $f, $3, $1b ; SILPH_CO_2F
	EVENT_DISP $f, $b, $3 ; SILPH_CO_9F
	EVENT_DISP $f, $b, $b ; SILPH_CO_7F
	EVENT_DISP $f, $f, $1b ; SILPH_CO_3F

