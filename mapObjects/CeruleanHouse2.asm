CeruleanHouse2Object: ; 0x74ebe (size=34)
	db $c ; border tile

	db $3 ; warps
	db $0, $2, $9, $ff
	db $7, $2, $8, $ff
	db $7, $3, $8, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_FAT_BALD_GUY, $3 + 4, $5 + 4, $ff, $d3, $1 ; person

	; warp-to
	EVENT_DISP $4, $0, $2
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $3
