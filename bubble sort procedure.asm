include irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitcode: DWORD
Selection_Sort PROTO,
	pArray:PTR DWORD,
	Count:DWORD	,
	temp: DWORD
PrintArr PROTO,
	pArray:PTR DWORD,
	Count:DWORD
ReadArr PROTO,
	pArray:PTR DWORD,
	Count:DWORD
.data
	
	str1   byte "Moi nhap so phan tu cua mang:",0
	str2  byte "Nhap mang:",0dh, 0ah , 0 
	n dword 0 
	arr dword 100 DUP(?)
.code

main PROC
	mov ebx, 0
	mov edx, offset str1
	call writestring

	call readInt
	mov n, eax

	mov ebx, 0
	mov ebx, 0
	mov edx, offset str2 
	call writestring
	
	INVOKE ReadArr , ADDR arr, n 
	INVOKE SELECTION_SORT , ADDR ARR, N, 0
	INVOKE PrintArr , ADDR arr, n 
	

	INVOKE ExitProcess,0
main ENDP


Selection_Sort PROC USES eax ecx esi,
	pArr:PTR DWORD,		; con tro mang
	Count:DWORD,				; so phan tu cua mang
	temp: DWORD

	dec Count
	mov ecx,Count
	
	mov edi , pArr
L1:	push ecx			; luu chi so cua vong cha
	mov esi,edi	
	add esi, type pArr
L2:	
	mov eax, [edi]	 ; lay gia tri phan tu tai edi ; phan tu o vong lap cha
	cmp [esi],eax		; so sanh vs phan tu esi ; phan tu o vong lap con 
	jge L3				; [esi] <= [edi],  nhay nhan, chay vong lap tiep theo
	xchg eax,[esi]	; dao gia tri 2 phan tu
	mov [edi],eax

L3:	add esi,type pArr		;	tang esi  +4
	loop L2			;	tiep tuc quya lai vong lap con
	; khi vong lap con da het
	pop ecx			;	nhan ecx cua vong lap cha
	add edi,type pArr 
	loop L1			;	lap cha

L4:	ret
Selection_Sort ENDP

PrintArr proc ,
	pArr: PTR Dword, count: dword
	mov ecx, count
	mov esi, pArr
	lap1:
		mov eax, [esi]
		call writeInt
		mov eax, ' '
		call writeChar
		add esi, type arr			
	loop lap1
ret
PrintArr endp


ReadArr proc ,
	pArr: PTR Dword, count: dword	
	mov ecx, count
	mov esi, pArr
	lap:
		call readInt
		mov [esi], eax
		add esi, type pArr			
	loop lap 
ret
ReadArr endp

END main