SafariZoneWestObject: ; 0x4a1dc (size=108)
	db $0 ; border tile

	db $8 ; warps
	db $0, $14, $0, SAFARI_ZONE_NORTH
	db $0, $15, $1, SAFARI_ZONE_NORTH
	db $0, $1a, $2, SAFARI_ZONE_NORTH
	db $0, $1b, $3, SAFARI_ZONE_NORTH
	db $16, $1d, $2, SAFARI_ZONE_CENTER
	db $17, $1d, $3, SAFARI_ZONE_CENTER
	db $3, $3, $0, SAFARI_ZONE_SECRET_HOUSE
	db $b, $b, $0, SAFARI_ZONE_REST_HOUSE_2

	db $4 ; signs
	db $c, $c, $5 ; SafariZoneWestText5
	db $3, $11, $6 ; SafariZoneWestText6
	db $4, $1a, $7 ; SafariZoneWestText7
	db $16, $18, $8 ; SafariZoneWestText8

	db $4 ; people
	db SPRITE_BALL, $14 + 4, $8 + 4, $ff, $ff, $81, MAX_POTION ; item
	db SPRITE_BALL, $7 + 4, $9 + 4, $ff, $ff, $82, TM_32 ; item
	db SPRITE_BALL, $12 + 4, $12 + 4, $ff, $ff, $83, MAX_REVIVE ; item
	db SPRITE_BALL, $7 + 4, $13 + 4, $ff, $ff, $84, GOLD_TEETH ; item

	; warp-to
	EVENT_DISP $f, $0, $14 ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $0, $15 ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $0, $1a ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $0, $1b ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $16, $1d ; SAFARI_ZONE_CENTER
	EVENT_DISP $f, $17, $1d ; SAFARI_ZONE_CENTER
	EVENT_DISP $f, $3, $3 ; SAFARI_ZONE_SECRET_HOUSE
	EVENT_DISP $f, $b, $b ; SAFARI_ZONE_REST_HOUSE_2
