.model samll
.stack 100h
.data
    test1 db 'Nhap mot sau ki tu: $'  
    test2 db 'Ki tu ban vua nhap la: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, test1
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
        lea dx, test2
        int 21h
        
        mov ah,2
        mov dl, bl
        int 21h
        
        mov ah, 4ch
        int 21h
        
        main endp  
    end main
