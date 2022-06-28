INCLUDE Irvine32.inc
.data
; s = (a - 1) + 15h - b - c + (d + 266)
	strNhap1 byte "nhap a =  ",0
	strNhap2 byte "Nhap b =  ",0
	strNhap3 byte "Nhap c =  ",0
	strNhap4 byte "Nhap d =  ",0
	strKetqua byte "Ket qua (a - 1) + 15h - b - c + (d + 266) =  ",0
	int0 sdword 0
	int1 sdword 0
	int2 sdword 0
	int3 sdword 0
	res sdword 0
.code

nhap proc
	lea edx, strNhap1 
	call writestring
	call readint
	mov int0, eax

	lea edx, strNhap2
	call writestring
	call readint
	mov int1, eax

	lea edx, strNhap3
	call writestring
	call readint
	mov int2, eax

	lea edx, strNhap4
	call writestring
	call readint
	mov int3, eax

	call writeint
    call crlf
    ret 
nhap endp




main proc
	; s = (a - 1) + 15h - b - c + (d + 266)
	call nhap

	mov eax, int0
	dec eax
	add eax , 15h
	sub eax , int1
	sub eax , int2

	lea edx, strKetqua
    call writestring

	mov ebx, int3
	add ebx, 266
	add eax, ebx
	CALL writeint





main ENDP
END main

