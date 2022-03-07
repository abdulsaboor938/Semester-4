;   Write a program that compresses an ordered array (having multiple occurrences of one
;   integer). You are not allowed to use any extra array, just modify the input array.

;   Sample Run:
;   Input Arr Values: 2,2,2,3,4,4,5,5,5,6
;   After Compression Arr Values: 2,3,4,5,6,0,0,0,0,0

[org 0x100]

jmp main
arr: dw 2,2,2,3,4,4,5,5,5,6

main:
    mov bx, 0 ; a pointer to element being checked
    mov cx, 0 ; a counter for program

    loop1:
        add cx, 2 ; adding to counter
        cmp cx, 20 ; counter terminating condition
        jz end ; jumping if length is reached
        mov dx, word[arr+bx+2] ; adding element next to pointer
        cmp dx, [arr+bx] ; comparing both elements
        jne skip ; skipping element

        ; code to shift array back
        mov si, bx ; copying bx pointer to si
        add si,2 ; incrementing si
        loop2:
            mov dx, word[arr+si+2] ; moving value of next element to dx
            mov word[arr+si], dx ; storing value of dx to current counter
            add si, 2 ; incrementing si
            cmp si, 18 ; comparing if end of array is reached
            jne loop2 ; jumping back
        mov word [arr+18],0 ; adding 0 to last place
        cmp bx, 18 ; comparing if last element of array is reached
        jne loop1 ; jumping to start to repeat whole process

    skip: ; code to skip element in case not equal
        add bx, 2 ; incrementing pointer to next element
        cmp bx, 18 ; comparing if end of array is reached
        jne loop1 ; jumping back to start to repeat whole process

end: ; end of program

mov ax, 0x4c00
int 0x21