UnknownDungeon1Object: ; 0x74d15 (size=97)
	db $7d ; border tile

	db $9 ; warps
	db $11, $18, $6, $ff
	db $11, $19, $6, $ff
	db $1, $1b, $0, UNKNOWN_DUNGEON_2
	db $7, $17, $1, UNKNOWN_DUNGEON_2
	db $9, $12, $2, UNKNOWN_DUNGEON_2
	db $1, $7, $3, UNKNOWN_DUNGEON_2
	db $3, $1, $4, UNKNOWN_DUNGEON_2
	db $b, $3, $5, UNKNOWN_DUNGEON_2
	db $6, $0, $0, UNKNOWN_DUNGEON_3

	db $0 ; signs

	db $3 ; people
	db SPRITE_BALL, $d + 4, $7 + 4, $ff, $ff, $81, FULL_RESTORE ; item
	db SPRITE_BALL, $3 + 4, $13 + 4, $ff, $ff, $82, MAX_ELIXER ; item
	db SPRITE_BALL, $0 + 4, $5 + 4, $ff, $ff, $83, NUGGET ; item

	; warp-to
	EVENT_DISP $f, $11, $18
	EVENT_DISP $f, $11, $19
	EVENT_DISP $f, $1, $1b ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $7, $17 ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $9, $12 ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $1, $7 ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $3, $1 ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $b, $3 ; UNKNOWN_DUNGEON_2
	EVENT_DISP $f, $6, $0 ; UNKNOWN_DUNGEON_3
