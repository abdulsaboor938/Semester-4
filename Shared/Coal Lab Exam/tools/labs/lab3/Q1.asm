; This program will generate first ten numbers of fibonacci sequence
[org 0x100]
    mov bx, fib_nums

l1: mov ax, [bx]
    add bx, 2
    add ax, [bx]
    add bx, 2
    mov [bx], ax
    sub bx, 2
    cmp bx, 18
    jne l1

    mov ax,0x4c00
    int 0x21

fib_nums: dw 0,1,0,0,0,0,0,0,0,0