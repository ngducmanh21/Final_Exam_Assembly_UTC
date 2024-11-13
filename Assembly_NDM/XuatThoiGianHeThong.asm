;ham 2ch, ngat 21h : lay thoi gian
;ch: gio , cl: phut , dh: giay, dl:%giay
.model small
.stack 100h
.data
     s  db  '00:00:00$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 2ch
    int 21h
    
    mov bl, 10
    mov al, ch
    mov ah, 0
    div bl
    mov bh, ah
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    mov dl, bh
    add dl, 48
    int 21h
    
    mov dl, ':'
    int 21h
    
    
    ;phut 
    mov bl, 10
    mov al, cl
    mov ah, 0
    div bl
    mov bh, ah
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    mov dl, bh
    add dl, 48
    int 21h
    
    mov dl, ':'
    int 21h
    
     mov bl, 10
    mov al, dh
    mov ah, 0
    div bl
    mov bh, ah
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    mov dl, bh
    add dl, 48
    int 21h
    
    mov dl, ':'
    int 21h  
    
     mov bl, 10
    mov al, dl
    mov ah, 0
    div bl
    mov bh, ah
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    mov dl, bh
    add dl, 48
    int 21h
    
    mov dl, ':'
    int 21h
    
    mov ah, 4ch
    int 21h
    
    main endp
end main