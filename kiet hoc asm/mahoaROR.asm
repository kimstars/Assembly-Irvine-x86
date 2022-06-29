
INCLUDE Irvine32.inc


.data
    key byte -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
    banro byte 50 dup(?)
    ketqua byte 50 dup(?)
    msg1 db "nhap ban ro: ",0
    msg2 db "ket qua: ", 0


.code
main proc
    lea edx, msg1
    call writestring
    mov edx, offset banro
    mov ecx, 50
    call readstring
    
    call MaHoa
    mov edx, offset msg2
    call writestring
    lea edx, ketqua
    call writestring


         
   
main endp


MaHoa proc uses ecx edx esi edi
    
    mov esi, 0 ; index of plaintext
    mov edi, 0 ; index of key
    mov edx, lengthof key
    .while esi < eax 
        mov bl, banro[esi]
        mov ketqua[esi], bl
        mov cl, key[edi]
        cmp cl, 0
        jl xoaytrai
        ror ketqua[esi], cl
        jmp L1
        xoaytrai:
            neg cl
            rol ketqua[esi], cl
        L1:
            inc esi
            inc edi
            .if edi == edx
                mov edi, 0

            .endif
        .endw
        mov ketqua[esi], 0
        ret
    
MaHoa endp 


end main