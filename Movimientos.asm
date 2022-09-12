# Script desarrollado por Esteban Colorado González y Juan Diego Valencia Sanchez

.data
	menu: .asciiz "1. Movimiento Rectilineo Uniformemente Acelerado\n2. Caida Libre\n3. Movimiento Circular Uniformemente Acelerado\n\n"
	opcion: .asciiz "Seleccione una opcion: "
	enunciado: .asciiz "Las aspas de un molino de viento están quietas debido a que no hay viento, pero depronto viene un viento el cual las comienza a mover, si la aceleracion aplicada a las aspas es  de 0.05 rad/s ¿Cuanto tiempo se tardó en llegar a una velocidad final determinada?\n\n"
	textoInput: .asciiz "Ingrese la velocidad final en rad/s:  "
	resultadoMCUA: .asciiz "El tiempo que tardo fue de: "
	velocidadAngularInicial: .float 0.0
	aceleracionAngular: .float 0.05
	opcionSalir: .asciiz "\n\nPresioné 0 para continuar..."
	textRUNO: .asciiz "Un tren de alta velocidad se encuntra en reposo comienza su trayecto en línea recta con una aceleración \nDigite la aceleracion del tren (en metros sobre segundos al cuadrado): \n "
    	textRUDos: .asciiz "se desea calcular la velocidad (en metros por segundos) que alcanza el tren\nDigite a los cuantos segundo desea calcular la velocidad del tren: \n "
    	textRUTres: .asciiz " m/s"
    	textRUResulado: .asciiz "El tren tiene una velocidad de "

    	textCIUno: .asciiz "Una manzana cae de un arbol y llega al suelo\nDigite cuantos segundos se demora en caer la manzana: \n"
    	textCIDos: .asciiz "La manzana cae a una velocidad de "
    	textCITres: .asciiz "m/s"
    	numero: .float 2
    	g: .float 9.81
	
.text
	j main
	
	main: 
		li $v0, 4
		la $a0, menu
		syscall
		
		li $v0, 4
		la $a0, opcion
		syscall
	
		li $v0, 5
		syscall
		move $t1, $v0
		
		beq $t1, 1, movimientoRectilineoUniformementeAcelerado
		beq $t1, 2, caidaLibre
		beq $t1, 3, movimientoCircularUniformementeAcelerado
	
	movimientoRectilineoUniformementeAcelerado:
		li $v0, 4
    		la $a0, textRUNO
    		syscall

    		li $v0,6
    		syscall
    		mov.s $f1, $f0

    		li $v0, 4
    		la $a0, textRUDos
    		syscall

    		li $v0,6
    		syscall

    		mov.s $f2, $f0
    		mul.s $f3,$f1,$f2

    		li $v0, 4
    		la $a0, textRUResulado
    		syscall

    		li $v0, 2
    		mov.s $f12,$f3
    		syscall

    		li $v0, 4
    		la $a0, textRUTres
    		syscall
		
		j menuSalir
	
	caidaLibre:
		lwc1 $f5,g
    		lwc1 $f6,numero

    		li $v0, 4
    		la $a0, textCIUno
    		syscall

    		li $v0,6
    		syscall
    		mov.s $f1, $f0

    		mul.s $f2,$f1,$f1
    		mul.s $f3,$f2,$f5
    		div.s $f4,$f3,$f6

    		li $v0, 4
    		la $a0, textCIDos
    		syscall

    		li $v0, 2
   	 	mov.s $f12,$f4
    		syscall

    		li $v0, 4
    		la $a0, textCITres
    		syscall
		
		j menuSalir
	
	movimientoCircularUniformementeAcelerado:
		li $v0, 4
		la $a0, enunciado
		syscall
		
		li $v0, 4
		la $a0, textoInput
		syscall
		
		li $v0, 6
		syscall
		mov.s $f1, $f0
		
		lwc1 $f2, velocidadAngularInicial
		lwc1 $f3, aceleracionAngular
		
		sub.s $f4, $f1, $f2
		div.s $f5, $f4, $f3
		
		li $v0, 4
		la $a0, resultadoMCUA
		syscall
		
		li $v0, 2
		mov.s $f12, $f5
		syscall
		
		j menuSalir
	
	menuSalir:
		seguir:
		li $v0, 4
		la $a0, opcionSalir
		syscall
		
		li $v0, 5
		syscall
		move $t2, $v0
		
		beqz $t2, main
		j seguir