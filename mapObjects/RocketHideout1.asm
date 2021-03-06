RocketHideout1Object: ; 0x44ce7 (size=98)
	db $2e ; border tile

	db $5 ; warps
	db $2, $17, $0, ROCKET_HIDEOUT_2
	db $2, $15, $2, GAME_CORNER
	db $13, $18, $0, ROCKET_HIDEOUT_ELEVATOR
	db $18, $15, $3, ROCKET_HIDEOUT_2
	db $13, $19, $1, ROCKET_HIDEOUT_ELEVATOR

	db $0 ; signs

	db $7 ; people
	db SPRITE_ROCKET, $8 + 4, $1a + 4, $ff, $d2, $41, ROCKET + $C8, $8 ; trainer
	db SPRITE_ROCKET, $6 + 4, $c + 4, $ff, $d3, $42, ROCKET + $C8, $9 ; trainer
	db SPRITE_ROCKET, $11 + 4, $12 + 4, $ff, $d0, $43, ROCKET + $C8, $a ; trainer
	db SPRITE_ROCKET, $19 + 4, $f + 4, $ff, $d3, $44, ROCKET + $C8, $b ; trainer
	db SPRITE_ROCKET, $12 + 4, $1c + 4, $ff, $d2, $45, ROCKET + $C8, $c ; trainer
	db SPRITE_BALL, $e + 4, $b + 4, $ff, $ff, $86, ESCAPE_ROPE ; item
	db SPRITE_BALL, $11 + 4, $9 + 4, $ff, $ff, $87, HYPER_POTION ; item

	; warp-to
	EVENT_DISP $f, $2, $17 ; ROCKET_HIDEOUT_2
	EVENT_DISP $f, $2, $15 ; GAME_CORNER
	EVENT_DISP $f, $13, $18 ; ROCKET_HIDEOUT_ELEVATOR
	EVENT_DISP $f, $18, $15 ; ROCKET_HIDEOUT_2
	EVENT_DISP $f, $13, $19 ; ROCKET_HIDEOUT_ELEVATOR

