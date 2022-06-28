INCLUDE Irvine32.inc

PrintArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

ReadArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

swappos PROTO,
		pArr:PTR DWORD,
		Count : DWORD,
		pos1: dword, 
		pos2: dword


.data
	arr1 dword 3,4,5,2,3,5,6,4,3,5,7,6,8
	arr2 dword 4,5,6,3,5,7,6,8,9,7,8,10,1

	lenarr = ($ - arr2)/4

	p1 dword 3
	p2 dword 4

	showarr1 byte "arr1 : ", 0
	showarr2 byte "arr2 : ", 0


	mess1 byte "nhap vi tri can doi cho: ",0
	mess2 byte "nhap vi tri muon doi cho: ",0
	messRes byte "Ket qua sau doi cho: ",0

	
.code
main PROC
	;------------------ show array1,2

	mov edx, offset showarr1
	call writestring
	invoke PrintArr, addr arr1, lenarr

	call crlf

	mov edx, offset showarr2
	call writestring
	invoke PrintArr, addr arr2, lenarr
	call crlf
	
	;------------------------ read position
	mov edx, offset mess1
	call writestring
	call readint
	mov p1, eax


	mov edx,offset mess2
	call writestring
	call readint
	mov p2, eax


	;invoke PrintArr, addr arr, lenarr

	invoke swappos, addr arr1, lenarr, p1,p2
	invoke swappos, addr arr2, lenarr, p1,p2

	mov edx,offset messRes
	call writestring


	call crlf


	mov edx, offset showarr1
	call writestring
	invoke PrintArr, addr arr1, lenarr

	call crlf

	mov edx, offset showarr2
	call writestring
	invoke PrintArr, addr arr2, lenarr
	call crlf

	
exit
main ENDP


swappos proc, pArr:ptr dword, count: dword, pos1: dword, pos2: dword

	mov esi, pArr
	mov ecx, pos1
	mov edx, pos2

	mov eax, [esi + ecx*4]
	mov ebx, [esi + edx*4]
	mov [esi + edx*4], eax
	mov [esi + ecx*4], ebx
	
	ret

swappos endp 




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







END main