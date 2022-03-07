;   program to give the highest of three variables by a function

[org 0x100] ; organization directive

jmp main
nums: dw 1,2,-4 ; three numbers to be checked

high_func: ; function for highest values
    push bp ; storing old value of bp on stack
    mov bp, sp ; pointing bp to current value
    sub sp, 2 ; creating a space for local variable storing max value on stack
    push ax ; saving the value of ax on stack

    ; first value operations
    mov ax, word[bp+4] ; moving first value to ax
    mov word[bp-2], ax ; storing as higest value

    ; second value operations
    mov ax, word[bp+6] ; moving second value to ax
    cmp ax, word[bp-2] ; comparing with max value
    jl skip1 ; skip if not greater
    mov word[bp-2], ax ; changing max value if greater

    skip1:
    ; third value operations
    mov ax, word[bp+8] ; moving third value to ax
    cmp ax, word[bp-2] ; comparing with max value
    jl skip2 ; skip if not greater
    mov word[bp-2], ax ; changing max value if greater

    skip2:
    ; final operations
    mov ax, word[bp-2] ; capturing max value in ax
    mov word[bp+10], ax ; storing maximum value on output place
    pop ax ; restoring old value of ax
    mov sp, bp ; deleting max variable
    pop bp ; retoring old value of bp
    ret 6 ; returning and deleting 3 values


main: ; main function
    mov ax , 0 ; initializing ax
    push ax ; creating a space for output on stack
    mov ax, word[nums] ; moving first number to ax
    push ax ; pushing num1 to stack
    mov ax, word[nums+2] ; moving second number to ax
    push ax ; pushing num2 to stack
    mov ax, word[nums+4] ; moving third number to ax
    push ax ; pushing num3 to stack
    call high_func ; calling function to return highest valuess

    pop ax ; storing highest value in ax

    mov ax, 0x4c00
    int 0x21