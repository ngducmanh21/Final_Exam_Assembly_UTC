; nhap vao mot day ky tu doi tat ca day sang chu hoa
.model small
.stack 100h
.data
    s1  db 'Nhap vao mot day ky tu: $'
    s2  db 10, 13,'Yeu cau de bai: $'
    s   db 100 dup(?)
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, s1
    int 21h
    
    mov bx, 0
nhaptiep:    
    mov ah, 1
    int 21h
    cmp al, 13
    je thoat
    mov s[bx], al
    inc bx
    jmp nhaptiep
thoat:
    
    mov cx, bx
    mov ah, 9
    lea dx, s2
    int 21h
    
    mov bx, 0
intiep:    
    mov ah, 2
    mov dl, s[bx]
    cmp dl ,  97
    jb inluon
    cmp dl, 122
    ja  inluon
    sub dl, 32
inluon:
    int 21h
    inc bx
    cmp bx, cx
    loop intiep
    

    main endp
end main