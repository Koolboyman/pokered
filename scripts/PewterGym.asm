PewterGymScript: ; 5c387 (17:4387)
	ld hl, $d126
	bit 6, [hl]
	res 6, [hl]
	call nz, PewterGymScript_5c3a4
	call EnableAutoTextBoxDrawing
	ld hl, PewterGymTrainerHeaders
	ld de, PewterGymScriptPointers
	ld a, [W_PEWTERGYMCURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_PEWTERGYMCURSCRIPT], a
	ret

PewterGymScript_5c3a4: ; 5c3a4 (17:43a4)
	ld hl, Gym1CityName ; $43ad
	ld de, Gym1LeaderName ; $43b9
	jp LoadGymLeaderAndCityName

Gym1CityName: ; 5c3ad (17:43ad)
	db "PEWTER CITY@"

Gym1LeaderName: ; 5c3b9 (17:43b9)
	db "BROCK@"

Func_5c3bf: ; 5c3bf (17:43bf)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_PEWTERGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PewterGymScriptPointers: ; 5c3ca (17:43ca)
	dw CheckFightingMapTrainers
	dw Func_324c
	dw EndTrainerBattle
	dw PewterGymScript3

PewterGymScript3: ; 5c3d2 (17:43d2)
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_5c3bf
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a

Func_5c3df: ; 5c3df (17:43df)
	ld a, $4
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld hl, $d755
	set 7, [hl]
	ld bc, (TM_34 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, $5
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
	ld hl, $d755
	set 6, [hl]
	jr .asm_5c408
.BagFull
	ld a, $6
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	call DisplayTextID
.asm_5c408
	ld hl, W_OBTAINEDBADGES ; $d356
	set 0, [hl]
	ld hl, $d72a
	set 0, [hl]
	ld a, $4
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	ld a, $22
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	ld hl, $d7eb
	res 0, [hl]
	res 7, [hl]
	ld hl, $d755
	set 2, [hl]
	jp Func_5c3bf

PewterGymTextPointers: ; 5c435 (17:4435)
	dw PewterGymText1
	dw PewterGymText2
	dw PewterGymText3
	dw PewterGymText4
	dw PewterGymText5
	dw PewterGymText6

PewterGymTrainerHeaders: ; 5c441 (17:4441)
PewterGymTrainerHeader0: ; 5c441 (17:4441)
	db $2 ; flag's bit
	db ($5 << 4) ; trainer's view range
	dw $d755 ; flag's byte
	dw PewterGymBattleText1 ; 0x44d0 TextBeforeBattle
	dw PewterGymAfterBattleText1 ; 0x44da TextAfterBattle
	dw PewterGymEndBattleText1 ; 0x44d5 TextEndBattle
	dw PewterGymEndBattleText1 ; 0x44d5 TextEndBattle

	db $ff

PewterGymText1: ; 5c44e (17:444e)
	db $08 ; asm
	ld a, [$d755]
	bit 7, a
	jr z, .asm_4a735 ; 0x5c454
	bit 6, a
	jr nz, .asm_ff7d0 ; 0x5c458
	call z, Func_5c3df
	call DisableWaitingAfterTextDisplay
	jr .asm_e0ffb ; 0x5c460
.asm_ff7d0 ; 0x5c462
	ld hl, UnnamedText_5c4a3
	call PrintText
	jr .asm_e0ffb ; 0x5c468
.asm_4a735 ; 0x5c46a
	ld hl, UnnamedText_5c49e
	call PrintText
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_5c4bc
	ld de, UnnamedText_5c4bc
	call PreBattleSaveRegisters
	ldh a, [$8c]
	ld [$cf13], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $1
	ld [$d05c], a
	xor a
	ldh [$b4], a
	ld a, $3
	ld [W_PEWTERGYMCURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
.asm_e0ffb ; 0x5c49b
	jp TextScriptEnd

UnnamedText_5c49e: ; 5c49e (17:449e)
	TX_FAR _UnnamedText_5c49e
	db "@"

UnnamedText_5c4a3: ; 5c4a3 (17:44a3)
	TX_FAR _UnnamedText_5c4a3
	db "@"

PewterGymText4: ; 5c4a8 (17:44a8)
	TX_FAR _TM34PreReceiveText
	db "@"

PewterGymText5: ; 5c4ad (17:44ad)
	TX_FAR _ReceivedTM34Text ; 0x980ad
	db $0B
	TX_FAR _TM34ExplanationText ; 0x980c0
	db "@"

PewterGymText6: ; 5c4b7 (17:44b7)
	TX_FAR _TM34NoRoomText
	db "@"

UnnamedText_5c4bc: ; 5c4bc (17:44bc)
	TX_FAR _UnnamedText_5c4bc ; 0x981c9
	db $0B
	TX_FAR _UnnamedText_5c4c1 ; 0x98232
	db "@"

PewterGymText2: ; 5c4c6 (17:44c6)
	db $08 ; asm
	ld hl, PewterGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PewterGymBattleText1: ; 5c4d0 (17:44d0)
	TX_FAR _PewterGymBattleText1
	db "@"

PewterGymEndBattleText1: ; 5c4d5 (17:44d5)
	TX_FAR _PewterGymEndBattleText1
	db "@"

PewterGymAfterBattleText1: ; 5c4da (17:44da)
	TX_FAR _PewterGymAfterBattleText1
	db "@"

PewterGymText3: ; 5c4df (17:44df)
	db $08 ; asm
	ld a, [$d72a]
	bit 0, a
	jr nz, .asm_71369 ; 0x5c4e5
	ld hl, UnnamedText_5c515
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, .asm_6123a ; 0x5c4f4
	ld hl, UnnamedText_5c51a
	call PrintText
	jr .asm_d1578 ; 0x5c4fc
.asm_6123a ; 0x5c4fe
	ld hl, UnnamedText_5c524
	call PrintText
.asm_d1578 ; 0x5c504
	ld hl, UnnamedText_5c51f
	call PrintText
	jr .asm_07013 ; 0x5c50a
.asm_71369 ; 0x5c50c
	ld hl, UnnamedText_5c529
	call PrintText
.asm_07013 ; 0x5c512
	jp TextScriptEnd

UnnamedText_5c515: ; 5c515 (17:4515)
	TX_FAR _UnnamedText_5c515
	db "@"

UnnamedText_5c51a: ; 5c51a (17:451a)
	TX_FAR _UnnamedText_5c51a
	db "@"

UnnamedText_5c51f: ; 5c51f (17:451f)
	TX_FAR _UnnamedText_5c51f
	db "@"

UnnamedText_5c524: ; 5c524 (17:4524)
	TX_FAR _UnnamedText_5c524
	db "@"

UnnamedText_5c529: ; 5c529 (17:4529)
	TX_FAR _UnnamedText_5c529
	db "@"
	
