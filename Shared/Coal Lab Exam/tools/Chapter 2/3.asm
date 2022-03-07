; here are the default segment associations in the assembly language

; default asscociation of IP is with CS segment, and SP with SS segment and this can not be changed
; all other registers can be overridden

[org 0x100]

mov ax, [cs:0]
inc ax
mov[cs:2], ax

mov ax, 0x4c00
int 0x21