; a program to add ten numbers using register + offset addressing 
[org 0x0100] 
        mov bx, 0 ; initialize array index to zero 
        mov cx, 3 ; load count of numbers in cx 
        mov ax, 10 ; initialize addition value

l1:     add [num1+bx], ax ; add number to element
        mov dx, [num1+bx] ; for visualizing purpose
        add ax, 10 ; add 10 to ax
        add bx, 2 ; advance bx to next index 
        sub cx, 1 ; numbers to be added reduced 
        jnz l1 ; if numbers remain add next 
 
mov ax, 0x4c00 ; terminate program 
int 0x21 

num1: dw 10, 20, 30