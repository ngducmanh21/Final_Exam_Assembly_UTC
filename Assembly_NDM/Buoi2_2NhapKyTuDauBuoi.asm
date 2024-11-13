.model small
.stack 100h
.data
    s1  db  10,13,'Nhap ky tu: $'
    s   db  10, 13,'Xuat: $'
.code
main proc
    mov ax, @data
    mov ds, ax  
nhaplai: 
    mov ah, 9
    lea dx, s1
    int 21h
   
    mov ah, 1
    int 21h ; al
    cmp al , 'z'
    ja nhaplai     
    jb chucai 
chucai:
    cmp al, 'a'    
    ja xuat
    jb chuhoa
xuat:     
    mov bl, al
    mov ah, 9
    lea dx, s
    int 21h 
    mov al, bl
chuthuong:
    cmp al, '{'        
    mov ah, 2         
    mov dl, al
    int 21h
    inc al              
    jmp chuthuong
chuhoa:
    cmp al, 'A'
    jb nhaplai
    cmp al , 'Z'
    ja  nhaplai
    add al, 32
    jmp xuat
thoat:    
    mov ah, 4ch
    int 21h
    main endp
end main    


