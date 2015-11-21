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
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	8(%rsi), %rdi
	movl	$.L.str, %esi
	callq	fopen
	movq	%rax, -24(%rbp)
	testq	%rax, %rax
	je	.LBB0_5
# BB#1:                                 # %if.end
	movq	-24(%rbp), %rdi
	callq	to_initcap_file
	movl	%eax, -40(%rbp)
	cmpl	$1, %eax
	jne	.LBB0_3
# BB#2:                                 # %if.then4
	movl	$.L.str2, %edi
	jmp	.LBB0_4
.LBB0_3:                                # %if.else
	movl	$.L.str3, %edi
.LBB0_4:                                # %if.else
	xorb	%al, %al
	callq	printf
	movq	-24(%rbp), %rdi
	callq	fclose
	addq	$48, %rsp
	popq	%rbp
	ret
.LBB0_5:                                # %if.then
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.globl	to_initcap_file
	.align	16, 0x90
	.type	to_initcap_file,@function
to_initcap_file:                        # @to_initcap_file
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
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	callq	fgetc
	movb	%al, -9(%rbp)
	movsbl	-9(%rbp), %eax
	cmpl	$97, %eax
	jl	.LBB1_4
# BB#1:                                 # %land.lhs.true
	movsbl	-9(%rbp), %eax
	cmpl	$122, %eax
	jg	.LBB1_4
# BB#2:                                 # %if.then
	movq	-8(%rbp), %rdi
	movq	$-1, %rsi
	movl	$1, %edx
	callq	fseek
	movsbl	-9(%rbp), %edi
	addl	$-32, %edi
	movq	-8(%rbp), %rsi
.LBB1_3:                                # %if.then
	callq	fputc
	jmp	.LBB1_4
	.align	16, 0x90
.LBB1_10:                               # %if.else
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-8(%rbp), %rdi
	callq	fgetc
	movb	%al, -9(%rbp)
.LBB1_4:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movsbl	-9(%rbp), %eax
	cmpl	$-1, %eax
	je	.LBB1_11
# BB#5:                                 # %while.body
                                        #   in Loop: Header=BB1_4 Depth=1
	movsbl	-9(%rbp), %eax
	cmpl	$32, %eax
	je	.LBB1_7
# BB#6:                                 # %lor.lhs.false
                                        #   in Loop: Header=BB1_4 Depth=1
	movsbl	-9(%rbp), %eax
	cmpl	$110, %eax
	jne	.LBB1_10
.LBB1_7:                                # %if.then18
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	-8(%rbp), %rdi
	callq	fgetc
	movb	%al, -9(%rbp)
	movsbl	-9(%rbp), %eax
	cmpl	$97, %eax
	jl	.LBB1_4
# BB#8:                                 # %land.lhs.true24
                                        #   in Loop: Header=BB1_4 Depth=1
	movsbl	-9(%rbp), %eax
	cmpl	$122, %eax
	jg	.LBB1_4
# BB#9:                                 # %if.then28
	movq	-8(%rbp), %rdi
	movq	$-1, %rsi
	movl	$1, %edx
	callq	fseek
	movq	-8(%rbp), %rsi
	movsbl	-9(%rbp), %edi
	addl	$-32, %edi
	jmp	.LBB1_3
.LBB1_11:                               # %while.end
	movl	$1, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp11:
	.size	to_initcap_file, .Ltmp11-to_initcap_file
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "r+"
	.size	.L.str, 3

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "cannot open the file "
	.size	.L.str1, 22

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "success"
	.size	.L.str2, 8

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "failure"
	.size	.L.str3, 8


	.section	".note.GNU-stack","",@progbits
