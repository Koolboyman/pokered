PokemonTower7Script: ; 60d05 (18:4d05)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7TrainerHeaders
	ld de, PokemonTower7ScriptPointers
	ld a, [W_POKEMONTOWER7CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ret

Func_60d18: ; 60d18 (18:4d18)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower7ScriptPointers: ; 60d23 (18:4d23)
	dw CheckFightingMapTrainers
	dw Func_324c
	dw PokemonTower7Script2
	dw PokemonTower7Script3
	dw PokemonTower7Script4

PokemonTower7Script2: ; 60d23 (18:4d23)
	ld hl, wFlags_0xcd60
	res 0, [hl]
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_60d18
	call EndTrainerBattle
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	call Func_60db6
	ld a, $3
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower7Script3: ; 60d56 (18:4d56)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld hl, W_MISSABLEOBJECTLIST
	ld a, [$cf13]
	ld b, a
.missableObjectsListLoop
	ld a, [hli]
	cp b            ; search for sprite ID in missing objects list
	ld a, [hli]
	jr nz, .missableObjectsListLoop
	ld [$cc4d], a   ; remove missable object
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [$cf13], a
	ld [wTrainerHeaderFlagBit], a
	ld [$da38], a
	ld a, $0
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower7Script4: ; 60d86 (18:4d86)
	ld a, $ff
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $43
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	ld a, $4
	ld [$c109], a
	ld a, $95
	ld [H_DOWNARROWBLINKCNT1], a ; $FF00+$8b
	ld a, $1
	ld [$d42f], a
	ld a, $4
	ld [$d365], a
	ld hl, $d72d
	set 3, [hl]
	ld a, $0
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

Func_60db6: ; 60db6 (18:4db6)
	ld hl, CoordsData_60de3 ; $4de3
	ld a, [$cf13]
	dec a
	swap a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [W_YCOORD] ; $d361
	ld b, a
	ld a, [W_XCOORD] ; $d362
	ld c, a
.asm_60dcb
	ld a, [hli]
	cp b
	jr nz, .asm_60dde
	ld a, [hli]
	cp c
	jr nz, .asm_60ddf
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	jp MoveSprite
.asm_60dde
	inc hl
.asm_60ddf
	inc hl
	inc hl
	jr .asm_60dcb

CoordsData_60de3: ; 60de3 (18:4de3)
	db $0C,$09
	dw MovementData_60e13
	db $0B,$0A
	dw MovementData_60e1b
	db $0B,$0B
	dw MovementData_60e22
	db $0B,$0C
	dw MovementData_60e22
	db $0A,$0C
	dw MovementData_60e28
	db $09,$0B
	dw MovementData_60e30
	db $09,$0A
	dw MovementData_60e22
	db $09,$09
	dw MovementData_60e22
	db $08,$09
	dw MovementData_60e37
	db $07,$0A
	dw MovementData_60e22
	db $07,$0B
	dw MovementData_60e22
	db $07,$0C
	dw MovementData_60e22

MovementData_60e13: ; 60e13
	db $C0,$00,$00,$00,$00,$00,$80,$FF

MovementData_60e1b: ; 60e1b
	db $00,$C0,$00,$00,$00,$00,$FF

MovementData_60e22: ; 60e22
	db $00,$00,$00,$00,$00,$FF

MovementData_60e28: ; 60e28
	db $80,$00,$00,$00,$00,$00,$00,$FF

MovementData_60e30: ; 60e30
	db $00,$00,$00,$80,$00,$00,$FF

MovementData_60e37: ; 60e37
	db $C0,$00,$00,$00,$00,$00,$00,$FF

PokemonTower7TextPointers: ; 60e3f (18:4e3f)
	dw PokemonTower7Text1
	dw PokemonTower7Text2
	dw PokemonTower7Text3
	dw PokemonTower7Text4

PokemonTower7TrainerHeaders: ; 60e47 (18:4e47)
PokemonTower7TrainerHeader0: ; 60e47 (18:4e47)
	db $1 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d769 ; flag's byte
	dw PokemonTower7BattleText1 ; 0x4ec9 TextBeforeBattle
	dw PokemonTower7AfterBattleText1 ; 0x4ed3 TextAfterBattle
	dw PokemonTower7EndBattleText1 ; 0x4ece TextEndBattle
	dw PokemonTower7EndBattleText1 ; 0x4ece TextEndBattle

PokemonTower7TrainerHeader1: ; 60e53 (18:4e53)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d769 ; flag's byte
	dw PokemonTower7BattleText2 ; 0x4ed8 TextBeforeBattle
	dw PokemonTower7AfterBattleText2 ; 0x4ee2 TextAfterBattle
	dw PokemonTower7EndBattleText2 ; 0x4edd TextEndBattle
	dw PokemonTower7EndBattleText2 ; 0x4edd TextEndBattle

PokemonTower7TrainerHeader2: ; 60e5f (18:4e5f)
	db $3 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw $d769 ; flag's byte
	dw PokemonTower7BattleText3 ; 0x4ee7 TextBeforeBattle
	dw PokemonTower7AfterBattleText3 ; 0x4ef1 TextAfterBattle
	dw PokemonTower7EndBattleText3 ; 0x4eec TextEndBattle
	dw PokemonTower7EndBattleText3 ; 0x4eec TextEndBattle

	db $ff

PokemonTower7Text1: ; 60e6c (18:4e6c)
	db $08 ; asm
	ld hl, PokemonTower7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text2: ; 60e76 (18:4e76)
	db $08 ; asm
	ld hl, PokemonTower7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text3: ; 60e80 (18:4e80)
	db $08 ; asm
	ld hl, PokemonTower7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text4: ; 60e8a (18:4e8a)
	db $08 ; asm
	ld hl, UnnamedText_60ec4
	call PrintText
	ld hl, $d7e0
	set 7, [hl]
	ld hl, $d769
	set 7, [hl]
	ld a, $44
	ld [$cc4d], a
	ld a, $15
	call Predef
	ld a, $17
	ld [$cc4d], a
	ld a, $11
	call Predef
	ld a, $18
	ld [$cc4d], a
	ld a, $15
	call Predef
	ld a, $4
	ld [W_POKEMONTOWER7CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	jp TextScriptEnd

UnnamedText_60ec4: ; 60ec4 (18:4ec4)
	TX_FAR _UnnamedText_60ec4
	db "@"

PokemonTower7BattleText1: ; 60ec9 (18:4ec9)
	TX_FAR _PokemonTower7BattleText1
	db "@"

PokemonTower7EndBattleText1: ; 60ece (18:4ece)
	TX_FAR _PokemonTower7EndBattleText1
	db "@"

PokemonTower7AfterBattleText1: ; 60ed3 (18:4ed3)
	TX_FAR _PokemonTower7AfterBattleText1
	db "@"

PokemonTower7BattleText2: ; 60ed8 (18:4ed8)
	TX_FAR _PokemonTower7BattleText2
	db "@"

PokemonTower7EndBattleText2: ; 60edd (18:4edd)
	TX_FAR _PokemonTower7EndBattleText2
	db "@"

PokemonTower7AfterBattleText2: ; 60ee2 (18:4ee2)
	TX_FAR _PokemonTower7AfterBattleText2
	db "@"

PokemonTower7BattleText3: ; 60ee7 (18:4ee7)
	TX_FAR _PokemonTower7BattleText3
	db "@"

PokemonTower7EndBattleText3: ; 60eec (18:4eec)
	TX_FAR _PokemonTower7EndBattleText3
	db "@"

PokemonTower7AfterBattleText3: ; 60ef1 (18:4ef1)
	TX_FAR _PokemonTower7AfterBattleText3
	db "@"
	
