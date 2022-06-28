; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
InsertionSort PROTO,
             pArr:PTR DWORD,
             Count:DWORD
ReadArr PROTO,
          pArr:PTR DWORD,
          Count:DWORD
PrintArr PROTO,
          pArr:PTR DWORD,
          Count:DWORD
.data
msg_01 db 'Nhap so phan tu cua mang: ',0
msg_02 db 'Nhap phan tu: ',0
n dword 0
arr dword 100 dup(?)
.code
main proc
     ;in thong bao
     MOV EDX,OFFSET msg_01
     call WriteString
     ;nhap so phan tu
     call ReadInt
     MOV n,EAX
     
     ;in thong bao nhap cac phan tu     
     MOV EDX,OFFSET msg_02
     call WriteString
     ;nhap cac phan tu
     INVOKE ReadArr,ADDR arr,n
     INVOKE InsertionSort,ADDR arr,n
     INVOKE PrintArr,ADDR arr,n    

	invoke ExitProcess,0
main endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Nhap du lieu
ReadArr PROC,
          pArr:PTR DWORD,
          Count:DWORD
          MOV ECX,Count
          MOV ESI,pArr

     lap:
          call ReadInt;nhap phan tu
          MOV [ESI],EAX
          ADD ESI,TYPE pArr
          LOOP lap
     ret
ReadArr ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Thuat toan sap xep lua chon
InsertionSort PROC USES eax ecx esi ebx edx,
             pArr:PTR DWORD,;con tro mang
             Count:DWORD; so phan tu cua mang
    
    ;int i, key, j;  
    ;for (i = 1; i < n; i++) 
    ;{  
        ;key = arr[i];  
        ;j = i - 1;  
  ;
        ;/* Move elements of arr[0..i-1], that are  
        ;greater than key, to one position ahead  
        ;of their current position */
        ;while (j >= 0 && arr[j] > key) 
        ;{  
            ;arr[j + 1] = arr[j];  
            ;j = j - 1;  
        ;}  
        ;arr[j + 1] = key;  
    DEC Count
    MOV ECX,Count  
     MOV EDI,pArr;~ i
     
     ;j=i-1    
Lap:
     MOV ESI,EDI;ESI~j
     ADD EDI,TYPE pArr;EDI tro den phan tu thu 2
     MOV EAX,pArr;luu phan tu ban dau
    MOV EBX,[EDI];EBX~ key
Lap3:
    CMP ESI,EAX;o nho j >=0, ta so sanh voi dia chi o phan tu dau cua no
    JL Lap2
    CMP [ESI],EBX;so sanh arr[j] vs key
    JLE Lap2
    MOV EDX,[ESI];~EDX=arr[j]
    ADD ESI,TYPE pArr;~ESI=arr[j+1]
    XCHG [ESI],EDX;arr[j+1]=arr[j]
    SUB ESI,TYPE pArr
    SUB ESI,TYPE pArr
    JMP Lap3
Lap2:
     ADD ESI,TYPE pArr
     MOV [ESI],EBX;arr[j+1]=key     
     LOOP Lap
     
     ret
    
InsertionSort ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;In phan tu ra man hinh
PrintArr PROC,
          pArr:PTR DWORD,
          Count:DWORD

          MOV ECX,Count
          MOV ESI,pArr
     lap:
          MOV EAX,[ESI]
          call WriteInt
          MOV EAX,' '
          call WriteChar
          ADD ESI,TYPE pArr
          LOOP lap
     ret
PrintArr ENDP

end main