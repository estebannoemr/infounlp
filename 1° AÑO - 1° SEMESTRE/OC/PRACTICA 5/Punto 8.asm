




org 1000h
; variables 

TABLA DB 2,4,6,8,10,12,14,16,18,20
FIN DB ?
TOTAL DB ?
MAX DB 13

org 2000h
; código

MOV AL, 0
MOV CL, OFFSET FIN - OFFSET TABLA
MOV BX, OFFSET TABLA
SUMA: ADD AL, [BX]
INC BX ; aumenta la posición, pasamos al siguiente número en tabla
DEC CL ; decrementa la cantidad de elementos de la tabla
JNZ SUMA ; si Z = 0 salta a SUMA

MOV TOTAL, AL
MOV DL, TOTAL ; para comprobar el valor de TOTAL

hlt
end
