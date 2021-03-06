SeafoamIslands1Object: ; 0x4484f (size=72)
	db $7d ; border tile

	db $7 ; warps
	db $11, $4, $0, $ff
	db $11, $5, $0, $ff
	db $11, $1a, $1, $ff
	db $11, $1b, $1, $ff
	db $5, $7, $1, SEAFOAM_ISLANDS_2
	db $3, $19, $6, SEAFOAM_ISLANDS_2
	db $f, $17, $4, SEAFOAM_ISLANDS_2

	db $0 ; signs

	db $2 ; people
	db SPRITE_BOULDER, $a + 4, $12 + 4, $ff, $10, $1 ; person
	db SPRITE_BOULDER, $7 + 4, $1a + 4, $ff, $10, $2 ; person

	; warp-to
	EVENT_DISP $f, $11, $4
	EVENT_DISP $f, $11, $5
	EVENT_DISP $f, $11, $1a
	EVENT_DISP $f, $11, $1b
	EVENT_DISP $f, $5, $7 ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $3, $19 ; SEAFOAM_ISLANDS_2
	EVENT_DISP $f, $f, $17 ; SEAFOAM_ISLANDS_2

	; holes
	EVENT_DISP $f, $6, $11
	EVENT_DISP $f, $6, $18

