data segment
data ends
code segment
start:
	assume cs:code, ds:data
	mov ax,data
	mov ds,ax
	mov ah,0Bh 
	mov bh,0 
	mov bl,2 
	int 10h
	
	mov ah,06h 
	mov al,15 
	mov ch,0 
	mov cl,0
	mov dh,50 
	mov dl,50
	int 10h
	
	mov ax,4c00h
	int 21h
code ends
end start
