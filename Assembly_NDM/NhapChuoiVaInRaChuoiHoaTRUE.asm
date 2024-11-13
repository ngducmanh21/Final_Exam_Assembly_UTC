.model small
.stack 100h
.data
    s1  db  'xau chu thuong: $'
    s2  db  10,13,'xau chu hoa: $'
    s   db  100     dup(?)
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
        je hienday
        mov s[bx]. al
        inc bx
        jmp nhaptiep
hienday:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, bx
        mov bx, 0
doitiep:        
        cmp s[bx], 'a'
        jl khongdoi
        sub s[bx], 32
khongdoi:
        inc bx
        loop doitiep
        
        mov s[bx], '$'
        lea dx, s
        int 21h
        main endp
    end main