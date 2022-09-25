org 1000h
; variables 

A DB 8
B DB 8
C DB ?

org 2000h
; código

MOV AL, A
MOV BL, B

CMP AL, BL ; hace AL - BL
JS MENOR_O_IGUAL
JZ MENOR_O_IGUAL

MOV C, BL ; si A es mayor, C:= B
JMP QUEDO_C
;JMP FIN

MENOR_O_IGUAL: MOV C, AL ; C:= A

QUEDO_C: MOV DL, C ; para ver en qué me quedó C

FIN: hlt
end
