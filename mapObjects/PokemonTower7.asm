PokemonTower7Object: ; 0x60ef6 (size=42)
	db $1 ; border tile

	db $1 ; warps
	db $10, $9, $1, POKEMONTOWER_6

	db $0 ; signs

	db $4 ; people
	db SPRITE_ROCKET, $b + 4, $9 + 4, $ff, $d3, $41, ROCKET + $C8, $13 ; trainer
	db SPRITE_ROCKET, $9 + 4, $c + 4, $ff, $d2, $42, ROCKET + $C8, $14 ; trainer
	db SPRITE_ROCKET, $7 + 4, $9 + 4, $ff, $d3, $43, ROCKET + $C8, $15 ; trainer
	db SPRITE_MR_FUJI, $3 + 4, $a + 4, $ff, $d0, $4 ; person

	; warp-to
	EVENT_DISP $a, $10, $9 ; POKEMONTOWER_6
