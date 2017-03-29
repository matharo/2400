.text
.global main

myFunc:

	pushl %ebp
	movl %esp, %ebp

	addl $15, %eax
	
	leave
	ret

main:
	pushl %ebp
	movl %esp, %ebp

	movl a, %eax
	call myFunc

	pushl %eax
	//pushl a
	pushl $myStr
	call printf
	popl %eax 
	popl %eax

	leave
	ret

.section .rodata
	myStr:
		.string "Hello, world! Value: %d\n"

.section .data
	a:
		.long 10
