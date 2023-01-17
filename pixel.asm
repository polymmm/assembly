data segment
data ends

code segment
start:
	assume cs:code, ds:data
	mov ah,0 
	mov al,4
	int 10h
	
	mov ah,0ch 
	mov al,2 
	mov cx,120 
	mov dx,110
	int 10h
	
	mov ax,4c00h
	int 21h
code ends
end start
