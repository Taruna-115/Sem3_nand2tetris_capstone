// Box.asm -- K = 15
// Start row 15, height 20 rows, width 64 pixels
// Four 16-bit words per row
// First screen address = 16864

(LOOP)
    @KBD
    D=M
    @BLACK
    D;JNE

    @color
    M=0
    @DRAW
    0;JMP

(BLACK)
    @color
    M=-1

(DRAW)
    @16864
    D=A
    @addr
    M=D

    @20
    D=A
    @n
    M=D

(ROW)
    // First word
    @color
    D=M
    @addr
    A=M
    M=D

    // Second word
    @addr
    M=M+1
    @color
    D=M
    @addr
    A=M
    M=D

    // Third word
    @addr
    M=M+1
    @color
    D=M
    @addr
    A=M
    M=D

    // Fourth word
    @addr
    M=M+1
    @color
    D=M
    @addr
    A=M
    M=D

    // Move to next row: 3 + 29 = 32 words
    @29
    D=A
    @addr
    M=D+M

    // Decrease row counter
    @n
    MD=M-1
    @ROW
    D;JGT

    @LOOP
    0;JMP