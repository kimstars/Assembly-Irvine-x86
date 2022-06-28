; Testing the ArraySum procedure	(TestArraySum.asm)
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:dword

.data
x sbyte ?
y sbyte ?
temp dword ?
.code
main proc
     MOV EBX,0 ;khởi tạo là 0
     call ReadInt; nhập số thứ nhất
     MOV temp, EAX; cho biến temp cùng dạng với eax
     mov BL , sbyte ptr temp; cho thanh ghi BL nhận giá trị sbyte của temp
     MOV x,BL; khi đó x sẽ có giá trị vừa nhập là dạng số nguyên có dấu 8 bits
     ;tương tự với y
     call ReadInt
     MOV temp, EAX
     mov BL , sbyte ptr temp
     MOV y,BL
     
MOV EAX,0
MOV EBX,0
     MOV AL, x; EAX có giá trị của x tương đương là thanh ghi AL
     MOV AL, y; giá trị y là thanh ghi BL
     MOV ECX,0;reset thanh ghi ECX
     ADD ECX,EAX
     ADD ECX,EBX; cộng vào sẽ ra tổng lưu ở CL
     
	invoke ExitProcess,0
main endp
		


end main	