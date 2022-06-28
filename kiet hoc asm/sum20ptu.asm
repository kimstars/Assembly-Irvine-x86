INCLUDE Irvine32.inc

ReadArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

PrintArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

Sum PROTO,
		pArr:PTR DWORD,
		Count : DWORD

.data
	msg01 db "Nhap so phan tu cua mang : ", 0
	msg02 db "Nhap cac phan tu : ",0
	msg03 db "Tong : ",0
	n dword 0
	arr dword 100 dup(?)

.code
main PROC
	mov edx, offset msg01
	call writestring
	call readint
	mov n, eax

	mov edx, offset msg02
	call writestring

	invoke ReadArr, ADDR arr, n

	mov edx, offset msg03
	call writestring
	invoke Sum, ADDR arr, n

main ENDP

ReadArr proc, pArr:ptr dword, count:dword
	mov ecx, count
	mov esi, pArr
	lap:
		call readint
		mov [esi], eax
		add esi, type pArr
		dec ecx
		cmp ecx,0
		jnz lap

	ret
ReadArr endp

Sum proc, pArr:ptr dword, count:dword
	mov ecx, count
	mov esi, pArr
	mov ebx, 0
	lap:
		mov eax, [esi]
		add ebx, eax
		add esi, type pArr
		loop lap
	mov eax, ebx
	call writeint
	ret

Sum endp


PrintArr proc, pArr:ptr dword, count: dword
	mov ecx, count
	mov esi, pArr
	lap: 
		mov eax, [esi]
		call writedec
		mov eax, ' '
		call writechar
		add esi, type pArr
		loop lap
	ret

PrintArr endp


END main