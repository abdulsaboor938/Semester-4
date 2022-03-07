; 4bit multiplication algorithm 
[org 0x100] 
jmp start 

multiplicand: dw 13 ; 16bit multiplicand (8bit space) 
multiplier: db 5 ; 8bit multiplier 
result: dw 0 ; 16bit result 

start: 
    mov cx, 8 ; initialize bit count to 8 
    mov bx, [multiplicand] ; load multiplicand in bl 
    mov dx, [multiplier] ; load multiplier in dl 
    checkbit: 
        shr dx, 1 ; move right most bit in carry 
        jnc skip ; skip addition if bit is zero 
        add word[result], bx ; accumulate result 

    skip: 
        shl bx, 1 ; shift multiplicand left 
        dec cx ; decrement bit count 
        jnz checkbit ; repeat if bits left 
mov ax, 0x4c00 ; terminate program 
int 0x21