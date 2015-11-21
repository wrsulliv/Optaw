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
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	movq	-24(%rbp), %rdi
	xorl	%esi, %esi
	callq	display
	movq	-24(%rbp), %rdi
	callq	transform
	movq	%rax, -32(%rbp)
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	movq	-32(%rbp), %rdi
	movl	$1, %esi
	callq	display
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	$0, 16(%rax)
	movq	%rbx, %rdi
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
	subq	$48, %rsp
.Ltmp14:
	.cfi_offset %rbx, -32
.Ltmp15:
	.cfi_offset %r14, -24
	movq	%rdi, -24(%rbp)
	leaq	-52(%rbp), %r14
	leaq	-56(%rbp), %rbx
	.align	16, 0x90
.LBB1_1:                                # %do.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_5 Depth 2
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str4, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$32, %edi
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	-52(%rbp), %ecx
	movl	%ecx, (%rax)
	movq	-32(%rbp), %rax
	movl	$0, 24(%rax)
	movq	-32(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-32(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-24(%rbp), %rax
	cmpq	$0, (%rax)
	jne	.LBB1_5
# BB#2:                                 # %if.then
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, (%rax)
	jmp	.LBB1_11
	.align	16, 0x90
.LBB1_4:                                # %if.else9
                                        #   in Loop: Header=BB1_5 Depth=2
	movq	%rax, -40(%rbp)
.LBB1_5:                                # %while.cond
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$0, -40(%rbp)
	je	.LBB1_8
# BB#6:                                 # %while.body
                                        #   in Loop: Header=BB1_5 Depth=2
	movq	-40(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movq	-32(%rbp), %rcx
	cmpl	(%rcx), %eax
	jl	.LBB1_3
# BB#7:                                 # %if.then7
                                        #   in Loop: Header=BB1_5 Depth=2
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_3:                                # %if.else9
                                        #   in Loop: Header=BB1_5 Depth=2
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_8:                                # %while.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movq	-32(%rbp), %rcx
	cmpl	(%rcx), %eax
	jl	.LBB1_10
# BB#9:                                 # %if.then14
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 16(%rax)
	jmp	.LBB1_11
	.align	16, 0x90
.LBB1_10:                               # %if.else16
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 8(%rax)
.LBB1_11:                               # %do.cond
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str4, %edi
	movq	%rbx, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	cmpl	$0, -56(%rbp)
	jne	.LBB1_1
# BB#12:                                # %do.end
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp16:
	.size	create, .Ltmp16-create
	.cfi_endproc

	.globl	display
	.align	16, 0x90
	.type	display,@function
display:                                # @display
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
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	cmpq	$0, -8(%rbp)
	je	.LBB2_3
# BB#1:                                 # %land.lhs.true
	cmpl	$0, -12(%rbp)
	je	.LBB2_2
.LBB2_3:                                # %if.else
	cmpq	$0, -8(%rbp)
	je	.LBB2_9
# BB#4:                                 # %land.lhs.true2
	cmpl	$0, -12(%rbp)
	je	.LBB2_9
# BB#5:                                 # %if.then4
	movq	-8(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.LBB2_6
	.align	16, 0x90
.LBB2_7:                                # %while.body
                                        #   in Loop: Header=BB2_6 Depth=1
	movq	-24(%rbp), %rax
.LBB2_6:                                # %if.then4
                                        # =>This Inner Loop Header: Depth=1
	movl	(%rax), %esi
	movl	$.L.str6, %edi
	xorb	%al, %al
	callq	printf
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jne	.LBB2_7
# BB#8:                                 # %while.end
	movl	$.L.str7, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB2_9
.LBB2_2:                                # %if.then
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdi
	xorl	%esi, %esi
	callq	display
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	movl	$.L.str6, %edi
	xorb	%al, %al
	callq	printf
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdi
	xorl	%esi, %esi
	callq	display
.LBB2_9:                                # %if.end13
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp22:
	.size	display, .Ltmp22-display
	.cfi_endproc

	.globl	transform
	.align	16, 0x90
	.type	transform,@function
transform:                              # @transform
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
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	testq	%rdi, %rdi
	je	.LBB3_7
# BB#1:                                 # %if.end
	movq	-16(%rbp), %rdi
	callq	transformdet
	movq	%rax, -16(%rbp)
	movq	%rax, -24(%rbp)
	jmp	.LBB3_2
	.align	16, 0x90
.LBB3_3:                                # %while.body
                                        #   in Loop: Header=BB3_2 Depth=1
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
.LBB3_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB3_4
	jmp	.LBB3_3
	.align	16, 0x90
.LBB3_5:                                # %while.body5
                                        #   in Loop: Header=BB3_4 Depth=1
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
.LBB3_4:                                # %while.cond3
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	$0, 16(%rax)
	jne	.LBB3_5
# BB#6:                                 # %while.end7
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rcx, 16(%rax)
.LBB3_7:                                # %while.end7
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp28:
	.size	transform, .Ltmp28-transform
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
	cmpq	$0, (%rdi)
	je	.LBB4_2
# BB#1:                                 # %if.then
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	addq	$16, %rdi
	callq	release
	movq	-8(%rbp), %rax
	movq	(%rax), %rdi
	callq	free
.LBB4_2:                                # %if.end
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp34:
	.size	release, .Ltmp34-release
	.cfi_endproc

	.globl	transformdet
	.align	16, 0x90
	.type	transformdet,@function
transformdet:                           # @transformdet
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Ltmp37:
	.cfi_def_cfa_offset 16
.Ltmp38:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp39:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	testq	%rdi, %rdi
	je	.LBB5_11
# BB#1:                                 # %if.end
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB5_6
# BB#2:                                 # %if.then3
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	transformdet
	jmp	.LBB5_3
	.align	16, 0x90
.LBB5_4:                                # %while.body
                                        #   in Loop: Header=BB5_3 Depth=1
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
.LBB5_3:                                # %if.then3
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	cmpq	$0, 16(%rax)
	jne	.LBB5_4
# BB#5:                                 # %while.end
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rcx, 16(%rax)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, 8(%rax)
.LBB5_6:                                # %if.end10
	movq	-16(%rbp), %rax
	cmpq	$0, 16(%rax)
	je	.LBB5_11
# BB#7:                                 # %if.then13
	movq	-16(%rbp), %rax
	movq	16(%rax), %rdi
	callq	transformdet
	jmp	.LBB5_8
	.align	16, 0x90
.LBB5_9:                                # %while.body19
                                        #   in Loop: Header=BB5_8 Depth=1
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
.LBB5_8:                                # %if.then13
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	cmpq	$0, 8(%rax)
	jne	.LBB5_9
# BB#10:                                # %while.end21
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	%rcx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, 16(%rax)
.LBB5_11:                               # %if.end24
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	ret
.Ltmp40:
	.size	transformdet, .Ltmp40-transformdet
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Creating binary tree:n"
	.size	.L.str, 23

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "Displaying binary tree:n"
	.size	.L.str1, 25

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "nDisplaying circular linked list:n"
	.size	.L.str2, 35

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "Enter a number in the tree: "
	.size	.L.str3, 29

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "%d"
	.size	.L.str4, 3

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "Do you want to add more numbers? [1/0]n"
	.size	.L.str5, 40

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "%d   "
	.size	.L.str6, 6

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "n"
	.size	.L.str7, 2


	.section	".note.GNU-stack","",@progbits
