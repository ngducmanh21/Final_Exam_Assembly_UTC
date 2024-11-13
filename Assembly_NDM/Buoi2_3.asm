.model samll
.stack 100h
.data
    num1in db 'Nhap so: $'  
    num1out db 'So thu nhat la: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov cl, 1
        int 21h
        
        mov ah, 9
        lea dx, num1in
        int 21h
        
               
        mov ah, 1
        int 21h
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
        
        mov dl, bl
        sub dl, cl
        int 21h
        
        mov ah,2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h 
        
       
        mov dl, bl
        add dl, cl
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp  
    end main
