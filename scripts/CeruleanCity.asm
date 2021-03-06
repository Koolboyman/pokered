CeruleanCityScript: ; 19480 (6:5480)
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCityScriptPointers
	ld a, [W_CERULEANCITYCURSCRIPT]
	jp CallFunctionInTable

CeruleanCityScript_1948c: ; 1948c (6:548c)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_CERULEANCITYCURSCRIPT], a
	ld a, $5
	ld [$cc4d], a
	ld a, $11
	jp Predef

CeruleanCityScriptPointers: ; 1949d (6:549d)
	dw CeruleanCityScript0
	dw CeruleanRivalEncounter
	dw CeruleanCityScript2
	dw CeruleanCityScript3
	dw CeruleanCityScript4

CeruleanCityScript4: ; 194a7 (6:54a7)
	ld a, [W_ISINBATTLE]
	cp $ff
	jp z, CeruleanCityScript_1948c
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d75b
	set 7, [hl]
	ld a, $2
	ld [$ff00+$8c], a
	call DisplayTextID
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityScript0: ; 194c8 (6:54c8)
	ld a, [$d75b]
	bit 7, a
	jr nz, .CeruleanCheckRival ; 0x194cd $28
	ld hl, CeruleanCityCoords1
	call ArePlayerCoordsInArray
	jr nc, .CeruleanCheckRival ; 0x194d5 $20
	ld a, [$cd3d]
	cp $1
	ld a, $8
	ld b, $0
	jr nz, .asm_194e6 ; 0x194e0 $4
	ld a, $4
	ld b, $4
.asm_194e6
	ld [$d528], a
	ld a, b
	ld [$c129], a
	call Delay3
	ld a, $2
	ld [$ff00+$8c], a
	jp DisplayTextID
.CeruleanCheckRival
	ld a, [$d75a]
	bit 0, a
	ret nz
	ld hl, CeruleanCityCoords2
	call ArePlayerCoordsInArray
	ret nc
	ld a, [$d700]
	and a
	jr z, .CeruleanRivalApproaches ; 0x19508 $8
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
.CeruleanRivalApproaches
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld a, [$d362]
	cp $14
	jr z, .asm_19535 ; 0x19526 $d
	ld a, $1
	ld [$ff00+$8c], a
	ld a, $5
	ld [$ff00+$8b], a
	call Func_3500
	ld [hl], $19
.asm_19535
	ld a, $5
	ld [$cc4d], a
	ld a, $15
	call Predef
	ld de, CeruleanCityMovement1
	ld a, $1
	ld [$ff00+$8c], a
	call MoveSprite
	ld a, $1
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityCoords1: ; 1954f (6:554f)
	db $07,$1e
	db $09,$1e
	db $ff

CeruleanCityCoords2: ; 19554 (6:5554)
	db $06,$14
	db $06,$15
	db $ff

CeruleanCityMovement1: ; 19559 (6:5559)
	db $00,$00,$00,$FF

CeruleanCityScript_1955d: ; 1955d (6:555d)
	ld a,1
	ld [$ff8c],a
	xor a
	ld [$ff8d],a
	jp Func_34a6 ; face object

CeruleanRivalEncounter: ; 19567 (6:5567)
	ld a, [$d730]
	bit 0, a
	ret nz
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_1966d
	ld de, UnnamedText_19672
	call PreBattleSaveRegisters
	ld a, $e1
	ld [$d059], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp SQUIRTLE
	jr nz, .NotSquirtle ; 0x19592 $4
	ld a, $7
	jr .done
.NotSquirtle
	cp BULBASAUR
	jr nz, .Charmander ; 0x1959a $4
	ld a, $8
	jr .done
.Charmander
	ld a, $9
.done
	ld [W_TRAINERNO], a

	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	call CeruleanCityScript_1955d
	ld a, $2
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityScript2: ; 195b1 (6:55b1)
	ld a, [$d057]
	cp $ff
	jp z, CeruleanCityScript_1948c
	call CeruleanCityScript_1955d
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d75a
	set 0, [hl]
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateStart)
	ld hl, Music_RivalAlternateStart
	call Bankswitch
	ld a, $1
	ld [$ff00+$8c], a
	call SetSpriteMovementBytesToFF
	ld a, [$d362]
	cp $14
	jr nz, .asm_195f0 ; 0x195e9 $5
	ld de, CeruleanCityMovement4
	jr .asm_195f3 ; 0x195ee $3
.asm_195f0
	ld de, CeruleanCityMovement3
.asm_195f3
	ld a, $1
	ld [$ff00+$8c], a
	call MoveSprite
	ld a, $3
	ld [W_CERULEANCITYCURSCRIPT], a
	ret

CeruleanCityMovement3: ; 19600 (6:5600)
	db $80,$00,$00,$00,$00,$00,$00,$FF

CeruleanCityMovement4: ; 19608 (6:5608)
	db $c0,$00,$00,$00,$00,$00,$00,$FF

CeruleanCityScript3: ; 19610 (6:5610)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, $5
	ld [$cc4d], a
	ld a, $11
	call Predef
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	call Func_2307
	ld a, $0
	ld [W_CERULEANCITYCURSCRIPT], a
	ret
	
CeruleanCityTextPointers: ; 1962d (6:562d)
	dw CeruleanCityText1
	dw CeruleanCityText2
	dw CeruleanCityText3
	dw CeruleanCityText4
	dw CeruleanCityText5
	dw CeruleanCityText6
	dw CeruleanCityText7
	dw CeruleanCityText8
	dw CeruleanCityText9
	dw CeruleanCityText10
	dw CeruleanCityText11
	dw CeruleanCityText12
	dw CeruleanCityText13
	dw MartSignText
	dw PokeCenterSignText
	dw CeruleanCityText16
	dw CeruleanCityText17

CeruleanCityText1: ; 1964f (6:564f)
	db $08 ; asm
	ld a, [$d75a] ; rival battle flag
	bit 0, a
	; do pre-battle text
	jr z, .PreBattleText
	; or talk about bill
	ld hl, UnnamedText_19677
	call PrintText
	jr .end ; 0x1965d
.PreBattleText ; 0x1965f
	ld hl, UnnamedText_19668
	call PrintText
.end ; 0x19665
	jp TextScriptEnd

UnnamedText_19668: ; 19668 (6:5668)
	TX_FAR _UnnamedText_19668
	db "@"

UnnamedText_1966d: ; 1966d (6:566d)
	TX_FAR _UnnamedText_1966d
	db "@"

UnnamedText_19672: ; 19672 (6:5672)
	TX_FAR _UnnamedText_19672
	db "@"

UnnamedText_19677: ; 19677 (6:5677)
	TX_FAR _UnnamedText_19677
	db "@"

CeruleanCityText2: ; 1967c (6:567c)
	db $8
	ld a, [$d75b]
	bit 7, a
	jr nz, .asm_4ca20 ; 0x19682 $29
	ld hl, UnnamedText_196d9
	call PrintText
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_196ee
	ld de, UnnamedText_196ee
	call PreBattleSaveRegisters
	ld a, [$ff00+$8c]
	ld [$cf13], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $4
	ld [W_CERULEANCITYCURSCRIPT], a
	jp TextScriptEnd
.asm_4ca20 ; 0x196ad
	ld hl, UnnamedText_196f3
	call PrintText
	ld bc, $e401
	call GiveItem
	jr c, .Success
	ld hl, TM28NoRoomText
	call PrintText
	jr .Done
.Success
	ld a, $1
	ld [$cc3c], a
	ld hl, ReceivedTM28Text
	call PrintText
	ld b, BANK(Func_74872)
	ld hl, Func_74872
	call Bankswitch
.Done
	jp TextScriptEnd

UnnamedText_196d9: ; 196d9 (6:56d9)
	TX_FAR _UnnamedText_196d9
	db "@"

ReceivedTM28Text: ; 196de (6:56de)
	TX_FAR _ReceivedTM28Text ; 0xa4f82
	db $0B
	TX_FAR _ReceivedTM28Text2 ; 0xa4f96
	db $0D, "@"

TM28NoRoomText: ; 196e9 (6:56e9)
	TX_FAR _TM28NoRoomText
	db "@"

UnnamedText_196ee: ; 196ee (6:56ee)
	TX_FAR _UnnamedText_196ee
	db "@"

UnnamedText_196f3: ; 196f3 (6:56f3)
	TX_FAR _UnnamedText_196f3
	db "@"

CeruleanCityText3: ; 196f8 (6:56f8)
	TX_FAR _CeruleanCityText3
	db "@"

CeruleanCityText4: ; 196fd (6:56fd)
	TX_FAR _CeruleanCityText4
	db "@"

CeruleanCityText5: ; 19702 (6:5702)
	TX_FAR _CeruleanCityText5
	db "@"

CeruleanCityText11: ; 19707 (6:5707)
CeruleanCityText6: ; 19707 (6:5707)
	TX_FAR _CeruleanCityText6
	db "@"

CeruleanCityText7: ; 1970c (6:570c)
	db $08 ; asm
	ldh a, [$d3]
	cp $b4
	jr c, .asm_e9fc9 ; 0x19711
	ld hl, UnnamedText_19730
	call PrintText
	jr .asm_d486e ; 0x19719
.asm_e9fc9 ; 0x1971b
	cp $64
	jr c, .asm_df99b ; 0x1971d
	ld hl, UnnamedText_19735
	call PrintText
	jr .asm_d486e ; 0x19725
.asm_df99b ; 0x19727
	ld hl, UnnamedText_1973a
	call PrintText
.asm_d486e ; 0x1972d
	jp TextScriptEnd

UnnamedText_19730: ; 19730 (6:5730)
	TX_FAR _UnnamedText_19730
	db "@"

UnnamedText_19735: ; 19735 (6:5735)
	TX_FAR _UnnamedText_19735
	db "@"

UnnamedText_1973a: ; 1973a (6:573a)
	TX_FAR _UnnamedText_1973a
	db "@"

CeruleanCityText8: ; 1973f (6:573f)
	db $08 ; asm
	ldh a, [$d3]
	cp $b4
	jr c, .asm_e28da ; 0x19744
	ld hl, UnnamedText_1976f
	call PrintText
	jr .asm_f2f38 ; 0x1974c
.asm_e28da ; 0x1974e
	cp $78
	jr c, .asm_15d08 ; 0x19750
	ld hl, UnnamedText_19774
	call PrintText
	jr .asm_f2f38 ; 0x19758
.asm_15d08 ; 0x1975a
	cp $3c
	jr c, .asm_d7fea ; 0x1975c
	ld hl, UnnamedText_19779
	call PrintText
	jr .asm_f2f38 ; 0x19764
.asm_d7fea ; 0x19766
	ld hl, UnnamedText_1977e
	call PrintText
.asm_f2f38 ; 0x1976c
	jp TextScriptEnd

UnnamedText_1976f: ; 1976f (6:576f)
	TX_FAR _UnnamedText_1976f
	db "@"

UnnamedText_19774: ; 19774 (6:5774)
	TX_FAR _UnnamedText_19774
	db "@"

UnnamedText_19779: ; 19779 (6:5779)
	TX_FAR _UnnamedText_19779
	db "@"

UnnamedText_1977e: ; 1977e (6:577e)
	TX_FAR _UnnamedText_1977e
	db "@"

CeruleanCityText9: ; 19783 (6:5783)
	TX_FAR _CeruleanCityText9
	db "@"

CeruleanCityText10: ; 19788 (6:5788)
	TX_FAR _CeruleanCityText10
	db "@"

CeruleanCityText12: ; 1978d (6:578d)
	TX_FAR _CeruleanCityText12
	db "@"

CeruleanCityText13: ; 19792 (6:5792)
	TX_FAR _CeruleanCityText13
	db "@"

CeruleanCityText16: ; 19797 (6:5797)
	TX_FAR _CeruleanCityText16
	db "@"

CeruleanCityText17: ; 1979c (6:579c)
	TX_FAR _CeruleanCityText17
	db "@"



