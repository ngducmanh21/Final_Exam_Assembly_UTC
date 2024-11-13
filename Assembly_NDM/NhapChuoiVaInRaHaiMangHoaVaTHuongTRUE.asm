.model small
.stack 100h
.data
    s1  db  'Nhap xau: $'
    s2  db  10, 13,'Xuat xau thuong: $'
    s3  db  10, 13,"Xuat xau hoa: $"
    s4  db  10, 13, "Xuat xau so: $"
    s   db  100 dup(?)
    hoa db  100 dup(?)   
    so  db  100 dup(?)
    thuong  db  100 dup(?)
    tmp dw 0
    tmp1 dw 0
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
    mov dx, 0
    
chuyentiep:
    cmp s[bx], 'a'
    jl chuhoa
    
    mov al, s[bx]
    mov thuong[si], al
    inc si
    jmp tiep
chuhoa:
    cmp s[bx], 'A'
    jl  chuyenso
    mov al, s[bx]
    mov hoa[di], al
    inc di
    jmp tiep
chuyenso:   
    mov al, s[bx]
    mov tmp, bx
    mov bx, dx 
    
    mov so[bx], al
    mov bx, tmp
    inc dx
    mov so[bx], 
tiep:    
    inc bx
    loop chuyentiep
    
    mov tmp1, dx
    mov ah,9
    lea dx, s3
    int 21h
    mov hoa[di], '$'
    lea dx, hoa
    int 21h
    
    lea dx, s2
    int 21h
    mov thuong[si], '$'
    lea dx, thuong
    int 21h     
    
    lea dx, s4
    int 21h
    
    mov bx, tmp1
    mov so[bx],'$'  
    lea dx, so 
    int 21h
    
     