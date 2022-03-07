[org 0x100] ; basic organization directive

jmp main
num1: dw 0x1234

main:
	mov ax, [num1] ; writing data to ax

mov ax, 0x4c00 ; terminating program
int 0x21