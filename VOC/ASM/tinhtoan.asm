ORG 0000H 
X: SETB P2.7
CALL DELAY
CLR P2.7
CALL DELAY
SETB P2.7
MOV A,#25
MOV B,#100
MUL AB
MOV R4,A
MOV R3,B
MOV R5,#104
MOV B,#08H
MOV A,R5
CLR C
DIVIDE: MOV A,R4
RLC A
MOV R4,A
MOV A,R3
RLC A
MOV R3,A
JC SUBTRACT
MOV A,R5
SUBB A,R3 
JNC NEXT
CLR C
SUBTRACT: MOV A,R3
SUBB A,R5
MOV R3,A
SETB C
NEXT: DJNZ B,DIVIDE
MOV A,R4
RLC A
MOV B,#10
DIV AB
MOV R1,B
MOV B,#10
DIV AB
MOV DPTR,#MALED
MOVC A,@A+DPTR
MOV P2,A
MOV A,B
MOV DPTR,#MALED
MOVC A,@A+DPTR
MOV P3,A
MOV A,R1
MOV DPTR,#MALED
MOVC A,@A+DPTR
MOV P0,A 
JMP X
MALED:
         DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H,80H,90H
DELAY:MOV R0,#10
W3: MOV R1,#100
W2: MOV R2,#100
W1: DJNZ R2,$
DJNZ R1,W2
DJNZ R0,W3
RET
END
