; This file will be used to check the specific behaviour of registers and their purpose

[org 0x100]

jmp main
arr: dw 1,2,3,4,5

main:
    mov ax, arr
    mov bx, arr
    mov cx, arr
    mov dx, 2
    mov si, 2
    ;mov ax, [ax] ; this is illegal

    ; anything other than ax will raise an error if we try to move to bx
    ; in short we cannot add anythig to ax and copy to 
    
    ; mov bx, [bx] only works for bxand not any other registers
    mov cx, [bx+si+4]

    ; in short only manipulating with ax is not allowed

    ;    mov cx, [bx+dx]; we can not add two registers as well

mov ax, 0x4c00
int 0x21