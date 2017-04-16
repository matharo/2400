.text
.global main

main:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$65, %eax	#letter
	movl	$10, %ebx	#newline
	movl	$0, %ecx	#row
	movl	$0, %edx	#column

	row:
	pushl	%eax
	call	putchar
	popl	%eax
	
	col:
	incl	%eax		#letter + 1
	cmpl	$91, %eax	#if letter + 1 < 91
	jge	changeEax
	pushl	%eax
	call	putchar
	popl	%eax
	jmp	inclCol

	changeEax:
	movl	$65, %eax
	pushl	%eax
	call	putchar
	popl	%eax

	inclCol:
	incl	%edx

	cmpl	$26, %edx
	jl	col

	row2:
	cmpl	$91, %eax
	jge	change
	addl	$2, %eax
	jmp	newline

	change:
	movl	$65, %eax
	addl	$2, %eax

	newline:
	pushl	%ebx
	call	putchar
	popl	%ebx

	pushl	%eax
	call	putchar
	popl	%eax

	incl	%ecx
	cmpl	$26, %ecx
	jge	done
	jmp	row

	done:
	leave
	ret
