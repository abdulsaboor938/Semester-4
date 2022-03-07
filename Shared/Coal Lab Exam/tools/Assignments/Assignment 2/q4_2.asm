[org 0x100]

mov ah,0
mov al,172
mov bl,128
add al,bl

mov ax, 0x4c00
int 0x21

;   What is the values of AX at the end of this code?
;   AX: 002C

;   Reason
;       The result of this calculation is 300 and since al is 8 bit register, the last bit is lost in overflow
;       and the remaining result is stored in AL which is 2C. Hence we get our result in AX.