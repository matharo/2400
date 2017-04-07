#compile with gcc -m32 flow.s -o flow
#Declare program code section of program
.text
.global main                            /* program entry point */

compare:
	pushl	%ebp
	movl	%esp, %ebp
	pusha

	#Move the arguments A and B into the registers EAX and EBX respectively
	movl	8(%ebp), %eax #Argument A
	movl	12(%ebp), %ebx #Argument B

	#Your comparison code goes here
		//part of number 6 and 8
	pushl 	%ebx
	pushl	%eax
	pushl 	$testing
	call 	printf		#print off values A and B
	popl 	%edx		#printf changes eax and ebx
	popl 	%eax		
	popl 	%ebx		#pop to get original arguments

		//number 6
	#cmpl 	%ebx, %eax	# b-a = 100-75 = 25	signed flag 1, zero flag 0
	#cmpl 	%eax, %ebx	# a-b = 75-100 = -25	signed flag 0, zero flag 0
	#subl 	$25, %ebx	# b = b-25 = 100-25 = 75
	#cmpl 	%ebx, %eax	# b-a = 75-75 = 0	signed flag 0, zero flag 1
	#call print_all		

		//number 8 and 9 -- see the variables; 
		//added: testing, comparing, A, B, equals
	cmpl 	%ebx, %eax	#arg 2 = eax, arg 1 = ebx
	jg	GREATER	#arg 2 is greater than arg 1
	js	LESS	#arg 2 is less than arg 1
        pushl 	$equals
        call 	printf
        jmp 	compare_exit

	GREATER:
	pushl 	$B
	pushl 	$A  #pushed first, arg 2
	pushl 	$comparing
	call 	printf
	jmp 	compare_exit
	
	LESS:
	pushl 	$A
	pushl 	$B
	pushl 	$comparing	
	call  	printf
	jmp 	compare_exit
	
	#Execute this code to exit function
	compare_exit:
	pop	%eax
	pop 	%ebx
	leave
	ret

main:
	#Preamble to the main function
	pushl	%ebp
	movl	%esp, %ebp

	movl $0, %eax
/*		//number 5
target:
	call print_eax
	incl %eax
	jmp target
*/

		//number 10
	movl $100, %eax		#set eax to 100
Loop100:
	call print_eax
	testl %eax, %eax	#test if eax&eax is 0
	jz DONE			#if test == 0, raises zero flag, jump
	decl %eax		#eax != 0, decrement eax by 1
	jmp Loop100		#loop again
DONE:
	pop %eax

	#Example calling the function compare with
	#A = 75
	#B = 100		
	
		//part of number 8 & 9
	#pushl	$100
	#pushl	$75		#B is greater than A

	pushl 	$22
	pushl	$50		#A is greater than B

	#pushl $10
	#pushl $10		#The arguments are equal

	call	compare
	pop	%eax
	pop	%eax



	#Finish the main function with leave and ret
	EXIT:
	leave
	ret
print_all:
	pushl	%ebp
	movl	%esp, %ebp
	call	print_intro
	call	print_eax
	call	print_ebx
	call	print_ecx
	call	print_edx
	call	print_cf
	call	print_zf
	call	print_sf
	call	print_of
	leave
	ret
print_intro:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
	pushl	%eax
	pushl	%ecx
	pushl	%edx
	pushl	$intro
	call	printf
	pop	%eax
	pop	%edx
	pop	%ecx
	pop	%eax
	popf
	leave
	ret
print_eax:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
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
	popf
	leave
	ret
print_ebx:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
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
	popf
	leave
	ret
print_ecx:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
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
	popf
	leave
	ret
print_edx:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
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
	popf
	leave
	ret

print_cf:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
	pushl	%eax
	pushl	%ecx
	pushl 	%edx
	pushf	#push eflags onto stack
	pop	%eax #move flags from stack to reister
	andl	$0x1, %eax #select first bit of flags
	pushl	%eax #push that value onto the stack
	pushl	$strcf
	pushl	$string
	call	printf
	pop	%eax
	pop	%eax
	pop	%eax
	pop	%edx
	pop	%ecx
	pop	%eax
	popf
	leave
	ret

print_zf:
	#function preamble
	pushl	%ebp
	movl	%esp, %ebp
	#save processor state
	pushf
	pushl	%eax
	pushl	%ecx
	pushl 	%edx

	#Now we select the seventh bit and move it to the first place
	pushf	#push eflags onto stack
	pop	%eax #put eflags into register
	andl	$0x40, %eax #select seventh bit of flags
	shrl	$6, %eax #move the seventh bit down to the first place

	#Set up and call printf function
	pushl	%eax #push the 0/1 value onto the stack for printf
	pushl	$strzf #push the zf string onto stack for printf
	pushl	$string #push the specifier string onto stack for printf
	call	printf
	pop	%eax #clear $string from stack
	pop	%eax #clear $strzf from stack
	pop	%eax #clear the 0/1 value from the stack

	#restore processor state
	pop	%edx
	pop	%ecx
	pop	%eax
	popf
	#function exit
	leave
	ret
print_sf:
	#function preamble
	pushl	%ebp
	movl	%esp, %ebp
	#save the existing state of the processor
	pushf
	pushl	%eax
	pushl	%ecx
	pushl 	%edx

	#Finish this function by writing your code here
	#Now we select the eighth bit and move it to the first place
        pushf   #push eflags onto stack
        pop     %eax #put eflags into register
        andl    $0x80, %eax #select eigth bit of flags
        shrl    $7, %eax #move the eigth bit down to the first place

        #Set up and call printf function
        pushl   %eax #push the 0/1 value onto the stack for printf
        pushl   $strsf #push the zf string onto stack for printf
        pushl   $string #push the specifier string onto stack for printf
        call    printf
        pop     %eax #clear $string from stack
        pop     %eax #clear $strzf from stack
        pop     %eax #clear the 0/1 value from the stack

	#restore the existing state of the processor
	pop	%edx
	pop	%ecx
	pop	%eax
	popf
	#Function exit code
	leave
	ret

print_of:
	pushl	%ebp
	movl	%esp, %ebp
	pushf
	pushl	%eax
	pushl	%ecx
	pushl 	%edx
	pushf	#push eflags onto stack
	pop	%eax #move eflags from stack to register
	andl	$0x800, %eax #select twelfth bit of flags
	shrl	$11,	%eax #move place 12 to place 1
	pushl	%eax #push that value onto the stack
	pushl	$strof
	pushl	$string
	call	printf
	pop	%eax
	pop	%eax
	pop	%eax
	pop	%edx
	pop	%ecx
	pop	%eax
	popf
	leave
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
    strcf:
	.string "Carry Flag"
    strzf:
	.string "Zero Flag"
    strsf:
	.string "Sign Flag"
    strof:
	.string "Overflow Flag"
    intro:
	.string "Printing processor state:\n"

    testing:
	.string "Testing A = %d and B = %d\n"
    comparing:
	.string "%s is greater than %s\n"
    equals:
	.string "The arguments are equal\n"
    A:
	.string "A"
    B:
	.string "B"
#Declare read/write data section of program
.section .data
	#not needed for this assignment
    #a:
	#.long 	100
