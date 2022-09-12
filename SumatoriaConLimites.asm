.data
	limiteInferior: .asciiz "Ingrese el limite Inferior: "
	limiteSuperior: .asciiz "Ingrese el limite Superior: "
	result: .asciiz "El resultado es: "
	
.text
	
	li $v0, 4
	la $a0, limiteInferior
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, limiteSuperior
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	li $t4, 1
	
	salir:
	ble $t1, $t2, aEsMenorOIgualQueB
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t3
	syscall
	j final
	
	aEsMenorOIgualQueB:
		add $t3, $t3, $t1
		add $t1, $t1, $t4
		j salir
	
	final:
	
