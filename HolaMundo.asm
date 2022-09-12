.data

	text: .asciiz "Hola "
	name: .asciiz "Esteban"

.text

	li $v0, 4
	la $a0, text
	syscall
	li $v0, 4
	la $a0, name
	syscall

	