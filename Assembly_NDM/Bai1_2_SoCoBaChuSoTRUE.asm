.model small
.stack 100h
.data
    s1 db 'Nhap 3 so: $'
    s2 db 10, 13, 'So vua nhap: $'
    dv db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah,9
        lea dx, s1 
        int 21h
        
; (a*10 + b)*10 + c
        mov ah,1; nhap so thu nhat
        int 21h
        sub al,48;doi thanh so
        mov ah, 0; xoa ah
        
        mov bl , 10
        mul bl ; al * 10
        mov bh, al ; cat vao bh
        
        mov ah, 1 ; nhap so thu 2, vi du nhap 5
        int 21h
        sub al, 48 ; doi thanh so
        add al,bh  ;cong voi so truoc do: 10 + 5 = 15
        mov ah, 0
        mov bl, 10 ; nhan 10 : 15*10 = 150
        mul bl
        mov bx, ax ;cat vao bh
        
        mov ah,1  ;nhap so thu 3
        int 21h   ; vi du nhap 6
        sub al, 48 
        mov ah, 0
        add bx, ax ; 150 + 6 =156-- su dung ax
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ax, bx
        mov bl, 10
        div bl
        mov dv, ah
        
        mov bl, 10
        mov ah, 0
        div bl
        mov bl, al
        mov bh, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov dl, dv
        add dl, 48
        int 21h   
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main
        