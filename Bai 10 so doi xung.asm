; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
num dword 12321
arr dword 30 dup(?)
isSymmetry db ?
caption db 'THong bao',0
msg_01 db 'So doi xung',0
msg_02 db 'So khong doi xung',0 
vongLap dword ?
soPhanTu dword ?
.code
main proc
     ;COnvert To array
     MOV ESI,OFFSET arr ;tro den vi tri dau tien  
     MOV EDI,0;length arr
     MOV EAX,num
     MOV EBX,10
     ;tach cac chu so ra thanh mang phan tu
     .WHILE EAX !=0
          MOV EDX,0          
          DIV EBX
          MOV [ESI],EDX; tach cac chu so tu hang don vi, hang chuc,.. =>....
          ADD ESI,TYPE arr
          INC EDI;count++
     .ENDW

     MOV EDX,0
     MOV EAX,EDI
     MOV soPhanTu,EDI
     MOV EBX,2
     DIV EBX
     MOV vongLap,EAX;vong lap = n/2 -1; i<n/2
     call CheckSymmetry;kiem tra co phai doi xung ko
     MOV AL,01     
     CMP AL, isSymmetry ;neu bang nhau la doi xung;khong bang nhau la khong doi xung
     JNE lap1

     MOV EBX,OFFSET caption
     MOV EDX,OFFSET msg_01
     call MsgBox     
     JMP endd
lap1:
MOV EBX,OFFSET caption
     MOV EDX,OFFSET msg_02
     call MsgBox    
endd:
	invoke ExitProcess,0
main endp
;int kiemtramangdoixung(int a[],int n)
;{
 ;int co=1;
 ;for(int i=0;i<n/2;i++)
 ;{
 ;if(a[i]!=a[n-1-i]) co=0;
 ;}
 ;return co; 
;}
CheckSymmetry PROC USES EAX ECX EDX
     MOV isSymmetry,01h   ;doi xung
     ;ECX ~ i<n/2
     MOV ECX,vongLap
     MOV ESI,0;tro den phan tu dau
     ;con tro EDI tro den phan tu cuoi
Lap: 
     
     MOV EAX,soPhanTu;so phan tu 
     MOV EDI,TYPE arr
     MUL EDI;so phan tu nhan voi type de ra vi tri phan tu cuoi cung

     MOV EDI,EAX;arr[n]
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