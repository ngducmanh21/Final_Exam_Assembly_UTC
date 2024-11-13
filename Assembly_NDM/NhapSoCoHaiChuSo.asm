.model small
.stack 100h
.data
    s1 db 'Nhap n: $'
    s2 db 10, 13, ' Tong =: $' 
    n db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah,9
        lea dx, s1
        int 21h
        
        mov ah,1
        int 21h  
        sub al, 48
        
        mov bl, 10
        mul bl
        
        mov bl, al; hang chuc
        
        mov ah, 1
        int 21h
        sub al, 48
        
        add bl , al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov bh, 0
        mov ax, bx
        
        mov bl, 10
        div bl
        
        mov bx, ax
        
        mov ah,2 
        mov dl, bl
        add dl, 48
        int 21h
        mov dl,bh
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main