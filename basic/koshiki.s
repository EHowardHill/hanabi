	.file	"koshiki.c"
	.text
	.globl	arrayInit
	.type	arrayInit, @function
arrayInit:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	leaq	0(,%rsi,4), %rdi
	pushq	%rax
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movq	%rbp, 16(%rbx)
	movq	%rax, (%rbx)
	movq	$0, 8(%rbx)
	popq	%rdx
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE35:
	.size	arrayInit, .-arrayInit
	.globl	arrayInsert
	.type	arrayInsert, @function
arrayInsert:
.LFB36:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	pushq	%rdx
	.cfi_def_cfa_offset 32
	movq	16(%rdi), %rsi
	cmpq	%rsi, 8(%rdi)
	jne	.L4
	leaq	(%rsi,%rsi), %rax
	movq	(%rdi), %rdi
	salq	$3, %rsi
	movq	%rax, 16(%rbx)
	call	realloc@PLT
	movq	%rax, (%rbx)
.L4:
	movq	8(%rbx), %rax
	movq	(%rbx), %rdx
	leaq	1(%rax), %rcx
	movq	%rcx, 8(%rbx)
	movl	%ebp, (%rdx,%rax,4)
	popq	%rax
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	arrayInsert, .-arrayInsert
	.globl	arrayFree
	.type	arrayFree, @function
arrayFree:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	call	free@PLT
	movq	$0, (%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 8(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	arrayFree, .-arrayFree
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"#include <stdio.h>\n\nint main() {"
.LC1:
	.string	"nook"
.LC2:
	.string	"cranny"
.LC3:
	.string	"skip"
.LC4:
	.string	"skipback"
.LC5:
	.string	"spot"
.LC6:
	.string	"print"
.LC7:
	.string	"input"
.LC8:
	.string	";"
.LC9:
	.string	"+"
.LC10:
	.string	"-"
.LC11:
	.string	"="
.LC12:
	.string	"("
.LC13:
	.string	")"
.LC14:
	.string	"\""
.LC15:
	.string	"# %i %i\n"
.LC16:
	.string	"%64s"
.LC17:
	.string	"Commands:"
.LC18:
	.string	"%i\n"
.LC19:
	.string	"Code:"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r14
	leaq	48(%rsp), %rbp
	leaq	72(%rsp), %rbx
	movq	%r14, %rdi
	call	arrayInit
	leaq	24(%rsp), %rdi
	movl	$1, %esi
	call	arrayInit
	movl	$1, %esi
	movq	%rbp, %rdi
	call	arrayInit
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L10:
	xorl	%eax, %eax
	movq	%rbx, %rsi
	leaq	.LC16(%rip), %rdi
	call	__isoc99_scanf@PLT
	testl	%eax, %eax
	js	.L39
	leaq	.LC1(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$1, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	movl	$2, %esi
.L38:
	movq	%rbp, %rdi
	call	arrayInsert
	jmp	.L10
.L13:
	leaq	.LC3(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$3, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$4, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC5(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$5, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC6(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$6, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC7(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$7, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC8(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$8, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC9(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$9, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC10(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$10, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC11(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$11, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC12(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$12, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC13(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$13, %esi
	testl	%eax, %eax
	je	.L38
	leaq	.LC14(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	movl	$14, %esi
	testl	%eax, %eax
	je	.L38
	movq	56(%rsp), %rdx
	movslq	%edx, %rax
	cmpq	%rax, %rdx
	jne	.L10
	movq	%rdx, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	movl	$1, %r13d
	leaq	.LC15(%rip), %rsi
	leaq	71(%rsp), %r15
	call	__printf_chk@PLT
.L27:
	movsbl	(%r15,%r13), %esi
	movq	%r14, %rdi
	movl	%r13d, %r12d
	incq	%r13
	call	arrayInsert
	cmpb	$0, (%r15,%r13)
	jne	.L27
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	arrayInsert
	xorl	%esi, %esi
	movq	%rbp, %rdi
	call	arrayInsert
	movslq	%r12d, %rax
.L28:
	movb	$0, (%rbx,%rax)
	decq	%rax
	testl	%eax, %eax
	jne	.L28
	jmp	.L10
.L39:
	leaq	.LC17(%rip), %rdi
	xorl	%ebx, %ebx
	leaq	.LC18(%rip), %rbp
	call	puts@PLT
.L30:
	cmpq	%rbx, 64(%rsp)
	jbe	.L40
	movq	48(%rsp), %rax
	movq	%rbp, %rsi
	movl	$1, %edi
	movl	(%rax,%rbx,4), %edx
	xorl	%eax, %eax
	incq	%rbx
	call	__printf_chk@PLT
	jmp	.L30
.L40:
	leaq	.LC19(%rip), %rdi
	xorl	%ebx, %ebx
	call	puts@PLT
.L32:
	movq	(%rsp), %rax
	movl	(%rax,%rbx,4), %edi
	incq	%rbx
	call	putchar@PLT
	cmpq	%rbx, 16(%rsp)
	ja	.L32
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
