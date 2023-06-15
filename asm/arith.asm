. arith is a program for showing arithmetic operations that SIC supports

arith	START	0    . start at address 0

. addition
		LDA		x    . A <- x
		ADD		y    . A <- A + y
		STA		sum  . sum <- A

. subtraction
		LDA		x    . A <- x
		SUB		y    . A <- A - y
		STA		diff . diff <- A

. multiplication
		LDA		x    . A <- x
		MUL		y    . A <- A * y
		STA		prod . prod <- A

. quotient
		LDA		x    . A <- x
		DIV		y    . A <- A / y
		STA		quot . quot <- A

. modulo
loop	LDA		x    . A <- x
		COMP	y    . CC <- A - y (compare A to y)
		JGT		raz  . if CC > 0 (A > y) then goto raz
		STA		mod  . mod <- A
		J		halt . goto halt

raz		SUB		y    . A <- A - y
		STA		x    . x <- A
		J		loop . goto loop

halt	J		halt . infinite loop (simulators treat this as end of program)

. data (variables)
x		WORD	10 . x = 10
y		WORD	3  . y = 3

. reserved memory (1 word == 3 bytes)
sum		RESW	1
diff	RESW	1
prod	RESW	1
quot	RESW	1
mod		RESW	1
