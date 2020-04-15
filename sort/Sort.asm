// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Sort.asm

// sort the array starting at the address in R14 with length as specified in R15.
// The sort is in descending order - the largest number at the head of the array

@Is_Swaped // flag for the last loop to be identified before end of tick toks if possible
M=1
(RESET)
	@Is_Swaped
	D=M
	D=D-1
	@END // check is_swaped
	D;JLT
	@Is_Swaped
	M=0
	@Temp_Val_1
	M=0
	@R14
	D=M
	@Temp_A
	M=D
	@i // index counter
	M=1
(MAINLOOP)
	@i
	D=M
	@R15
	D=M-D
	@RESET // check if we have reached to the last index - if so, start again from the begining
	D;JEQ
	@Temp_A
	A=M
	D=M
	A=A+1
	D=D-M // check if swap needed
	@Temp_A // move the index forward by 1
	M=M+1
	@i // move the index forward by 1
	M=M+1
	@SWAP // check if swap is needed
	D;JLT
	@MAINLOOP
	0;JMP
(SWAP)
	@Is_Swaped
	M=1
	@Temp_A
	A=M // go to cell 1
	D=M // fetch value 1
	@Temp_Val_1
	M=D // keep value of cell 1
	@Temp_A
	A=M
	A=A-1 // go to cell 0
	D=M // keep value 0
	A=A+1 // go to cell 1
	M=D // update val of cell 0 in cell 1
	@Temp_Val_1
	D=M // fetch value 1
	@Temp_A
	A=M
	A=A-1 // go to cell 0
	M=D // update val 1 in cell 0
	@MAINLOOP
	0;JMP
(END)