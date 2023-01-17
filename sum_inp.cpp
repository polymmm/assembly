#include <iostream>

int main()
{
	unsigned __int8 var1, var2; //vars
	unsigned __int16 sum;
	scanf_s("%d", &var1); //input
	scanf_s("%d", &var2);
	__asm
	{
		mov al, var1; //Put the value var1 in the register
		add al, var2; //Add var2 to the register value
		mov sum, ax; //Write the value of the register into the variable
	}
	printf_s("%d", sum); //output
	return 0;
}
