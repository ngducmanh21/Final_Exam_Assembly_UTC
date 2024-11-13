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
        mul bl    ; nhan so vua nhap voi 10
        
        mov bh, al
        mov ah, 1
        int 21h
        sub al, 48; nhan tiep
        add bh, al; cong voi so hang chuc
        mov a1, bh; cat vao a1
        
        mov ah, 9
        lea dx, s2
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
        mov a2, bh
        mov al, a1
        add al, a2
        
        mov tong , al
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 4ch
        int 21h
        
        
        
    main endp
end main