CeladonMansion3Object: ; 0x487ff (size=72)
	db $f ; border tile

	db $4 ; warps
	db $1, $6, $0, CELADON_MANSION_2
	db $1, $7, $0, CELADON_MANSION_4
	db $1, $2, $1, CELADON_MANSION_4
	db $1, $4, $3, CELADON_MANSION_2

	db $4 ; signs
	db $3, $1, $5 ; CeladonMansion3Text5
	db $3, $4, $6 ; CeladonMansion3Text6
	db $6, $1, $7 ; CeladonMansion3Text7
	db $9, $4, $8 ; CeladonMansion3Text8

	db $4 ; people
	db SPRITE_BIKE_SHOP_GUY, $4 + 4, $0 + 4, $ff, $d1, $1 ; person
	db SPRITE_MART_GUY, $4 + 4, $3 + 4, $ff, $d1, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $7 + 4, $0 + 4, $ff, $d1, $3 ; person
	db SPRITE_LAPRAS_GIVER, $3 + 4, $2 + 4, $ff, $ff, $4 ; person

	; warp-to
	EVENT_DISP $4, $1, $6 ; CELADON_MANSION_2
	EVENT_DISP $4, $1, $7 ; CELADON_MANSION_4
	EVENT_DISP $4, $1, $2 ; CELADON_MANSION_4
	EVENT_DISP $4, $1, $4 ; CELADON_MANSION_2
