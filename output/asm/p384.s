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
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$1, -8(%rbp)
	movl	$0, -20(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-16(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	movl	-4(%rbp), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	-8(%rbp), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	$2, -20(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	incl	-20(%rbp)
	movl	-12(%rbp), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	-8(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.LBB0_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.LBB0_2
# BB#3:                                 # %while.end
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Enter the limit to generate the Fibonacci Series n"
	.size	.L.str, 51

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%d"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Fibonacci Series is ...n"
	.size	.L.str2, 25

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "%dn"
	.size	.L.str3, 4


	.section	".note.GNU-stack","",@progbits
