SeafoamIslands1Script: ; 447e9 (11:47e9)
	call EnableAutoTextBoxDrawing
	ld hl, $d7e7
	set 0, [hl]
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jr z, .asm_4483b ; 0x447f8 $41
	ld hl, Seafoam1HolesCoords
	call CheckBoulderCoords
	ret nc
	ld hl, $d7e8
	ld a, [$cd3d]
	cp $1
	jr nz, .asm_44819 ; 0x44809 $e
	set 6, [hl]
	ld a, $d7
	ld [$d079], a
	ld a, $d9
	ld [$d07a], a
	jr .asm_44825 ; 0x44817 $c
.asm_44819
	set 7, [hl]
	ld a, $d8
	ld [$d079], a
	ld a, $da
	ld [$d07a], a
.asm_44825
	ld a, [$d079]
	ld [$cc4d], a
	ld a, $11
	call Predef
	ld a, [$d07a]
	ld [$cc4d], a
	ld a, $15
	jp Predef
.asm_4483b
	ld a, $9f
	ld [$d71d], a
	ld hl, Seafoam1HolesCoords
	jp Func_46981

Seafoam1HolesCoords: ; 44846 (11:4846)
	db $06,$11
	db $06,$18
	db $ff

SeafoamIslands1TextPointers: ; 4484b (11:484b)
	dw BoulderText
	dw BoulderText


