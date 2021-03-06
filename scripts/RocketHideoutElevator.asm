RocketHideoutElevatorScript: ; 45710 (11:5710)
	ld hl, $d126
	bit 5, [hl]
	res 5, [hl]
	push hl
	call nz, RocketHideoutElevatorScript_4572c
	pop hl
	bit 7, [hl]
	res 7, [hl]
	call nz, Func_4575f
	xor a
	ld [$cf0c], a
	inc a
	ld [$cc3c], a
	ret

RocketHideoutElevatorScript_4572c: ; 4572c (11:572c)
	ld hl, $d3af
	ld a, [$d73b]
	ld b, a
	ld a, [$d73c]
	ld c, a
	call RocketHideoutElevatorScript_4573a

RocketHideoutElevatorScript_4573a: ; 4573a (11:573a)
	inc hl
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

RocketHideoutElevatorScript_45741: ; 45741 (11:5741)
	ld hl, RocketHideoutElavatorFloors ; $5754
	call LoadItemList
	ld hl, RocketHideoutElevatorWarpMaps ; $5759
	ld de, $cc5b
	ld bc, $0006
	call CopyData
	ret

RocketHideoutElavatorFloors: ; 45754 (11:5754)
	db $03 ; num elements in list
	db $55, $54, $61 ; "B1F", "B2F", "B4F"
	db $FF ; terminator

RocketHideoutElevatorWarpMaps: ; 45759 (11:5759)
; first byte is warp number
; second byte is map number
; These specify where the player goes after getting out of the elevator.
	db $04, ROCKET_HIDEOUT_1
	db $04, ROCKET_HIDEOUT_2
	db $02, ROCKET_HIDEOUT_4

Func_4575f: ; 4575f (11:575f)
	call Delay3
	ld b, BANK(Func_7bf15)
	ld hl, Func_7bf15
	call Bankswitch
	ret

RocketHideoutElevatorTextPointers: ; 4576b (11:576b)
	dw RocketHideoutElevatorText1

RocketHideoutElevatorText1: ; 4576d (11:576d)
	db $08 ; asm
	ld b, LIFT_KEY
	call IsItemInBag
	jr z, .asm_8d8f0 ; 0x45773
	call RocketHideoutElevatorScript_45741
	ld hl, RocketHideoutElevatorWarpMaps ; $5759
	ld a, $61
	call Predef
	jr .asm_46c43 ; 0x45780
.asm_8d8f0 ; 0x45782
	ld hl, UnnamedText_4578b
	call PrintText
.asm_46c43 ; 0x45788
	jp TextScriptEnd

UnnamedText_4578b: ; 4578b (11:578b)
	TX_FAR _UnnamedText_4578b ; 0x82438
	db $d, "@"
	


