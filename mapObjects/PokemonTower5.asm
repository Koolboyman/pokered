PokemonTower5Object: ; 0x60a48 (size=65)
	db $1 ; border tile

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_4
	db $9, $12, $0, POKEMONTOWER_6

	db $0 ; signs

	db $6 ; people
	db SPRITE_MEDIUM, $8 + 4, $c + 4, $ff, $ff, $1 ; person
	db SPRITE_MEDIUM, $7 + 4, $11 + 4, $ff, $d2, $42, CHANNELER + $C8, $e ; trainer
	db SPRITE_MEDIUM, $3 + 4, $e + 4, $ff, $d2, $43, CHANNELER + $C8, $10 ; trainer
	db SPRITE_MEDIUM, $a + 4, $6 + 4, $ff, $d3, $44, CHANNELER + $C8, $11 ; trainer
	db SPRITE_MEDIUM, $10 + 4, $9 + 4, $ff, $d3, $45, CHANNELER + $C8, $12 ; trainer
	db SPRITE_BALL, $e + 4, $6 + 4, $ff, $ff, $86, NUGGET ; item

	; warp-to
	EVENT_DISP $a, $9, $3 ; POKEMONTOWER_4
	EVENT_DISP $a, $9, $12 ; POKEMONTOWER_6

