PlateauMons3: 
	db $0F
	IF !_YELLOW
		db 24,MACHOP
		db 26,GEODUDE
		db 22,ZUBAT
		db 42,ONIX
		db 40,VENOMOTH
		db 45,ONIX
		db 43,GRAVELER
		db 41,GOLBAT
		db 42,MACHOKE
		db 45,MACHOKE
	ENDC
	
	IF _YELLOW
		db 36,GEODUDE
		db 44,GOLBAT
		db 41,GEODUDE
		db 49,ONIX
		db 46,GEODUDE
		db 41,GRAVELER
		db 42,MACHOKE
		db 45,MACHOKE
		db 47,GRAVELER
		db 47,GRAVELER
	ENDC
	
	db $00