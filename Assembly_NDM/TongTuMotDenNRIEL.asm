.model small
.stack 100h
.data
    s1 db 'Nhap n: $'
    s2 db 10, 13, ' Tong =: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah,9
        lea dx, s1
        int 21h
        
        mov ah,1
        int 21h
        
        sub al, 48;n
        
        mov cl, 1; i lap ca 
        mov bl, 0; s

back:        
        add bl, cl ; s = s+i
        inc cl; i = i + 1
        cmp cl, al
        jle back
        
        mov ah,9
        lea dx, s2
        int 21h
        
        mov ah,0 ; phai xu ly nhu nay moi dung
        mov al, bl; lay ax chia
        mov bl, 10
        div bl
        
        mov bh, ah
        mov bl, al
                 
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main