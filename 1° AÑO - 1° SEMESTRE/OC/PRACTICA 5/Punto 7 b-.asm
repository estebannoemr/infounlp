org 1000h
; variables 

A DB 9
B DB 8
C DB ?

org 2000h
; código

MOV AL, A
MOV BL, B

CMP AL, BL ; hace AL - BL
JZ IGUAL

MOV C, BL ; si A es distinto, C:= B
JMP QUEDO_C

IGUAL: MOV C, AL ; C:= A

QUEDO_C: MOV DL, C ; para ver en qué me quedó C

FIN: hlt
end
