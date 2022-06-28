; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr dword 1,2,3,4,5,6,7,8,9,10
arrSize=($-arr)/TYPE arr
vongLap=arrSize-2;i<n-2
caption db 'Thong Bao',0
msg_01 db 'Khong la cap so cong',0
msg_02 db 'La cap so cong',0
.code
main proc
;for(i=0;i+2<n;i++)
    ;if(A[i+2]-A[i+1]!=A[i+1]-A[i])
;{
 ;flag=0;
;break;
;}
 ;if(flag == 0)
    ;printf("\nKhong la csc");
 ;else
     ;printf("\nLa csc");
    ;getch();
;}
     MOV ECX,vongLap
     MOV ESI,0;~i=0
Lap:
     MOV EDX,arr[ESI];~arr[i]
     MOV EDI,ESI
     ADD EDI,TYPE arr;~i+1
     MOV EBX,arr[EDI];~arr[i+1]
     ADD EDI,TYPE arr;~i+2
     MOV EAX,arr[EDI];~arr[i+2]

     SUB EAX,EBX;~arr[i+2]-arr[i+1]
     SUB EBX,EDX;~arr[i+1]-arr[i]

     .IF EAX != EBX         
          JMP ThongBao;thong bao khong la cap so cong
     .ENDIF

     ADD ESI,TYPE arr
     LOOP Lap
     ;thong bao la cap so cong
     MOV EBX,offset caption
     MOV EDX,offset msg_02
     call MsgBox    
     JMP endd
ThongBao:;thong bao khong la cap so cong
     MOV EBX,offset caption
     MOV EDX,offset msg_01
     call MsgBox
     
endd:
INVOKE ExitPRocess,0
main endp

end main