LanceObject: ; 0x5a3c5 (size=36)
	db $3 ; border tile

	db $3 ; warps
	db $10, $18, $2, AGATHAS_ROOM
	db $0, $5, $0, CHAMPIONS_ROOM
	db $0, $6, $0, CHAMPIONS_ROOM

	db $0 ; signs

	db $1 ; people
	db SPRITE_LANCE, $1 + 4, $6 + 4, $ff, $d0, $41, LANCE + $C8, $1 ; trainer

	; warp-to
	EVENT_DISP $d, $10, $18 ; AGATHAS_ROOM
	EVENT_DISP $d, $0, $5 ; CHAMPIONS_ROOM
	EVENT_DISP $d, $0, $6 ; CHAMPIONS_ROOM
