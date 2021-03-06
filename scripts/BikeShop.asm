BikeShopScript: ; 1d73c (7:573c)
	jp EnableAutoTextBoxDrawing
	
BikeShopTextPointers: ; 1d73f (7:573f)
	dw BikeShopText1
	dw BikeShopText2
	dw BikeShopText3

BikeShopText1: ; 1d745 (7:5745)
	db $08 ; asm
	ld a, [$d75f]
	bit 0, a
	jr z, .asm_260d4 ; 0x1d74b
	ld hl, UnnamedText_1d82f
	call PrintText
	jp .Done
.asm_260d4 ; 0x1d756
	ld b, BIKE_VOUCHER
	call IsItemInBag
	jr z, .asm_41190 ; 0x1d75b
	ld hl, UnnamedText_1d81f
	call PrintText
	ld bc, (BICYCLE << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a, BIKE_VOUCHER
	ldh [$db], a
	ld b, BANK(RemoveItemByID)
	ld hl, RemoveItemByID
	call Bankswitch
	ld hl, $d75f
	set 0, [hl]
	ld hl, UnnamedText_1d824
	call PrintText
	jr .Done
.BagFull
	ld hl, UnnamedText_1d834
	call PrintText
	jr .Done
.asm_41190 ; 0x1d78c
	ld hl, UnnamedText_1d810
	call PrintText
	xor a
	ld [$cc26], a
	ld [$cc2a], a
	ld a, $3
	ld [$cc29], a
	ld a, $1
	ld [$cc28], a
	ld a, $2
	ld [$cc24], a
	ld a, $1
	ld [$cc25], a
	ld hl, $d730
	set 6, [hl]
	ld hl, wTileMap
	ld b, $4
	ld c, $f
	call TextBoxBorder
	call UpdateSprites
	FuncCoord 2, 2 ; $c3ca
	ld hl, Coord
	ld de, BikeShopMenuText
	call PlaceString
	FuncCoord 8, 3 ; $c3e4
	ld hl, Coord
	ld de, BikeShopMenuPrice
	call PlaceString
	ld hl, UnnamedText_1d815
	call PrintText
	call HandleMenuInput
	bit 1, a
	jr nz, .asm_b7579 ; 0x1d7dc
	ld hl, $d730
	res 6, [hl]
	ld a, [$cc26]
	and a
	jr nz, .asm_b7579 ; 0x1d7e7
	ld hl, UnnamedText_1d81a
	call PrintText
.asm_b7579 ; 0x1d7ef
	ld hl, UnnamedText_1d82a
	call PrintText
.Done
	jp TextScriptEnd

BikeShopMenuText: ; 1d7f8 (7:57f8)
	db   "BICYCLE"
	next "CANCEL@"

BikeShopMenuPrice: ; 1d807 (7:5807)
	db "¥1000000@"

UnnamedText_1d810: ; 1d810 (7:5810)
	TX_FAR _UnnamedText_1d810
	db "@"

UnnamedText_1d815: ; 1d815 (7:5815)
	TX_FAR _UnnamedText_1d815
	db "@"

UnnamedText_1d81a: ; 1d81a (7:581a)
	TX_FAR _UnnamedText_1d81a
	db "@"

UnnamedText_1d81f: ; 1d81f (7:581f)
	TX_FAR _UnnamedText_1d81f
	db "@"

UnnamedText_1d824: ; 1d824 (7:5824)
	TX_FAR _UnnamedText_1d824 ; 0x98eb2
	db $11, "@"

UnnamedText_1d82a: ; 1d82a (7:582a)
	TX_FAR _UnnamedText_1d82a
	db "@"

UnnamedText_1d82f: ; 1d82f (7:582f)
	TX_FAR _UnnamedText_1d82f
	db "@"

UnnamedText_1d834: ; 1d834 (7:5834)
	TX_FAR _UnnamedText_1d834
	db "@"

BikeShopText2: ; 1d839 (7:5839)
	db $08 ; asm
	ld hl, UnnamedText_1d843
	call PrintText
	jp TextScriptEnd

UnnamedText_1d843: ; 1d843 (7:5843)
	TX_FAR _UnnamedText_1d843
	db "@"

BikeShopText3: ; 1d848 (7:5848)
	db $08 ; asm
	ld a, [$d75f]
	bit 0, a
	ld hl, UnnamedText_1d861
	jr nz, .asm_34d2d ; 0x1d851
	ld hl, UnnamedText_1d85c
.asm_34d2d ; 0x1d856
	call PrintText
	jp TextScriptEnd

UnnamedText_1d85c: ; 1d85c (7:585c)
	TX_FAR _UnnamedText_1d85c
	db "@"

UnnamedText_1d861: ; 1d861 (7:5861)
	TX_FAR _UnnamedText_1d861
	db "@"
	


