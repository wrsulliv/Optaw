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
	subq	$1024, %rsp             # imm = 0x400
	movl	$0, -4(%rbp)
	movq	$0, -1016(%rbp)
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	leaq	-1008(%rbp), %rsi
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	printf
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_5:                                # %sw.bb
                                        #   in Loop: Header=BB0_1 Depth=1
	xorb	%al, %al
	callq	printf
	incq	-1016(%rbp)
.LBB0_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-1016(%rbp), %rax
	cmpb	$0, -1008(%rbp,%rax)
	je	.LBB0_14
# BB#2:                                 # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-1016(%rbp), %rax
	movsbl	-1008(%rbp,%rax), %eax
	addl	$-48, %eax
	cmpl	$7, %eax
	ja	.LBB0_13
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	jmpq	*.LJTI0_0(,%rax,8)
.LBB0_4:                                # %sw.bb
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str3, %edi
	jmp	.LBB0_5
.LBB0_6:                                # %sw.bb5
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str4, %edi
	jmp	.LBB0_5
.LBB0_7:                                # %sw.bb7
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str5, %edi
	jmp	.LBB0_5
.LBB0_8:                                # %sw.bb9
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str6, %edi
	jmp	.LBB0_5
.LBB0_9:                                # %sw.bb11
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str7, %edi
	jmp	.LBB0_5
.LBB0_10:                               # %sw.bb13
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str8, %edi
	jmp	.LBB0_5
.LBB0_11:                               # %sw.bb15
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str9, %edi
	jmp	.LBB0_5
.LBB0_12:                               # %sw.bb17
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str10, %edi
	jmp	.LBB0_5
.LBB0_13:                               # %sw.default
	movq	-1016(%rbp), %rax
	movsbl	-1008(%rbp,%rax), %esi
	movl	$.L.str11, %edi
	xorb	%al, %al
	callq	printf
.LBB0_14:                               # %while.end
	movl	$0, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$1024, %rsp             # imm = 0x400
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.align	8
.LJTI0_0:
	.quad	.LBB0_4
	.quad	.LBB0_6
	.quad	.LBB0_7
	.quad	.LBB0_8
	.quad	.LBB0_9
	.quad	.LBB0_10
	.quad	.LBB0_11
	.quad	.LBB0_12

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "Enter any octal number: "
	.size	.L.str, 25

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "%s"
	.size	.L.str1, 3

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "Equivalent binary value: "
	.size	.L.str2, 26

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "000"
	.size	.L.str3, 4

	.type	.L.str4,@object         # @.str4
.L.str4:
	.asciz	 "001"
	.size	.L.str4, 4

	.type	.L.str5,@object         # @.str5
.L.str5:
	.asciz	 "010"
	.size	.L.str5, 4

	.type	.L.str6,@object         # @.str6
.L.str6:
	.asciz	 "011"
	.size	.L.str6, 4

	.type	.L.str7,@object         # @.str7
.L.str7:
	.asciz	 "100"
	.size	.L.str7, 4

	.type	.L.str8,@object         # @.str8
.L.str8:
	.asciz	 "101"
	.size	.L.str8, 4

	.type	.L.str9,@object         # @.str9
.L.str9:
	.asciz	 "110"
	.size	.L.str9, 4

	.type	.L.str10,@object        # @.str10
.L.str10:
	.asciz	 "111"
	.size	.L.str10, 4

	.type	.L.str11,@object        # @.str11
.L.str11:
	.asciz	 "n Invalid octal digit %c "
	.size	.L.str11, 26


	.section	".note.GNU-stack","",@progbits
