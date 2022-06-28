; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr dword  1,2,3,8,4,6,99,102,26,14
msg_01 db 'So lon thu 2 la: ',0
msg_02 db 'Tai vi tri: ',0
firstMax dword ?
secondMax dword ?
vitri dword ?
.code
main proc
;int FindByLoop(int a[], int n){
    ;int firstMax, secondMax;
    ;if (a[0] > a[1]){
        ;firstMax = a[0];
        ;secondMax = a[1];
    ;}else{
        ;firstMax = a[1];
        ;secondMax = a[0];
    ;}
    ;for(int i = 2; i < n; i++){
        ;if(a[i] >= firstMax){
            ;secondMax = firstMax;
            ;firstMax = a[i];
        ;}else if (a[i] > secondMax){
            ;secondMax = a[i];
        ;}
    ;}
    ;return secondMax;
;}
     MOV ESI,0
     MOV EDI,ESI
     ADD ESI,TYPE arr
     MOV EAX,arr[EDI]
     .IF EAX > arr[ESI]      ;if (a[0] > a[1]){    
          MOV firstMax,EAX;firstMax = a[0];
          MOV EAX,arr[ESI]
          MOV secondMax,EAX ;secondMax = a[1];
     .ELSE
          MOV secondMax,EAX;secondMax = a[0];
          MOV EAX,arr[ESI]
          MOV firstMax,EAX;firstMax = a[1];
     .ENDIF

     MOV ECX,8; do vong lap bat dau tu i=2 va i<10 nen chi co 8 lan
Lap:
     ADD ESI,TYPE arr;i=2
     MOV EAX,arr[ESI]
     .IF EAX >= firstMax
          MOV EBX,firstMax
          MOV secondMax,EBX
          MOV firstMax,EAX
     .ELSEIF EAX > secondMax
          MOV secondMax,EAX
     .ENDIF
     LOOP Lap
     
     MOV EDX,offset msg_01
     call WriteString
     MOV EAX,secondMax
     call WriteDec

     MOV EDX,offset msg_02
     call WriteString
     MOV EAX,secondMax
     call searchVT2
     MOV EDX,0
     MOV EAX,ESI;luu y la ESI tinh tu vi tri 0 
     MOV EBX,TYPE arr
     DIV EBX
     call WriteDec
     ;MOV EDX,offset msg_02
     ;call WriteString

    
	invoke ExitProcess,0
main endp
searchVT2 PROC USES EAX
     MOV CX,9
     MOV ESI,0
Lap:    
     .IF EAX == arr[ESI]
          ret
     .ENDIF
     ADD ESI,TYPE arr
     LOOP Lap

     ret
searchVT2 ENDP
end main