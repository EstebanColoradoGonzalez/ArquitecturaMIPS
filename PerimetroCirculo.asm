.data

	text: .asciiz "Ingrese el radio: "
	result: .asciiz "El resultado es: "
	pi: .float 3.1415
	const: .float 2

.text
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	lwc1 $f2, pi
	lwc1 $f3, const
	mul.s $f4, $f2, $f3
	mul.s $f5, $f4, $f1
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall