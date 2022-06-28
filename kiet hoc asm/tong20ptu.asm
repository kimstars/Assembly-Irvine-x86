INCLUDE Irvine32.inc

.data
arr dword ?
string byte "nhap phan tu ",0
tb1 byte "nhap 20 phan tu :",0
endstr byte " : ",0
tong byte "tong:",0
.code


main PROC
	mov ebx, 0
	mov ecx, 0
	lea edx, tb1
	call writestring

	lap:
		lea edx,string
		call writestring
		mov eax, ecx
		call writeint
		call readint
		;mov arr[ecx],eax
		add ebx,eax
		add ecx,1
		cmp ecx,20
	jne lap

	lea edx, tong
	call writestring
	mov eax,ebx
	call writedec
	call crlf
main ENDP
END main