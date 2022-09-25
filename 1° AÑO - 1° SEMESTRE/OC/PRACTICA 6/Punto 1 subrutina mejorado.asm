ORG 1000H
NUM1 DW 8000H ; parte BAJA
     DW 0004h ; parte ALTA
NUM2 DW 8000h ; parte BAJA
     DW 0004h ; parte ALTA
RESUL DW 0
     DW 0
BIEN DB ?
MAL DB ?


ORG 3000H
SUMA: MOV AX, NUM1 ; AX:= parte BAJA de NUM1
MOV CX, NUM2 ; CX:= parte BAJA de NUM2

ADD AX,CX ; sumo

MOV RESUL, AX ; almaceno en parte BAJA de RESUL el valor de la parte BAJA de la suma

MOV BX, OFFSET NUM1 + 2
MOV AX, [BX] ; AX:= parte ALTA de NUM1

MOV BX, OFFSET NUM2 + 2
MOV CX, [BX] ; CX:= parte ALTA de NUM2

MOV BX, OFFSET RESUL + 2 ; parte ALTA de RESUL
ADC [BX], AX
ADD [BX], CX

; CHEQUEO SI SALIO BIEN O MAL
JO SALIO_MAL

MOV BIEN, 0FFH
JMP FIN

SALIO_MAL: MOV MAL, 0FFH

FIN: RET

ORG 2000H

CALL SUMA

HLT
END