; 16bit multiplication 

; Steps
; multiplicand is 32-bit
; multiplier is 16 bit
; result is 32 bit

; shift multiplier to right
; if carry is 0
; skip by shifting multiplicand to left, and rotating through carry as well

; else add to result and also add through carry to result + 2

[org 0x100]

jmp main
multiplicand: dd 1300
multiplier: dw 500
result: dd 0

main:
    shr word[multiplier], 1
    jnc skip
    mov dx, word[multiplicand]
    add word[result], dx
    mov dx, word[multiplicand+2]
    adc word[result+2], dx

    skip:
        shl word[multiplicand], 1
        rcl word[multiplicand+2], 1
        cmp word[multiplier], 0
        jnz main
    
mov ax, 0x4c00
int 0x21