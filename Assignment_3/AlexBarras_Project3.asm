; Author: James Alexander Barras
; Last Modified: Oct. 15, 2021
; Project Description: The objective of this assignment is to create a program that will read a value from an array, and then place this value in another array with the location shifted by a certain amount.


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data

	input BYTE 1, 2, 3, 4, 5, 6, 7, 8
	output BYTE LENGTHOF input DUP(?)
	shift DWORD 3

.code 
	main proc

	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov edi, 0
	mov esi, 0
	
	
	mov ecx, LENGTHOF input
	sub ecx, shift
	mov edi, shift

	;this loop is used to manage all bits that don't have to be carried or wrapped around. So, they can simply be shifted by the specified amount
	frontloop: 
			   mov al, input[esi]
			   mov output[edi], al
			   inc esi
			   inc edi
	loop frontloop

	mov esi, LENGTHOF input
	sub esi, shift
	mov ecx, shift
	mov edi, 0
	
	;this loop is used to manage the bits that have to be "carried" or wrapped around to the front during the shift
	carryloop: mov al, input[esi]
			   mov output[edi], al
			   inc esi
			   inc edi
	loop carryloop

		invoke ExitProcess, 0
	main endp
end main