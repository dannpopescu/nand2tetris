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

// Put your code here.

@addr
M=0

@i
M=0

@8192
D=A
@len
M=D

@prevState
M=0

(LISTEN)
@KBD
D=M
@FILL
D;JGT

@CLEAR
D;JEQ

@LISTEN
0;JMP


(FILL)
@prevState
D=M
@LISTEN
D;JGT

@SCREEN
D=A
@addr
M=D

@i
M=0

@prevState
M=1

(FILL_LOOP)
@len
D=M
@i
D=D-M
@LISTEN
D;JEQ

@addr
A=M
M=-1

@addr
M=M+1

@i
M=M+1

@FILL_LOOP
0;JMP


(CLEAR)
@prevState
D=M
@LISTEN
D;JEQ

@SCREEN
D=A
@addr
M=D

@i
M=0

@prevState
M=0

(CLEAR_LOOP)
@len
D=M
@i
D=D-M
@LISTEN
D;JEQ

@addr
A=M
M=0

@addr
M=M+1

@i
M=M+1

@CLEAR_LOOP
0;JMP
