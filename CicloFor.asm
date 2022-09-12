.data

	result: .asciiz "El resultado es: "
	
.text

	li $t1, 1
	li $t2, 11
	li $t4, 1
	
	salir:
	blt $t1, $t2, aEsMenorQueB
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	j final
	
	aEsMenorQueB:
		add $t3, $t3, $t1
		add $t1, $t1, $t4
		j salir
	
	final:
	