[org 0x100]

mov al, 05h ; h is for hex
test al,09h
mov ax, 0x4c00
int 0x21

;   What is the value if AL at the end of this code?
;       The value of AL at the end of this code is 05 as we are storing 05 in AL in first instruction.

;   What is value of ZF at the end of this code?
;       The value of ZF at the end of this code is 0 as we are comparing value of AL with 09 in second
;       instruction. Since 05 is not equal to 09, hence the zero-flag (ZF) is set 0.