LanceScript: ; 5a2ae (16:62ae)
	call LanceScript_5a2c4
	call EnableAutoTextBoxDrawing
	ld hl, LanceTrainerHeaders
	ld de, LanceScriptPointers
	ld a, [W_LANCECURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_LANCECURSCRIPT], a
	ret

LanceScript_5a2c4: ; 5a2c4 (16:62c4)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [$d866]
	bit 7, a
	jr nz, .asm_5a2da
	ld a, $31
	ld b, $32
	jp Func_5a2de
.asm_5a2da
	ld a, $72
	ld b, $73

Func_5a2de: ; 5a2de (16:62de)
	push bc
	ld [$d09f], a
	ld bc, $602
	call Func_5a2f0
	pop bc
	ld a, b
	ld [$d09f], a
	ld bc, $603

Func_5a2f0: ; 5a2f0 (16:62f0)
	ld a, $17
	jp Predef ; indirect jump to Func_ee9e (ee9e (3:6e9e))

Func_5a2f5: ; 5a2f5 (16:62f5)
	xor a
	ld [W_LANCECURSCRIPT], a
	ret

LanceScriptPointers: ; 5a2fa (16:62fa)
	dw LanceScript0
	dw Func_324c
	dw LanceScript2
	dw LanceScript3
	dw LanceScript4

LanceScript4: ; 5a304 (16:6304)
	ret

LanceScript0: ; 5a305 (16:6305)
	ld a, [$d866]
	bit 6, a
	ret nz
	ld hl, CoordsData_5a33e
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, [wWhichTrade] ; $cd3d
	cp $3
	jr nc, .asm_5a325
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	jp DisplayTextID
.asm_5a325
	cp $5
	jr z, Func_5a35b
	ld hl, $d866
	bit 7, [hl]
	set 7, [hl]
	ret nz
	ld hl, $d126
	set 5, [hl]
	ld a, $ad
	call PlaySound
	jp LanceScript_5a2c4

CoordsData_5a33e: ; 5a33e (16:633e)
	db $01,$05
	db $02,$06
	db $0B,$05
	db $0B,$06
	db $10,$18
	db $FF

LanceScript2: ; 5a349 (16:6349)
	call EndTrainerBattle
	ld a, [W_ISINBATTLE] ; $d057
	cp $ff
	jp z, Func_5a2f5
	ld a, $1
	ld [H_DOWNARROWBLINKCNT2], a ; $FF00+$8c
	jp DisplayTextID

Func_5a35b: ; 5a35b (16:635b)
	ld a, $ff
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $ccd3
	ld de, RLEList_5a379
	call DecodeRLEList
	dec a
	ld [$cd38], a
	call Func_3486
	ld a, $3
	ld [W_LANCECURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

RLEList_5a379: ; 5a379 (16:6379)
	db $40, $0C
	db $20, $0C
	db $80, $07
	db $20, $06
	db $FF

LanceScript3: ; 5a382 (16:6382)
	ld a, [$cd38]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_LANCECURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

LanceTextPointers: ; 5a395 (16:6395)
	dw LanceText1

LanceTrainerHeaders: ; 5a397 (16:6397)
LanceTrainerHeader0: ; 5a397 (16:6397)
	db $1 ; flag's bit
	db ($0 << 4) ; trainer's view range
	dw $d866 ; flag's byte
	dw LanceBeforeBattleText ; 0x63ae TextBeforeBattle
	dw LanceAfterBattleText ; 0x63b8 TextAfterBattle
	dw LanceEndBattleText ; 0x63b3 TextEndBattle
	dw LanceEndBattleText ; 0x63b3 TextEndBattle

	db $ff

LanceText1: ; 5a3a4 (16:63a4)
	db $08 ; asm
	ld hl, LanceTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LanceBeforeBattleText: ; 5a3ae (16:63ae)
	TX_FAR _LanceBeforeBattleText
	db "@"

LanceEndBattleText: ; 5a3b3 (16:63b3)
	TX_FAR _LanceEndBattleText
	db "@"

LanceAfterBattleText: ; 5a3b8 (16:63b8)
	TX_FAR _LanceAfterBattleText ; 0x85e9e
	db $8
	ld hl, $d866
	set 6, [hl]
	jp TextScriptEnd
	
