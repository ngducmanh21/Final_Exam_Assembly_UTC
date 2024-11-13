.model small
.stack 100h
.data  
    s1      db  10,13,'Nhap diem Toan: $'
    s2      db  10,13,'Nhap diem Ly: $'
    s3      db  10,13,'Nhap diem Hoa: $'
    stong    db  10,13,'Tong diem: $'
    rank    db  10,13,'Xep loai: $'    
    hgioi db 'Gioi$'
    hkha db 'Kha$'
    hkem db 'Kem$'
    t       db  ?
    l       db  ?
    h       db  ?  
    tong    db  ?
.code  
main proc
    mov ax, @data
nhaptoan:
    mov ds, ax
    mov dx, 0
    mov cx, 0
    mov bx, 0    
    mov ah, 9
    lea dx, s1
    int 21h
    
    mov ah, 1
    int 21h
    sub al,'0' 
    mov dl, al
    mov ah, 1
    int 21h
    cmp al, 13
    je thoattoan: 
    mov cl, al
    mov al, dl
    mov ah, 0
    mov bx, 10
    mul bx
    mov dl, al
    mov al, cl
    
    sub al, '0'
    add dl, al
    cmp dl, 0

    cmp dl, 10
    ja nhaptoan
thoattoan:     
    mov t, dl

nhaply:   
    mov dx, 0
    mov cx, 0
    mov bx, 0  
    mov ah, 9
    lea dx, s2
    int 21h
    
    mov ah, 1
    int 21h
    sub al,'0'
    mov dl, al
    mov ah, 1
    int 21h
    cmp al, 13 
    
    je thoatly:
    mov cl, al
    mov al, dl
    mov ah, 0
    mov bx, 10
    mul bx
    mov dl, al
    mov al, cl
    sub al, '0'
    add dl, al
    cmp dl, 0
    jb nhaply
    cmp dl, 10
    ja nhaply
thoatly:     
    mov l, dl 
    
nhaphoa:   
    mov dx, 0
    mov cx, 0
    mov bx, 0  
    mov ah, 9
    lea dx, s3
    int 21h
    
    mov ah, 1
    int 21h
    sub al,'0' 
    mov dl, al
    mov ah, 1
    int 21h
    cmp al, 13
    je thoathoa
    mov cl, al
    mov al, dl
    mov ah, 0
    mov bx, 10
    mul bx
    mov dl, al
    mov al, cl 
    sub al, '0'
    add dl, al
    cmp dl, 0
    jb nhaphoa
    cmp dl, 10
    ja nhaphoa
thoathoa:     
    mov h, dl      
    
    mov bl, 0
    add bl, t  
    add bl, l
    add bl, h
    
    mov tong, bl 
    
    mov ah, 9
    lea dx, stong
    int 21h
    
    cmp tong, 10
    jb  xuat1
    ja  xuat2
xuat1:    
    mov ah, 2
    mov dl, tong   
    add dl, '0'
    int 21h
    jmp thoatxuat
xuat2:
    mov ah, 0
    mov bl, 10
    mov al, tong
    div bl
    
    mov bh, ah
    mov bl, al
    
    mov ah, 2
    mov dl, bl
    add dl, '0'
    int 21h 
    
    mov ah, 2
    mov dl, bh
    add dl, '0'
    int 21h   
thoatxuat:    
     
    mov ah, 9
    lea dx, rank 
    int 21h
    
    cmp tong, 10
    jb kem
    cmp tong, 20
    jb kha
    ja gioi
kem:
    mov ah, 9
    lea dx, hkem
    int 21h
    jmp thoatsosanh
kha:  
    mov ah, 9
    lea dx, hkha
    int 21h
    jmp thoatsosanh
gioi:     
    mov ah, 9
    lea dx, hgioi
    int 21h
    jmp thoatsosanh
thoatsosanh:

       
    mov ah, 4ch
    int 21h
    
    main endp
end main