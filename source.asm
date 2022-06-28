; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr dword  1,2,3,8,4,6,99,102,26,14
msg_01 db 'So lon nhat la: ',0
msg_02 db 'Tai vi tri: ',0
.code
main proc
;int i, pos = 0;
;int temp;
;temp = A[0];
;for (i = 0; i < len; i++)
;{
;if (temp < A[i])
;{
     ;temp = A[i];
     ;pos = i;
;}
;}
;return pos+1;
    MOV ECX,9
    MOV ESI,0;ESI is pointer
    MOV EAX,arr[ESI];temp=A[0]
Lap:     
     CMP EAX,arr[ESI];so sanh voi cac so phia sau
     JGE next;neu EAX >= phan tu so sanh thi vong lap tiep theo
     XCHG EAX,arr[ESI]; swap
     MOV EDI,ESI;pos cua so lon nhat
next:
     ADD ESI,TYPE arr
     LOOP Lap
     ;in thong bao so lon nhat
     MOV EDX,OFFSET msg_01
     call WriteString
     call WriteDec
     call crlf

     MOV EDX,OFFSET msg_02     
     call WriteString
     ;thuc hien phep chia de tim vi tri
     MOV EDX,0;phep chia 32bit nen cho EDX=0
     MOV EAX,EDI;EAX =vi tri/ TYPE cua  mang
     MOV EBX, TYPE arr
     DIV EBX
     ;in ra vi tri
     call WriteDec
	invoke ExitProcess,0
main endp

end main