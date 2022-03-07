; addition of 64-bit number
[org 0x100]

jmp main
dest: dd 40000 ,0
src: dd 80000, 0

main:
    mov ax, [src] 
    add word [dest], ax 
    mov ax, [src+2] 
    adc word [dest+2], ax
    mov ax, [src+4] 
    adc word [dest+4], ax
    mov ax, [src+6] 
    adc word [dest+6], ax

mov ax, 0x4c00
int 0x21