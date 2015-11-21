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
	movl	$0, -28(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-8(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	leaq	-16(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	leaq	-12(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	-16(%rbp), %eax
	leal	-1(%rax), %ecx
	imull	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	leal	(%rcx,%rdx,2), %ecx
	imull	%eax, %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	movl	%eax, -28(%rbp)
	movl	-16(%rbp), %eax
	decl	%eax
	imull	-12(%rbp), %eax
	addl	-8(%rbp), %eax
	movl	%eax, -24(%rbp)
	movl	$.L.str4, %edi
	xorb	%al, %al
	callq	printf
	movl	-8(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_5:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	%eax, -20(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB0_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	.LBB0_4
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_5
	.align	16, 0x90
.LBB0_4:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %edx
	movl	-20(%rbp), %esi
	movl	$.L.str6, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_5
.LBB0_6:                                # %for.end
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Enter the first term value of the A.P. series: "
	.size	.L.str, 48

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%d"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Enter the total numbers in the A.P. series: "
	.size	.L.str2, 45

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "Enter the common difference of A.P. series: "
	.size	.L.str3, 45

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "Sum of the A.P series is: "
	.size	.L.str4, 27

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "%d + "
	.size	.L.str5, 6

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "%d = %d "
	.size	.L.str6, 9


	.section	".note.GNU-stack","",@progbits
