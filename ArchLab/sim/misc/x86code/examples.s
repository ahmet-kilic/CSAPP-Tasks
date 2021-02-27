	.file	"examples.c"
	.text
	.p2align 4,,15
	.globl	_rev
	.def	_rev;	.scl	2;	.type	32;	.endef
_rev:
LFB0:
	.cfi_startproc
	movl	4(%esp), %eax
	testl	%eax, %eax
	je	L2
	xorl	%ecx, %ecx
	jmp	L3
	.p2align 4,,10
L4:
	movl	%edx, %eax
L3:
	movl	4(%eax), %edx
	movl	%ecx, 4(%eax)
	movl	%eax, %ecx
	testl	%edx, %edx
	jne	L4
L2:
	ret
	.cfi_endproc
LFE0:
	.p2align 4,,15
	.globl	_rrev
	.def	_rrev;	.scl	2;	.type	32;	.endef
_rrev:
LFB1:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	testl	%ebx, %ebx
	je	L11
	movl	4(%ebx), %edx
	movl	%ebx, %eax
	testl	%edx, %edx
	je	L9
	movl	%edx, (%esp)
	call	_rrev
	movl	4(%ebx), %edx
	movl	%ebx, 4(%edx)
	movl	$0, 4(%ebx)
L9:
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L11:
	.cfi_restore_state
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE1:
	.p2align 4,,15
	.globl	_move
	.def	_move;	.scl	2;	.type	32;	.endef
_move:
LFB2:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	movl	$1, %edi
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %edx
	movl	20(%esp), %ecx
	movl	24(%esp), %ebx
	cmpl	%ecx, %edx
	jle	L16
	leal	(%ecx,%ebx,4), %eax
	cmpl	%edx, %eax
	jg	L25
L16:
	sall	$2, %edi
	xorl	%eax, %eax
	testl	%ebx, %ebx
	jle	L15
	.p2align 4,,10
L17:
	movl	(%ecx), %esi
	addl	%edi, %ecx
	movl	%esi, (%edx)
	xorl	%esi, %eax
	addl	%edi, %edx
	subl	$1, %ebx
	jne	L17
L15:
	popl	%ebx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L25:
	.cfi_restore_state
	leal	-4(,%ebx,4), %eax
	movl	$-1, %edi
	addl	%eax, %edx
	addl	%eax, %ecx
	jmp	L16
	.cfi_endproc
LFE2:
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
