Route18Mons: 
	db $19
	IF !_YELLOW
		db 20,SPEAROW
		db 22,SPEAROW
		db 25,RATICATE
		db 24,DODUO
		db 25,FEAROW
		db 26,DODUO
		db 28,DODUO
		db 29,RATICATE
		db 27,FEAROW
		db 29,FEAROW
	ENDC
	
	IF _YELLOW
		db 22,SPEAROW
		db 22,DODUO
		db 23,RATTATA
		db 24,DODUO
		db 24,RATTATA
		db 26,DODUO
		db 23,SPEAROW
		db 24,FEAROW
		db 25,RATICATE
		db 26,RATICATE
	ENDC
	
	db $00