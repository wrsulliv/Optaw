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
	pushq	%r14
	pushq	%rbx
	subq	$272, %rsp              # imm = 0x110
.Ltmp6:
	.cfi_offset %rbx, -32
.Ltmp7:
	.cfi_offset %r14, -24
	movl	$0, -28(%rbp)
	movl	$0, -36(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-144(%rbp), %r14
	movl	$.L.str1, %edi
	movq	%r14, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	leaq	-154(%rbp), %rbx
	movl	$.L.str1, %edi
	movq	%rbx, %rsi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str3, %edi
	xorb	%al, %al
	callq	printf
	leaq	-32(%rbp), %rsi
	movl	$.L.str4, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	leaq	-256(%rbp), %rax
	movq	%r14, -264(%rbp)
	movq	%rax, -280(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_11:                               # %for.inc38
                                        #   in Loop: Header=BB0_1 Depth=1
	incq	-264(%rbp)
	incl	-20(%rbp)
	incl	-24(%rbp)
	incq	-280(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
	movq	-264(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$48, %eax
	je	.LBB0_12
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-20(%rbp), %rax
	movb	-144(%rbp,%rax), %al
	movslq	-24(%rbp), %rcx
	movb	%al, -256(%rbp,%rcx)
	movq	-264(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$32, %eax
	jne	.LBB0_5
# BB#3:                                 # %land.lhs.true
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$1, -36(%rbp)
	je	.LBB0_5
# BB#4:                                 # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	incl	-28(%rbp)
.LBB0_5:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	cmpl	$1, -36(%rbp)
	je	.LBB0_11
# BB#6:                                 # %land.lhs.true19
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-32(%rbp), %eax
	decl	%eax
	cmpl	%eax, -28(%rbp)
	jne	.LBB0_11
# BB#7:                                 # %if.then22
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$1, -36(%rbp)
	movq	%rbx, -272(%rbp)
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_9:                                # %for.inc
                                        #   in Loop: Header=BB0_8 Depth=2
	movq	-272(%rbp), %rax
	movb	(%rax), %al
	movl	-24(%rbp), %ecx
	incl	%ecx
	movl	%ecx, -24(%rbp)
	movslq	%ecx, %rcx
	movb	%al, -256(%rbp,%rcx)
	incq	-280(%rbp)
	incq	-272(%rbp)
.LBB0_8:                                # %for.cond24
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	-272(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$48, %eax
	jne	.LBB0_9
# BB#10:                                # %for.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-24(%rbp), %eax
	incl	%eax
	movl	%eax, -24(%rbp)
	movslq	%eax, %rax
	movb	$32, -256(%rbp,%rax)
	incq	-280(%rbp)
	jmp	.LBB0_11
.LBB0_12:                               # %for.end43
	movslq	-24(%rbp), %rax
	movb	$48, -256(%rbp,%rax)
	leaq	-256(%rbp), %rsi
	movl	$.L.str5, %edi
	xorb	%al, %al
	callq	printf
	addq	$272, %rsp              # imm = 0x110
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
.Ltmp8:
	.size	main, .Ltmp8-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "nenter the String:"
	.size	.L.str, 19

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 " %[^n]s"
	.size	.L.str1, 8

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "nenter the string to be inserted:"
	.size	.L.str2, 34

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "nenter the position you like to insert:"
	.size	.L.str3, 40

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "%d"
	.size	.L.str4, 3

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "nthe string after modification isnn %sn"
	.size	.L.str5, 40


	.section	".note.GNU-stack","",@progbits
