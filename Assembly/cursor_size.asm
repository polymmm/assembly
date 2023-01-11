data segment
	ByteLabel1 label byte
	MaxLength1 db 20
	RealLength1 db ?
	InputField1 db 20 dup ('$') 
	Enter1 db 'Enter ch=$'  
	
	ByteLabel2 label byte
	MaxLength2 db 20
	RealLength2 db ?
	InputField2 db 20 dup ('$') 
	InputField2 db 'Enter cl=$' 
	space db 10,13,'$' 
data ends 

code segment 
start: 
	assume cs:code, ds: data
	mov ax, data 
	mov ds, ax
	
	mov ah, 9 
	lea dx, Enter1
	int 21h
	mov ah, 0ah 
	lea dx, ByteLabel1
	int 21h
	
	mov ah, 9
	lea dx, space
	int 21h
	
	mov ah, 9
	lea dx, Enter2
	int 21h
	
	mov ah, 0ah 
	lea dx, ByteLabel2
	int 21h
	
	mov ah, 9 
	lea dx, space
	int 21h
	
	sub InputField1, 48 
	sub InputField1, 48
	
	mov ah, 01h
	mov ch, InputField1
	mov cl, InputField2
	int 10h
	 
	mov ax, 4c00h
	int 21h
code ends
end start
