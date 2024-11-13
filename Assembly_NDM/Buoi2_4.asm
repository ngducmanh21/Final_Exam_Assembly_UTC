.model samll
.stack 100h
.data
    num1in db 'Nhap so thu nhat: $'  
    num1out db 'So thu nhat la: $'  
    num2in db 'Nhap so thu hai: $'
    num2out db 'So thu hai la: $'
    a db 0
    b db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        
        mov ah, 9
        lea dx, num1in
        int 21h
        
               
        mov ah, 1
        int 21h   
        sub al, 48
        mov bl, al
        mov ah,2   
        
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        mov ah,9
        lea dx, num1out
        int 21h
             
        
        mov ah,2
        mov dl, bl
        int 21h
        
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        mov ah, 9
        lea dx, num2in
        int 21h
        
               
        mov ah, 1
        int 21h   
        sub al, 48
        mov cl, al
        mov ah,2   
        
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        mov ah,9
        lea dx, num2out
        int 21h
             
        
        mov ah,2
        mov dl, cl 
        
        int 21h
        
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
          
        mov ah,2
        add cl, bl
        mov dl, cl;
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp  
    end main
