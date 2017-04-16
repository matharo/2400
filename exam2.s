#Lorna Xiao
.text
.global main                            /* program entry point */

raise:
	pushl	%ebp
	movl	%esp, %ebp

	movl	8(%ebp), %eax	#A
	movl	12(%ebp), %ebx	#B

	testl	%eax, %eax	#if A = 0
	je	zero		#return 0

	cmpl	$1, %eax	#if A = 1
	je	one		#return 1

	testl	%ebx, %ebx	#if B = 0
	je	one		#return 1

	cmpl	$1, %ebx	#if B = 1
	je	done		#return A
	
	movl	%eax, %ecx	
	loop:
	imull	%eax, %ecx	#multiply A * A
	decl	%ebx		#decrement B
	
	cmpl	$1, %ebx	#if B = 1, done
	jg	loop
	movl	%ecx, %eax	
	jmp	done

	zero:
	movl	$0, %eax
	jmp	done	

	one:	
	movl	$1, %eax

	done:
	leave
	ret
main:
	pushl	%ebp
	movl	%esp, %ebp

	#raise 5 to the 3rd power (answer: 125)
	pushl 	$3
	pushl	$5
	call	raise
	pop	%ebx
	pop	%ebx
	
	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx

	#raise 2 to the 10th power (answer: 1024)
	pushl	$10
	pushl	$2
	call	raise
	pop	%ebx
	pop	%ebx

	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx

	#raise 7 to the 1st power (answer: 7)
	pushl	$1
	pushl	$7
	call	raise
	pop	%ebx
	pop	%ebx

	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx


	#raise 4 to the 0th power (answer: 1)
	pushl	$0
	pushl	$4
	call	raise
	pop	%ebx
	pop	%ebx

	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx


	#raise 0 to the 10th power (answer: 0)
	pushl	$10
	pushl	$0
	call	raise
	pop	%ebx
	pop	%ebx

	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx


	#raise 1 to the 20th power (answer: 1)
	pushl	$20
	pushl	$1
	call	raise
	pop	%ebx
	pop	%ebx

	pushl	%eax
	pushl	$string
	call	printf
	pop	%ebx
	pop	%ebx


	leave
	ret

.section	.rodata
	string:
		.string "%d\n"
