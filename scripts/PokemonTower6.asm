PokemonTower6Script: ; 60aef (18:4aef)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower6TrainerHeaders
	ld de, PokemonTower6ScriptPointers
	ld a, [W_POKEMONTOWER6CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ret

Func_60b02: ; 60b02 (18:4b02)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower6ScriptPointers: ; 60b0d (18:4b0d)
	dw PokemonTower6Script0
	dw Func_324c
	dw EndTrainerBattle
	dw PokemonTower6Script3
	dw PokemonTower6Script4

PokemonTower6Script0: ; 60b17 (18:4b17)
	ld a, [$d768]
	bit 7, a
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_60b45 ; $4b45
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld a, $91
	ld [W_CUROPPONENT], a ; $d059
	ld a, $1e
	ld [W_CURENEMYLVL], a ; $d127
	ld a, $4
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

CoordsData_60b45: ; 60b45 (18:4b45)
	db $10,$0A,$FF

PokemonTower6Script4: ; 60b48 (18:4b48)
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_60b02
	ld a, $ff
	ld [wJoypadForbiddenButtonsMask], a
	ld a, [$d72d]
	bit 6, a
	ret nz
	call UpdateSprites
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld a, [$cf0b]
	and a
	jr nz, .asm_60b82
	ld hl, $d768
	set 7, [hl]
	ld a, $7
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $0
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret
.asm_60b82
	ld a, $1
	ld [$cd38], a
	ld a, $10
	ld [$ccd3], a
	xor a
	ld [$c206], a
	ld [$cd3b], a
	ld hl, $d730
	set 7, [hl]
	ld a, $3
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower6Script3: ; 60ba1 (18:4ba1)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [W_POKEMONTOWER6CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower6TextPointers: ; 60bb1 (18:4bb1)
	dw PokemonTower6Text1
	dw PokemonTower6Text2
	dw PokemonTower6Text3
	dw Predef5CText
	dw Predef5CText
	dw PokemonTower6Text6
	dw PokemonTower6Text7

PokemonTower6TrainerHeaders: ; 60bbf (18:4bbf)
PokemonTower6TrainerHeader0: ; 60bbf (18:4bbf)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d768 ; flag's byte
	dw PokemonTower6BattleText1 ; 0x4c29 TextBeforeBattle
	dw PokemonTower6AfterBattleText1 ; 0x4c33 TextAfterBattle
	dw PokemonTower6EndBattleText1 ; 0x4c2e TextEndBattle
	dw PokemonTower6EndBattleText1 ; 0x4c2e TextEndBattle

PokemonTower6TrainerHeader1: ; 60bcb (18:4bcb)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d768 ; flag's byte
	dw PokemonTower6BattleText2 ; 0x4c38 TextBeforeBattle
	dw PokemonTower6AfterBattleText2 ; 0x4c42 TextAfterBattle
	dw PokemonTower6EndBattleText2 ; 0x4c3d TextEndBattle
	dw PokemonTower6EndBattleText2 ; 0x4c3d TextEndBattle

PokemonTower6TrainerHeader2: ; 60bd7 (18:4bd7)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw $d768 ; flag's byte
	dw PokemonTower6BattleText3 ; 0x4c47 TextBeforeBattle
	dw PokemonTower6AfterBattleText3 ; 0x4c51 TextAfterBattle
	dw PokemonTower6EndBattleText3 ; 0x4c4c TextEndBattle
	dw PokemonTower6EndBattleText3 ; 0x4c4c TextEndBattle

	db $ff

PokemonTower6Text1: ; 60be4 (18:4be4)
	db $08 ; asm
	ld hl, PokemonTower6TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text2: ; 60bee (18:4bee)
	db $08 ; asm
	ld hl, PokemonTower6TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text3: ; 60bf8 (18:4bf8)
	db $08 ; asm
	ld hl, PokemonTower6TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower6Text7: ; 60c02 (18:4c02)
	db $8
	ld hl, UnnamedText_60c1f
	call PrintText
	ld a, MAROWAK
	call PlayCry
	call WaitForSoundToFinish
	ld c, $1e
	call DelayFrames
	ld hl, UnnamedText_60c24
	call PrintText
	jp TextScriptEnd

UnnamedText_60c1f: ; 60c1f (18:4c1f)
	TX_FAR _UnnamedText_60c1f
	db "@"

UnnamedText_60c24: ; 60c24 (18:4c24)
	TX_FAR _UnnamedText_60c24
	db "@"

PokemonTower6BattleText1: ; 60c29 (18:4c29)
	TX_FAR _PokemonTower6BattleText1
	db "@"

PokemonTower6EndBattleText1: ; 60c2e (18:4c2e)
	TX_FAR _PokemonTower6EndBattleText1
	db "@"

PokemonTower6AfterBattleText1: ; 60c33 (18:4c33)
	TX_FAR _PokemonTower6AfterBattleText1
	db "@"

PokemonTower6BattleText2: ; 60c38 (18:4c38)
	TX_FAR _PokemonTower6BattleText2
	db "@"

PokemonTower6EndBattleText2: ; 60c3d (18:4c3d)
	TX_FAR _PokemonTower6EndBattleText2
	db "@"

PokemonTower6AfterBattleText2: ; 60c42 (18:4c42)
	TX_FAR _PokemonTower6AfterBattleText2
	db "@"

PokemonTower6BattleText3: ; 60c47 (18:4c47)
	TX_FAR _PokemonTower6BattleText3
	db "@"

PokemonTower6EndBattleText3: ; 60c4c (18:4c4c)
	TX_FAR _PokemonTower6EndBattleText3
	db "@"

PokemonTower6AfterBattleText3: ; 60c51 (18:4c51)
	TX_FAR _PokemonTower6AfterBattleText3
	db "@"

PokemonTower6Text6: ; 60c56 (18:4c56)
	TX_FAR _UnnamedText_60c56
	db "@"
	
