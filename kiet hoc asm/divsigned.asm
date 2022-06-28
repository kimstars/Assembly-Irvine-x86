INCLUDE Irvine32.inc
.data
	array dword 10,40,30,50,70,54,55,64,34,70,60
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
		jl L2 
		jmp L5
	L2: 
		cmp array[esi*4], edx 
		jg L3 
		jmp L4 
	L3:
		add eax, array[esi*4]
	L4:
		inc esi 
		jmp L1 
	L5: 
		mov sum, eax
		call writeint
		call crlf
		exit

main ENDP
END main