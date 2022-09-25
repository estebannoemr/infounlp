


org 1000h
; variables 
FRASE DB "Organización y la Computación"
FINFRASE DB ?

org 2000h
; código

MOV BX, OFFSET FRASE ; único registro que funciona como puntero es BX
MOV DL, 0 ; cuenta la cantidad de 'a'

LOOP: MOV AL, [BX] ; tomo el elemento actual

CMP AL, 61h ; comparo con la letra 'a'
JNZ NO_ES_A ; si no es A

INC DL ; es 'a', por lo que incremento DL

NO_ES_A: INC BX ; avanzo en la frase
CMP BX, OFFSET FINFRASE
JNZ LOOP

hlt
end
