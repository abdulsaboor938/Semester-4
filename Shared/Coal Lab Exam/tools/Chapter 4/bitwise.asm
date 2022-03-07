; This file contains an outline of alll the bitwise operations

and ax, bx
or ax, bx
xor ax, bx
not ax ; inverts all bits
test ax, bx ; performs and but updates flags instead of changing
; all results are visible in the destination

; all these operations are performed in a bit by bit manner

; These operations can alos be used for bit masking like setting or clearing individual bits
and ax, 0x0000 ; This can be used to clear all the bits in ax
or ax, 0xffff ; this can be used to set all bits in the ax
xor ax, 0000000000000001b ; this can be used to invert selected bits in ax
test ax, bx ; this performs and operation but updates flag registers instead of changing the operands

; Multiplication using test instruction

; 16bit multiplication using test for bit testing 
[org 0x0100] 
jmp start 
multiplicand: dd 1300 ; 16bit multiplicand 32bit space 
multiplier: dw 500 ; 16bit multiplier 
result: dd 0 ; 32bit result 

start: 
    mov cl, 16 ; initialize bit count to 16 
    mov bx, 1 ; initialize bit mask 
    checkbit: 
        test bx, [multiplier] ; test right most bit 
        jz skip ; skip addition if bit is zero 
        mov ax, [multiplicand] 
        add [result], ax ; add less significant word 
        mov ax, [multiplicand+2] 
        adc [result+2], ax ; add more significant word 
    skip: 
        shl word [multiplicand], 1 
        rcl word [multiplicand+2], 1 ; shift multiplicand left 
        shl bx, 1 ; shift mask towards next bit 
        dec cl ; decrement bit count 
        jnz checkbit ; repeat if bits left 
mov ax, 0x4c00 ; terminate program 
int 0x21