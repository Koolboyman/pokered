Route24Mons: 
	db $19
	
	IF _RED
		db 7,WEEDLE
		db 8,KAKUNA
		db 12,PIDGEY
		db 12,ODDISH
		db 13,ODDISH
		db 10,ABRA
		db 14,ODDISH
		db 13,PIDGEY
		db 8,ABRA
		db 12,ABRA
	ENDC
	
	IF _GREEN || !_JAPAN && _BLUE
		db 7,CATERPIE
		db 8,METAPOD
		db 12,PIDGEY
		db 12,BELLSPROUT
		db 13,BELLSPROUT
		db 10,ABRA
		db 14,BELLSPROUT
		db 13,PIDGEY
		db 8,ABRA
		db 12,ABRA
	ENDC
	
	IF _JAPAN && _BLUE
		db 7,CATERPIE
		db 8,METAPOD
		db 12,PIDGEY
		db 12,ODDISH
		db 13,ODDISH
		db 10,ABRA
		db 14,ODDISH
		db 13,PIDGEY
		db 8,ABRA
		db 12,ABRA
	ENDC
	
	IF _YELLOW
		db 12,ODDISH
		db 12,BELLSPROUT
		db 13,PIDGEY
		db 14,ODDISH
		db 14,BELLSPROUT
		db 15,PIDGEY
		db 13,VENONAT
		db 16,VENONAT
		db 17,PIDGEY
		db 17,PIDGEOTTO
	ENDC
	
	db $00