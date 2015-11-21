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
	pushq	%rbx
	subq	$24, %rsp
.Ltmp6:
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	movq	$0, -24(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-24(%rbp), %rbx
	movq	%rbx, %rdi
	callq	create
	movq	%rbx, %rdi
	callq	makecycle
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	movq	-24(%rbp), %rdi
	callq	detectcycle
	movl	%eax, -28(%rbp)
	testl	%eax, %eax
	je	.LBB0_2
# BB#1:                                 # %if.then
	movl	$.L.str2, %edi
	jmp	.LBB0_3
.LBB0_2:                                # %if.else
	movl	$.L.str3, %edi
.LBB0_3:                                # %if.else
	xorb	%al, %al
	callq	printf
	leaq	-24(%rbp), %rdi
	callq	release
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	main, .Ltmp7-main
	.cfi_endproc

	.globl	create
	.align	16, 0x90
	.type	create,@function
create:                                 # @create
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp11:
	.cfi_def_cfa_offset 16
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp13:
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$32, %rsp
.Ltmp14:
	.cfi_offset %rbx, -32
.Ltmp15:
	.cfi_offset %r14, -24
	movq	%rdi, -24(%rbp)
	leaq	-28(%rbp), %r14
	leaq	-32(%rbp), %rbx
	.align	16, 0x90
.LBB1_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L.str4, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str5, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$16, %edi
	callq	malloc
	movq	%rax, -40(%rbp)
	movl	-28(%rbp), %ecx
	movl	%ecx, (%rax)
	movq	-40(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	cmpq	$0, (%rax)
	jne	.LBB1_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rcx, (%rax)
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_3:                                # %if.else
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rcx, 8(%rax)
.LBB1_4:                                # %do.cond
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	movl	$.L.str6, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str5, %edi
	movq	%rbx, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	cmpl	$0, -32(%rbp)
	jne	.LBB1_1
# BB#5:                                 # %do.end
	movl	$.L.str7, %edi
	xorb	%al, %al
	callq	printf
	addq	$32, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp16:
	.size	create, .Ltmp16-create
	.cfi_endproc

	.globl	makecycle
	.align	16, 0x90
	.type	makecycle,@function
makecycle:                              # @makecycle
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp19:
	.cfi_def_cfa_offset 16
.Ltmp20:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp21:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	$0, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	%rax, -24(%rbp)
	jmp	.LBB2_1
	.align	16, 0x90
.LBB2_2:                                # %while.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	incl	-32(%rbp)
.LBB2_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB2_2
# BB#3:                                 # %while.end
	cmpl	$0, -32(%rbp)
	je	.LBB2_5
# BB#4:                                 # %if.then
	callq	rand
	cltd
	idivl	-32(%rbp)
	movl	%edx, -28(%rbp)
	jmp	.LBB2_6
.LBB2_5:                                # %if.else
	movl	$1, -28(%rbp)
.LBB2_6:                                # %if.end
	movl	$0, -36(%rbp)
	jmp	.LBB2_7
	.align	16, 0x90
.LBB2_8:                                # %for.body
                                        #   in Loop: Header=BB2_7 Depth=1
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	incl	-36(%rbp)
.LBB2_7:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	decl	%eax
	cmpl	%eax, -36(%rbp)
	jl	.LBB2_8
# BB#9:                                 # %for.end
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 8(%rax)
	addq	$48, %rsp
	popq	%rbp
	ret
.Ltmp22:
	.size	makecycle, .Ltmp22-makecycle
	.cfi_endproc

	.globl	detectcycle
	.align	16, 0x90
	.type	detectcycle,@function
detectcycle:                            # @detectcycle
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp25:
	.cfi_def_cfa_offset 16
.Ltmp26:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp27:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$1, -20(%rbp)
	movl	$1, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	jmp	.LBB3_1
	.align	16, 0x90
.LBB3_13:                               # %if.end23
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$0, -20(%rbp)
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -20(%rbp)
.LBB3_1:                                # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	cmpl	$0, -20(%rbp)
	je	.LBB3_3
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
.LBB3_3:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-48(%rbp), %rax
	cmpq	-40(%rbp), %rax
	je	.LBB3_4
# BB#11:                                # %if.else
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-48(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB3_13
# BB#12:                                # %if.then21
	movl	$0, -4(%rbp)
	jmp	.LBB3_15
	.align	16, 0x90
.LBB3_5:                                # %while.body7
                                        #   in Loop: Header=BB3_4 Depth=1
	incl	-24(%rbp)
.LBB3_4:                                # %if.then3
                                        # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jne	.LBB3_5
# BB#6:                                 # %while.end
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	%rax, -48(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB3_7
	.align	16, 0x90
.LBB3_8:                                # %for.inc
                                        #   in Loop: Header=BB3_7 Depth=1
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
	incl	-28(%rbp)
.LBB3_7:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.LBB3_9
	jmp	.LBB3_8
	.align	16, 0x90
.LBB3_10:                               # %while.body14
                                        #   in Loop: Header=BB3_9 Depth=1
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -48(%rbp)
.LBB3_9:                                # %while.cond12
                                        # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB3_10
# BB#14:                                # %while.end17
	movq	-48(%rbp), %rax
	movq	$0, 8(%rax)
	movl	$1, -4(%rbp)
.LBB3_15:                               # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	ret
.Ltmp28:
	.size	detectcycle, .Ltmp28-detectcycle
	.cfi_endproc

	.globl	release
	.align	16, 0x90
	.type	release,@function
release:                                # @release
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp31:
	.cfi_def_cfa_offset 16
.Ltmp32:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp33:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	(%rdi), %rax
	movq	%rax, -16(%rbp)
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB4_1
	.align	16, 0x90
.LBB4_2:                                # %while.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	-16(%rbp), %rdi
	callq	free
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rcx
	movq	8(%rcx), %rcx
	movq	%rcx, (%rax)
.LBB4_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpq	$0, (%rax)
	jne	.LBB4_2
# BB#3:                                 # %while.end
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp34:
	.size	release, .Ltmp34-release
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Enter data into the listn"
	.size	.L.str, 26

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "Identifying if a cycle exists.n"
	.size	.L.str1, 32

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Cycle detected in the linked list.n"
	.size	.L.str2, 36

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "No cycle detected in the linked list.n"
	.size	.L.str3, 39

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "Enter number: "
	.size	.L.str4, 15

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "%d"
	.size	.L.str5, 3

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "Do you wish to continue [1/0]: "
	.size	.L.str6, 32

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "n"
	.size	.L.str7, 2


	.section	".note.GNU-stack","",@progbits
