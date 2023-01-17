data segment
	x db 8
	y db 6
	z db 2
	sum1 dw 0
	sum2 dw 0
	buffer db 3 dup (?)
	data ends
	
code segment
start:
	assume cs:code, ds: data 
	mov ax, data
	mov ds, ax
	
	mov al, x 
	mov bl, z
	mov cl, y
	mul bl 
	cbw 
	add ax, cx 
	mov cl, 2 
	div cl 
	mov al, al 
	cbw 
	mov sum1, ax
	
	mov al, x 
	mov bl, z
	mov cl, y
	sub al, cl 
	add al, bl 
	cbw 
	mov sum2, ax 
	
	mov ax, sum1 
	mov bx, sum2
	cmp ax, bx 
	jl min 
	jmp ent 
	
	min:
		mov bx, ax 	
	ent:
		mov ax, bx 
		mov ch, 10
		div ch
			mov buffer[2], ah
			mov ah, 0
		div ch
	mov buffer[1], ah
	mov buffer[0], al
	add buffer[0], 48
	add buffer[1], 48
	add buffer[2], 48
	mov buffer[3], '$'
	
	mov ah, 9 
	lea dx, buffer
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end start
