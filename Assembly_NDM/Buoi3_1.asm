.model small
.stack 100H
.data
.code
    main proc   
        mov ah,2
        mov dl,'A'
        
   back:
        int 21h
        mov bl, dl
        
        mov dl, 32 
        int 21h
        mov dl, bl
        
        inc dl
        cmp dl, 'Z'
        jle back
   thoat:
       
        mov ah, 4ch
        int 21h
        main endp
    
    end main