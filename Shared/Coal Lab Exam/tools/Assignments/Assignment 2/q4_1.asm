[org 0x100]

mov al,-128
mov bl,117
cmp al, bl
ja exit

exit:
    mov ax, 0x4c00
    int 0x21

;   What is the value of following at the end of  code?
;   OF: 1
;   CF: 0
;   SF: 0

;   Reason:
;       Here we are comparing a negative number with a positive number but the destination of
;       comparison is Al. Going inside comparison we are in realtiy subtracting 117 from -128 which
;       is just addition at end. The result of this addition is a negative number which is bigger 
;       than 8-bit equivalent source. Hence an overflow occurs which is represented by the flag.