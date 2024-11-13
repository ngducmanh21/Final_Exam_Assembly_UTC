.model small
.stack 100h
.data
    CRLF db 13,10, '$'
    hello db 'hello world$', 0   
.code
    main Proc
        mov ax, @data
        mov ds, ax
        
        lea dx, Hello
        mov ah, 09h
        int 21h
        
        mov ah,4Ch
        int 21h
    
    main Endp