; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
num dword ?
flag db ?
caption db 'Thong bao',0
msg_01 db 'La so nguyen to',0
msg_02 db 'Khong phai so nguyen to',0
msg_03 db 'NHap so : ',0
.code
main proc
     call ReadNum
     call CHeckSoNguyenTo
     call Print
	invoke ExitProcess,0
main endp
ReadNum PROC
     MOV EDX,OFFSET msg_03
     Call WriteString
     Call ReadInt
     MOV num,EAX
     ret
ReadNum ENDP
;bool KTSNT(int x)
;{
	;if(x<2)
		;return false;
	;for(int i=2; i<=x/2; i++)
		;if(x%i==0)
			;return false;
	;return true;
;}
CHeckSoNguyenTo PROC
     .IF num < 2
          MOV flag,0;return false
     .ENDIF
     MOV EDX,0
     MOV EAX,num
     MOV EBX,2
     DIV EBX     
     MOV EDI,EAX;num/2
     MOV ESI,2;i=2

     .WHILE ESI <= EDI
          MOV EDX,0
          MOV EAX,num
          DIV ESI

          .IF EDX ==0
               MOV flag,0;return false
               JMP endd
          .ENDIF
          INC ESI
     .ENDW
     MOV flag,01;return true
     endd:
          ret
CHeckSoNguyenTo ENDP

Print PROC
     MOV AL,flag
     .IF flag ==0;khong phai so nguyen to
          MOV EBX,OFFSET caption
          MOV EDX,OFFSET msg_02
          call MsgBox
     .ELSEIF flag==1;la so nguyen to
          MOV EBX,OFFSET caption
          MOV EDX,OFFSET msg_01
          call MsgBox
     .ENDIF
     ret        
Print ENDP
end main