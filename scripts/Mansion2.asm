Mansion2Script: ; 51fd8 (14:5fd8)
	call Mansion2Script_51fee
	call EnableAutoTextBoxDrawing
	ld hl, Mansion2TrainerHeaders
	ld de, Mansion2ScriptPointers
	ld a, [W_MANSION2CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_MANSION2CURSCRIPT], a
	ret

Mansion2Script_51fee: ; 51fee (14:5fee)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [$d796]
	bit 0, a
	jr nz, .asm_52016
	ld a, $e
	ld bc, $204
	call Func_5202f
	ld a, $54
	ld bc, $409
	call Func_5202f
	ld a, $5f
	ld bc, $b03
	call Func_5202f
	ret
.asm_52016
	ld a, $5f
	ld bc, $204
	call Func_5202f
	ld a, $e
	ld bc, $409
	call Func_5202f
	ld a, $e
	ld bc, $b03
	call Func_5202f
	ret

Func_5202f: ; 5202f (14:602f)
	ld [$d09f], a
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

Func_52037: ; 52037 (14:6037)
	ld a, [$c109]
	cp $4
	ret nz
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $5
	ld [H_SPRITEHEIGHT], a
	jp DisplayTextID

Mansion2ScriptPointers: ; 52047 (14:6047)
	dw CheckFightingMapTrainers
	dw Func_324c
	dw EndTrainerBattle

Mansion2TextPointers: ; 5204d (14:604d)
	dw Mansion2Text1
	dw Predef5CText
	dw Mansion2Text3
	dw Mansion2Text4
	dw Mansion2Text5

Mansion2TrainerHeaders: ; 52057 (14:6057)
Mansion2TrainerHeader0: ; 52057 (14:6057)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw $d847 ; flag's byte
	dw Mansion2BattleText1 ; 0x606e TextBeforeBattle
	dw Mansion2AfterBattleText1 ; 0x6078 TextAfterBattle
	dw Mansion2EndBattleText1 ; 0x6073 TextEndBattle
	dw Mansion2EndBattleText1 ; 0x6073 TextEndBattle

	db $ff

Mansion2Text1: ; 52064 (14:6064)
	db $08 ; asm
	ld hl, Mansion2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion2BattleText1: ; 5206e (14:606e)
	TX_FAR _Mansion2BattleText1
	db "@"

Mansion2EndBattleText1: ; 52073 (14:6073)
	TX_FAR _Mansion2EndBattleText1
	db "@"

Mansion2AfterBattleText1: ; 52078 (14:6078)
	TX_FAR _Mansion2AfterBattleText1
	db "@"

Mansion2Text3: ; 5207d (14:607d)
	TX_FAR _Mansion2Text3
	db "@"

Mansion2Text4: ; 52082 (14:6082)
	TX_FAR _Mansion2Text4
	db "@"

Mansion3Text6: ; 52087 (14:6087)
Mansion2Text5: ; 52087 (14:6087)
	db $8
	ld hl, UnnamedText_520c2
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, .asm_520b9 ; 0x52095 $22
	ld a, $1
	ld [$cc3c], a
	ld hl, $d126
	set 5, [hl]
	ld hl, UnnamedText_520c7
	call PrintText
	ld a, $ad
	call PlaySound
	ld hl, $d796
	bit 0, [hl]
	set 0, [hl]
	jr z, .asm_520bf ; 0x520b3 $a
	res 0, [hl]
	jr .asm_520bf ; 0x520b7 $6
.asm_520b9
	ld hl, UnnamedText_520cc
	call PrintText
.asm_520bf
	jp TextScriptEnd

UnnamedText_520c2: ; 520c2 (14:60c2)
	TX_FAR _UnnamedText_520c2
	db "@"

UnnamedText_520c7: ; 520c7 (14:60c7)
	TX_FAR _UnnamedText_520c7
	db "@"

UnnamedText_520cc: ; 520cc (14:60cc)
	TX_FAR _UnnamedText_520cc
	db "@"
	
