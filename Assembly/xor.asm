data segment
	buff db 80 dup(?) 
	key db "keyforencryption $", 0ah, 0dh 
	filename db "a.txt",0 
	handler dw ? 
data ends

code segment 
start: 
	assume cs:code, ds: data 
	mov ax, data 
	mov ds, ax
	
	mov ah, 3dh 
	mov al, 2 
	mov dx, offset filename 
	int 21h
	
	mov handler, ax
	mov ah, 3fh 
	mov bx, handler
	lea dx, buff
	mov cx, 20 
	int 21h
	
	mov key, al 
	xor buff[0], al 
	xor buff[1], al
	xor buff[2], al
	xor buff[3], al
	
	lea dx,buff
	mov ah,09h
	int 21h
	
	mov ah, 42h 
	mov bx, handler
	mov cx, 0 
	int 21h
	
	mov ah, 3eh 
	mov bx, handler
	int 21h
	
	mov ax,4c00h
	int 21h
code ends
end start
