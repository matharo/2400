.text
.global main 
//tells main is entry point for program

//write if-else statement, compares a given value

//void comp10(int x)

comp10: 

	pushl %ebp
	movl %esp, %ebp

	movl 8(%ebp), %ebx
		 //get value off stack and move to ebx
	
	//compare instruction; doesn't overwrite any register
	cmp $10, %ebx
		 //compare to 10

	//if less than 10, jump to lessEq
	//jump to lessEqual --> new label
	jle lessEq


	//otherwise, push on ebx and see if greater
	pushl %ebx
	pushl $greaterStr

	//don't want to execute both greater and less str
	jmp end 
		//jump to end

lessEq:
	pushl %ebx
	pushl $lessEqStr

end:

	call printf
	popl %ebx
	popl %ebx

	popl %ebp
	ret
	
main:
		//need set up stack frame
	pushl %ebp
	movl %esp, %ebp	
		//esp is top of stack frame, ebp is bottom of it
	
	pushl $7
	call comp10
	popl %eax

	pushl $15
	call comp10
	popl %eax


	popl %ebp 
			//can also do leave--quit function
	ret

//section that declares variables
.data

lessEqStr:
	.string "%d is less than 10\n"

greaterStr:
	.string "%d is greater than 10\n
