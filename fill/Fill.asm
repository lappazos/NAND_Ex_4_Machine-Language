// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@SCR//main
0;JMP

(SCR)//set the screen adress
	@SCREEN
	D=A
	@addr
	M=D
	@KEYBOARD
	0;JMP

(KEYBOARD)//check keyboard status
	@KBD
	D=M
	@FILL
	D;JNE
	@EMPTY
	D;JEQ

(FILL)
	@addr//fetch the current screen adress
	A=M
	M=-1//set 16 pixels to black
	@addr
	M=M+1//move forward 16 pixels ahead
	//check if reach the end of screen
	@KBD
	D=A
	@addr
	D=D-M
	@FILL
	D;JGT
	@SCR
	0;JMP
	
(EMPTY)
	@addr//fetch the current screen adress
	A=M
	M=0//set 16 pixels to white
	@addr
	M=M+1//move forward 16 pixels ahead
	//check if reach the end of screen
	@KBD
	D=A
	@addr
	D=D-M
	@EMPTY
	D;JGT
	@SCR
	0;JMP