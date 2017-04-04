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

	pushl b
	pushl a	

	movl a, %eax
	call myFunc
	popl %edx

	pushl %eax
	pushl $myStr
	call printf
	popl %eax 
	popl %eax

	leave
	ret

.section .rodata
	myStr:
		.string "Hello, world! Value of a: %d, b: %d\n"

.section .data
	a:
		.long 10
	b:
		.long 1
