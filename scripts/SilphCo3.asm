SilphCo3Script: ; 59f5b (16:5f5b)
	call SilphCo3Script_59f71
	call EnableAutoTextBoxDrawing
	ld hl, SilphCo3TrainerHeaders
	ld de, SilphCo3ScriptPointers
	ld a, [W_SILPHCO3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SILPHCO3CURSCRIPT], a
	ret

SilphCo3Script_59f71: ; 59f71 (16:5f71)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, DataTable_59fa8 ; $5fa8
	call Func_59d43
	call Func_59fad
	ld a, [$d828]
	bit 0, a
	jr nz, .asm_59f98
	push af
	ld a, $5f
	ld [$d09f], a
	ld bc, $404
	ld a, $17
	call Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))
	pop af
.asm_59f98
	bit 1, a
	ret nz
	ld a, $5f
	ld [$d09f], a
	ld bc, $408
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

DataTable_59fa8: ; 59fa8 (16:5fa8)
	db $04,$04,$04,$08,$FF

Func_59fad: ; 59fad (16:5fad)
	ld hl, $d828
	ld a, [$FF00+$e0]
	and a
	ret z
	cp $1
	jr nz, .asm_59fbb
	set 0, [hl]
	ret
.asm_59fbb
	set 1, [hl]
	ret

SilphCo3ScriptPointers: ; 59fbe (16:5fbe)
	dw CheckFightingMapTrainers
	dw Func_324c
	dw EndTrainerBattle

SilphCo3TextPointers: ; 59fc4 (16:5fc4)
	dw SilphCo3Text1
	dw SilphCo3Text2
	dw SilphCo3Text3
	dw Predef5CText

SilphCo3TrainerHeaders: ; 59fcc (16:5fcc)
SilphCo3TrainerHeader0: ; 59fcc (16:5fcc)
	db $2 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw $d827 ; flag's byte
	dw SilphCo3BattleText1 ; 0x600d TextBeforeBattle
	dw SilphCo3AfterBattleText1 ; 0x6017 TextAfterBattle
	dw SilphCo3EndBattleText1 ; 0x6012 TextEndBattle
	dw SilphCo3EndBattleText1 ; 0x6012 TextEndBattle

SilphCo3TrainerHeader1: ; 59fd8 (16:5fd8)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d827 ; flag's byte
	dw SilphCo3BattleText2 ; 0x6026 TextBeforeBattle
	dw SilphCo3AfterBattleText2 ; 0x6030 TextAfterBattle
	dw SilphCo3EndBattleText2 ; 0x602b TextEndBattle
	dw SilphCo3EndBattleText2 ; 0x602b TextEndBattle

	db $ff

SilphCo3Text1: ; 59fe5 (16:5fe5)
	db $08 ; asm
	ld a, [$d838]
	bit 7, a
	ld hl, UnnamedText_59ffe
	jr nz, asm_8c56f ; 0x59fee
	ld hl, UnnamedText_59ff9
asm_8c56f ; 0x59ff3
	call PrintText
	jp TextScriptEnd

UnnamedText_59ff9: ; 59ff9 (16:5ff9)
	TX_FAR _UnnamedText_59ff9
	db "@"

UnnamedText_59ffe: ; 59ffe (16:5ffe)
	TX_FAR _UnnamedText_59ffe
	db "@"

SilphCo3Text2: ; 5a003 (16:6003)
	db $08 ; asm
	ld hl, SilphCo3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText1: ; 5a00d (16:600d)
	TX_FAR _SilphCo3BattleText1
	db "@"

SilphCo3EndBattleText1: ; 5a012 (16:6012)
	TX_FAR _SilphCo3EndBattleText1
	db "@"

SilphCo3AfterBattleText1: ; 5a017 (16:6017)
	TX_FAR _SilphCo3AfterBattleText1
	db "@"

SilphCo3Text3: ; 5a01c (16:601c)
	db $08 ; asm
	ld hl, SilphCo3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SilphCo3BattleText2: ; 5a026 (16:6026)
	TX_FAR _SilphCo3BattleText2
	db "@"

SilphCo3EndBattleText2: ; 5a02b (16:602b)
	TX_FAR _SilphCo3EndBattleText2
	db "@"

SilphCo3AfterBattleText2: ; 5a030 (16:6030)
	TX_FAR _SilphCo3AfterBattleText2
	db "@"
	
