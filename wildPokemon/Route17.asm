Route17Mons: 
	db $19
	IF !_YELLOW
		db 20,SPEAROW
		db 22,SPEAROW
		db 25,RATICATE
		db 24,DODUO
		db 27,RATICATE
		db 26,DODUO
		db 28,DODUO
		db 29,RATICATE
		db 25,FEAROW
		db 27,FEAROW
	ENDC
	
	IF _YELLOW
		db 26,DODUO
		db 27,FEAROW
		db 27,DODUO
		db 28,DODUO
		db 28,PONYTA
		db 30,PONYTA
		db 29,FEAROW
		db 28,DODUO
		db 32,PONYTA
		db 29,DODRIO
	ENDC
	
	db $00