data segment
	fib1 dw 0
	fib2 dw 1
	fib3 dw 0 
	
	storeEven dw 0
	storeOdd dw 0 
data ends

code segment
start:
	main proc
	assume cs:code, ds: data
		mov ax, data
		mov ds, ax
		call sumFib
		
		mov ax, storeOdd
		add storeEven, ax 
		
		mov ax, 4c00h
		int 21h
	main endp
	
	sumFib proc
		xor bx, bx 
		xor dx, dx
		xor cx, cx
		
		while_begin:
			cmp cx, 23
			jge while_end
			inc cx
			test fib1, 1 
			jnz OddSum1 
			jz EvenSum1 
			
			test fib2, 1 
			jnz OddSum2 
			jz EvenSum2 
			
			mov ax, fib1
			mov dx, fib2
			add bx, ax
			add bx, dx
			mov fib3, bx
			
			mov fib1, dx 
			mov fib2, bx
			mov fib3, 0
			jmp while_begin
	
			EvenSum1:
				mov ax, fib1
				call CompEven 
				jmp while_begin
			
			OddSum1:
				mov ax, fib1
				call CompOdd 
				jmp while_begin
				
			EvenSum2:
				mov ax, fib2
				call CompEven
				jmp while_begin
				
			OddSum2:
				mov ax, fib2
				call CompOdd
				jmp while_begin
				
		while_end:
		ret
		sumFib endp
		
		CompOdd proc
		add storeOdd, ax
		ret
		CompOdd endp
		
		CompEven proc
		add storeEven, ax
		ret
		CompEven endp
code ends
end start
