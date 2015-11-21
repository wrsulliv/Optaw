	.file	"<stdin>"
	.text
	.globl	print
	.align	16, 0x90
	.type	print,@function
print:                                  # @print
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
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-20(%rbp), %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %esi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	incl	-20(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.LBB0_2
# BB#3:                                 # %for.end
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	print, .Ltmp5-print
	.cfi_endproc

	.globl	integerPartition
	.align	16, 0x90
	.type	integerPartition,@function
integerPartition:                       # @integerPartition
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp8:
	.cfi_def_cfa_offset 16
.Ltmp9:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp10:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	movl	$12000, %edi            # imm = 0x2EE0
	callq	malloc
	movq	%rax, -40(%rbp)
	movl	$-1, (%rax)
	movq	-40(%rbp), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, 4(%rax)
	movq	-40(%rbp), %rax
	movl	-32(%rbp), %ecx
	movl	%ecx, 8(%rax)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_10:                               # %if.else42
                                        #   in Loop: Header=BB1_1 Depth=1
	decl	-28(%rbp)
.LBB1_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -28(%rbp)
	js	.LBB1_11
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movslq	-28(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	-40(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, -20(%rbp)
	movslq	-28(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	-40(%rbp), %rcx
	movl	4(%rcx,%rax,4), %eax
	movl	%eax, -4(%rbp)
	movslq	-28(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	-40(%rbp), %rcx
	movl	8(%rcx,%rax,4), %eax
	movl	%eax, -32(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.LBB1_10
# BB#3:                                 # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$-1, -20(%rbp)
	jne	.LBB1_7
# BB#4:                                 # %if.then16
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	-4(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movq	-16(%rbp), %rsi
	movl	-32(%rbp), %edi
	callq	print
	movl	$1, %eax
	cmpl	$0, -32(%rbp)
	je	.LBB1_6
# BB#5:                                 # %cond.false
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-32(%rbp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	-16(%rbp), %rcx
	movl	(%rcx,%rax,4), %eax
.LBB1_6:                                # %cond.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	%eax, -20(%rbp)
	jmp	.LBB1_8
	.align	16, 0x90
.LBB1_7:                                # %if.else
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
	incl	%eax
.LBB1_8:                                # %if.else
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
	cmpl	%eax, -24(%rbp)
	jg	.LBB1_10
# BB#9:                                 # %if.then23
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movl	-24(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movslq	-28(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	-40(%rbp), %rcx
	movl	-24(%rbp), %edx
	movl	%edx, (%rcx,%rax,4)
	incl	-28(%rbp)
	movslq	-28(%rbp), %rax
	leaq	(%rax,%rax,2), %rax
	movq	-40(%rbp), %rcx
	movl	$-1, (%rcx,%rax,4)
	movl	-4(%rbp), %eax
	subl	-24(%rbp), %eax
	movslq	-28(%rbp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	-40(%rbp), %rdx
	movl	%eax, 4(%rdx,%rcx,4)
	movl	-32(%rbp), %eax
	incl	%eax
	movslq	-28(%rbp), %rcx
	leaq	(%rcx,%rcx,2), %rcx
	movq	-40(%rbp), %rdx
	movl	%eax, 8(%rdx,%rcx,4)
	jmp	.LBB1_1
.LBB1_11:                               # %while.end
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	integerPartition, .Ltmp11-integerPartition
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp14:
	.cfi_def_cfa_offset 16
.Ltmp15:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp16:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$1, -8(%rbp)
	movslq	-8(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	%rax, -16(%rbp)
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	leaq	-8(%rbp), %rsi
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$1, -20(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %esi
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %edi
	callq	integerPartition
	incl	-20(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.LBB2_2
# BB#3:                                 # %for.end
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp17:
	.size	main, .Ltmp17-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "%d"
	.size	.L.str, 3

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "n"
	.size	.L.str1, 2

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "nEnter a number N to generate all set partition from 1 to N: "
	.size	.L.str2, 62

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "nInteger partition for %d is: n"
	.size	.L.str3, 32


	.section	".note.GNU-stack","",@progbits
