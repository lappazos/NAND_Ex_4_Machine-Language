// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
@R2//initialize the resut
M=0
(LOOP)//multipication loop
	@R1//check if the mult_factor R1 is zero
	D=M
	@END
	D;JEQ	
	@R1//decrease the mult factor by 1
	M=D-1
	@R0//fetching R0 - the multiplied object 
	D=M
	@R2//adding to the result the multiplied object
	M=M+D
	@LOOP//loop
	0;JMP
(END)