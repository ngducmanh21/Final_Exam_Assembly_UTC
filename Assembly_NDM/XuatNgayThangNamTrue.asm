;ham 2ch, ngat 21h : lay thoi gian  
;ham 2ah, ngat 21h;
;al: thu (0: sun, 1: MON, ... 6: SAT)
;dl: ngay(1-32), dh: thang (1-12)
;cx : nam (1980-2099) 

.model small
.stack 100h
.data
     ngay       db  ?
     thang      db  ?
     nam        dw  ?
     ;thu        db  'SUNMONTUEWEDTHUFRISAT'
     thu        db  'Chu nhatThu hai Thu ba  Thu tu  Thu nam Thu sau Thu Bay'
     
.code
main proc
    mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h   
        
        mov ngay , dl
        mov thang, dh
        mov nam, cx
        
        mov bl, 8
        mov ah, 0
        mul bl
        mov bx, ax
        mov cx, 8
hienthu:        

        mov ah, 2
        mov dl, thu[bx]
        int 21h
        inc bx
        loop hienthu
        
hienngay:
        mov ah, 2
        mov dl, ' '
        int 21h 
        
        mov al, ngay
        mov ah, 0
        mov bl, 10
        div bl
        mov bh, ah
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov dl, bh
        add dl , 48
        int 21h
        mov dl, '/'
        int 21h
        
        mov al, thang
        mov ah, 0
        mov bl, 10
        div bl
        mov bh, ah
        
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        
        mov dl, bh
        add dl , 48
        int 21h
        mov dl, '/'
        int 21h
        
        ; lay dx ax chia v� thuong o ax va du o dx
        mov ax, nam
        mov bx, 10
        mov cx, 4
chiatiep:        
        mov dx, 0
        div bx
        push dx
        loop chiatiep
        mov cx, 4
hiennam:        
        
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        loop hiennam
        
        mov ah, 4ch
        int 21h
    
    main endp
end main