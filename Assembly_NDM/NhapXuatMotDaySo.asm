.model small
.stack 100h
.data
    s1 db 'Nhap day: $'
    s2 db 10, 13, 'Day vua nhap la: $'     
    s  db 100 dup<?>
    
.code
main proc  
     mov ax ,@data
     mov ds, ax
     
     mov ah, 9
     lea dx, s1
     int 21h
     
     mov bx, 0
     
nhaptiep:     
     mov ah, 1
     int 21h
     cmp al, 13
     je inday
     mov s[bx], al
     inc bx
     jmp nhaptiep:
inday:
    mov ah, 9
    lea dx, s2
    int 21h
    
    mov cx, bx
    mov bx, 0
intiep:   
    mov ah, 2
    mov dl, s[bx]
    int 21h
    inc bx
    cmp bx, cx
    jl intiep
    
    mov ah, 4ch
    int 21h
    
main endp
end main