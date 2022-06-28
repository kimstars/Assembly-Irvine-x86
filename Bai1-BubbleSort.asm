INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:dword

.data
arr DB 2,8,5,4,3,1,9,12,19,15

.code
main proc
     MOV ECX,0;reset thanh ghi
     MOV EAX,0;reset thanh ghi
     MOV AL,9; số phần tử . ko phải là 10 vì index bắt đầu từ 0->9 là 10 phần tử
Lap:     
     MOVZX ECX,AL; chuyển số phần tử vào thanh ghi ECX
Lap1:
     MOV BH,arr[ECX-1]; gán BH là phần tử thứ 9
     CMP BH,arr[EAX];so sánh với phần tử cuối, sau khi lặp hết CX thì sẽ tìm được giá trị lớn nhất ở cuối
     JG Swap;nếu phần tử trước lớn hơn phần tử sau thì đổi chỗ
Back:
     LOOP Lap1;lại so sánh tiếp các phần tử còn lại với phần tử cuối
     DEC AL; khi giảm AL tức là ta chỉ cần sắp xếp AL phần tử nữa thôi
     CMP AL,1
     JGE Lap;nếu phần tử cần sắp xếp >=1 thì lại sắp xếp tiếp
     JMP Endd; đã sắp xếp xong
Swap:
     XCHG BH,arr[EAX];BH đang giữ giá trị của arr[ECX-1], khi đó đổi chỗ thì arr[EAX]=arr[ECX-1]
     XCHG BH,arr[ECX-1];đổi tiếp với arr[ECX-1]=arr[EAX]
     CMP AL,1;nếu phần tử cần so sánh chỉ còn là 1
     JNE Back;nếu không bằng thì sẽ so sánh tiếp
Endd:
     MOV ECX,10;số phần tử
InDaySapXep:
     MOV BH,arr[ECX-1];in ra các số sắp xếp
     LOOP InDaySapXep
	invoke ExitProcess,0
main endp
	

end main	