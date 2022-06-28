INCLUDE Irvine32.inc

.data
casetable	byte 'A'
			dword ProcessA
			byte 'B'
			dword ProcessB
num = 4

prompt byte "press A or B",0

msgA byte "process A",0
.code
main PROC
	mov edx, offset prompt
	call writestring
	call readchar

	mov ebx, offset casetable
	mov ecx, num

	L1: 
		cmp al, [ebx]
		jne L2
		call NEAR PTR [ebx + 1]
		call writestring
		call crlf 
		jmp L3

	L2:
		add ebx, 5
		loop L1

	L3: 
		exit

main ENDP

ProcessA proc 
	mov edx, offset msgA
	ret
ProcessA endp

ProcessB proc 
	ret

ProcessB endp

END main