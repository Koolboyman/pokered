UndergroundTunnelEntranceRoute5Script: ; 5d6a9 (17:56a9)
	ld a, $10
	ld [$d365], a
	ret

UndergroundTunnelEntranceRoute5_5d6af: ; 5d6af (17:56af)
	db $50

UndergroundTunnelEntranceRoute5TextPointers: ; 5d6b0 (17:56b0)
	dw UndergroundTunnelEntranceRoute5Text1

UndergroundTunnelEntranceRoute5Text1: ; 5d6b2 (17:56b2)
	db $08 ; asm
	ld a, $9
	ld [wWhichTrade], a
	ld a, $54
	call Predef
	ld hl, UndergroundTunnelEntranceRoute5_5d6af
	ret
	
