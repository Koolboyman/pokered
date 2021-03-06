PokemonTower2Script: ; 604f2 (18:44f2)
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower2ScriptPointers
	ld a, [W_POKEMONTOWER2CURSCRIPT]
	jp CallFunctionInTable

Func_604fe: ; 604fe (18:44fe)
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower2ScriptPointers: ; 60509 (18:4509)
	dw PokemonTower2Script0
	dw PokemonTower2Script1
	dw PokemonTower2Script2

PokemonTower2Script0: ; 6050f (18:450f)
	ld a, [$d764]
	bit 7, a
	ret nz
	ld hl, CoordsData_6055e ; $455e
	call ArePlayerCoordsInArray
	ret nc
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, $d764
	res 6, [hl]
	ld a, [$cd3d]
	cp $1
	ld a, $8
	ld b, $0
	jr nz, .asm_60544 ; 0x60539 $9
	ld hl, $d764
	set 6, [hl]
	ld a, $2
	ld b, $c
.asm_60544
	ld [$d528], a
	ld a, $1
	ld [$ff00+$8c], a
	ld a, b
	ld [$ff00+$8d], a
	call Func_34a6
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld [H_NEWLYPRESSEDBUTTONS], a
	ret

CoordsData_6055e: ; 6055e (18:455e)
	db $05,$0F
	db $06,$0E
	db $0F ; isn't this supposed to end in $ff?

PokemonTower2Script1: ; 60563 (18:4563)
	ld a, [$d057]
	cp $ff
	jp z, Func_604fe
	ld a, $f0
	ld [wJoypadForbiddenButtonsMask], a
	ld hl, $d764
	set 7, [hl]
	ld a, $1
	ld [$ff00+$8c], a
	call DisplayTextID
	ld de, MovementData_605b2
	ld a, [$d764]
	bit 6, a
	jr nz, .asm_60589 ; 0x60584 $3
	ld de, MovementData_605a9
.asm_60589
	ld a, $1
	ld [$ff00+$8c], a
	call MoveSprite
	ld a, $ff
	ld [$c0ee], a
	call PlaySound
	ld b, BANK(Music_RivalAlternateStart)
	ld hl, Music_RivalAlternateStart
	call Bankswitch
	ld a, $2
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

MovementData_605a9: ; 605a9 (18:45a9)
	db $C0,$00,$00,$C0,$00,$00,$C0,$C0,$FF

MovementData_605b2: ; 605b2 (18:45b2)
	db $00,$00,$C0,$C0,$C0,$C0,$00,$00,$FF

PokemonTower2Script2: ; 605bb (18:45bb)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, $38
	ld [$cc4d], a
	ld a, $11
	call Predef
	xor a
	ld [wJoypadForbiddenButtonsMask], a
	call Func_2307
	ld a, $0
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
	ret

PokemonTower2TextPointers: ; 605db (18:45db)
	dw PokemonTower2Text1
	dw PokemonTower2Text2

PokemonTower2Text1: ; 605df (18:45df)
	db $08 ; asm
	ld a, [$d764]
	bit 7, a
	jr z, .asm_16f24 ; 0x605e5
	ld hl, UnnamedText_6063c
	call PrintText
	jr .asm_41852 ; 0x605ed
.asm_16f24 ; 0x605ef
	ld hl, UnnamedText_6062d
	call PrintText
	ld hl, $d72d
	set 6, [hl]
	set 7, [hl]
	ld hl, UnnamedText_60632
	ld de, UnnamedText_60637 ; XXX $4637
	call PreBattleSaveRegisters
	ld a, $f2
	ld [$d059], a

	; select which team to use during the encounter
	ld a, [W_RIVALSTARTER]
	cp SQUIRTLE
	jr nz, .NotSquirtle ; 0x6060f
	ld a, $4
	jr .done
.NotSquirtle ; 0x60615
	cp BULBASAUR
	jr nz, .Charmander ; 0x60617
	ld a, $5
	jr .done
.Charmander ; 0x6061d
	ld a, $6
.done
	ld [W_TRAINERNO], a

	ld a, $1
	ld [W_POKEMONTOWER2CURSCRIPT], a
	ld [W_CURMAPSCRIPT], a
.asm_41852 ; 0x6062a
	jp TextScriptEnd

UnnamedText_6062d: ; 6062d (18:462d)
	TX_FAR _UnnamedText_6062d
	db "@"

UnnamedText_60632: ; 60632 (18:4632)
	TX_FAR _UnnamedText_60632
	db "@"

UnnamedText_60637: ; 60637 (18:4637)
	TX_FAR _UnnamedText_60637
	db "@"

UnnamedText_6063c: ; 6063c (18:463c)
	TX_FAR _UnnamedText_6063c
	db "@"

PokemonTower2Text2: ; 60641 (18:4641)
	TX_FAR _PokemonTower2Text2
	db "@"

