	.file	"<stdin>"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -40(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-36(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	-36(%rbp), %esi
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	leaq	-32(%rbp), %rsi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-40(%rbp), %rax
	movsbl	-32(%rbp,%rax), %esi
	movl	$.L.str4, %edi
	movl	%esi, %edx
	xorb	%al, %al
	callq	printf
	incl	-40(%rbp)
.LBB0_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.LBB0_2
# BB#3:                                 # %while.end
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Enter the no of characters present in an array n "
	.size	.L.str, 50

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%d"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 " Enter the string of %d characters n"
	.size	.L.str2, 37

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "%s"
	.size	.L.str3, 3

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 " %c = %dn"
	.size	.L.str4, 10


	.section	".note.GNU-stack","",@progbits
