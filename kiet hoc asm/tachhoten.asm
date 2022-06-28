INCLUDE Irvine32.inc


tachten PROTO,
	pArray:PTR dword,
	count : dword

.data
	pInput byte "Nhap ho ten : ",0
	pAns byte "Ten cua ban la:",0

	wrdtemp byte ?

	ten byte ?

	lenc dword 13

.code
main PROC
	mov edx, offset pInput
	call writestring
	mov edx, offset wrdtemp
	mov ecx, 100
	call readstring

	invoke tachten, addr ten, lenc

exit
main ENDP

tachten proc,
	pArray:PTR dword,
	count : dword
	
	xor  eax, eax
	mov esi, offset wrdtemp
	mov ecx, count

	L1:
		mov eax, [esi]
		cmp eax, 0
		jz L2
		push eax
		loop L1
	L2:
		xor eax,eax
		mov ecx, count
		mov edx, 0
		mov esi, offset ten
	L3:
		pop eax
		cmp eax, ' '
		je  L4
		mov [esi], eax
		add esi, type ten
		inc edx
		LOOP L3
	mov ecx, edx
	mov esi, offset ten
	mov eax, 0
	L4: ;push
		mov eax, [esi]
		push eax
		add esi, type ten
		loop L4

		mov edx,offset pAns
		call writestring
		mov ecx, edx
	L5: ;print
		pop eax
		call writestring
		loop L5
		
	
tachten endp


END main