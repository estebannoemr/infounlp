ejercicio 9 practica 5
ORG 1000H 
tabla db 2,4,6,8,10,12,14,16,18,20
fin db ?
total db ?
max db 13

ORG 2000H 
mov al, 0
mov bx , offset tabla 
mov dl, offset fin - offset tabla
mov ah, max

cmp [bx] , ah
js suma1
jz suma1

compara: inc bx
dec dl
cmp dl,0
jz final
cmp [bx] , ah
jz suma1
js suma1

jmp compara

suma1: inc al
jmp compara

final: mov total , al
hlt
End