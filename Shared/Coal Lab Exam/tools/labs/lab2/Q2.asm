; THis program will swap upper and lower part in a number
[org 0x100]

    mov ax, word[num1] ; moving first part of number into accumulator
    mov bx, word[num1+2] ; moving lower part into base register
    mov word[num1], bx
    mov word[num1+2], ax

    mov ax, 0x4c00
    int 0x21

num1:   dd  0xAABBCCDD