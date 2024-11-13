; tach hoa rieng hoa thuong tu mot xau
.model small
.stack 100h
.data
    s1  db  'Nhap xau: $'
    s2  db  10, 13,'Xuat xau thuong: $'
    s3  db  10, 13,'Xuat xau hoa: $'
    s4  db  10, 13, 'Xuat so: $'
    s   db  100 dup(?)
    hoa db  100 dup(?)
    thuong  db  100 dup(?)
    so  db  100     dup(?)
    n   db   
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
    mov bx, 0 
    mov si, 0
    mov di, 0
duyetxau:
    cmp bx, cx
    jg thoatduyet
    cmp s[bx], '9'
    jle xauso   
    cmp s[bx], 'a'
    jl xauhoa
    jge xauthuong

xauhoa:  
    mov al, s[bx]
    mov hoa[di],al
    inc bx
    inc di
    jmp duyetxau
xauthuong:
    mov al, s[bx]
    mov thuong[si], al
    inc bx
    inc si
    jmp duyetxau
xauso:
    mov al, s[bx]
    mov so
thoatduyet:
    
    mov thuong[si], '$'
    mov hoa[di], '$'
    
    mov ah, 9
    lea dx ,s2
    int 21h
    
    mov ah, 9
    lea dx, thuong
    int 21h
    
    mov ah, 9
    lea dx, s3
    int 21h 
    
    mov ah, 9
    lea dx, hoa
    int 21h 
    main endp
end main