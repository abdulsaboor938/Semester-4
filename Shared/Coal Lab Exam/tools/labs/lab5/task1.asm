; this program shifts an array according to passed parameters
[org 0x100]

jmp main
arr: dw 1,2,3,4,5
size: dw 5
rot:db 2
direc:db 0

rotfunc:
    ; this function checks and calls the corresponding rotate function
    dec si
    shl si, 1
    mov ch, 0 ; counter for outer loop
mainloop:
    cmp byte[direc], 0
    jz rotl
    call rotright
    jmp end

    rotl:
    call rotleft

    end:
        inc ch
        cmp ch, byte[rot]
        jnz mainloop
    ret
    
rotright:
    mov dx, word[arr+si]
    push dx
    mov di, si
    sub di, 2
    l2:
        mov dx, word[arr+di]
        mov word[arr+di+2], dx
        sub di, 2 ; moving to previous index
        cmp di,0
        jnz l2
    mov dx, word[arr]
    mov word[arr+2], dx
    pop dx
    mov word[arr], dx
    ret ; returning from function
 

rotleft:
    mov dx, word[arr]
    push dx
    mov di, 0
    l1:
        mov dx, word[arr+di+2]
        mov word[arr+di], dx
        add di, 2 ; moving to next index
        cmp di,si
        jnz l1
    pop dx
    mov word[arr+si], dx
    ret ; returning from function

main:
    mov ax, arr
    mov si, word[size]
    call rotfunc

mov ax, 0x4c00
int 0x21