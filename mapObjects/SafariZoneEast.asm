SafariZoneEastObject: ; 0x4588b (size=81)
	db $0 ; border tile

	db $5 ; warps
	db $4, $0, $6, SAFARI_ZONE_NORTH
	db $5, $0, $7, SAFARI_ZONE_NORTH
	db $16, $0, $6, SAFARI_ZONE_CENTER
	db $17, $0, $6, SAFARI_ZONE_CENTER
	db $9, $19, $0, SAFARI_ZONE_REST_HOUSE_3

	db $3 ; signs
	db $a, $1a, $5 ; SafariZoneEastText5
	db $4, $6, $6 ; SafariZoneEastText6
	db $17, $5, $7 ; SafariZoneEastText7

	db $4 ; people
	db SPRITE_BALL, $a + 4, $15 + 4, $ff, $ff, $81, FULL_RESTORE ; item
	db SPRITE_BALL, $7 + 4, $3 + 4, $ff, $ff, $82, MAX_POTION ; item
	db SPRITE_BALL, $d + 4, $14 + 4, $ff, $ff, $83, CARBOS ; item
	db SPRITE_BALL, $c + 4, $f + 4, $ff, $ff, $84, TM_37 ; item

	; warp-to
	EVENT_DISP $f, $4, $0 ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $5, $0 ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $16, $0 ; SAFARI_ZONE_CENTER
	EVENT_DISP $f, $17, $0 ; SAFARI_ZONE_CENTER
	EVENT_DISP $f, $9, $19 ; SAFARI_ZONE_REST_HOUSE_3

