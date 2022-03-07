[org 0x100]

main:
    mov ax, 6
    mov bx, 10
    mov dx, 1
    sub ax, 1
    l1:
        shl dx, 1
        sub ax, 1
        jnz l1
         
    xor bx, dx

mov ax, 0x4c00
int 0x21