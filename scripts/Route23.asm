Route23Script: ; 511da (14:51da)
	call Func_511e9
	call EnableAutoTextBoxDrawing
	ld hl, Route23ScriptPointers
	ld a, [W_ROUTE23CURSCRIPT]
	jp CallFunctionInTable

Func_511e9: ; 511e9 (14:51e9)
	ld hl, $d126
	bit 6, [hl]
	res 6, [hl]
	ret z
	ld hl, $d7ee
	res 0, [hl]
	res 7, [hl]
	ld hl, $d813
	res 0, [hl]
	res 6, [hl]
	ld a, $7a
	ld [$cc4d], a
	ld a, $15
	call Predef ; indirect jump to AddMissableObject (f1c8 (3:71c8))
	ld a, $60
	ld [$cc4d], a
	ld a, $11
	jp Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))

Route23ScriptPointers: ; 51213 (14:5213)
	dw Route23Script0
	dw Route23Script1
	dw Route23Script2

Route23Script0: ; 51219 (14:5219)
	ld hl, YCoordsData_51255 ; $5255
	ld a, [W_YCOORD]
	ld b, a
	ld e, $0
	ld c, $7
.asm_51224
	ld a, [hli]
	cp $ff
	ret z
	inc e
	dec c
	cp b
	jr nz, .asm_51224 ; 0x5122b $f7
	cp $23
	jr nz, .asm_51237 ; 0x5122f $6
	ld a, [W_XCOORD]
	cp $e
	ret nc
.asm_51237
	ld a, e
	ld [$ff00+$8c], a
	ld a, c
	ld [$cd3d], a
	ld b, $2
	ld hl, $d7ed
	ld a, $10
	call Predef
	ld a, c
	and a
	ret nz
	call Func_5125d
	call DisplayTextID
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ret

YCoordsData_51255: ; 51255 (14:5255)
	db $23,$38,$55,$60,$69,$77,$88,$FF

Func_5125d: ; 5125d (14:525d)
	ld hl, BadgeTextPointers ; $5276
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $cd6d
.asm_5126e
	ld a, [hli]
	ld [de], a
	inc de
	cp $50
	jr nz, .asm_5126e
	ret

BadgeTextPointers: ; 51276 (14:5276)
	dw CascadeBadgeText
	dw ThunderBadgeText
	dw RainbowBadgeText
	dw SoulBadgeText
	dw MarshBadgeText
	dw VolcanoBadgeText
	dw EarthBadgeText

EarthBadgeText: ; 51284 (14:5284)
	db "EARTHBADGE@"

VolcanoBadgeText: ; 5128f (14:528f)
	db "VOLCANOBADGE@"

MarshBadgeText: ; 5129c (14:529c)
	db "MARSHBADGE@"

SoulBadgeText: ; 512a7 (14:52a7)
	db "SOULBADGE@"

RainbowBadgeText: ; 512b1 (14:52b1)
	db "RAINBOWBADGE@"

ThunderBadgeText: ; 512be (14:52be)
	db "THUNDERBADGE@"

CascadeBadgeText: ; 512cb (14:52cb)
	db "CASCADEBADGE@"

Func_512d8: ; 512d8 (14:52d8)
	ld a, $1
	ld [$cd38], a
	ld a, $80
	ld [$ccd3], a
	xor a
	ld [$c109], a
	ld [wJoypadForbiddenButtonsMask], a
	jp Func_3486

Route23Script1: ; 512ec (14:52ec)
	ld a, [$cd38]
	and a
	ret nz
Route23Script2: ; 512f1 (14:52f1)
	ld a, $0
	ld [W_ROUTE23CURSCRIPT], a
	ret

Route23TextPointers: ; 512f7 (14:52f7)
	dw Route23Text1
	dw Route23Text2
	dw Route23Text3
	dw Route23Text4
	dw Route23Text5
	dw Route23Text6
	dw Route23Text7
	dw Route23Text8

Route23Text1: ; 51307 (14:5307)
	db $08 ; asm
	ld a, $6
	call Func_51346
	jp TextScriptEnd

Route23Text2: ; 51310 (14:5310)
	db $08 ; asm
	ld a, $5
	call Func_51346
	jp TextScriptEnd

Route23Text3: ; 51319 (14:5319)
	db $08 ; asm
	ld a, $4
	call Func_51346
	jp TextScriptEnd

Route23Text4: ; 51322 (14:5322)
	db $08 ; asm
	ld a, $3
	call Func_51346
	jp TextScriptEnd

Route23Text5: ; 5132b (14:532b)
	db $08 ; asm
	ld a, $2
	call Func_51346
	jp TextScriptEnd

Route23Text6: ; 51334 (14:5334)
	db $08 ; asm
	ld a, $1
	call Func_51346
	jp TextScriptEnd

Route23Text7: ; 5133d (14:533d)
	db $8
	ld a, $0
	call Func_51346
	jp TextScriptEnd

Func_51346: ; 51346 (14:5346)
	ld [wWhichTrade], a ; $cd3d
	call Func_5125d
	ld a, [wWhichTrade] ; $cd3d
	inc a
	ld c, a
	ld b, $2
	ld hl, W_OBTAINEDBADGES ; $d356
	ld a, $10
	call Predef ; indirect jump to HandleBitArray (f666 (3:7666))
	ld a, c
	and a
	jr nz, .asm_5136e
	ld hl, VictoryRoadGuardText1 ; $538e
	call PrintText
	call Func_512d8
	ld a, $1
	ld [W_ROUTE23CURSCRIPT], a
	ret
.asm_5136e
	ld hl, VictoryRoadGuardText2 ; $539e
	call PrintText
	ld a, [wWhichTrade] ; $cd3d
	ld c, a
	ld b, $1
	ld hl, $d7ed
	ld a, $10
	call Predef ; indirect jump to HandleBitArray (f666 (3:7666))
	ld a, $2
	ld [W_ROUTE23CURSCRIPT], a
	ret

Func_51388: ; 51388 (14:5388)
	ld hl, VictoryRoadGuardText2
	jp PrintText

VictoryRoadGuardText1: ; 5138e (14:538e)
	TX_FAR _VictoryRoadGuardText1
	db $08 ; asm
	ld a, $a5
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoadGuardText2: ; 5139e (14:539e)
	TX_FAR _VictoryRoadGuardText2
	db $b
	TX_FAR _UnnamedText_513a3
	db "@"

Route23Text8: ; 513a8 (14:53a8)
	TX_FAR _Route23Text8
	db "@"

