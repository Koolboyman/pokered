MansionMons1: 
	db $0A
	IF _RED
		db 32,KOFFING
		db 30,KOFFING
		db 34,PONYTA
		db 30,PONYTA
		db 34,GROWLITHE
		db 32,PONYTA
		db 30,GRIMER
		db 28,PONYTA
		db 37,WEEZING
		db 39,MUK
	ENDC
	
	IF _GREEN || _BLUE
		db 32,GRIMER
		db 30,GRIMER
		db 34,PONYTA
		db 30,PONYTA
		db 34,VULPIX
		db 32,PONYTA
		db 30,KOFFING
		db 28,PONYTA
		db 37,MUK
		db 39,WEEZING
	ENDC
	
	IF _YELLOW
		db 34,RATTATA
		db 34,RATICATE
		db 23,GRIMER
		db 26,GROWLITHE
		db 37,RATTATA
		db 37,RATICATE
		db 30,GROWLITHE
		db 26,GRIMER
		db 34,GROWLITHE
		db 38,GROWLITHE
	ENDC
	
	db $00