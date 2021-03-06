RockTunnel1Object: ; 0x445f6 (size=127)
	db $3 ; border tile

	db $8 ; warps
	db $3, $f, $1, $ff
	db $0, $f, $1, $ff
	db $21, $f, $2, $ff
	db $23, $f, $2, $ff
	db $3, $25, $0, ROCK_TUNNEL_2
	db $3, $5, $1, ROCK_TUNNEL_2
	db $b, $11, $2, ROCK_TUNNEL_2
	db $11, $25, $3, ROCK_TUNNEL_2

	db $1 ; signs
	db $1d, $b, $8 ; RockTunnel1Text8

	db $7 ; people
	db SPRITE_HIKER, $5 + 4, $7 + 4, $ff, $d0, $41, HIKER + $C8, $c ; trainer
	db SPRITE_HIKER, $10 + 4, $5 + 4, $ff, $d0, $42, HIKER + $C8, $d ; trainer
	db SPRITE_HIKER, $f + 4, $11 + 4, $ff, $d2, $43, HIKER + $C8, $e ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $17 + 4, $ff, $d2, $44, POKEMANIAC + $C8, $7 ; trainer
	db SPRITE_LASS, $15 + 4, $25 + 4, $ff, $d2, $45, JR__TRAINER_F + $C8, $11 ; trainer
	db SPRITE_LASS, $18 + 4, $16 + 4, $ff, $d0, $46, JR__TRAINER_F + $C8, $12 ; trainer
	db SPRITE_LASS, $18 + 4, $20 + 4, $ff, $d3, $47, JR__TRAINER_F + $C8, $13 ; trainer

	; warp-to
	EVENT_DISP $14, $3, $f
	EVENT_DISP $14, $0, $f
	EVENT_DISP $14, $21, $f
	EVENT_DISP $14, $23, $f
	EVENT_DISP $14, $3, $25 ; ROCK_TUNNEL_2
	EVENT_DISP $14, $3, $5 ; ROCK_TUNNEL_2
	EVENT_DISP $14, $b, $11 ; ROCK_TUNNEL_2
	EVENT_DISP $14, $11, $25 ; ROCK_TUNNEL_2

