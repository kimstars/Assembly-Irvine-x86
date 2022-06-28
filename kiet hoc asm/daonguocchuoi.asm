INCLUDE Irvine32.inc

ExitProcess proto,dwExitCode:dword

.stack 4096
.data
	aName byte "chutuankiet",0
	result byte 100 dup (?)
	nameSize = ($ - aName) -1

.code
main PROC
	mov ecx, nameSize
	mov esi, 0
	L1:
		movzx eax, aName[esi]
		push eax
		inc esi
		loop L1
	
	mov ecx, nameSize
	mov esi, 0
	L2:
		pop eax
		mov aName[esi], al
		inc esi
		loop L2

	mov edx, offset result
	call writestring



	Invoke ExitProcess,0

main ENDP
END main