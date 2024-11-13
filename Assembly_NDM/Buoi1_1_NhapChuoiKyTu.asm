.model small
.stack 100h    
.data
    msgi db 'Nhap chuoi ky tu: $'
    str db 100 dup(?)
    msgo db 10,13, 'Ket qua: $'
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
    mov cx, 10 ;so lan lap 10 lan
    mv bx, 0; i
    
nhap:    
    mov ah,1
    int 21h
    mov str[bx], al ; str[i] = al
    inc bx; i++ 
    loop nhap
    
    
    mov ah,9
    lea dx, str
    int 21h
            
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h
    
main ENDP
END main