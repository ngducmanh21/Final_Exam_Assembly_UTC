.model small
.stack 100h
.data
    s1 db 'nhap so thu nhat:$'
    s2 db 10,13, 'nhap so thu 2: $'
    s3 db 10, 13, 'tong so:$'
    a1 db 0
    a2 db 0
    tong db 0
    dv db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah,1
        int 21h
        sub al, 48
        
        mov bl, 10
        mul bl
        
        mov bh, al
        mov ah, 1
        int 21h
        sub al, 48
        add bh, al
        mov a1, bh
        
       
        
        mov ah, 4ch
        int 21h
        
    main endp
end main