SDA	BIT	P1.0
SCL	BIT	P1.1
F_SEND_TIME	BIT	00H
F_SEND_DATE	BIT	01H
F_SEND		BIT	02H
SECONDS		DATA	30H
MINUTES		DATA	31H
HOUR		DATA	32H
DAY		DATA	33H
DATE		DATA	34H
MONTH		DATA	35H
YEAR		DATA	36H
org	0000h
ljmp	main
org	0003h		;NGAT NGOAI0
	SETB	F_SEND_TIME
	SETB	F_SEND_DATE
	SETB	F_SEND
	RETI
ORG 0030H
MAIN:
	mov	scon,#42h
	mov	tmod,#20h
	mov	a,pcon			;nhan doi toc do baud
	setb	acc.7
	mov	pcon,a
	mov	th1,#0fFh		;57600  11.0592Mhz
	setb	tr1
	setb	it0		;ngat ngoai 0 kich canh xuong
	mov	ie,#81h		;cho phep ngat ngoai0

	CALL	I2C_INIT
	CALL	DS1307_INIT
	CALL	DS1307_OUTPUT
;	MOV	SECONDS,#31H	
;	MOV	MINUTES,#31H
;	MOV	HOUR,#10H
	;CALL	DS1307_WRITE_TIME
;   ___WHILE1:
;	JNB	F_SEND,$
;	CLR	F_SEND
;	CALL	SEND_UART_TIME
;	CALL	SEND_UART_DATE
	SJMP	$;___WHILE1

SEND_UART_TIME:
	JB	F_SEND_TIME,___SEND_TIME
	JMP	___EXIT_SEND_TIME
   ___SEND_TIME:
	CLR	F_SEND_TIME
	MOV	A,#'T'
	CALL	OUTCHAR
	MOV	A,#'I'
	CALL	OUTCHAR
	MOV	A,#'M'
	CALL	OUTCHAR
	MOV	A,#'E'
	CALL	OUTCHAR
	MOV	A,#' '
	CALL	OUTCHAR
	CALL	DS1307_READ_TIME
	MOV	A,HOUR
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,HOUR
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#':'
	call	outchar
	MOV	A,MINUTES
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,MINUTES
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#':'
	call	outchar
	MOV	A,SECONDS
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,SECONDS
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#0DH
	call	outchar
	MOV	A,#0AH
	call	outchar
   ___EXIT_SEND_TIME:
	RET

SEND_UART_DATE:
	JB	F_SEND_DATE,___SEND_DATE
	JMP	___EXIT_SEND_DATE
   ___SEND_DATE:
	CLR	F_SEND_DATE
	MOV	A,#'D'
	CALL	OUTCHAR
	MOV	A,#'A'
	CALL	OUTCHAR
	MOV	A,#'T'
	CALL	OUTCHAR
	MOV	A,#'E'
	CALL	OUTCHAR
	MOV	A,#' '
	CALL	OUTCHAR
	CALL	DS1307_READ_DATE
	MOV	A,DAY
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,DAY
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#':'
	call	outchar
	MOV	A,DATE
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,DATE
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#':'
	call	outchar
	MOV	A,MONTH
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,MONTH
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#':'
	call	outchar
	MOV	A,YEAR
	swap	a
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,YEAR
	anl	a,#0fh
	add	a,#48
	call	outchar
	MOV	A,#0DH
	call	outchar
	MOV	A,#0AH
	call	outchar
   ___EXIT_SEND_DATE:
	RET
DS1307_INIT:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307
	LCALL	I2C_WRITE	;
	;JC	$-5	
	MOV	A,#00H		;DIA CHI THANH GHI 0
	LCALL	I2C_WRITE
	MOV	A,#00H		;ENABLE	THE oscillator (CH bit = 0)
	LCALL	I2C_WRITE
	CALL	I2C_STOP
	RET
DS1307_OUTPUT:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307
	CALL	I2C_WRITE	;
	MOV	A,#07H		;DIA CHI THANH GHI 0
	CALL	I2C_WRITE
	MOV	A,#10H		;ENABLE	THE OUTPUT oscillator F=1HZ 
	CALL	I2C_WRITE
	CALL	I2C_STOP
	RET
DS1307_WRITE_TIME:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307
	CALL	I2C_WRITE	;
	MOV	A,#00H		;DIA CHI THANH GHI 0
	CALL	I2C_WRITE
	MOV	A,SECONDS	;
	CALL	I2C_WRITE
	MOV	A,MINUTES	;
	CALL	I2C_WRITE
	MOV	A,HOUR		;
	CALL	I2C_WRITE
	CALL	I2C_STOP
	RET
DS1307_WRITE_DATE:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307
	CALL	I2C_WRITE	;
	MOV	A,#03H		;DIA CHI THANH GHI 3
	CALL	I2C_WRITE
	MOV	A,DAY		;THU	
	CALL	I2C_WRITE
	MOV	A,DATE		;NGAY
	CALL	I2C_WRITE
	MOV	A,MONTH		;THANG
	CALL	I2C_WRITE	
	MOV	A,YEAR		;NAM
	CALL	I2C_WRITE
	CALL	I2C_STOP
	RET
DS1307_READ_TIME:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307 VA WRITE
	CALL	I2C_WRITE	;
	MOV	A,#00H		;DIA CHI THANH GHI 0
	CALL	I2C_WRITE
	CALL	I2C_RESTART
	MOV	A,#0D1H		;DIA CHI DS1307 VA READ
	CALL	I2C_WRITE
	CALL	I2C_READ_ACK
	MOV	SECONDS,A
	CALL	I2C_READ_ACK
	MOV	MINUTES,A
	CALL	I2C_READ_NACK
	MOV	HOUR,A
	CALL	I2C_STOP
	RET
DS1307_READ_DATE:
	CALL	I2C_START
	MOV	A,#0D0H		;DIA CHI DS1307 VA WRITE
	CALL	I2C_WRITE	;
	MOV	A,#03H		;DIA CHI THANH GHI 3
	CALL	I2C_WRITE
	CALL	I2C_RESTART
	MOV	A,#0D1H		;DIA CHI DS1307 VA READ
	CALL	I2C_WRITE
	CALL	I2C_READ_ACK
	MOV	DAY,A
	CALL	I2C_READ_ACK
	MOV	DATE,A
	CALL	I2C_READ_ACK
	MOV	MONTH,A
	CALL	I2C_READ_NACK
	MOV	YEAR,A
	CALL	I2C_STOP
	RET
I2C_WRITE:
	PUSH	07H
	MOV	R7,#8
   ___LOOP_I2C_WRITE:
	CLR	SCL
	RLC	A
	MOV	SDA,C
	NOP
	NOP
	SETB	SCL
	NOP
	NOP
	DJNZ	R7,___LOOP_I2C_WRITE
	CLR	SCL
	NOP
	NOP
	NOP
	NOP
	SETB	SDA		;CAU HINH NGO VAO SDA DOC ACK
	SETB	SCL
	NOP
	MOV	C,SDA		;KIEM TRA CO "C" DE XAC DINH LOI 
	NOP
	NOP
	CLR	SCL
	POP	07H
	RET
I2C_READ_ACK:
	PUSH	07H
	MOV	R7,#8
	SETB	SDA		;CAU HINH NGO VAO SDA
   ___LOOP_I2C_READ_ACK:
	SETB	SCL
	NOP
	MOV	C,SDA
	RLC	A		;BYTE DOC VE LUU TRONG THANH GHI "A"
	NOP
	CLR	SCL
	NOP
	NOP
	NOP
	DJNZ	R7,___LOOP_I2C_READ_ACK
	CLR	SDA
	NOP
	SETB	SCL
	NOP
	NOP
	NOP
	NOP
	CLR	SCL
	POP	07H
	RET
I2C_READ_NACK:
	PUSH	07H
	MOV	R7,#8
	SETB	SDA		;CAU HINH NGO VAO SDA
   ___LOOP_I2C_READ_NACK:
	SETB	SCL
	NOP
	MOV	C,SDA
	RLC	A		;BYTE DOC VE LUU TRONG THANH GHI "A"
	NOP
	CLR	SCL
	NOP
	NOP
	NOP
	DJNZ	R7,___LOOP_I2C_READ_NACK
	SETB	SDA
	NOP
	SETB	SCL
	NOP
	NOP
	NOP
	NOP
	CLR	SCL
	POP	07H
	RET
I2C_INIT:
	SETB	SCL
	SETB	SDA
	RET
I2C_START:
	SETB	SDA
	SETB	SCL
	NOP		;DELAY 4.7US
	NOP		;Bus Free Time Between a STOP and START Condition
	NOP	
	NOP
	NOP
	CLR	SDA
	NOP		;DELAY 4US
	NOP		;Hold Time (Repeated) START Condition
	NOP	
	NOP
	CLR	SCL
	RET
I2C_STOP:
	CLR	SDA
	SETB	SCL
	NOP		;DELAY	4.7US
	NOP		;Setup Time for STOP Condition
	NOP
	NOP	
	NOP
	SETB	SDA
	RET
I2C_RESTART:
	SETB	SDA
	SETB	SCL
	NOP		;DELAY 4.7US
	NOP		;Setup Time for a Repeated START Condition
	NOP	
	NOP
	NOP
	CLR	SDA
	NOP		;DELAY 4US
	NOP		;Hold Time (Repeated) START Condition
	NOP	
	NOP
	CLR	SCL
	NOP
	NOP
	RET
SCL_HIGH:
	NOP		;DELAY 4US
	NOP		;HIGH Period of SCL Clock
	SETB	SCL
	NOP
	NOP
	RET
SCL_LOW:
	NOP		;DELAY 4.7US
	NOP		;LOW Period of SCL Clock
	CLR	SCL
	NOP
	NOP
	NOP
	RET
outchar:	
	jnb	ti,$
	clr 	ti
	mov	sbuf,a
	ret
END