org 1000h
; variables 

TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 13

org 2000h
; código

MOV AL, 0 ; registro contador de los elementos < max
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
MOV DL, MAX

COMPARA: CMP [BX], DL ; comparamos número acutal con el MAX
JS MENOR_O_IGUAL
JZ MENOR_O_IGUAL

JMP SIGUE

MENOR_O_IGUAL: INC AL

SIGUE: INC BX ; aumenta la posición, pasamos al siguiente número en tabla
DEC CL ; descrementamos la cantidad de elementos que nos quedan
JNZ COMPARA ; si Z = 0 salta a SUMA

MOV TOTAL, AL
MOV DL, TOTAL ; para comprobar el valor de TOTAL

hlt
end
