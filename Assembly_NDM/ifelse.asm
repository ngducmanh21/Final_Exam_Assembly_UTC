.model small
.stack 100H
.data
    main PROC  
    MOV AL, 5
    CMP AL, 5
    
    JG greater
    JE equal
    JMP less
    
greater:
    MOV BL, 'G'
    JMP after
    
equal:
    MOV BL, 'E'
    JMP after

    
less:
    MOV Bl, 'L'
after:
    mov ah,2
    mov DL, BL
    int 21h
    MOV AH, 4CH
    INT 21H
    main ENDP
END main