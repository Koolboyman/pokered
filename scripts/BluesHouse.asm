BluesHouseScript: ; 19b3b (6:5b3b)
	call EnableAutoTextBoxDrawing
	ld hl,BluesHouseScriptPointers
	ld a,[W_BLUESHOUSECURSCRIPT]
	jp CallFunctionInTable

BluesHouseScriptPointers: ; 19b47 (6:5b47)
	dw BluesHouseScript0
	dw BluesHouseScript1

BluesHouseScript0: ; 19b4b (6:5b4b)
	ld hl,$D74A
	set 1,[hl]

	; trigger the next script
	ld a,1
	ld [W_BLUESHOUSECURSCRIPT],a
	ret

BluesHouseScript1: ; 19b56 (6:5b56)
	ret
	
BluesHouseTextPointers: ; 19b57 (6:5b57)
	dw BluesHouseText1
	dw BluesHouseText2
	dw BluesHouseText3

BluesHouseText1: ; 19b5d (6:5b5d)
	db 8
	ld a,[$D74A]
	bit 0,a
	jr nz,.GotMap
	ld a,[$D74B]
	bit 5,a
	jr nz,.GiveMap
	ld hl,DaisyInitialText
	call PrintText
	jr .done
.GiveMap
	ld hl,DaisyOfferMapText
	call PrintText
	ld bc,(TOWN_MAP << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld a,$29
	ld [$CC4D],a
	ld a,$11
	call Predef ; hide table map object
	ld hl,GotMapText
	call PrintText
	ld hl,$D74A
	set 0,[hl]
	jr .done
.GotMap
	ld hl,DaisyUseMapText
	call PrintText
	jr .done
.BagFull
	ld hl,DaisyBagFullText
	call PrintText
.done
	jp TextScriptEnd

DaisyInitialText: ; 19baa (6:5baa)
	TX_FAR _DaisyInitialText
	db "@"

DaisyOfferMapText: ; 19baf (6:5baf)
	TX_FAR _DaisyOfferMapText
	db "@"

GotMapText: ; 19bb4 (6:5bb4)
	TX_FAR _GotMapText
	db $11,"@"

DaisyBagFullText: ; 19bba (6:5bba)
	TX_FAR _DaisyBagFullText
	db "@"

DaisyUseMapText: ; 19bbf (6:5bbf)
	TX_FAR _DaisyUseMapText
	db "@"

BluesHouseText2: ; 0x19bc4 Daisy, walking around
	TX_FAR _BluesHouseText2
	db "@"

BluesHouseText3: ; 0x19bc9 map on table
	TX_FAR _BluesHouseText3
	db "@"



