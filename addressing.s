#Compile with: gcc -m32 addressing.s -o addressing

#Declare program code section of program
.text
.global main                            /* program entry point */

main:
	#Preamble to the main function
	pushl	%ebp
	movl	%esp,	%ebp

	#Our code starts here


	#How we called printf from last time

		//number 14
	movl 	$6, %ebx	#array range: 0-6, 7 elements
			//imm - index inside myarray
	movl 	$myarray, %eax
#	pushl 	(%eax, %ebx, 4)		# 4(%eax) == 100 	
#
#	decl 	%ebx
#	pushl 	(%eax, %ebx, 4)		# 8(%eax) == 200
#
#        decl    %ebx	
#        pushl    (%eax, %ebx, 4)	# 12(%eax) == 300
#
#        decl    %ebx
#        pushl    (%eax, %ebx, 4)	# 16(%eax) == 400
#        decl    %ebx
#        pushl    (%eax, %ebx, 4)
#        decl    %ebx
#        pushl    (%eax, %ebx, 4)
#        decl    %ebx
#        pushl    (%eax, %ebx, 4)

	loop:
	cmpl	$0, %ebx
	jl	stop
	pushl	(%eax, %ebx, 4)
	decl	%ebx
	jmp	loop
		//number 5
	//leal 	myarray,%eax
	//pushl 	4(%eax)
 
		//number 4
	//leal 	myarray,%eax
	//pushl	(%eax)
	
		//number 3 
	//movl 	(myarray),%eax
	//pushl %eax
	stop:
	pushl	$string
	call	printf
	popl	%eax
	popl	%eax
	popl    %eax
        popl    %eax
	popl    %eax
        popl    %eax
	popl    %eax
	#Our code ends here

	#Finish the main function with leave and ret
	leave
	ret

#Declare read-only data section of program
.section	.rodata
    string:
	.string	"Value is %u, %u, %u, %u, %u, %u, %u\n"

#Declare read/write data section of program
.section .data
    myarray:
	.long	100
	.long	200
	.long	300
	.long	400
	.long	500
	.long	600
	.long	700
