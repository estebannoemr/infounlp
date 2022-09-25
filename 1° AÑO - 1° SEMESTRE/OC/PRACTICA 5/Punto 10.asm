





org 1000h
; variables 


org 2000h
; código

MOV AX, 1
MOV BX, 1000h
CARGA: MOV [BX], AX ; añade lo contenido en AX
ADD BX, 2 ; aumenta 2 direcciones de memoria al haberse añadido AX (2 bytes)
ADD AX, AX ; se multiplica por 2 AX
MOV DX, AX ; para verificar
CMP AX, 200 ; se compara AX con 200
JS CARGA

; este programa multiplica AX por 2 hasta llegar a un número que sea mayor o igual a 200

hlt
end
