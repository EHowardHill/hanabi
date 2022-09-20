	.file	"lexer.c"
	.text
	.globl	vcd
	.bss
	.align 32
	.type	vcd, @object
	.size	vcd, 255
vcd:
	.zero	255
	.globl	vtd
	.align 32
	.type	vtd, @object
	.size	vtd, 255
vtd:
	.zero	255
	.globl	vsd
	.align 32
	.type	vsd, @object
	.size	vsd, 255
vsd:
	.zero	255
	.globl	ttk
	.section	.rodata
	.align 8
	.type	ttk, @object
	.size	ttk, 9
ttk:
	.string	" (){}+-="
	.globl	tk
.LC0:
	.string	"print"
.LC1:
	.string	"if"
.LC2:
	.string	"goto"
	.section	.data.rel.local,"aw",@progbits
	.align 16
	.type	tk, @object
	.size	tk, 24
tk:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.globl	p
	.section	.rodata
	.align 32
	.type	p, @object
	.size	p, 255
p:
	.string	"if (= x 1) goto yes"
	.zero	235
	.text
	.globl	ps
	.type	ps, @function
ps:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, %eax
	movb	%al, -12(%rbp)
	movq	-8(%rbp), %rax
	addq	$254, %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-12(%rbp), %eax
	movb	%al, (%rdx)
	movq	-8(%rbp), %rax
	addq	$254, %rax
	movzbl	(%rax), %edx
	addl	$1, %edx
	movb	%dl, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	ps, .-ps
	.section	.rodata
.LC3:
	.string	"%i, "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movb	$0, -19(%rbp)
	movb	$-1, -18(%rbp)
.L20:
	movb	$0, -17(%rbp)
	jmp	.L3
.L10:
	movzbl	-17(%rbp), %eax
	movslq	%eax, %rdx
	leaq	ttk(%rip), %rax
	movzbl	(%rdx,%rax), %ecx
	movzbl	-19(%rbp), %eax
	movslq	%eax, %rdx
	leaq	p(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	cmpb	%al, %cl
	jne	.L4
	movzbl	254+vcd(%rip), %eax
	testb	%al, %al
	je	.L5
	movb	$0, -16(%rbp)
	jmp	.L6
.L7:
	movzbl	-16(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vcd(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	vsd(%rip), %rdi
	call	ps
	movzbl	-16(%rbp), %eax
	addl	$1, %eax
	movb	%al, -16(%rbp)
.L6:
	movzbl	254+vcd(%rip), %eax
	cmpb	%al, -16(%rbp)
	jb	.L7
	movl	$10, %esi
	leaq	vsd(%rip), %rdi
	call	ps
	movl	$0, %esi
	leaq	vtd(%rip), %rdi
	call	ps
	movl	$0, -12(%rbp)
	jmp	.L8
.L9:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vcd(%rip), %rax
	movb	$0, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L8:
	cmpl	$254, -12(%rbp)
	jle	.L9
.L5:
	movzbl	-17(%rbp), %eax
	addl	$2, %eax
	movb	%al, -18(%rbp)
	movb	$8, -17(%rbp)
.L4:
	movzbl	-17(%rbp), %eax
	addl	$1, %eax
	movb	%al, -17(%rbp)
.L3:
	cmpb	$7, -17(%rbp)
	jbe	.L10
	movzbl	-19(%rbp), %eax
	movslq	%eax, %rdx
	leaq	p(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	vcd(%rip), %rdi
	call	ps
	movb	$0, -15(%rbp)
	jmp	.L11
.L15:
	movl	$0, -8(%rbp)
	jmp	.L12
.L14:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vcd(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %edx
	movzbl	-15(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	tk(%rip), %rax
	movq	(%rcx,%rax), %rcx
	movl	-8(%rbp), %eax
	cltq
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	%eax, %edx
	jne	.L13
	movzbl	-15(%rbp), %eax
	addl	$10, %eax
	movb	%al, -18(%rbp)
	movb	$2, -15(%rbp)
	movzbl	254+vcd(%rip), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
.L13:
	addl	$1, -8(%rbp)
.L12:
	movzbl	254+vcd(%rip), %eax
	movzbl	%al, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L14
	movzbl	-15(%rbp), %eax
	addl	$1, %eax
	movb	%al, -15(%rbp)
.L11:
	cmpb	$1, -15(%rbp)
	jbe	.L15
	cmpb	$-1, -18(%rbp)
	je	.L16
	movzbl	-18(%rbp), %eax
	movl	%eax, %esi
	leaq	vtd(%rip), %rdi
	call	ps
	movl	$0, -4(%rbp)
	jmp	.L17
.L18:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vcd(%rip), %rax
	movb	$0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L17:
	cmpl	$254, -4(%rbp)
	jle	.L18
	movb	$-1, -18(%rbp)
.L16:
	movzbl	-19(%rbp), %eax
	addl	$1, %eax
	movb	%al, -19(%rbp)
	cmpb	$-1, -19(%rbp)
	je	.L19
	movzbl	-19(%rbp), %eax
	movslq	%eax, %rdx
	leaq	p(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	testb	%al, %al
	jg	.L20
.L19:
	movb	$0, -14(%rbp)
	jmp	.L21
.L22:
	movzbl	-14(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vcd(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	vsd(%rip), %rdi
	call	ps
	movzbl	-14(%rbp), %eax
	addl	$1, %eax
	movb	%al, -14(%rbp)
.L21:
	movzbl	254+vcd(%rip), %eax
	cmpb	%al, -14(%rbp)
	jb	.L22
	movb	$0, -13(%rbp)
	jmp	.L23
.L24:
	movzbl	-13(%rbp), %eax
	movslq	%eax, %rdx
	leaq	vtd(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	movzbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movzbl	-13(%rbp), %eax
	addl	$1, %eax
	movb	%al, -13(%rbp)
.L23:
	movzbl	32+vtd(%rip), %eax
	cmpb	%al, -13(%rbp)
	jb	.L24
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
