[org 0x100]

jmp main
arr: dw 1011001001011101b
;arr: dw 0000000000000101b

main:
    mov ax, word[arr]
    mov cl, 8

    l1:
        mov ch, 0
        shr ax, 1
        rcl ch, 1
        shr ax, 1
        rcl ch, 1
        shl ax, 2
        shr ch, 1
        rcr ax, 1
        shr ch, 1
        rcr ax, 1
        sub cl, 1
        jnz l1

    mov [arr], ax

mov ax, 0x4c00
int 0x21