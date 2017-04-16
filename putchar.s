.text
.global main

main:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$65, %eax	#A
	movl	$90, %ebx	#Z
	movl	$10, %ecx

	movl	$26, %edx	#count letters
	movl	$26, %edi	#count rows

	loop:
	cmpl	%ebx, %eax	#compare A to Z
	jg	repeat		#if eax > 90, start repeating letters
	pushl	%eax	
	call	putchar
	popl	%eax
	
	decl	%edx
	countLetters:
	cmpl	$0, %edx	#if letter counter less than 26
	je	newline		#max 0-25 letters per row, newline

	incl	%eax		#increment 65, A
	jmp 	loop		

	repeat:
	movl	$65, %eax
	jmp	countLetters

	newline:
	pushl	%ecx
	call	putchar		#insert new line
	popl	%ecx

	cmpl	%ebx, %eax
	jge	change
	addl	$2, %eax
	jmp	countRow	

	change:
	movl	$65, %eax
	addl	$2, %eax

	countRow:
	decl	%edi		#decrement row counter
	cmpl	$0, %edi	#if rowCounter != 0
	je	done
	movl	$26, %edx
	jmp	loop
	
	done:
	leave
	ret
