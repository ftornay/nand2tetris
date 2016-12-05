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
// R0 will contain a pointer to the next pixels
//It's initialized to point to screen minus 1
@SCREEN
D=A-1
@R0
M=D
// Start of the infinite loop
(START)
// Update pointer to next pixel word
@R0
M=M+1
D=M
// Check we haven't gone through the screen memory
// by comparing next address with the kbd address
//      (which is just past the screen memory area)
@KBD
D=A-D
@CHECKKBD
// If we haven't reached the end of the screen, proceed
D;JGT
// Otherwise, reset screen pointer
@SCREEN
D=A
@R0
M=D
// Check keyboard
(CHECKKBD)
//R1 will contain the value we'll write to the screen, initialize to 0
@R1
M=0
@KBD
D=M
@DRAW
// If no key's pressed, proceed with a 0 value in R1 (paint screen white)
D;JEQ
// Otherwise, write -1 to screen (will paint every pixel black)
D=0
D=D-1
@R1
M=D
// Now, we're ready to draw
// R0 contains pointer to next pixel word
// R1 contains value to write to it
(DRAW)
@R1
D=M
@R0
A=M
M=D
// Loop back for the next pixel word
@START
0;JMP
