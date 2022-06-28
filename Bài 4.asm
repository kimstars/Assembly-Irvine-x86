; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr db 1,5,8,4,20,63,15
sizeArr = ($-arr)
max db ?
.code
main proc
     call SearchMax
     MOV EAX,0
     MOV EDI,offset arr
     MOV AL,[EDI]
     call WriteDec
	invoke ExitProcess,0
main endp
;int max = a[0];
    ;for (int i = 1; i < n; i++)
        ;if (max < a[i])
            ;max = a[i];
    ;return max;
searchMax PROC
     MOV ESI,offset arr
     MOV EDI,offset arr
     MOV EAX,0
     MOV AL,[ESI];max=a[0]
     INC ESI;i=1
     MOV ECX,sizeArr
     DEC ECX;i=1 -> n-1
lap:
     CMP AL,[ESI]
     JGE next
     XCHG AL,[ESI];swap
     MOV [EDI],AL;max=a[i]
next:
     INC ESI;i++
     LOOP lap
     ret
searchMax ENDP
end main