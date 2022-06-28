
INCLUDE Irvine32.inc

STRLEN PROTO,
		pArr:ptr byte,
		

.data
iMess1	byte "Nhap vao chuoi goc : ", 0
iMess2	byte "Nhap vao chuoi can so sanh : ", 0
MAX = 80 
string_1 BYTE MAX+1 dup(?),0 ; chuoi goc
string_2 BYTE MAX+1 dup(?),0 ; chuoi muon so sanh

lenstr1 dword ?
lenstr2 dword ?

pos dword 0

msg0     BYTE "string_1 in upper case: ",0
msg1     BYTE "string1 and string2 are equal",0
msg2     BYTE "string1 and string2 are not equal",0
.code
main PROC
	
	call InputString
	call First
	

	exit
main ENDP

InputString proc

	mov edx, offset iMess1
	call  writestring
	
	mov edx , offset string_1
	mov ecx, MAX
	call readstring


	invoke STRLEN, addr  string_1
	mov lenstr1, eax


	mov edx, offset iMess2
	call  writestring
	
	mov edx , offset string_2
	mov ecx, MAX
	call readstring

	invoke STRLEN, addr  string_2
	mov lenstr2, eax

	ret

InputString endp


First proc
	mov eax, lenstr1
	sub eax, lenstr2
	inc eax ; tinh so lan lap
	
	mov ecx, eax

	mov esi, offset string_1 ; chuoi goc
	mov edi, offset string_2 ; chuoi con
	L1:
		mov eax, [esi]
		cmp eax, [edi]
		je cmpr
		inc esi
		loop L1

	cm2:
		push ecx
		mov ecx, lenstr2
	cmpr:
		inc edi
		inc esi
		cmp [esi], [edi]
		jne 
		loop 


		
	


First endp











STRLEN  PROC,
	pArray: PTR byte
    cld
	mov edx, pArray
    mov    eax, 0
counter:
    mov    cl, [edx+eax]
    cmp    cl, 0
    JE     done
    inc    eax
    jmp    counter
done:
    ;call   writedec    
	
    ret 
STRLEN       ENDP


compare_strings PROC


	ret

compare_strings  ENDP



END main