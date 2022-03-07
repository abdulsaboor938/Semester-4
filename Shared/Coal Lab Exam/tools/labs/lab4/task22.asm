[org 0x100]

jmp main
num: dw 1100010110100011b

main:
    mov cx, 0
    mov ax, [num]
    l1:
        shr ax, 1
        jnc skip
        add cx, 1

        skip:
            cmp ax, 0
            jnz l1
        
        mov word[num], cx
        cmp word[num], 1
        jnz main

mov ax, 0x4c00
int 0x21