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

