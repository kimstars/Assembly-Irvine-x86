; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
SelectionSort PROTO,
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
     INVOKE SelectionSort,ADDR arr,n
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
;void selectionSort(int arr[], int n)
;{
    ;int i, j, min_idx;
    ;// Di chuyển ranh giới của mảng đã sắp xếp và chưa sắp xếp
    ;for (i = 0; i < n-1; i++)
    ;{
    ;// Tìm phần tử nhỏ nhất trong mảng chưa sắp xếp
    ;min_idx = i;
    ;for (j = i+1; j < n; j++)
        ;if (arr[j] < arr[min_idx])
        ;min_idx = j;
 ;
    ;// Đổi chỗ phần tử nhỏ nhất với phần tử đầu tiên
        ;swap(arr[min_idx], arr[i]);
    ;}
;}

SelectionSort PROC USES eax ecx esi,
             pArr:PTR DWORD,;con tro mang
             Count:DWORD; so phan tu cua mang
	DEC Count   
     MOV ECX,Count;0->5
     MOV EDI,OFFSET arr;phan tu dau tien cua mang
L1:
     push ecx;vong lap cha
     mov esi,edi;esi la phan tu dau tien
     add esi,TYPE pArr;tro den phan tu tiep theo i+4
L2:
     MOV EAX,0
     mov eax,[edi];eax la phan tu i
     mov ebx,[esi];ebx la phan tu j
     cmp [esi],eax;so sanh phan tu j voi min
     jge L3;so sanh [edi] <[esi] neu nho hon thi so sanh vong lap moi, nhay xuong l3
     XCHG eax,[esi];doi cho cho nhau
     mov [edi],eax
L3:
     Add esi,TYPE pArr;tang len 1, sau do lai so sanh voi phan tu i
     LOOP L2
     ;khi vong lap con het
     pop ecx;nhan ecx cua vong lap cha
     add edi,TYPE pArr;phan tu can sap xep tang them 1
     loop L1;lap lai tiep phan tu cha
ret
    
SelectionSort ENDP
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