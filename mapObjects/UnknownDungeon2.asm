UnknownDungeon2Object: ; 0x45e14 (size=73)
	db $7d ; border tile

	db $6 ; warps
	db $1, $1d, $2, UNKNOWN_DUNGEON_1
	db $6, $16, $3, UNKNOWN_DUNGEON_1
	db $7, $13, $4, UNKNOWN_DUNGEON_1
	db $1, $9, $5, UNKNOWN_DUNGEON_1
	db $3, $1, $6, UNKNOWN_DUNGEON_1
	db $b, $3, $7, UNKNOWN_DUNGEON_1

	db $0 ; signs

	db $3 ; people
	db SPRITE_BALL, $9 + 4, $1d + 4, $ff, $ff, $81, PP_UP ; item
	db SPRITE_BALL, $f + 4, $4 + 4, $ff, $ff, $82, ULTRA_BALL ; item
	db SPRITE_BALL, $6 + 4, $d + 4, $ff, $ff, $83, FULL_RESTORE ; item

	; warp-to
	EVENT_DISP $f, $1, $1d ; UNKNOWN_DUNGEON_1
	EVENT_DISP $f, $6, $16 ; UNKNOWN_DUNGEON_1
	EVENT_DISP $f, $7, $13 ; UNKNOWN_DUNGEON_1
	EVENT_DISP $f, $1, $9 ; UNKNOWN_DUNGEON_1
	EVENT_DISP $f, $3, $1 ; UNKNOWN_DUNGEON_1
	EVENT_DISP $f, $b, $3 ; UNKNOWN_DUNGEON_1

