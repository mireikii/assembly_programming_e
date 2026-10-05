# assembly_programming_e
# Addition Operations

# Program 1: add1.asm
The build that was tested is the 64-bit file. The instruction was to add two numbers, that is 0X78 + 0x0A. The result is AL = 0x82, 130 unsigned, -126 signed.
The results of gdb that shows which flags are set are:
al             0x82                -126
eflags         0xa96               [ PF AF SF IF OF ]

The result of the flags include:

ADD adds the 8-bit values 0x78 and 0x0A to produce 0x82. The unsigned value is 130 (128+2) and -126 is the signed value.
Sign Flag is set because because the result's highest bit is 1.
Carry Flag is cleared as there is no carry out of the 8 bits.
Overflow Flag is set since the signed sum is larger than the maximum signed 8-bit value.
Zero Flag is cleared because the result is not zero.
Parity Flag is set because there are two even 1-bits.
Auxiliary Flag is set because there is a carry from bit 3 to bit 4.

# Program 2: add2.asm
The build that was tested is the 64-bit file. The instruction was to add two numbers, that is 32000+ 500.
The results of gdb that shows which flags are set are:
ax             0x7ef4              32500
eflags         0x202               [ IF ]


Due to use of AX, the operation is 16-bit.

The result of the flags include:

The Carry Flag is cleared because there was no carry out, Overflow Flag was cleared as the number was within the range, Zero Flag is cleared as the result is not zero, Sign Flag is cleared as the 15th bit is 0, Parity Flag is cleared due to five 1-bits and there is no carry between the highest lower bit and lowest upper bit.

# Program 3: add3.asm
The build that was tested is the 64-bit file. The instruction was to add 0xFFFF and 0x0001, that is in decimal, 65535 + 1. In binary it would be 1111 1111 1111 1111 + 0000 0000 0000 0001 resulting in 1 0000 0000 0000 0001, which is 0x10000.

The results of gdb that shows which flags are set are:
ax             0x0                 0
eflags         0x257               [ CF PF AF ZF IF ]

The result of the flags include:

Carry Flag is set as there is an a carry at the highest bit resulting in a 17-bit result.
Overflow flag is cleared as the result fits within the range of 16-bits.
Zero Flag is set because the result is zero.
Sign Flag is cleared as the result's highest bit is 0.
Parity Flag is set as the number of 0-bits are even.
Auxiliary Flag is set as there is a carry from the 3rd bit to the 4th bit.