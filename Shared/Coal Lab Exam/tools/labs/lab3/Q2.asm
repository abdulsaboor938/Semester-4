[org 0x100]

    mov bx, my_array
    mov cx, 0
    mov dx, [array_len]

l1: mov ax, [bx]
    add ax, cx
    mov [bx], ax
    add bx, 2
    add cx, 1
    cmp cx, dx
    jne l1


my_array: dw 10,34,6,67,24,656,75,59,34
array_len: dw 9