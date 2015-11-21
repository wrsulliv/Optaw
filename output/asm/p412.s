	.file	"<stdin>"
	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI0_0:
	.long	1065353216              # float 1
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
	subq	$16, %rsp
	movl	$.L.str, %edi
	xorb	%al, %al
	callq	printf
	movl	$.L.str1, %edi
	xorb	%al, %al
	callq	printf
	leaq	-4(%rbp), %rsi
	movl	$.L.str2, %edi
	xorb	%al, %al
	callq	__isoc99_scanf
	movl	$0, -12(%rbp)
	movl	$1065353216, -8(%rbp)   # imm = 0x3F800000
	vmovss	.LCPI0_0(%rip), %xmm0
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	vdivss	-8(%rbp), %xmm0, %xmm1
	vmovss	%xmm1, -16(%rbp)
	vaddss	-12(%rbp), %xmm1, %xmm1
	vmovss	%xmm1, -12(%rbp)
	vaddss	-8(%rbp), %xmm0, %xmm1
	vmovss	%xmm1, -8(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	vcvtsi2ssl	-4(%rbp), %xmm0, %xmm1
	vucomiss	-8(%rbp), %xmm1
	jae	.LBB0_2
# BB#3:                                 # %for.end
	vmovss	-12(%rbp), %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movl	$.L.str3, %edi
	movb	$1, %al
	callq	printf
	addq	$16, %rsp
	popq	%rbp
	ret
.Ltmp5:
	.size	main, .Ltmp5-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	 "1 + 1 / 2 + 1 / 3 +......+1 / n n"
	.size	.L.str, 34

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	 "Enter the value of n n"
	.size	.L.str1, 23

	.type	.L.str2,@object         # @.str2
.L.str2:
	.asciz	 "%d"
	.size	.L.str2, 3

	.type	.L.str3,@object         # @.str3
.L.str3:
	.asciz	 "the Sum of H.P Series is = %f"
	.size	.L.str3, 30


	.section	".note.GNU-stack","",@progbits
