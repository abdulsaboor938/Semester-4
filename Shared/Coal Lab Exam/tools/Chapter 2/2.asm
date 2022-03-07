; file to show direct and indirect addressing

[org 0x100]

jmp main
nums: dw 1, 2, 3, 4

main
    mov ax,[nums]
    mov ax,[nums+2]
    mov ax,[nums+4]
    mov ax,[nums+6]

    ;indirect addressing
    mov si, nums
    mov ax, [si]
    add si, 2
    mov ax, [si]
    add si, 2
    mov ax, [si]
    add si, 2
    mov ax, [si]

    mov si,nums
    mov ax,[si]
    mov ax,[si+2]
    mov ax,[si+4]
    mov ax,[si+6]


mov ax, 0x4c00
int 0x21