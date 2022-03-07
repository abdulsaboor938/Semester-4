;   Consider that four digits of your roll number are hexa decimal numbers. Write a program
;   to add first two digits of your roll number to the last two digits and store the sum in
;   register al. For example, if your roll number is 6722, then add 67 to 22 and save the result
;   in al. Please also mention the status of following flags after this operation: Carry,
;   Overflow, Sign, Zero, Parity.

[org 0x100]

jmp main ; jumping to program
roll_no: dw 0x1113 ;   Storing roll_no in memory


main:  mov al, byte [roll_no]  ;   reading data from memory
        add al, byte [roll_no+1]  ;   adding and storing result in al

        mov ax, 0x4c00
        int 0x21

; The values of registers after execution of program are:
; Carry  : 0
; Sign   : 0
; Zero   : 0
; Parity : 0