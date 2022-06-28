; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
msg_01 db 'Nhap so: ',0
msg_02 db 'La so hoan hao',0
msg_03 db 'Khong phai so hoan hao',0
caption db 'Thong Bao',0
num dword ?
.code
main proc
;bool check(int n){
    ;int sum = 0;//khai bao biem sum
    ;for(int i=1;i<=n/2;i++){
        ;if(n%i==0) 
            ;sum+=i;
    ;}
    ;if(sum==n) return true; // tra ve true
    ;return false;
;}
     call ReadNum;nhap so
     call CheckNum;kiem tra so
	invoke ExitProcess,0
main endp
ReadNum PROC USES EDX
     MOV EDX,OFFSET msg_01
     CALL WriteString
     CALL ReadInt;nhap so
     MOV num,EAX
     ret
ReadNum ENDP
CheckNum PROC
     MOV EDX,0;EDX:EAX su dung phep chia
     MOV EBX,num
     MOV ECX,2
     DIV ECX  ;vong lap tu i=1 -> i=num/2   
     MOV ECX,EAX;n/2
     MOV EBX,0;sum=0
     MOV EAX,num
     MOV ESI,1;i=1
Lap:
     MOV EDX,0;EDX:EAX phep chia
     PUSH EAX;luu bien EAX
     DIV ESI
     ;=> num%i==0;tuc la neu EAX % ESI co EDI==0 tuc i la uoc so cua num
     .IF EDX == 0
          ADD EBX,ESI;sum+=i
     .ENDIF
     POP EAX;lay lai gia tri NUM cho vong lap tiep theo
     INC ESI;tang bien dem i len 1
     LOOP Lap

     call Print;in
     ret
CheckNum ENDP
Print PROC USES EAX EBX EDX
     .IF EAX == EBX
          MOV EBX,OFFSET caption
          MOV EDX,OFFSET msg_02
          CALL MsgBox
     .ELSE
          MOV EBX,OFFSET caption
          MOV EDX,OFFSET msg_03
          CALL MsgBox
     .ENDIF
     ret
Print ENDP
end main