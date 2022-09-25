ORG 1000H
    X    DW    3
ORG 2000H
        MOV AX, X
        MOV BX, 1002H
CHECK:    MOV CX, AX
        AND CX, 1
        JZ SUB7
        JMP ADD5 
        ADD AX, 5 
        MOV WORD PTR [BX], AX
        JZ FIN
        ADD BX, 2
        JMP CHECK
SUB7:        SUB AX, 7
        JZ FIN
        MOV WORD PTR [BX], AX
        ADD BX, 2
        JMP CHECK
FIN:    HLT
        END