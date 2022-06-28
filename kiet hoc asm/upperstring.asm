INCLUDE Irvine32.inc

.data
aString byte 50 dup(0), 0
strSize = ($ - aString) - 1

.code
main PROC
	xor eax,eax
	mov ecx, strSize
	mov esi, 0
	lap:
		call readchar
		call writechar
		mov aString[esi], al
		inc esi
		cmp al, 13
		jne lap 
		mov ecx, esi
		mov esi, 0

	L1:
		movzx eax, aString[esi]
		sub eax, 32
		call writechar
		add esi, type aString
		cmp esi, ecx
		jnz L1
		call crlf


		invoke exitprocess,0
main ENDP
END main