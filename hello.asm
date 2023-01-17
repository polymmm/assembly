data segment
	mes db 'Hello!",10,13,'
	mes2 db "My name is polymmm!',10,13,'$'
	mes3 db "Good bye!',10,13,'S"
data ends

code segment
start:
	assume cs:code, ds: data
	mov ax, data
	mov ds, ax

	mov ah, 9
	lea dx, mes
	int 21h

	mov ah, 9
	lea dx, mes2
	int 21h

	mov ah, 9
	lea dx, mes3
	int 21h

	mov ax, 4c00h
	int 21h

code ends
end start
