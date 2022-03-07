;search in a sorted array by the binary search method
;input: si = array offset address
;       bx = number of elements
;       cx = key
;output: si = offset of sorted array
;        ax = pos where key has been found
    mov dx,bx   ; dx = rIndex
    dec dx 
    mov bx,0    ; bx = lIndex


    START_BIN_SEARCH: ; bx=l,ax=m,dx=r
        cmp bx,dx ; exit when lIndex > rIndex
        jg NOT_FOUND_BIN_SEARCH
        mov ax,bx
        add ax,dx ; ax=bx+dx
        shr ax,1 ; ax = midindex ; m=(l+r)/2
        
        mov di,si
        add di,ax
        add di,ax
        cmp cx,[di]
        je FOUND_BIN_SEARCH            
        jg BIG_PIVOT_BIN_SEARCH
        jmp SMALL_PIVOT_BIN_SEARCH

        BIG_PIVOT_BIN_SEARCH:
            inc ax 
            mov bx,ax ; l=m+1
            jmp START_BIN_SEARCH

        SMALL_PIVOT_BIN_SEARCH:
            dec ax
            mov dx,ax ; r=m-1
            jmp START_BIN_SEARCH


    NOT_FOUND_BIN_SEARCH:
        mov ax, 0
        jmp END_BIN_SEARCH

    FOUND_BIN_SEARCH: ; index already in ax
        mov ax, 1
        jmp END_BIN_SEARCH


    END_BIN_SEARCH:

mov ax, 0x4c00
int 0x21