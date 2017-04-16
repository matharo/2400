.text
.global main

main:
	pushl	%ebp
	movl	%esp, %ebp

	movl	$65, %eax	#A, current letter
	movl	$90, %ebx	#Z, holder for last letter/end
	movl	$10, %ecx	#new line

	movl	$26, %edx	#count letters (columns)
	movl	$26, %edi	#count rows

	loop:
	cmpl	%ebx, %eax	#compare curr to end
	jg	repeat		#if current letter > 90, repeat alphabet--set eax to A
	
	pushl	%edi
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax	
	call	putchar		#if curr is still A-Z, then print it
	popl	%eax
	popl	%ebx
	popl	%ecx
	popl	%edx
	popl	%edi		#still need these vars, so push and pop to get original val
	
	decl	%edx		#decrement letter counter
	incl	%eax		#increment curr letter to print next one

	countLetters:
	testl	%edx, %edx	#if there is more than 26 letters in this row
	jz	newline		#print a newline
	jmp 	loop		#otherwise, loop again

	repeat:
	movl	$65, %eax	#sets eax to A 
	jmp	countLetters	

	newline:
	pushl   %edi
        pushl   %edx
        pushl   %eax
        pushl   %ebx
        pushl   %ecx
        call    putchar		#prints new line
        popl    %ecx
        popl    %ebx
        popl    %eax
        popl    %edx
        popl    %edi		#still need these variables

	cmpl	%ebx, %eax	#compare curr letter to 90
	jge	change		#if curr letter is Z, jump to change
	incl	%eax		#other wise, increment currletter (total of 2 incl, 1 is inside loop)
	jmp	countRow	

	change:
	movl	$65, %eax	#set eax to A
	incl	%eax		#because each newline is 2 more than curr letter (1 incl is inside loop)

	countRow:		#count number of rows so far
	decl	%edi		#decrement row counter
	cmpl	$0, %edi	#if rowCounter != 0
	je	done		#26 rows = stop
	movl	$26, %edx	#not 26 rows, restart letter counter 
	jmp	loop
	
	done:
	leave
	ret
