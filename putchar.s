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
	
	pushl	%edi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax	
	call	putchar
	popl	%eax
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%edi
	
	decl	%edx
	incl	%eax
	countLetters:
	testl	%edx, %edx	#if letter counter less than 26
	jz	newline		#max 0-25 letters per row, newline

	jmp 	loop		

	repeat:
	movl	$65, %eax
	jmp	countLetters

	newline:
	pushl   %edi
        pushl   %edx
        pushl   %eax
        pushl   %ebx
        pushl   %ecx
        call    putchar
        popl    %ecx
        popl    %ebx
        popl    %eax
        popl    %edx
        popl    %edi

	cmpl	%ebx, %eax
	jge	change
	addl	$1, %eax
	jmp	countRow	

	change:
	movl	$65, %eax
	addl	$1, %eax

	countRow:
	decl	%edi		#decrement row counter
	cmpl	$0, %edi	#if rowCounter != 0
	je	done
	movl	$26, %edx
	jmp	loop
	
	done:
	leave
	ret
