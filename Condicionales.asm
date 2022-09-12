.data

	text: .asciiz "Ingrese un valor entero: "
	text01: .asciiz "A = B \n"
	text02: .asciiz "A > B \n"
	text03: .asciiz "A < B \n"

.text

	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	beq $t1, $t2, sonIguales
	bgt $t1, $t2, aEsMayorQueB
	blt $t1, $t2, aEsMenorQueB
	
	sonIguales:
		li $v0, 4
		la $a0, text01
		syscall
		j salir
	
	aEsMayorQueB:
		li $v0, 4
		la $a0, text02
		syscall
		j salir
		
	aEsMenorQueB:
		li $v0, 4
		la $a0, text03
		syscall
		j salir
	
	salir: