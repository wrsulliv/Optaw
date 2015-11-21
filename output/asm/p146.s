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
	subq	$544, %rsp              # imm = 0x220
	movl	$0, -520(%rbp)
	movl	$0, -524(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-112(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$0, -516(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_3:                                # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-524(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	-512(%rbp,%rax,4), %rax
	movslq	-520(%rbp), %rcx
	movb	$48, (%rcx,%rax)
	incl	-524(%rbp)
	movl	$0, -520(%rbp)
	incl	-516(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-516(%rbp), %rax
	movsbl	-112(%rbp,%rax), %eax
	cmpl	$48, %eax
	je	.LBB0_5
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-516(%rbp), %rax
	movsbl	-112(%rbp,%rax), %eax
	cmpl	$32, %eax
	je	.LBB0_3
# BB#4:                                 # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movslq	-516(%rbp), %rax
	movb	-112(%rbp,%rax), %al
	movslq	-524(%rbp), %rcx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	-512(%rbp,%rcx,4), %rcx
	movslq	-520(%rbp), %rdx
	movb	%al, (%rdx,%rcx)
	incl	-520(%rbp)
	incl	-516(%rbp)
	jmp	.LBB0_1
.LBB0_5:                                # %for.end
	movslq	-524(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	-512(%rbp,%rax,4), %rax
	movslq	-520(%rbp), %rcx
	movb	$48, (%rcx,%rax)
	movl	$0, -516(%rbp)
	jmp	.LBB0_6
	.align	16, 0x90
.LBB0_15:                               # %for.inc61
                                        #   in Loop: Header=BB0_6 Depth=1
	incl	-516(%rbp)
.LBB0_6:                                # %for.cond24
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_8 Depth 2
                                        #       Child Loop BB0_11 Depth 3
	movl	-516(%rbp), %eax
	cmpl	-524(%rbp), %eax
	jg	.LBB0_16
# BB#7:                                 # %for.body27
                                        #   in Loop: Header=BB0_6 Depth=1
	movl	-516(%rbp), %eax
	incl	%eax
	movl	%eax, -520(%rbp)
	jmp	.LBB0_8
	.align	16, 0x90
.LBB0_14:                               # %for.inc58
                                        #   in Loop: Header=BB0_8 Depth=2
	incl	-520(%rbp)
.LBB0_8:                                # %for.cond28
                                        #   Parent Loop BB0_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_11 Depth 3
	movl	-520(%rbp), %eax
	cmpl	-524(%rbp), %eax
	jg	.LBB0_15
# BB#9:                                 # %for.body31
                                        #   in Loop: Header=BB0_8 Depth=2
	movslq	-520(%rbp), %rax
	movslq	-516(%rbp), %rcx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	-512(%rbp,%rcx,4), %rdi
	leaq	(%rax,%rax,4), %rax
	leaq	-512(%rbp,%rax,4), %rsi
	callq	strcmp
	testl	%eax, %eax
	jne	.LBB0_14
# BB#10:                                # %if.then41
                                        #   in Loop: Header=BB0_8 Depth=2
	movl	-520(%rbp), %eax
	movl	%eax, -532(%rbp)
	jmp	.LBB0_11
	.align	16, 0x90
.LBB0_12:                               # %for.inc54
                                        #   in Loop: Header=BB0_11 Depth=3
	movslq	-532(%rbp), %rax
	leaq	(%rax,%rax,4), %rcx
	leaq	-512(%rbp,%rcx,4), %rdi
	incl	%eax
	movslq	%eax, %rax
	leaq	(%rax,%rax,4), %rax
	leaq	-512(%rbp,%rax,4), %rsi
	callq	strcpy
	incl	-532(%rbp)
.LBB0_11:                               # %for.cond42
                                        #   Parent Loop BB0_6 Depth=1
                                        #     Parent Loop BB0_8 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movl	-532(%rbp), %eax
	cmpl	-524(%rbp), %eax
	jle	.LBB0_12
# BB#13:                                # %for.end56
                                        #   in Loop: Header=BB0_8 Depth=2
	decl	-524(%rbp)
	jmp	.LBB0_14
.LBB0_16:                               # %for.end63
	movl	$0, -528(%rbp)
	jmp	.LBB0_17
	.align	16, 0x90
.LBB0_18:                               # %for.inc72
                                        #   in Loop: Header=BB0_17 Depth=1
	movslq	-528(%rbp), %rax
	leaq	(%rax,%rax,4), %rax
	leaq	-512(%rbp,%rax,4), %rsi
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	incl	-528(%rbp)
.LBB0_17:                               # %for.cond64
                                        # =>This Inner Loop Header: Depth=1
	movl	-528(%rbp), %eax
	cmpl	-524(%rbp), %eax
	jle	.LBB0_18
# BB#19:                                # %for.end74
	addq	$544, %rsp              # imm = 0x220
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "enter the stringn"
	.size	.L.str, 18

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%[^n]s"
	.size	.L.str1, 7

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "%sn"
	.size	.L.str2, 4


	.section	".note.GNU-stack","",@progbits
