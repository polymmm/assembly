code segment
start:
	assume cs:code, ds: data
	mov ax, data
	mov ds, ax
	xor cx, cx 
	xor dx, dx 
	mov bx,OFFSET inputstring 
	mov ah, 1 
	
	while_begin:
		cmp cx, 20 
		jge while_end 
		inc cx 
		int 21h 
		cmp al, 13 
		jz while_end 
		mov [bx], al 
		cmp al, 32 
		je sumword 
		inc dx 
		jmp while_begin 
		
	sumword:
		inc words 
		jmp while_begin 
		
	while_end: 
		inc words 
		mov bx, dx 
		mov words + 8, '$'
		mov ah, 9 
		lea dx, msg1 
		int 21h 
		
		add words, 48 
		lea dx, words
		int 21h
		
	mov ax, bx 
	mov ch, 10 
	div ch

	mov buffer[1], ah 
	mov buffer[0], al 
	add buffer[0], 48
	add buffer[1], 48
	add buffer[2], '$'
	
	mov ah, 9 
	lea dx, msg2
	int 21h
	
	lea dx, buffer
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends
end start
