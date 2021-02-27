	.file	"examples.c"
	.text
	.globl	_rev
	.def	_rev;	.scl	2;	.type	32;	.endef
_rev:
LFB0:
	.cfi_startproc
	movl	4(%esp), %edx
	movl	$0, %eax
L2:
	testl	%edx, %edx
	je	L4
	movl	4(%edx), %ecx
	movl	%eax, 4(%edx)
	movl	%edx, %eax
	movl	%ecx, %edx
	jmp	L2
L4:
	ret
	.cfi_endproc
LFE0:
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
	je	L7
	movl	4(%ebx), %eax
	testl	%eax, %eax
	je	L8
	movl	%eax, (%esp)
	call	_rrev
	movl	4(%ebx), %edx
	movl	%ebx, 4(%edx)
	movl	$0, 4(%ebx)
L5:
	addl	$24, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
L7:
	.cfi_restore_state
	movl	%ebx, %eax
	jmp	L5
L8:
	movl	%ebx, %eax
	jmp	L5
	.cfi_endproc
LFE1:
	.globl	_move
	.def	_move;	.scl	2;	.type	32;	.endef
_move:
LFB2:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
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
	jle	L14
	leal	(%ecx,%ebx,4), %eax
	cmpl	%edx, %eax
	jle	L15
	leal	-4(,%ebx,4), %eax
	addl	%eax, %edx
	addl	%eax, %ecx
	movl	$-1, %edi
	jmp	L11
L14:
	movl	$1, %edi
L11:
	movl	$0, %eax
L12:
	testl	%ebx, %ebx
	jle	L17
	movl	(%ecx), %esi
	xorl	%esi, %eax
	movl	%esi, (%edx)
	leal	0(,%edi,4), %esi
	addl	%esi, %edx
	addl	%esi, %ecx
	subl	$1, %ebx
	jmp	L12
L15:
	movl	$1, %edi
	jmp	L11
L17:
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE2:
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
