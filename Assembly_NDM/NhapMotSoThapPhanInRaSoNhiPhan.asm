.model small
.stack 100h
.data
    input db 'Nhap 1 so thap phan: $'
    output db 10, 13, 'Ket qua la: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, input
        int 21h
        
        mov ah, 1
        int 21h        
        sub al, 48
        
        mov bl, 2
        mov cl, 0
chiatiep:
        mov ah, 0        
        div bl
        push ax
        inc cl
        cmp al, 0
        je hienso
        jmp chiatiep
hienso:    
        mov ah, 9
        lea dx, output
        int 21h
        mov ch, 0
intiep:        
        mov ah, 2
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        loop intiep
        
        mov ah, 4ch
        int 21h
        main endp
    end main