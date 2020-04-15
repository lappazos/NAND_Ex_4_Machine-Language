// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Divide.asm

// Divides R13 by R14 and stores the result in R15 - no remainder.
// (R13, R14, R15 refer to RAM[13], RAM[14], and RAM[15], respectively.)
@R15//initialize the resut
M=0
(CHECK_RESULT_ZERO)
	@R14
	D=M
	@R13
	D=M-D// IF R13 < R14 result is 0
	@END
	D;JLT
@R15
M=1
(SHIFT_LEFT_LOOP) // exp increase
	@R14 // double the divider
	D=M<<
	@BRIDGE//check negetive - larger than 2^8 - break loop if so
	D;JLT
	@R13
	D=M-D //check if the doubled divider is bigger then the devided
	@BRIDGE //break loop if so
	D;JLT
	@R14 // update memory accordingly
	M=M<<
	@R15
	M=M<< //update the result accordingly
	@SHIFT_LEFT_LOOP
	0;JMP
(BRIDGE)
@R15
D=M	
@Mult_Counter // keep a seperate counter of the devider mult factor
M=D
@R14
D=M
@Temp_Mult  // keep a temp sum of the different multiplied dividers
M=D
(DECREASE) // exp decrease - return to multipications we already vidited, and try to add them to the temp sum 
	@R14
	D=M
	@R13
	D=M-D // check if the current multiplied divider is equal to the divided
	@END// finish if so
	D;JEQ
	@Mult_Counter // check if the multiplied divider equals to the original divider
	D=M-1
	@END // finish if so, because you cant decrease no more, you have finished
	D;JEQ
	@Mult_Counter // decrease the temp sum and the mult counter
	M=M>>
	@Temp_Mult
	M=M>>
	@R14
	D=M
	@R13
	D=M-D
	@Temp_Mult
	D=D-M
	@DECREASE // continue do divide if possible, if not, update the resut accordingy with the current addition
	D;JLT
(UPDATE_RESULT) // update the result after every decrease loop
	@Mult_Counter
	D=M
	@R15
	M=M+D
	@Temp_Mult
	D=M
	@R14
	M=M+D
	@DECREASE
	0;JMP	
(END)