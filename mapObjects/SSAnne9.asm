SSAnne9Object: ; 0x61c8d (size=188)
	db $c ; border tile

	db $c ; warps
	db $5, $2, $0, SS_ANNE_2
	db $5, $3, $0, SS_ANNE_2
	db $5, $c, $1, SS_ANNE_2
	db $5, $d, $1, SS_ANNE_2
	db $5, $16, $2, SS_ANNE_2
	db $5, $17, $2, SS_ANNE_2
	db $f, $2, $3, SS_ANNE_2
	db $f, $3, $3, SS_ANNE_2
	db $f, $c, $4, SS_ANNE_2
	db $f, $d, $4, SS_ANNE_2
	db $f, $16, $5, SS_ANNE_2
	db $f, $17, $5, SS_ANNE_2

	db $0 ; signs

	db $d ; people
	db SPRITE_GENTLEMAN, $2 + 4, $a + 4, $ff, $d3, $41, GENTLEMAN + $C8, $3 ; trainer
	db SPRITE_FISHER2, $4 + 4, $d + 4, $ff, $d2, $42, FISHER + $C8, $1 ; trainer
	db SPRITE_GENTLEMAN, $e + 4, $0 + 4, $ff, $d3, $43, GENTLEMAN + $C8, $5 ; trainer
	db SPRITE_LASS, $b + 4, $2 + 4, $ff, $d0, $44, LASS + $C8, $c ; trainer
	db SPRITE_GENTLEMAN, $2 + 4, $1 + 4, $ff, $d0, $5 ; person
	db SPRITE_BALL, $1 + 4, $c + 4, $ff, $ff, $86, MAX_ETHER ; item
	db SPRITE_GENTLEMAN, $2 + 4, $15 + 4, $ff, $d0, $7 ; person
	db SPRITE_OLD_PERSON, $1 + 4, $16 + 4, $ff, $d0, $8 ; person
	db SPRITE_BALL, $c + 4, $0 + 4, $ff, $ff, $89, RARE_CANDY ; item
	db SPRITE_GENTLEMAN, $c + 4, $c + 4, $ff, $d0, $a ; person
	db SPRITE_YOUNG_BOY, $e + 4, $b + 4, $ff, $ff, $b ; person
	db SPRITE_BRUNETTE_GIRL, $c + 4, $16 + 4, $ff, $d2, $c ; person
	db SPRITE_FOULARD_WOMAN, $c + 4, $14 + 4, $ff, $d3, $d ; person

	; warp-to
	EVENT_DISP $c, $5, $2 ; SS_ANNE_2
	EVENT_DISP $c, $5, $3 ; SS_ANNE_2
	EVENT_DISP $c, $5, $c ; SS_ANNE_2
	EVENT_DISP $c, $5, $d ; SS_ANNE_2
	EVENT_DISP $c, $5, $16 ; SS_ANNE_2
	EVENT_DISP $c, $5, $17 ; SS_ANNE_2
	EVENT_DISP $c, $f, $2 ; SS_ANNE_2
	EVENT_DISP $c, $f, $3 ; SS_ANNE_2
	EVENT_DISP $c, $f, $c ; SS_ANNE_2
	EVENT_DISP $c, $f, $d ; SS_ANNE_2
	EVENT_DISP $c, $f, $16 ; SS_ANNE_2
	EVENT_DISP $c, $f, $17 ; SS_ANNE_2

