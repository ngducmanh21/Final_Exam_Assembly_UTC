.model small
.stack 100H
.data
.code

main PROC
    MOV BL, '0'
init_for:
    MOV CL, 0
for:
    CMP CL, 5
    JGE outside_for
    INC BL

    exit:
    MOV AH, 4
    INT 21H
    main ENDP
END main