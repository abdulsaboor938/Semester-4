; program to manipulate al and bl
[org 0x100]

mov al, 11001010b
mov bl, 00000000b
mov cx, 0
l1:
    mov byte ah, 0
    shl byte al, 1
    rcl byte ah, 1
    shl byte al, 1
    rcr byte bl, 1
    shr byte ah, 1
    rcr byte bl, 1
    inc cx
    cmp byte al, 0
    jnz l1

mov ax, 0x4c00
int 0x21