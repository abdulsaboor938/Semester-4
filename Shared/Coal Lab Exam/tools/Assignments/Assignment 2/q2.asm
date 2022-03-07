;   Write an assembly code where the program takes a 2 Byte number as input and outputs
;   the number after multiplying it by 8.

[org 0x100]

jmp main
num: dw 2

main:
    mov ax, word [num] ; storing number
    mov bx, ax ; storing multiplicant
    mov cx, 0 ; initializing counter for loop

    l1:
        add ax, bx ; adding to previous result
        add cx, 1 ; incrementing counter
        cmp cx, 7 ; checking terminating condition
        jne l1 ; jumping back

mov ax, 0x4c00
int 0x21