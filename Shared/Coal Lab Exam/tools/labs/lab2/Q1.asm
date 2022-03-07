; This program wil add the upper and lower number of a double word and store in another variable
[org 0x100]

    mov ax, [num1] ; Storing first part in accumulator
    mov bx, [num1+ 2] ; Storing second part in num2
    add ax, bx ; adding both values
    mov [sum], ax; storing sum in variable

    mov ax, 0x4c00
    int 0x21

num1: dd 0xAABBCCDD
sum: dw 0