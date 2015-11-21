	.file	"<stdin>"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$40, %rsp
.Ltmp6:
	.cfi_offset %rbx, -40
.Ltmp7:
	.cfi_offset %r14, -32
.Ltmp8:
	.cfi_offset %r15, -24
	movl	$0, -28(%rbp)
	movq	$0, -40(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -52(%rbp)
	leaq	-44(%rbp), %r14
	leaq	-40(%rbp), %rbx
	leaq	-48(%rbp), %r15
	.align	16, 0x90
.LBB0_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str1, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	-44(%rbp), %eax
	cmpl	$3, %eax
	je	.LBB0_6
# BB#2:                                 # %do.body
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$2, %eax
	jne	.LBB0_3
# BB#5:                                 # %sw.bb4
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-40(%rbp), %rdi
	callq	DFS
	jmp	.LBB0_9
	.align	16, 0x90
.LBB0_6:                                # %sw.bb5
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	%rbx, %rdi
	callq	delete
	movl	$.L.str3, %edi
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_3:                                # %do.body
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$1, %eax
	jne	.LBB0_7
# BB#4:                                 # %sw.bb
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str1, %edi
	movq	%r15, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	-48(%rbp), %esi
	movq	%rbx, %rdi
	callq	generate
	jmp	.LBB0_9
.LBB0_7:                                # %sw.default
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str4, %edi
.LBB0_8:                                # %sw.default
                                        #   in Loop: Header=BB0_1 Depth=1
	xorb	%al, %al
	callq	printf
.LBB0_9:                                # %do.cond
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$3, -44(%rbp)
	jne	.LBB0_1
# BB#10:                                # %do.end
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.Ltmp9:
	.size	main, .Ltmp9-main
	.cfi_endproc

	.globl	generate
	.align	16, 0x90
	.type	generate,@function
generate:                               # @generate
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp12:
	.cfi_def_cfa_offset 16
.Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	jne	.LBB1_4
# BB#1:                                 # %if.then
	movl	$24, %edi
	callq	malloc
	movq	-8(%rbp), %rcx
	movq	%rax, (%rcx)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax)
	jmp	.LBB1_10
	.align	16, 0x90
.LBB1_3:                                # %if.else6
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	%rax, -24(%rbp)
.LBB1_4:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	.LBB1_7
# BB#5:                                 # %while.body
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	cmpl	(%rax), %ecx
	jle	.LBB1_2
# BB#6:                                 # %if.then4
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	jmp	.LBB1_3
	.align	16, 0x90
.LBB1_2:                                # %if.else6
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.LBB1_3
.LBB1_7:                                # %while.end
	movl	$24, %edi
	callq	malloc
	movq	%rax, -24(%rbp)
	movl	-12(%rbp), %ecx
	movl	%ecx, (%rax)
	movq	-32(%rbp), %rax
	movl	-12(%rbp), %ecx
	cmpl	(%rax), %ecx
	jl	.LBB1_9
# BB#8:                                 # %if.then12
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 16(%rax)
	jmp	.LBB1_10
.LBB1_9:                                # %if.else14
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 8(%rax)
.LBB1_10:                               # %if.end17
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp15:
	.size	generate, .Ltmp15-generate
	.cfi_endproc

	.globl	DFS
	.align	16, 0x90
	.type	DFS,@function
DFS:                                    # @DFS
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp18:
	.cfi_def_cfa_offset 16
.Ltmp19:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp20:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	testq	%rdi, %rdi
	je	.LBB2_6
# BB#1:                                 # %if.then
	movq	-8(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB2_3
# BB#2:                                 # %if.then2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdi
	callq	DFS
.LBB2_3:                                # %if.end
	movq	-8(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	.LBB2_5
# BB#4:                                 # %if.then5
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	callq	DFS
.LBB2_5:                                # %if.end7
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
.LBB2_6:                                # %if.end8
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp21:
	.size	DFS, .Ltmp21-DFS
	.cfi_endproc

	.globl	delete
	.align	16, 0x90
	.type	delete,@function
delete:                                 # @delete
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp24:
	.cfi_def_cfa_offset 16
.Ltmp25:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp26:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, (%rdi)
	je	.LBB3_6
# BB#1:                                 # %if.then
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 8(%rax)
	je	.LBB3_3
# BB#2:                                 # %if.then1
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	addq	$8, %rdi
	callq	delete
.LBB3_3:                                # %if.end
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	$0, 16(%rax)
	je	.LBB3_5
# BB#4:                                 # %if.then4
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	addq	$16, %rdi
	callq	delete
.LBB3_5:                                # %if.end6
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	callq	free
.LBB3_6:                                # %if.end7
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp27:
	.size	delete, .Ltmp27-delete
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "nEnter your choice:n1. Insertn2. Perform DFS Traversaln3. ExitnChoice: "
	.size	.L.str, 72

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%d"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Enter element to insert: "
	.size	.L.str2, 26

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "Memory ClearednPROGRAM TERMINATEDn"
	.size	.L.str3, 35

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "Not a valid input, try againn"
	.size	.L.str4, 30

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "%d  "
	.size	.L.str5, 5


	.section	".note.GNU-stack","",@progbits
