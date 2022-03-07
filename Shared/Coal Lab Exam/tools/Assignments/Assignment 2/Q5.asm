;   Write an assembly code to perform the following on a given 2-byte number X in binary
;   form using bit manipulation only:

;   1. Multiply the number by 4.
;   2. Take complement of the resulting number.
;   3. Divide the number by 2.
;   4. Input and output variables must be defined at the start of code.

jmp main
num_in : db 0000000000000001b
num_out: db 0000000000000000b

[org 0x100]

main:
    mov ax, word [num_in]
    shl ax, 2 ; multiplication by 4
    not ax ; complement
    shr ax, 1 ; dividing by 2
    mov word [num_out], ax

    mov ax, 0x4c00
    int 0x21