ViridianForestObject: ; 0x611da (size=127)
	db $3 ; border tile

	db $6 ; warps
	db $0, $1, $2, VIRIDIAN_FOREST_EXIT
	db $0, $2, $3, VIRIDIAN_FOREST_EXIT
	db $2f, $f, $1, VIRIDIAN_FOREST_ENTRANCE
	db $2f, $10, $1, VIRIDIAN_FOREST_ENTRANCE
	db $2f, $11, $1, VIRIDIAN_FOREST_ENTRANCE
	db $2f, $12, $1, VIRIDIAN_FOREST_ENTRANCE

	db $6 ; signs
	db $28, $18, $9 ; ViridianForestText9
	db $20, $10, $a ; ViridianForestText10
	db $11, $1a, $b ; ViridianForestText11
	db $18, $4, $c ; ViridianForestText12
	db $2d, $12, $d ; ViridianForestText13
	db $1, $2, $e ; ViridianForestText14

	db $8 ; people
	db SPRITE_BUG_CATCHER, $2b + 4, $10 + 4, $ff, $ff, $1 ; person
	db SPRITE_BUG_CATCHER, $21 + 4, $1e + 4, $ff, $d2, $42, BUG_CATCHER + $C8, $1 ; trainer
	db SPRITE_BUG_CATCHER, $13 + 4, $1e + 4, $ff, $d2, $43, BUG_CATCHER + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $12 + 4, $2 + 4, $ff, $d2, $44, BUG_CATCHER + $C8, $3 ; trainer
	db SPRITE_BALL, $b + 4, $19 + 4, $ff, $ff, $85, ANTIDOTE ; item
	db SPRITE_BALL, $1d + 4, $c + 4, $ff, $ff, $86, POTION ; item
	db SPRITE_BALL, $1f + 4, $1 + 4, $ff, $ff, $87, POKE_BALL ; item
	db SPRITE_BUG_CATCHER, $28 + 4, $1b + 4, $ff, $ff, $8 ; person

	; warp-to
	EVENT_DISP $11, $0, $1 ; VIRIDIAN_FOREST_EXIT
	EVENT_DISP $11, $0, $2 ; VIRIDIAN_FOREST_EXIT
	EVENT_DISP $11, $2f, $f ; VIRIDIAN_FOREST_ENTRANCE
	EVENT_DISP $11, $2f, $10 ; VIRIDIAN_FOREST_ENTRANCE
	EVENT_DISP $11, $2f, $11 ; VIRIDIAN_FOREST_ENTRANCE
	EVENT_DISP $11, $2f, $12 ; VIRIDIAN_FOREST_ENTRANCE
