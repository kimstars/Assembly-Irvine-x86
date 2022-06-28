INCLUDE Irvine32.inc
.data
	val1 dword ?
	sDeBai byte "Chuyen mot so thanh dang ki tu", 0
	sInput byte "Nhap mot so : ",0
	sRes byte "Ket qua: ",0
.code
main PROC
	mov edx, offset sDebai
	call writestring
	call crlf
	mov edx, offset sInput
	call writestring
	call crlf
	call readint
	or al,00110000b
	call crlf
	mov edx, offset sRes
	call writestring
	call writechar
	call crlf


main ENDP
END main