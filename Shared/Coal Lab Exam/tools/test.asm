[org 0x100]

mov ah, 15
xor ah, 00001000b

mov ax, 0x4c00
int 0x21