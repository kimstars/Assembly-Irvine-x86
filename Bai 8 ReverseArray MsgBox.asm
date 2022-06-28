
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
arr dword 1,2,3,4,5,6,7,8,9,10
arrSize=($-arr)/TYPE arr

caption db 'Thong Bao',0
arrReverse db 30 dup(?)
count db ?
.code
main proc
     MOV ECX,arrSize
     MOV ESI,0
     ;push array into stack
Lap_01:
     MOV EAX, arr[ESI]
     PUSH EAX
     ADD ESI,TYPE arr
     LOOP Lap_01
     ;Pop array => have reverse array
     MOV ECX,arrSize
     MOV ESI,0
Lap_02:
     POP EAX
     MOV arr[ESI],EAX
     INC ESI;do array chuyen sang dang byte 
     LOOP Lap_02

     ;Convert string
     MOV ESI,OFFSET arr;tro den mang arr
     MOV EDI,OFFSET arrReverse;tro den mang reverse in ra man hinh
     MOV ECX,lengthof arr;do dai cua mang

Lap:
     ;chia phan tu cho 10 de lay cac chu so tu hang don vi->hang chuc->....
     MOV EAX,0
     MOV AL,[ESI];AL nhan gia tri dau tien cua mang
Lap2:
     MOV EDX,0;phai gan EDX=0 vi ta thuc hien phep chia 32bit
     MOV EBX,10;chia cho 10 de tach ra cac chu so hang don vi, hang chuc,...
     DIV EBX
     PUSH EDX;phan du cua phep chia se luu vao EDX
     INC count;count dai dien cho co bao nhieu chu so 
     CMP EAX,0
     JNE Lap2;neu EAX chua bang 0, tuc la chua tach xong cac chu so thi se lap lai de tach het ra 
Lap3:
     POP EAX;lay ra cac chu so tu hang cao nhat cho den thap nhat
     DEC count;1 chu so duoc lay ra, nen viec in ra chu so se giam di 1
     ADD AL,48;chuyen so thanh string
     MOV [EDI],AL;cho chu so do vao arrReverse
     MOV AL,','
     INC EDI
     MOV [EDI],AL;neu da in het cac chu so cua 1 so , tuc la count=0 thi se them dau phay de ngan cach cac so
     ;neu count !=0 thi ta van se in ra tiep cac chu so cua 1 so, khi do thi chu so se overwrite dau phay
     CMP count,0
     JNE Lap3;count!= thi in tiep cac chu so cua 1 so
     INC ESI;tang phan tu len 1
     INC EDI;tang phan tu len 1
     LOOP Lap;duyet den cac phan tu tiep theo
INVOKE MessageBox,null,ADDR arrReverse,ADDR caption,MB_OK;in msgBox
INVOKE ExitPRocess,0
main endp

end main