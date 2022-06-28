; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr dword  1,2,3,4,5,4,3,2,1
arrSize=($-arr)/TYPE arr
vongLap=arrSize/2
isSymmetry db ?
msg_01 db 'Mang doi xung',0
msg_02 db 'Mang khong doi xung',0 
.code
main proc
;int kiemtramangdoixung(int a[],int n)
;{
 ;int co=1;
 ;for(int i=0;i<n/2;i++)
 ;{
 ;if(a[i]!=a[n-1-i]) co=0;
 ;}
 ;return co; 
;}
     call CheckSymmetry
     MOV AL,01     
     CMP AL, isSymmetry ;neu bang nhau la doi xung;khong bang nhau la khong doi xung
     JNE lap1

     MOV EDX,OFFSET msg_01
     call WriteString
     call crlf
     JMP endd
lap1:
     MOV EDX,OFFSET msg_02
     call WriteString
     call crlf
endd:

INVOKE ExitPRocess,0
main endp
CheckSymmetry PROC USES EAX ECX EDX
     MOV isSymmetry,01h   ;doi xung
     ;ECX ~ i<n/2
     MOV ECX,vongLap
     MOV ESI,0;tro den phan tu dau
     ;con tro EDI tro den phan tu cuoi
Lap:
     MOV EDI,SIZEOF arr;arr[n]
     SUB EDI,TYPE arr;arr[n-1]
     SUB EDI,ESI;arr[n-1-i]

     MOV EAX,arr[ESI];arr[i]
     CMP EAX,arr[EDI]
     JE next
     MOV isSymmetry,0h;khong doi xung
next:
     ADD ESI,TYPE arr
     LOOP Lap
     ret
CheckSymmetry ENDP
end main