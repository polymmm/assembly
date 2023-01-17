data segment
	imput DB 20 DUP (?) 
	buffer db 3 dup (?) 
	msg1 db 10, 13, 'Errorr $'
	msg2 db 10, 13, 'Decimal number is $'
	number dw 20 dup (?)
	sum dw 0
data ends

code segment
start:
	assume cs:code, ds: data
	mov ax, data
	mov ds, ax
	mov cx, 0
	xor dx, dx
	mov bx,OFFSET imput 
	mov ah, 1
	lea di, number 
	while_begin: 
		cmp cx, 20
		jge error 
		inc cx
		int 21h
		cmp al, 104 
		je printhex 
		cmp al, 48
		jl error 
		cmp al, 70
		jg error 
		cmp al, 47
		jg MoreThan47 
	jmp while_begin 
	MoreThan47:
		cmp al, 58
		jl Convertation 
		cmp al, 57
	jg MoreThan57
	
	MoreThan57:
		cmp al, 71
	jl convert_digitAF 

	Convertation:
		sub al, 48 
		mov [di], al 
		inc di 
	jmp while_begin
	convert_digitAF:
		sub al, 55 
		mov [di], al 
		inc di 
	jmp while_begin
	
	printhex:
		dec cx 
		mov ah, 9
		lea dx, msg2
		int 21h
	jmp while_buf
	
	error:
		mov ah, 9
		lea dx, msg1
		int 21h
		jmp while_end_error
		while_buf:
		lea di, number 
	jmp while_k
	
	while_k:
		dec cx
		mov bl, 1 
		mov al, [di] 
		inc di 
		mov dx, cx 
		cmp cx, 0
		jg subDeg 
		cmp cx, 0
	je while_end
	 
	subDeg:
		sal bl, 4 
		dec dx
		cmp dx, 0
		je while_end
	jmp subDeg
	
	while_end:
		mov al, al 
		mov bl, bl 
		mul bl 
		add sum, ax 
		mov ax, 0 
		cmp cx, 0
		je res 
		cmp cx, 0
	jg while_k
	
	res:
		mov ax, sum
		mov ch, 10
		div ch;
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
	
	jmp while_end_error
	while_end_error:
	mov ax, 4c00h
	int 21h
code ends
end start
