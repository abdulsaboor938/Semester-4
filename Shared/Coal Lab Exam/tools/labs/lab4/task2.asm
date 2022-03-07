; subtraction of 64-bit number
[org 0x100]

jmp main
dest: dd 40000 
src: dd 80000 

main:
    mov ax, [src] 
    sub word [dest], ax 
    mov ax, [src+2] 
    sbb word [dest+2], ax 
    mov ax, [src+4] 
    sbb word [dest+4], ax 
    mov ax, [src+4] 
    sbb word [dest+4], ax 

mov ax, 0x4c00
int 0x21