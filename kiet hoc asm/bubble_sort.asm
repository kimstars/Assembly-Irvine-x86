INCLUDE Irvine32.inc

BubbleSort PROTO pArray:PTR dword,
			count : dword

PrintArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

.data
	arr dword 3,4,5,2,3,5,6,4,3,5,7,6,8
	lenarr = ($ - arr)/4

.code
main PROC
	
	invoke BubbleSort, addr arr, lenarr
	invoke PrintArr, addr arr, lenarr

exit
main ENDP



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



BubbleSort proc uses eax ecx esi,
			pArray: PTR dword,
			count : dword

	mov ecx, count
	dec ecx
	L1:
		push ecx 
		mov esi, pArray
	L2: mov eax, [esi]
		cmp [esi+4], eax ; so sanh ptu tiep
		jge L3 ; [esi] <= [edi] skip
		xchg eax, [esi+4] ; else swap
		mov [esi], eax
	L3:
		add esi, 4
		loop L2
		pop ecx
		loop L1

	L4: ret	

BubbleSort endp

END main