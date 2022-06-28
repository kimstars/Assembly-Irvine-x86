; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
arr dword 5,3,8,1,2
SizeArr=($-arr)/TYPE arr
.code
main proc    
     ;void noibot(int A[], int n)
;{
	 ;for(int i=0;i<n-1;i++)
	 ;for(int j=n-1;j>i;j--)
	 ;{
	 	;if(A[j]>A[j-1])
	 	;hoanvi(A[j],A[j-1]);
	 ;}
;}
     MOV ESI,0;i=0    
     MOV ECX,sizeArr
     DEC ECX;i=0 -> n-1
lap1:
     MOV EDI,sizeArr
     DEC EDI;j=n-1
     .WHILE EDI > ESI
          MOV EAX,arr[EDI*TYPE arr];A[j]
          DEC EDI;j-1
          .IF EAX > arr[EDI*TYPE arr];if a[j] >a[j-1]
               XCHG EAX,arr[EDI*TYPE arr]
               INC EDI;j
               MOV arr[EDI*TYPE arr],EAX;swap a[j],a[j-1]
               MOV EBX,arr[EDI*TYPE arr]
               DEC EDI;j-1
          .ENDIF

          ;DEC EDI;j--
     .ENDW
     INC ESI;i++
     LOOP lap1
     call InMang
	invoke ExitProcess,0
main endp
InMang PROC
     MOV EDI,offset arr
     MOV ECX,sizeArr
lap:        
     mov eax,[edi]
     call writeint     
     add edi,TYPE arr
     loop lap
     ret
InMang ENDP
end main