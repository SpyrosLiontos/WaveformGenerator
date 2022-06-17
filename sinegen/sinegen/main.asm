


LDI R17,$FF
OUT DDRA,R17
LDI R18,$00
OUT DDRB, R18
LDI R16,$FF
OUT PORTB,R16



main:
in r19,pinb
cpi r19,$fe
breq sinewave
cpi r19,$fd
breq triwave
cpi r19,$fb
breq squarewave
rjmp main






sinewave:
LDI ZH, HIGH(sinetable*2)
LDI ZL, LOW(sinetable*2)
startsine:
    clr r24
	clr r25
	clr r16
	lpm
	adiw zl,$01
	mov r22,r0 
	cpi r22,$11
	breq finitosine
	rcall delay
	out PORTA, R22
    rjmp startsine

	finitosine:
	rjmp sinewave

triwave:
LDI ZH, HIGH(tritable*2)
LDI ZL, LOW(tritable*2)
starttri:
    clr r24
	clr r25
	clr r16
	lpm
	adiw zl,$01
	mov r22,r0 
	cpi r22,$18
	breq finitotri
	rcall delay
	out PORTA, R22
    rjmp starttri

	finitotri:
	rjmp triwave

squarewave:
LDI ZH, HIGH(squaretable*2)
LDI ZL, LOW(squaretable*2)
startsquare:
    clr r24
	clr r25
	clr r16
	lpm
	adiw zl,$01
	mov r22,r0 
	cpi r22,$11
	breq finitosquare
	rcall delay
	out PORTA, R22
    rjmp startsquare

	finitosquare:
	rjmp squarewave



	delay:
	inc r16
	cpi r16,$88
	breq finitodelay
	rjmp delay
	finitodelay: ret


	sinetable:
	.DW $887f, $9b92, $ada4, $DDB5, $CDC5, $DBD4, $E7E1, $F0EC, $F8F4, $FCFA, $FFFE, $FCFE, $FAFC, $F4F8, $ECF0, $E1E7, $D4DD, $C5CD, $B5BD, $A4AD, $929B, $7F88, $6C76, $5A63, $4951, $3941, $2A31, $1D23, $1217
	.DW $0A0E, $0406, $0002, $0000, $0200, $0604, $0E0A, $1712, $231D, $312A, $4139, $5149, $635A, $766C, $0011

	tritable:
	.DW $0200, $0805, $0E0B, $1411, $1A17, $201D, $2623, $2B29, $312E, $3734, $3D3A, $4340, $4946, $4F4C, $5552, $5A57, $605D, $6663, $6C69, $726F, $7875, $7E7B, $8381, $8986, $8F8C, $9592, $9B98, $A19E, $A7A4
	.DW $ADAA, $B2AF, $B8B5, $BEBB, $C4C1, $CAC7, $D0CD, $D6D3, $DBD9, $E1DE, $E7E4, $EDEA, $F3F0, $F9F6, $FFFC 
	.DW $FFFC, $F9F6, $F3F0, $EDEA, $E7E4, $E1DE, $DBD9, $D6D3, $D0CD, $CAC7, $C4C1, $BEBB, $B8B5, $B2AF, $ADAA, $A7A4, $A19E, $9B98, $9592, $8F8C, $8986, $8381, $7E7B, $7875, $726F, $6C69, $6663, $605D, $5A57
	.DW $5552, $4F4C, $4946, $4340, $3D3A, $3734, $312E, $2B29, $2623, $201D, $1A17, $1411, $0E0B, $0805, $0200
	.DW $0018

	squaretable:
	.DW $FFFF, $FFFF, $FFFF, $FFFF, $0000,$0000,$0000,$0000, $0011