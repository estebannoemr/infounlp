ORG 1000H
DIR    DW    1004H
MAX    DW   1050H
    ORG 2000H
MOV BX, DIR
MOV AX, MAX
MOV CL, 0
CARGA:    MOV WORD PTR [BX], CX
        ADD BX, 2
        CMP CL, MAX
        JS IF
        JMP NOT_IF
IF:        ADD CL, 5
NOT_IF:    CMP CL, MAX
        JS CARGA
        HLT
        END 