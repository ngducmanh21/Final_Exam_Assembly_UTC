.model small
.stack 100h
.data 
    s1  db  10,13,'Nhap ten: $'
    s2  db  10,13,'Ten da chuyen: $'
    s   db  100 dup(?)    
.code
main proc
    mov ax, @data
    mov ds, ax
nhaplai:    
    mov ah, 9
    lea dx, s1
    int 21h
    mov si, 0
nhapday:
    mov ah, 1
    int 21h
    cmp al, 13
    je thoat: 
    mov s[si], al
    cmp si, '0'
    inc si
    jmp nhapday   
    
bienchudau:      
    sub s[bx], 32
    jmp tieptuc1   
bienchuhoa:
    inc bx
    sub s[bx], 32
    jmp tieptuc2
    
    
thoat:      
    mov bx, 0
tieptuc2:

    cmp bx, si
    je hienthi
    cmp bx, 0
    je bienchudau
    cmp s[bx], 32
    je bienchuhoa
tieptuc1:
    inc bx
    jmp tieptuc2
    
     
hienthi:    
    mov ah, 9
    lea dx, s2
    int 21h  
    mov s[si], '$'
    mov ah, 9
    lea dx, s
    int 21h
    
    mov ah, 4ch
    int 21h    
    
    main endp
end main