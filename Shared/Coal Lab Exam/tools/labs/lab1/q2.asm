; this is a comment. Comment starts with a semicolon
; this program adds three numbers in registers

[org 0x0100] ; we will see org directive later
    mov ax, 15 ; a value in ax
    mov bx, 10 ; a value in bx
    mov cx, ax ; storing value of ax in cx
    sub cx,bx ; subtracting the value
    
mov ax, 0x4c00 ;terminate the program
int 0x21