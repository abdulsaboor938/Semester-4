; this is a comment. Comment starts with a semicolon
; this program adds three numbers in registers

[org 0x0100] ; we will see org directive later
    mov ax,6 ; initializing first value
    add ax,6 ; adding vlaue
    add ax,6 ; adding value
    add ax,6 ; adding value
    add ax,6 ; adding value
    add ax,6 ; adding value
    
mov ax, 0x4c00 ;terminate the program
int 0x21