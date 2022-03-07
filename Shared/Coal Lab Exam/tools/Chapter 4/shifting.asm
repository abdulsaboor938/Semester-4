; This file contains an overview of the shifting instructions and how they work in assembly language

[org 0x100]

; Shift Logical Right SHR
; The rightmost bit is pushed to carry flag and a zero is added to the leftmost bit

; Shift Logical Left (SHL) / Shift Arithmetic Left (SAL)
; This is opposite of the shift right opeartion and same for SAL operation

; Shift Arithmetic Right (SAR) 
; This method is useful for signed numbers as the leftmost bit contains the sign of number
; So, the right most bit is pushed to carry flag while the leftmost bit is again copied into itself
; thus preserving the sign

; Rotate (Left / Right), ROR / ROL
; in rotate right every bit is shifted right and the last bit is then moved to the leftmost bit,
; this is also copied to the carry flag. ROL operation is teh opposite of this.

; Rotate through carry (Left / Right), (RCL / RCR)
; In the rotate through carry right opeartion, each bit is shifted right and the leftmost bit is 
; replaced with whatever is in carry flag, the right most bit is then placed in carry flag.
; Consider this as a rotation opeartion by adding an extra bit on the desired side.

mov ax, 0x4c00
int 0x21