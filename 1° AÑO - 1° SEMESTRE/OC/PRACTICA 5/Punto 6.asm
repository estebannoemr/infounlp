org 1000h
; variables 

INI DB 0
FIN DB 15



org 2000h
; código

MOV AL, INI
MOV AH, FIN
SUMA: INC AL ; incrementa a AL
CMP AL, AH ; hace AL - AH
JNZ SUMA ; se fija en el flag Z, mientras sea = 0 repite todo lo que esté adentro de SUMA

hlt
end
