PlateauMons2: 
	db $0A
	IF !_YELLOW
		db 22,MACHOP
		db 24,GEODUDE
		db 26,ZUBAT
		db 36,ONIX
		db 39,ONIX
		db 42,ONIX
		db 41,MACHOKE
		db 40,GOLBAT
		db 40,MAROWAK
		db 43,GRAVELER
	ENDC
	
	IF _YELLOW
		db 31,GEODUDE
		db 36,GEODUDE
		db 41,GEODUDE
		db 44,ZUBAT
		db 39,GOLBAT
		db 44,GRAVELER
		db 45,ONIX
		db 47,ONIX
		db 39,MACHOKE
		db 42,MACHOKE
	ENDC
	
	db $00