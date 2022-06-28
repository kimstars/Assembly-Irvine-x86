INCLUDE Irvine32.inc
.data
 arr dword 50 dup(?)

buffer BYTE 32 dup(0),0

.code
main proc
    mov esi, offset arr
    mov ecx, 5
    nhap:
        call readdec
        mov [esi], eax
        add esi, type arr
        loop nhap

    mov esi, offset arr
    mov ecx, 5

    inarr:
        mov eax, dword ptr [esi]
        push ecx
        call chuyenheso
        add esi, type arr
        pop ecx
        loop inarr
    exit

main endp

chuyenheso proc 
    mov ecx, 32 
    mov edi, offset buffer
    L1:	shl	eax,1			
	    mov	BYTE PTR [edi],'0'	
	    jnc	L2				
	    mov	BYTE PTR [edi],'1'	

    L2:	inc  edi			
	    loop L1				
	    mov  edx,OFFSET buffer
	    call WriteString
	    call Crlf
    ret
    
chuyenheso endp

end main