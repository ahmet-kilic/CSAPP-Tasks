	.file	"kernels.c"
	.text
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4
	.globl	naive_bokeh
	.type	naive_bokeh, @function
naive_bokeh:
.LFB45:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$76, %esp
	.cfi_def_cfa_offset 96
	movl	96(%esp), %eax
	testl	%eax, %eax
	jle	.L1
	movl	96(%esp), %eax
	movl	104(%esp), %esi
	movl	$0, 68(%esp)
	movl	$1, 64(%esp)
	subl	$1, %eax
	movl	%esi, 32(%esp)
	movl	%eax, 48(%esp)
	movl	96(%esp), %eax
	addl	%eax, %eax
	movl	%eax, 72(%esp)
	addl	96(%esp), %eax
	addl	%eax, %eax
	movl	%eax, 36(%esp)
	movl	64(%esp), %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	48(%esp), %edx
	movl	%eax, %ebx
	movl	$0, %ecx
	movl	$1, %esi
	subl	$2, %ebx
	cmovns	%ebx, %ecx
	cmpl	%edx, %eax
	cmovle	%eax, %edx
	movl	68(%esp), %eax
	movl	%ecx, 52(%esp)
	imull	96(%esp), %ecx
	leal	(%eax,%eax,2), %eax
	movl	%edx, 56(%esp)
	leal	(%eax,%eax), %edi
	leal	1(%edx), %eax
	movl	%ecx, 60(%esp)
	movl	%eax, 28(%esp)
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L4:
	movl	100(%esp), %eax
	movl	108(%esp), %ebx
	movl	%esi, 4(%esp)
	addl	$1, %esi
	movl	(%eax,%edi), %eax
	movl	%eax, (%ebx,%edi)
	movl	100(%esp), %eax
	movzwl	4(%eax,%edi), %eax
	movw	%ax, 4(%ebx,%edi)
	movl	4(%esp), %eax
	addl	$6, %edi
	cmpl	%eax, 96(%esp)
	jle	.L16
.L10:
	movl	32(%esp), %eax
	cmpw	$0, -2(%eax,%esi,2)
	jne	.L4
	movl	52(%esp), %ebp
	movl	56(%esp), %eax
	cmpl	%eax, %ebp
	jg	.L5
	movl	%esi, %ebx
	movl	48(%esp), %ecx
	movl	$0, %eax
	movl	100(%esp), %edx
	subl	$2, %ebx
	movl	$0, 16(%esp)
	cmovs	%eax, %ebx
	movl	60(%esp), %eax
	cmpl	%ecx, %esi
	movl	%edi, 40(%esp)
	cmovle	%esi, %ecx
	movl	$0, 12(%esp)
	addl	%ebx, %eax
	movl	$0, 8(%esp)
	leal	(%eax,%eax,2), %eax
	movl	%esi, 4(%esp)
	leal	(%edx,%eax,2), %edx
	movl	%ecx, %eax
	movl	%ecx, (%esp)
	xorl	%ecx, %ecx
	subl	%ebx, %eax
	movl	%esi, 44(%esp)
	movl	%ebp, %esi
	addl	$1, %eax
	movl	%eax, 20(%esp)
	addl	%eax, %eax
	movl	%eax, 24(%esp)
	.p2align 4,,10
	.p2align 3
.L8:
	cmpl	(%esp), %ebx
	jg	.L6
	movl	24(%esp), %eax
	addl	20(%esp), %eax
	leal	(%edx,%eax,2), %edi
	movl	%edx, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movzwl	(%eax), %ebp
	addl	$6, %eax
	addl	%ebp, 8(%esp)
	movzwl	-4(%eax), %ebp
	addl	%ebp, 12(%esp)
	movzwl	-2(%eax), %ebp
	addl	%ebp, 16(%esp)
	cmpl	%edi, %eax
	jne	.L7
	movl	(%esp), %eax
	subl	%ebx, %eax
	leal	1(%eax,%ecx), %ecx
.L6:
	addl	$1, %esi
	addl	36(%esp), %edx
	cmpl	28(%esp), %esi
	jne	.L8
	movl	8(%esp), %eax
	movl	40(%esp), %edi
	movl	108(%esp), %ebx
	movl	44(%esp), %esi
	cltd
	idivl	%ecx
	addl	$1, %esi
	movw	%ax, (%ebx,%edi)
	movl	12(%esp), %eax
	cltd
	idivl	%ecx
	movw	%ax, 2(%ebx,%edi)
	movl	16(%esp), %eax
	cltd
	idivl	%ecx
	movw	%ax, 4(%ebx,%edi)
	movl	4(%esp), %eax
	addl	$6, %edi
	cmpl	%eax, 96(%esp)
	jg	.L10
.L16:
	movl	64(%esp), %esi
	movl	96(%esp), %ebx
	addl	%ebx, 68(%esp)
	movl	72(%esp), %ebx
	leal	1(%esi), %eax
	addl	%ebx, 32(%esp)
	cmpl	96(%esp), %esi
	je	.L1
	movl	%eax, 64(%esp)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L1:
	addl	$76, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	naive_bokeh.cold, @function
naive_bokeh.cold:
.LFSB45:
.L5:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -20
	.cfi_offset 5, -8
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	ud2
	.cfi_endproc
.LFE45:
	.text
	.size	naive_bokeh, .-naive_bokeh
	.section	.text.unlikely
	.size	naive_bokeh.cold, .-naive_bokeh.cold
.LCOLDE0:
	.text
.LHOTE0:
	.p2align 4
	.globl	bokeh
	.type	bokeh, @function
bokeh:
.LFB46:
	.cfi_startproc
	endbr32
	jmp	naive_bokeh
	.cfi_endproc
.LFE46:
	.size	bokeh, .-bokeh
	.p2align 4
	.globl	naive_hadamard
	.type	naive_hadamard, @function
naive_hadamard:
.LFB49:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %eax
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	movl	40(%esp), %edi
	testl	%eax, %eax
	jle	.L18
	movl	28(%esp), %eax
	movl	$0, (%esp)
	xorl	%ebp, %ebp
	sall	$2, %eax
	movl	%eax, 4(%esp)
	movl	%eax, %ecx
	.p2align 4,,10
	.p2align 3
.L20:
	leal	0(,%ebp,4), %eax
	.p2align 4,,10
	.p2align 3
.L21:
	movl	(%ebx,%eax), %edx
	imull	(%esi,%eax), %edx
	movl	%edx, (%edi,%eax)
	addl	$4, %eax
	cmpl	%eax, %ecx
	jne	.L21
	addl	$1, (%esp)
	addl	28(%esp), %ebp
	movl	(%esp), %eax
	addl	4(%esp), %ecx
	cmpl	%eax, 28(%esp)
	jne	.L20
.L18:
	addl	$8, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE49:
	.size	naive_hadamard, .-naive_hadamard
	.p2align 4
	.globl	hadamard
	.type	hadamard, @function
hadamard:
.LFB50:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$8, %esp
	.cfi_def_cfa_offset 28
	movl	28(%esp), %eax
	testl	%eax, %eax
	jle	.L24
	movl	28(%esp), %eax
	movl	32(%esp), %esi
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	subl	$1, %eax
	subl	$-128, %esi
	andl	$-32, %eax
	movl	%esi, 4(%esp)
	movl	%eax, (%esp)
	.p2align 4,,10
	.p2align 3
.L26:
	movl	(%esp), %esi
	movl	32(%esp), %eax
	leal	0(,%edi,4), %edx
	movl	36(%esp), %ecx
	leal	(%esi,%edi), %ebx
	movl	4(%esp), %esi
	addl	%edx, %eax
	addl	%edx, %ecx
	addl	40(%esp), %edx
	leal	(%esi,%ebx,4), %esi
	.p2align 4,,10
	.p2align 3
.L27:
	movl	(%eax), %ebx
	imull	(%ecx), %ebx
	movl	%ebx, (%edx)
	movl	4(%eax), %ebx
	imull	4(%ecx), %ebx
	movl	%ebx, 4(%edx)
	movl	8(%eax), %ebx
	imull	8(%ecx), %ebx
	movl	%ebx, 8(%edx)
	movl	12(%eax), %ebx
	imull	12(%ecx), %ebx
	movl	%ebx, 12(%edx)
	movl	16(%eax), %ebx
	imull	16(%ecx), %ebx
	movl	%ebx, 16(%edx)
	movl	20(%eax), %ebx
	imull	20(%ecx), %ebx
	movl	%ebx, 20(%edx)
	movl	24(%eax), %ebx
	imull	24(%ecx), %ebx
	movl	%ebx, 24(%edx)
	movl	28(%eax), %ebx
	imull	28(%ecx), %ebx
	movl	%ebx, 28(%edx)
	movl	32(%eax), %ebx
	imull	32(%ecx), %ebx
	movl	%ebx, 32(%edx)
	movl	36(%eax), %ebx
	imull	36(%ecx), %ebx
	movl	%ebx, 36(%edx)
	movl	40(%eax), %ebx
	imull	40(%ecx), %ebx
	movl	%ebx, 40(%edx)
	movl	44(%eax), %ebx
	imull	44(%ecx), %ebx
	movl	%ebx, 44(%edx)
	movl	48(%eax), %ebx
	imull	48(%ecx), %ebx
	movl	%ebx, 48(%edx)
	movl	52(%eax), %ebx
	imull	52(%ecx), %ebx
	movl	%ebx, 52(%edx)
	movl	56(%eax), %ebx
	imull	56(%ecx), %ebx
	movl	%ebx, 56(%edx)
	movl	60(%eax), %ebx
	imull	60(%ecx), %ebx
	movl	%ebx, 60(%edx)
	movl	64(%eax), %ebx
	imull	64(%ecx), %ebx
	movl	%ebx, 64(%edx)
	movl	68(%eax), %ebx
	imull	68(%ecx), %ebx
	movl	%ebx, 68(%edx)
	movl	72(%eax), %ebx
	imull	72(%ecx), %ebx
	movl	%ebx, 72(%edx)
	movl	76(%eax), %ebx
	imull	76(%ecx), %ebx
	movl	%ebx, 76(%edx)
	movl	80(%eax), %ebx
	imull	80(%ecx), %ebx
	movl	%ebx, 80(%edx)
	movl	84(%eax), %ebx
	imull	84(%ecx), %ebx
	movl	%ebx, 84(%edx)
	movl	88(%eax), %ebx
	imull	88(%ecx), %ebx
	movl	%ebx, 88(%edx)
	movl	92(%eax), %ebx
	imull	92(%ecx), %ebx
	movl	%ebx, 92(%edx)
	movl	96(%eax), %ebx
	imull	96(%ecx), %ebx
	movl	%ebx, 96(%edx)
	movl	100(%eax), %ebx
	imull	100(%ecx), %ebx
	movl	%ebx, 100(%edx)
	movl	104(%eax), %ebx
	imull	104(%ecx), %ebx
	movl	%ebx, 104(%edx)
	movl	108(%eax), %ebx
	imull	108(%ecx), %ebx
	movl	%ebx, 108(%edx)
	movl	112(%eax), %ebx
	imull	112(%ecx), %ebx
	movl	%ebx, 112(%edx)
	movl	116(%eax), %ebx
	imull	116(%ecx), %ebx
	movl	%ebx, 116(%edx)
	movl	120(%eax), %ebx
	imull	120(%ecx), %ebx
	movl	%ebx, 120(%edx)
	movl	124(%eax), %ebx
	imull	124(%ecx), %ebx
	subl	$-128, %eax
	subl	$-128, %ecx
	subl	$-128, %edx
	movl	%ebx, -4(%edx)
	cmpl	%eax, %esi
	jne	.L27
	addl	$1, %ebp
	addl	28(%esp), %edi
	cmpl	%ebp, 28(%esp)
	jne	.L26
.L24:
	addl	$8, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE50:
	.size	hadamard, .-hadamard
	.p2align 4
	.globl	unroll_wo_ridx
	.type	unroll_wo_ridx, @function
unroll_wo_ridx:
.LFB53:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$4, %esp
	.cfi_def_cfa_offset 24
	movl	24(%esp), %edi
	testl	%edi, %edi
	jle	.L30
	leal	-1(%edi), %eax
	xorl	%ebp, %ebp
	shrl	$5, %eax
	addl	$1, %eax
	sall	$7, %eax
	movl	%eax, (%esp)
	.p2align 4,,10
	.p2align 3
.L32:
	movl	36(%esp), %ecx
	movl	32(%esp), %edx
	xorl	%esi, %esi
	movl	28(%esp), %eax
	.p2align 4,,10
	.p2align 3
.L33:
	movl	(%eax), %ebx
	imull	(%edx), %ebx
	movl	%ebx, (%ecx)
	movl	4(%eax), %ebx
	imull	4(%edx), %ebx
	movl	%ebx, 4(%ecx)
	movl	8(%eax), %ebx
	imull	8(%edx), %ebx
	movl	%ebx, 8(%ecx)
	movl	12(%eax), %ebx
	imull	12(%edx), %ebx
	movl	%ebx, 12(%ecx)
	movl	16(%eax), %ebx
	imull	16(%edx), %ebx
	movl	%ebx, 16(%ecx)
	movl	20(%eax), %ebx
	imull	20(%edx), %ebx
	movl	%ebx, 20(%ecx)
	movl	24(%eax), %ebx
	imull	24(%edx), %ebx
	movl	%ebx, 24(%ecx)
	movl	28(%eax), %ebx
	imull	28(%edx), %ebx
	movl	%ebx, 28(%ecx)
	movl	32(%eax), %ebx
	imull	32(%edx), %ebx
	movl	%ebx, 32(%ecx)
	movl	36(%eax), %ebx
	imull	36(%edx), %ebx
	movl	%ebx, 36(%ecx)
	movl	40(%eax), %ebx
	imull	40(%edx), %ebx
	movl	%ebx, 40(%ecx)
	movl	44(%eax), %ebx
	imull	44(%edx), %ebx
	movl	%ebx, 44(%ecx)
	movl	48(%eax), %ebx
	imull	48(%edx), %ebx
	movl	%ebx, 48(%ecx)
	movl	52(%eax), %ebx
	imull	52(%edx), %ebx
	movl	%ebx, 52(%ecx)
	movl	56(%eax), %ebx
	imull	56(%edx), %ebx
	movl	%ebx, 56(%ecx)
	movl	60(%eax), %ebx
	imull	60(%edx), %ebx
	movl	%ebx, 60(%ecx)
	movl	64(%eax), %ebx
	imull	64(%edx), %ebx
	movl	%ebx, 64(%ecx)
	movl	68(%eax), %ebx
	imull	68(%edx), %ebx
	movl	%ebx, 68(%ecx)
	movl	72(%eax), %ebx
	imull	72(%edx), %ebx
	movl	%ebx, 72(%ecx)
	movl	76(%eax), %ebx
	imull	76(%edx), %ebx
	movl	%ebx, 76(%ecx)
	movl	80(%eax), %ebx
	imull	80(%edx), %ebx
	movl	%ebx, 80(%ecx)
	movl	84(%eax), %ebx
	imull	84(%edx), %ebx
	movl	%ebx, 84(%ecx)
	movl	88(%eax), %ebx
	imull	88(%edx), %ebx
	movl	%ebx, 88(%ecx)
	movl	92(%eax), %ebx
	imull	92(%edx), %ebx
	movl	%ebx, 92(%ecx)
	movl	96(%eax), %ebx
	imull	96(%edx), %ebx
	movl	%ebx, 96(%ecx)
	movl	100(%eax), %ebx
	imull	100(%edx), %ebx
	movl	%ebx, 100(%ecx)
	movl	104(%eax), %ebx
	imull	104(%edx), %ebx
	movl	%ebx, 104(%ecx)
	movl	108(%eax), %ebx
	imull	108(%edx), %ebx
	movl	%ebx, 108(%ecx)
	movl	112(%eax), %ebx
	imull	112(%edx), %ebx
	movl	%ebx, 112(%ecx)
	movl	116(%eax), %ebx
	imull	116(%edx), %ebx
	movl	%ebx, 116(%ecx)
	movl	120(%eax), %ebx
	imull	120(%edx), %ebx
	movl	%ebx, 120(%ecx)
	movl	124(%eax), %ebx
	imull	124(%edx), %ebx
	subl	$-128, %ecx
	movl	%ebx, -4(%ecx)
	addl	$32, %esi
	subl	$-128, %eax
	subl	$-128, %edx
	cmpl	%esi, %edi
	jg	.L33
	addl	$1, %ebp
	movl	(%esp), %eax
	addl	%eax, 36(%esp)
	addl	%eax, 28(%esp)
	addl	%eax, 32(%esp)
	cmpl	%ebp, %edi
	jne	.L32
.L30:
	addl	$4, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE53:
	.size	unroll_wo_ridx, .-unroll_wo_ridx
	.p2align 4
	.globl	bokeh_formula
	.type	bokeh_formula, @function
bokeh_formula:
.LFB56:
	.cfi_startproc
	endbr32
	jmp	naive_bokeh
	.cfi_endproc
.LFE56:
	.size	bokeh_formula, .-bokeh_formula
	.p2align 4
	.globl	register_bokeh_functions
	.type	register_bokeh_functions, @function
register_bokeh_functions:
.LFB48:
	.cfi_startproc
	endbr32
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	leal	naive_bokeh_descr@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	naive_bokeh@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_bokeh_function@PLT
	popl	%eax
	.cfi_def_cfa_offset 28
	leal	bokeh_descr@GOTOFF(%ebx), %eax
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	bokeh@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_bokeh_function@PLT
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	leal	bokeh_formula_descr@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	bokeh_formula@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_bokeh_function@PLT
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE48:
	.size	register_bokeh_functions, .-register_bokeh_functions
	.p2align 4
	.globl	hadamard2
	.type	hadamard2, @function
hadamard2:
.LFB51:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$20, %esp
	.cfi_def_cfa_offset 40
	movl	40(%esp), %eax
	testl	%eax, %eax
	jle	.L39
	movl	40(%esp), %eax
	movl	$0, 12(%esp)
	movl	$0, (%esp)
	sall	$7, %eax
	movl	%eax, 16(%esp)
	movl	40(%esp), %eax
	leal	0(,%eax,4), %ebp
.L41:
	movl	12(%esp), %eax
	movl	$0, 4(%esp)
	movl	%eax, 8(%esp)
.L46:
	movl	8(%esp), %eax
	movl	44(%esp), %esi
	movl	$32, %edi
	movl	48(%esp), %ebx
	addl	%eax, %esi
	addl	%eax, %ebx
	addl	52(%esp), %eax
	movl	%eax, %ecx
	.p2align 4,,10
	.p2align 3
.L45:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L42:
	movl	(%esi,%eax), %edx
	imull	(%ebx,%eax), %edx
	movl	%edx, (%ecx,%eax)
	addl	$4, %eax
	cmpl	$128, %eax
	jne	.L42
	addl	%ebp, %esi
	addl	%ebp, %ebx
	addl	%ebp, %ecx
	subl	$1, %edi
	jne	.L45
	addl	$32, 4(%esp)
	movl	4(%esp), %eax
	subl	$-128, 8(%esp)
	cmpl	%eax, 40(%esp)
	jg	.L46
	addl	$32, (%esp)
	movl	16(%esp), %ecx
	movl	(%esp), %eax
	addl	%ecx, 12(%esp)
	cmpl	%eax, 40(%esp)
	jg	.L41
.L39:
	addl	$20, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE51:
	.size	hadamard2, .-hadamard2
	.p2align 4
	.globl	hadamard3
	.type	hadamard3, @function
hadamard3:
.LFB52:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$36, %esp
	.cfi_def_cfa_offset 56
	movl	56(%esp), %eax
	testl	%eax, %eax
	jle	.L49
	movl	56(%esp), %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	sall	$7, %eax
	movl	%eax, 32(%esp)
	movl	56(%esp), %eax
	sall	$2, %eax
	movl	%eax, 28(%esp)
	movl	56(%esp), %eax
	sall	$3, %eax
	movl	%eax, 4(%esp)
.L51:
	movl	24(%esp), %ebx
	movl	28(%esp), %eax
	movl	$0, 8(%esp)
	addl	%ebx, %eax
	movl	%ebx, 16(%esp)
	movl	%eax, 12(%esp)
	.p2align 4,,10
	.p2align 3
.L54:
	movl	16(%esp), %eax
	movl	60(%esp), %edi
	movl	$16, (%esp)
	movl	64(%esp), %esi
	movl	60(%esp), %ecx
	addl	%eax, %edi
	movl	64(%esp), %edx
	addl	%eax, %esi
	addl	68(%esp), %eax
	movl	%eax, %ebx
	movl	12(%esp), %eax
	addl	%eax, %ecx
	addl	%eax, %edx
	addl	68(%esp), %eax
	.p2align 4,,10
	.p2align 3
.L52:
	movl	(%edi), %ebp
	imull	(%esi), %ebp
	movl	%ebp, (%ebx)
	movl	4(%edi), %ebp
	imull	4(%esi), %ebp
	movl	%ebp, 4(%ebx)
	movl	8(%edi), %ebp
	imull	8(%esi), %ebp
	movl	%ebp, 8(%ebx)
	movl	12(%edi), %ebp
	imull	12(%esi), %ebp
	movl	%ebp, 12(%ebx)
	movl	16(%edi), %ebp
	imull	16(%esi), %ebp
	movl	%ebp, 16(%ebx)
	movl	20(%edi), %ebp
	imull	20(%esi), %ebp
	movl	%ebp, 20(%ebx)
	movl	24(%edi), %ebp
	imull	24(%esi), %ebp
	movl	%ebp, 24(%ebx)
	movl	28(%edi), %ebp
	imull	28(%esi), %ebp
	movl	%ebp, 28(%ebx)
	movl	32(%edi), %ebp
	imull	32(%esi), %ebp
	movl	%ebp, 32(%ebx)
	movl	36(%edi), %ebp
	imull	36(%esi), %ebp
	movl	%ebp, 36(%ebx)
	movl	40(%edi), %ebp
	imull	40(%esi), %ebp
	movl	%ebp, 40(%ebx)
	movl	44(%edi), %ebp
	imull	44(%esi), %ebp
	movl	%ebp, 44(%ebx)
	movl	48(%edi), %ebp
	imull	48(%esi), %ebp
	movl	%ebp, 48(%ebx)
	movl	52(%edi), %ebp
	imull	52(%esi), %ebp
	movl	%ebp, 52(%ebx)
	movl	56(%edi), %ebp
	imull	56(%esi), %ebp
	movl	%ebp, 56(%ebx)
	movl	60(%edi), %ebp
	imull	60(%esi), %ebp
	movl	%ebp, 60(%ebx)
	movl	64(%edi), %ebp
	imull	64(%esi), %ebp
	movl	%ebp, 64(%ebx)
	movl	68(%edi), %ebp
	imull	68(%esi), %ebp
	movl	%ebp, 68(%ebx)
	movl	72(%edi), %ebp
	imull	72(%esi), %ebp
	movl	%ebp, 72(%ebx)
	movl	76(%edi), %ebp
	imull	76(%esi), %ebp
	movl	%ebp, 76(%ebx)
	movl	80(%edi), %ebp
	imull	80(%esi), %ebp
	movl	%ebp, 80(%ebx)
	movl	84(%edi), %ebp
	imull	84(%esi), %ebp
	movl	%ebp, 84(%ebx)
	movl	88(%edi), %ebp
	imull	88(%esi), %ebp
	movl	%ebp, 88(%ebx)
	movl	92(%edi), %ebp
	imull	92(%esi), %ebp
	movl	%ebp, 92(%ebx)
	movl	96(%edi), %ebp
	imull	96(%esi), %ebp
	movl	%ebp, 96(%ebx)
	movl	100(%edi), %ebp
	imull	100(%esi), %ebp
	movl	%ebp, 100(%ebx)
	movl	104(%edi), %ebp
	imull	104(%esi), %ebp
	movl	%ebp, 104(%ebx)
	movl	108(%edi), %ebp
	imull	108(%esi), %ebp
	movl	%ebp, 108(%ebx)
	movl	112(%edi), %ebp
	imull	112(%esi), %ebp
	movl	%ebp, 112(%ebx)
	movl	116(%edi), %ebp
	imull	116(%esi), %ebp
	movl	%ebp, 116(%ebx)
	movl	120(%edi), %ebp
	imull	120(%esi), %ebp
	movl	%ebp, 120(%ebx)
	movl	124(%edi), %ebp
	imull	124(%esi), %ebp
	movl	%ebp, 124(%ebx)
	movl	(%ecx), %ebp
	imull	(%edx), %ebp
	movl	%ebp, (%eax)
	movl	4(%ecx), %ebp
	imull	4(%edx), %ebp
	movl	%ebp, 4(%eax)
	movl	8(%ecx), %ebp
	imull	8(%edx), %ebp
	movl	%ebp, 8(%eax)
	movl	12(%ecx), %ebp
	imull	12(%edx), %ebp
	movl	%ebp, 12(%eax)
	movl	16(%ecx), %ebp
	imull	16(%edx), %ebp
	movl	%ebp, 16(%eax)
	movl	20(%ecx), %ebp
	imull	20(%edx), %ebp
	movl	%ebp, 20(%eax)
	movl	24(%ecx), %ebp
	imull	24(%edx), %ebp
	movl	%ebp, 24(%eax)
	movl	28(%ecx), %ebp
	imull	28(%edx), %ebp
	movl	%ebp, 28(%eax)
	movl	32(%ecx), %ebp
	imull	32(%edx), %ebp
	movl	%ebp, 32(%eax)
	movl	36(%ecx), %ebp
	imull	36(%edx), %ebp
	movl	%ebp, 36(%eax)
	movl	40(%ecx), %ebp
	imull	40(%edx), %ebp
	movl	%ebp, 40(%eax)
	movl	44(%ecx), %ebp
	imull	44(%edx), %ebp
	movl	%ebp, 44(%eax)
	movl	48(%ecx), %ebp
	imull	48(%edx), %ebp
	movl	%ebp, 48(%eax)
	movl	52(%ecx), %ebp
	imull	52(%edx), %ebp
	movl	%ebp, 52(%eax)
	movl	56(%ecx), %ebp
	imull	56(%edx), %ebp
	movl	%ebp, 56(%eax)
	movl	60(%ecx), %ebp
	imull	60(%edx), %ebp
	movl	%ebp, 60(%eax)
	movl	64(%ecx), %ebp
	imull	64(%edx), %ebp
	movl	%ebp, 64(%eax)
	movl	68(%ecx), %ebp
	imull	68(%edx), %ebp
	movl	%ebp, 68(%eax)
	movl	72(%ecx), %ebp
	imull	72(%edx), %ebp
	movl	%ebp, 72(%eax)
	movl	76(%ecx), %ebp
	imull	76(%edx), %ebp
	movl	%ebp, 76(%eax)
	movl	80(%ecx), %ebp
	imull	80(%edx), %ebp
	movl	%ebp, 80(%eax)
	movl	84(%ecx), %ebp
	imull	84(%edx), %ebp
	movl	%ebp, 84(%eax)
	movl	88(%ecx), %ebp
	imull	88(%edx), %ebp
	movl	%ebp, 88(%eax)
	movl	92(%ecx), %ebp
	imull	92(%edx), %ebp
	movl	%ebp, 92(%eax)
	movl	96(%ecx), %ebp
	imull	96(%edx), %ebp
	movl	%ebp, 96(%eax)
	movl	100(%ecx), %ebp
	imull	100(%edx), %ebp
	movl	%ebp, 100(%eax)
	movl	104(%ecx), %ebp
	imull	104(%edx), %ebp
	movl	%ebp, 104(%eax)
	movl	108(%ecx), %ebp
	imull	108(%edx), %ebp
	movl	%ebp, 108(%eax)
	movl	112(%ecx), %ebp
	imull	112(%edx), %ebp
	movl	%ebp, 112(%eax)
	movl	116(%ecx), %ebp
	imull	116(%edx), %ebp
	movl	%ebp, 116(%eax)
	movl	120(%ecx), %ebp
	imull	120(%edx), %ebp
	movl	%ebp, 120(%eax)
	movl	124(%ecx), %ebp
	imull	124(%edx), %ebp
	movl	%ebp, 124(%eax)
	movl	4(%esp), %ebp
	addl	%ebp, %edi
	addl	%ebp, %esi
	addl	%ebp, %ebx
	addl	%ebp, %ecx
	addl	%ebp, %edx
	addl	%ebp, %eax
	subl	$1, (%esp)
	jne	.L52
	addl	$32, 8(%esp)
	movl	8(%esp), %eax
	subl	$-128, 16(%esp)
	subl	$-128, 12(%esp)
	cmpl	%eax, 56(%esp)
	jg	.L54
	addl	$32, 20(%esp)
	movl	32(%esp), %esi
	movl	20(%esp), %eax
	addl	%esi, 24(%esp)
	cmpl	%eax, 56(%esp)
	jg	.L51
.L49:
	addl	$36, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE52:
	.size	hadamard3, .-hadamard3
	.p2align 4
	.globl	register_hadamard_functions
	.type	register_hadamard_functions, @function
register_hadamard_functions:
.LFB54:
	.cfi_startproc
	endbr32
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	subl	$16, %esp
	.cfi_def_cfa_offset 24
	leal	naive_hadamard_descr@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	naive_hadamard@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_hadamard_function@PLT
	popl	%eax
	.cfi_def_cfa_offset 28
	leal	hadamard_descr@GOTOFF(%ebx), %eax
	popl	%edx
	.cfi_def_cfa_offset 24
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	hadamard@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_hadamard_function@PLT
	popl	%ecx
	.cfi_def_cfa_offset 28
	popl	%eax
	.cfi_def_cfa_offset 24
	leal	wo_ridx@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 28
	leal	unroll_wo_ridx@GOTOFF(%ebx), %eax
	pushl	%eax
	.cfi_def_cfa_offset 32
	call	add_hadamard_function@PLT
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE54:
	.size	register_hadamard_functions, .-register_hadamard_functions
	.globl	wo_ridx
	.data
	.align 32
	.type	wo_ridx, @object
	.size	wo_ridx, 71
wo_ridx:
	.string	"unroll_wo_ridx: basic unroll without ridx and direct pointer iteration"
	.globl	v3
	.align 32
	.type	v3, @object
	.size	v3, 38
v3:
	.string	"hadamard3: 32x32 with loop unrollings"
	.globl	v2
	.align 4
	.type	v2, @object
	.size	v2, 17
v2:
	.string	"hadamard2: 32x32"
	.globl	hadamard_descr
	.align 32
	.type	hadamard_descr, @object
	.size	hadamard_descr, 34
hadamard_descr:
	.string	"hadamard: Current working version"
	.globl	naive_hadamard_descr
	.align 32
	.type	naive_hadamard_descr, @object
	.size	naive_hadamard_descr, 78
naive_hadamard_descr:
	.string	"naive_hadamard The naive baseline version of hadamard product of two matrices"
	.globl	bokeh_formula_descr
	.align 32
	.type	bokeh_formula_descr, @object
	.size	bokeh_formula_descr, 51
bokeh_formula_descr:
	.string	"bokeh_formula: bokeh with formula directly applied"
	.globl	bokeh_descr
	.align 4
	.type	bokeh_descr, @object
	.size	bokeh_descr, 31
bokeh_descr:
	.string	"bokeh: Current working version"
	.globl	naive_bokeh_descr
	.align 32
	.type	naive_bokeh_descr, @object
	.size	naive_bokeh_descr, 46
naive_bokeh_descr:
	.string	"naive_bokeh: Naive baseline bokeh with filter"
	.globl	team
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Introvert"
.LC2:
	.string	"Ahmet Emre KILI\303\207"
.LC3:
	.string	"e2380616"
.LC4:
	.string	""
	.section	.data.rel.local,"aw"
	.align 4
	.type	team, @object
	.size	team, 28
team:
	.long	.LC1
	.long	.LC2
	.long	.LC3
	.long	.LC4
	.long	.LC4
	.long	.LC4
	.long	.LC4
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB58:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE58:
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
