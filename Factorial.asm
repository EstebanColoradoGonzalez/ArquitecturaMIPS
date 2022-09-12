.data

	text: .asciiz "Ingrese el numero: "
	result: .asciiz "El resultado es: "
	
.text

	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	la $t2, ($zero)
	li $t3, 1
	li $t4, 1
	
	beqz  $t1, aEsCero
	
	salir:
		bgt $t1, $t2, aEsMayorQueB
		
	
	resultado:
		li $v0, 4
		la $a0, result
		syscall
	
		li $v0, 1
		move $a0, $t3
		syscall
		j final
	
	aEsCero:
		li $t3, 1
		j resultado
	
	aEsMayorQueB:
		mul $t3, $t3, $t1
		sub $t1, $t1, $t4
		j salir
		
	final: