INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

ReadArr PROTO,
		pArr:PTR DWORD,
		Count : DWORD

PrintArr PROTO,
		pArr:ptr DWORD,
		Count:DWORD


.data
msg_01 db 'Nhap so phan tu cua mang: ',0
msg_02 db 'Nhap phan tu: ',0
n dword 0
arr dword 100 dup(?)

.code

;nhap xuat mang n phan tu
main PROC
	mov edx, offset msg_01
	call Writestring
	call readint
	mov n, eax
	
	mov edx, offset msg_02
	call writestring

	; nhap cac phan tu cho mang

	invoke ReadArr, ADDR arr, n
	invoke PrintArr, ADDR arr, n

	invoke ExitProcess, 0

main ENDP




ReadArr proc,
		pArr:ptr dword,
		count:dword
		mov ecx , count
		mov esi, pArr
	lap:
		call readint
		mov [esi], eax
		add esi, type pArr
		loop lap
	ret

ReadArr endp


PrintArr proc,
		pArr:ptr dword,
		Count : DWORD 

		mov ECX, Count
		mov ESI, pArr
	lap:
		mov EAX, [esi]
		call writedec
		mov eax, ' '
		call writechar
		add esi, type pArr ; esi += sizeof(type(pArr))
		loop lap
	ret

PrintArr endp

SelectionSort PROC uses eax ecx esi,
			pArr:PTR DWORD,
			Count: DWORD
		DEC Count
		mov ecx, Count
		mov edi, OFFSET arr
	L1:
		push ecx
		mov esi, edi 
		add esi, type pArr
	L2:
		mov eax, 0
		mov eax, [edi] ; ptu i
		mov ebx, [esi] ; ptu j
		cmp ebx, eax
		jge L3 
		; so sanh [edi] <= [esi] neu nho hon thi so sanh vong lap moi (L3)

	L3:
		add esi, type pArr
		loop L2
		; khi vong lap het
		;nhap ecx cua vong lap cha
		pop ecx ; nhan ecx cua vong lap cha
		add edi, type pArr ;ptu can sap xep tang 1
		loop L1  ;lap lai tiep ptu cha

ret
SelectionSort endp

END main