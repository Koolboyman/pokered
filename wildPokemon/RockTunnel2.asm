TunnelMonsB2: 
	db $0F
	IF !_YELLOW
		db 16,ZUBAT
		db 17,ZUBAT
		db 17,GEODUDE
		db 15,MACHOP
		db 16,GEODUDE
		IF _RED || _GREEN || (_BLUE && !_JAPAN)
			db 18,ZUBAT
		ENDC
		IF (_BLUE && _JAPAN)
			db 18,DITTO
		ENDC
		db 17,MACHOP
		db 17,ONIX
		db 13,ONIX
		db 18,GEODUDE
	ENDC
	
	IF _YELLOW
		db 20,ZUBAT
		db 17,GEODUDE
		db 18,MACHOP
		db 21,ZUBAT
		db 22,ZUBAT
		db 21,GEODUDE
		db 20,MACHOP
		db 14,ONIX
		db 18,ONIX
		db 22,ONIX
	ENDC
	
	db $00

