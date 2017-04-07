#compile with gcc -m32 arithmetic.s -o arithmetic

#Declare program code section of program
.text
.global main                            /* program entry point */

function:
	pushl %ebp
	movl %esp, %ebp

	movl 8(%ebp), %eax	#value a
	movl 12(%ebp), %ebx	#value b
	movl 16(%ebp), %ecx	#value c	leftmost

	shll $1, %ebx		#b = b*2
	addl %ebx, %eax 	#a = a + b
	#a = 11					

	movl %ecx, %edx		#temp d = c	
	sarl $1, %ebx		#b = b/2, return to original b
	imull %ebx, %edx	#d = d *  b = c * b
	#d = 50

	imull %ecx, %ecx	#c = c*c
	#c = 100

	addl %edx, %eax		#a = a + d
	addl %ecx, %eax		#a = a + c
	addl %ebx, %eax		#a = a + b

	leave
	ret	

main:
	#Preamble to the main function
	pushl	%ebp
	movl	%esp, %ebp

	#code starts here
		//number 4
	movl $100, %eax
	movl $5, %ebx
	#addl %eax, %ebx
	movl %ebx, %ecx
	call print_ecx	#return 105

		//number 5
	movl $5, %ebx
	subl %ebx, %eax
	movl %eax, %ecx	
	call print_ecx	#return 95

		//number 6
	movl $100, %eax
	imull %eax, %ebx
	movl %ebx, %ecx
	call print_ecx	#return 500

		//number 7
	movl $40, %eax
	shll $2, %eax
	movl %eax, %ebx
	call print_ebx	#return 160

		//number 8
	movl $-500, %eax
	sarl $2, %eax
	movl %eax, %ebx
	call print_ebx	#return -125
	
		//number 9
	movl $1000, %eax
	shll $5, %eax
	addl $1000, %eax
	movl $1000, %ecx
	shll $4, %ecx	#return 49000

	addl %ecx,%eax
	call print_eax
		//end number 9

	pushl c
	pushl b
	pushl a		#push onto stack from left to right
			# a b c

	call function
	pushl %eax	#get value returned from function
	pushl $sum
	pushl $string
	call printf
	popl %eax
	popl %eax
	popl %eax
	popl %eax
	popl %eax
	popl %eax
	#Finish the main function with leave and ret
	leave
	ret

print_all:
	call	print_eax
	call	print_ebx
	call	print_ecx
	call	print_edx
	ret

print_eax:
	pushl	%ecx
	pushl	%edx
	pushl 	%eax
	pushl	$streax
	pushl	$string
	call	printf
	pop	%eax
	pop	%eax
	pop	%eax
	pop	%edx
	pop	%ecx
	ret

print_ebx:
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl 	%ebx
	pushl	$strebx
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx
	pop	%ebx
	pop	%eax
	pop	%edx
	pop	%ecx
	ret

print_ecx:
	pushl	%edx
	pushl	%eax
	pushl 	%ecx
	pushl	$strecx
	pushl	$string
	call	printf
	pop	%ecx
	pop	%ecx
	pop	%ecx
	pop	%eax
	pop	%edx
	ret

print_edx:
	pushl	%ecx
	pushl	%eax
	pushl 	%edx
	pushl	$stredx
	pushl	$string
	call	printf
	pop	%edx
	pop	%edx
	pop	%edx
	pop	%eax
	pop	%ecx
	ret

#Declare read-only data section of program
.section	.rodata
    string:
	.string "Value of %s: %d\n"
    streax:
	.string	"EAX"
    strebx:
	.string	"EBX"
    strecx:
	.string	"ECX"
    stredx:
	.string	"EDX"
    sum:
	.string "Sum"

#Declare read/write data section of program
.section .data
	a:
		.long	4
	b:
		.long 	8
	c:
		.long 	16
	
	#a = 1, b = 5, c = 10 	returns 166
	#a = 4, b = 8, c = 16 	returns 412
