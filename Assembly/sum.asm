extrn MessageBoxA: PROC ; function

.data
tit db 'polymmm', 0 ; title
a1 equ 364 ; first var
a2 equ 1171 ; second var
msg db 4 dup(?),0 ; 4 bytes array

.code
main proc
	sub rsp,28h ; stack
	a3=a1+a2 ; 
	i=1
	while (a3/10) ge 1 ; determination of the bit depth of the sum
		i=i*10
		a3=a3/10
	endm
	
	a3=a1+a2
	j=0
	while (i) gt 1
		mov [msg+j],(a3/i)+48 ; writing the sum to an array by bits
		j=j+1 ; Номер позиции в массиве
		a3=a3 mod i ; item number in the array
		i=i/10
	endm
	mov [msg+j],a3+48 ; write the last digit of the sum to the array
	
	mov rcx, 0
	lea rdx, msg ; MessageBoxA parameters
	lea r8, tit
	mov r9d, 0
	call MessageBoxA
main endp
end
