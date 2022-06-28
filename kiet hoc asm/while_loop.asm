INCLUDE Irvine32.inc
.data
	array dword 10,40,30,50,60,64,23,65,72,18
	sizearr = ($ - array)/ TYPE array
	sample dword 50
	sum dword ?
.code
main PROC
	mov eax, 0 ;sum
	mov edx, sample 
	mov esi , 0 ;index
	mov ecx, sizearr ;size

	L1:	
		cmp esi, ecx 
		jl L2 ; index < size
		jmp L5 ; else
	L2: 
		cmp array[esi*4], edx ; cmp arr[i], sample
		jg L3 ; if >
		jmp L4 ; else
	L3:
		add eax, array[esi*4] ; sum += arr[i]
	L4:
		inc esi ; i++
		jmp L1 
	L5:  ; print result
		mov sum, eax
		call writeint
		call crlf
		exit

main ENDP
END main