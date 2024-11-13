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
        
        mov ah,1; nhap so thu 2
        int 21h
        sub al, 48;doi thanh so
        mov ah,0;xoa ah
                   
        add bh, al
        mov al, bh
        mov bl,10
        mul bl
        mov bh, al
        
        mov ah, 1; nhap so thu 3
        int 21h
        sub al, 48
        mov ah, 0
        add bh, al
        mov al, bh
        
        mov dv, al
       
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main
        