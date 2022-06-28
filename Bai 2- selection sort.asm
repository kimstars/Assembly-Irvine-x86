; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr dword 1,6,3,8,4,9
.code
main proc
			
     MOV ECX,5;0->5
     MOV EDI,OFFSET arr;phan tu dau tien cua mang
L1:
     push ecx;vong lap cha
     mov esi,edi;esi la phan tu dau tien
     add esi,TYPE arr;tro den phan tu tiep theo i+4
L2:
     MOV EAX,0
     mov eax,[edi];eax la phan tu i
     mov ebx,[esi]
     cmp [esi],eax;so sanh phan tu i+num voi i
     jge L3;so sanh [edi] <[esi] neu nho hon thi so sanh vong lap moi, nhay xuong l3
     XCHG eax,[esi];doi cho cho nhau
     mov [edi],eax
L3:
     Add esi,TYPE arr;tang len 1, sau do lai so sanh voi phan tu i
     LOOP L2
     ;khi vong lap con het
     pop ecx;nhan ecx cua vong lap cha
     add edi,TYPE arr;phan tu can sap xep tang them 1
     loop L1;lap lai tiep phan tu cha

     MOV ECX,6;so phan tu cua mang
     MOV EDX,offset arr;cho edx di chuyen den vi tri phan tu dau
L4:        
     MOV EAX,[EDX]     ;  eax chi den phan tu [edx]
     Call WriteDec  ; in so
     call crlf          ; xuong dong
     ADD EDX,TYPE arr; cho edx chi den phan tu tiep theo
     Loop L4   ; lap
	invoke ExitProcess,0
main endp
end main