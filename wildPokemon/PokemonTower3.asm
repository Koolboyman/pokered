TowerMons3: 
	db $0A
	
	IF !_YELLOW
		db 20,GASTLY
		db 21,GASTLY
		db 22,GASTLY
		db 23,GASTLY
		db 19,GASTLY
		db 18,GASTLY
		db 24,GASTLY
		db 20,CUBONE
		db 22,CUBONE
		db 25,HAUNTER
	ENDC
	
	IF _YELLOW
		db 20,GASTLY
		db 21,GASTLY
		db 22,GASTLY
		db 23,GASTLY
		db 24,GASTLY
		db 19,GASTLY
		db 18,GASTLY
		db 25,GASTLY
		db 20,HAUNTER
		db 25,HAUNTER
	ENDC
	
	db $00