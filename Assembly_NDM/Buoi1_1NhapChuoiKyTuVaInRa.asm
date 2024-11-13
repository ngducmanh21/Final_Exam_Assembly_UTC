.model small
.stack 100h    
.data
    msgi db 'Nhap chuoi ky tu: $'
    str db 100 dup(?)
    msgo db 10,13, 'Ket qua thuong -> hoa: $'
.code
main PROC  
    ; chuyen dia chi data vao ds 
    mov ax, @data
    mov ds, ax 
    
    ;in thong bao 
    mov ah, 9
    lea dx, msgi
    int 21h
    
    ;nhap 10 ky tu
    ;mov cx, 10 ;so lan lap 10 lan
    mov bx, 0; i
    
nhap:    
    mov ah,1
    int 21h  
    cmp al, 13 
    je dung
    mov str[bx], al ; str[i] = al
    inc bx; i++ 
    jmp nhap
dung:
    ; in thong bao in
    lea dx, msgo
    mov ah, 9
    int 21h
    
    ;in chuoi
    mov cx, bx ;so lan lap = so ky tu trong chuoi 
    mov bx, 0
inchuoi: 
    mov ah,2
    mov dl, str[bx]
    inc bx
    int 21h  
    loop inchuoi  
    
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    
main ENDP
END main