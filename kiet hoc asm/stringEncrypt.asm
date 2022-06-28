INCLUDE Irvine32.inc


BUFMAX = 128


.data
	sPrompt byte "Nhap noi dung can ma hoa: ", 0
	sPromptKey byte "Nhap Key ma hoa: ", 0
	sEncrypt byte "Ket qua encrypt: ",0
	sDecrypt byte "Ket qua decrypt: ",0
	buffer byte BUFMAX+ 1 dup(0)
	bufsize dword ?
	key dword ?
		
.code
main PROC
	call Nhap
	call translate
	mov edx, offset sEncrypt
	call Xuat
	call translate
	mov edx, offset sDecrypt
	call Xuat
exit
main ENDP

Nhap PROC
	pushad
	mov edx, offset sPrompt
	call writestring
	mov ecx, BUFMAX
	mov edx, offset buffer
	call ReadString
	mov bufsize, eax
	call crlf
	mov edx, offset sPromptKey
	call writestring
	call readint
	mov key, eax
	call crlf
	popad
	ret
Nhap endp

Xuat proc
	pushad
	call writestring
	mov edx, offset buffer
	call writestring
	call crlf
	call crlf
	popad
	ret
Xuat ENDP

translate proc

	pushad
	mov ecx, bufsize
	mov esi, 0
	L1:
		mov ebx, key
		xor buffer[esi], bl
		inc esi
		loop L1
	popad
	ret
translate endp




END main