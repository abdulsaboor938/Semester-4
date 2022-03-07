; THis file contaions all the jump instructions that are provided in the assembly language
; Keep in mind that we use JA and JB for unsigned and JG and JL for signed integers

[org 0x100]

    ; CF = Carry Flag
    ; ZF = Zero Flag
    ; SF = Sign Flag
    ; PF = Parity Flag

    ; CF = 1
    JC label ; Jump if carry
    JB ; jump below
    JNAE ; jump if no above or equal

    ; CF = 0
    JNC ; Jump if not carry 
    JNB ; Jump if not below
    JAE ; Jump if above or equal

    ; ZF = 1
    JE ; Jump if equal
    JZ ; Jump if zero
 
    ; ZF = 0
    JNE ; Jump if not equal 
    JNZ ; Jump if not zero

    ; ZF = 0 AND CF = 0 
    JA ; Jump if above 
    JNBE ; Jump if not below or equal

    ; ZF = 1 OR CF = 1
    JNA ; Jump if not above 
    JBE ; Jump if below or equal

    ; SF ≠ OF 
    JL ; Jump if less 
    JNGE ; Jump if not greater or equal

    ; SF = OF
    JNL ; Jump if not less 
    JGE ; Jump if greater or equal    

    ; ZF = 0 AND SF = OF 
    JG ; Jump if greater 
    JNLE ; Jump if not less or equal

    ; ZF = 1 OR SF ≠ OF
    JNG ; Jump if not greater 
    JLE ; Jump if less or equal

    ; OF = 1
    JO ; Jump if overflow
    JNO ; Jump if not overflow, OF = 0

    JS ; Jump if SF = 1
    JNS ; jump if SF = 0

    ; PF = 1
    JP ; Jump if parity 
    JPE ; Jump if even parity 

    ; PF = 0
    JNP ; Jump if not parity 
    JPO ; Jump if odd parity

    ; CX = 0
    JCXZ ; Jump if CX is zero 