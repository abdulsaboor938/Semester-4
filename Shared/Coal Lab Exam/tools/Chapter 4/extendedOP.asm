; This file contains a template of all the extended bit operations

num1: dd 40000 
    shr word [num1+2], 1 
    rcr word [num1], 1 

; Extended Addition
dest: dd 40000 
src: dd 80000 
    mov ax, [src] 
    add word [dest], ax 
    mov ax, [src+2] 
    adc word [dest+2], ax ; add through carry

; Extended Subtraction
dest: dd 40000 
src: dd 80000 
    mov ax, [src] 
    sub word [dest], ax 
    mov ax, [src+2] 
    sbb word [dest+2], ax ; subtract through borrow

; Extended Multiplication
; 16bit multiplication 
[org 0x0100] 

jmp start
multiplicand: dd 1300 ; 16bit multiplicand 32bit space 
multiplier: dw 500 ; 16bit multiplier 
result: dd 0 ; 32bit result 

start: 
    mov cl, 16 ; initialize bit count to 16 
    mov dx, [multiplier] ; load multiplier in dx 
    checkbit: 
        shr dx, 1 ; move right most bit in carry 
        jnc skip ; skip addition if bit is zero 
        mov ax, [multiplicand] 
        add [result], ax ; add less significant word 
        mov ax, [multiplicand+2] 
        adc [result+2], ax ; add more significant word 
    skip: 
        shl word [multiplicand], 1 
        rcl word [multiplicand+2], 1 ; shift multiplicand left 
        dec cl ; decrement bit count 
        jnz checkbit ; repeat if bits left 
mov ax, 0x4c00 ; terminate program 
int 0x21 