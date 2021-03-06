Mansion1Object: ; 0x443a4 (size=90)
	db $2e ; border tile

	db $8 ; warps
	db $1b, $4, $0, $ff
	db $1b, $5, $0, $ff
	db $1b, $6, $0, $ff
	db $1b, $7, $0, $ff
	db $a, $5, $0, MANSION_2
	db $17, $15, $0, MANSION_4
	db $1b, $1a, $0, $ff
	db $1b, $1b, $0, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_OAK_AIDE, $11 + 4, $11 + 4, $ff, $d2, $41, SCIENTIST + $C8, $4 ; trainer
	db SPRITE_BALL, $3 + 4, $e + 4, $ff, $ff, $82, ESCAPE_ROPE ; item
	db SPRITE_BALL, $15 + 4, $12 + 4, $ff, $ff, $83, CARBOS ; item

	; warp-to
	EVENT_DISP $f, $1b, $4
	EVENT_DISP $f, $1b, $5
	EVENT_DISP $f, $1b, $6
	EVENT_DISP $f, $1b, $7
	EVENT_DISP $f, $a, $5 ; MANSION_2
	EVENT_DISP $f, $17, $15 ; MANSION_4
	EVENT_DISP $f, $1b, $1a
	EVENT_DISP $f, $1b, $1b

