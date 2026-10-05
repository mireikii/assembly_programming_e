# assembly_programming_e
# Subtraction Operations

# Program 1: sub1.asm
The build that was tested is the 64-bit file. Due to the use of AL, the subtraction is 8-bit.

The calculation is 50 - 80 = -30. As an unsigned 8-bit result, the stored value is 226, which is 0xE2. As a signed 8-bit result, 0xE2 represents -30.

The results of gdb after SUB are:
al             0xe2                -30
eflags         0x287               [ CF PF SF IF ]

The result of the flags includes:

The Carry Flag is set because the unsigned subtraction needs to borrow: 50 is less than 80.
The Overflow Flag is cleared because -30 fits within the signed 8-bit range.
The Zero Flag is cleared because the result is not zero.
The Sign Flag is set because the highest bit of 0xE2 is 1.
The Parity Flag is set because the low result byte 0xE2 has four set bits, an even number.
The Auxiliary Flag is cleared because the low nibble subtraction 0x2 - 0x0 needs no borrow.

# Program 2: sub2.asm
The build that was tested is the 64-bit file. Due to the use of AX, the subtraction is 16-bit.

The calculation is 1000 - 2000 = -1000. As an unsigned 16-bit result, the stored value is 64536, which is 0xFC18. As a signed 16-bit result, 0xFC18 represents -1000.

The results of gdb after SUB are:
ax             0xfc18              -1000
eflags         0x287               [ CF PF SF IF ]

The result of the flags includes:

The Carry Flag is set because the unsigned subtraction needs to borrow: 1000 is less than 2000.
The Overflow Flag is cleared because -1000 fits within the signed 16-bit range.
The Zero Flag is cleared because the result is not zero.
The Sign Flag is set because the highest bit of 0xFC18 is 1.
The Parity Flag is set because the low result byte 0x18 has two set bits, an even number.
The Auxiliary Flag is cleared because the low nibble subtraction 0x8 - 0x0 needs no borrow.

# Program 3: sub3.asm
The build that was tested is the 64-bit file. Due to the use of AX, the subtraction is 16-bit. This program performs both SUB and SBB, so the flags are recorded after each instruction.

After SUB, the calculation is 0x0000 - 0x0001 = 0xFFFF in AX.

The results of gdb after SUB are:
ax             0xffff              -1
eflags         0x297               [ CF PF AF SF IF ]

The result of the flags includes:

The Carry Flag is set because the unsigned subtraction needs to borrow: 0 is less than 1.
The Overflow Flag is cleared because the signed result -1 fits within the signed 16-bit range.
The Zero Flag is cleared because the result is not zero.
The Sign Flag is set because the highest bit of 0xFFFF is 1.
The Parity Flag is set because the low result byte 0xFF has eight set bits, an even number.
The Auxiliary Flag is set because the low nibble subtraction 0x0 - 0x1 needs a borrow.

After SUB, CF is 1. SBB subtracts both its second operand and the incoming carry, so the next calculation is 0xFFFF - 0 - 1 = 0xFFFE in AX.

The results of gdb after SBB are:
ax             0xfffe              -2
eflags         0x282               [ SF IF ]

The result of the flags includes:

The Carry Flag is cleared because 0xFFFF - 0 - 1 does not need an unsigned borrow.
The Overflow Flag is cleared because the signed result -2 fits within the signed 16-bit range.
The Zero Flag is cleared because the result is not zero.
The Sign Flag is set because the highest bit of 0xFFFE is 1.
The Parity Flag is cleared because the low result byte 0xFE has seven set bits, an odd number.
The Auxiliary Flag is cleared because the low nibble calculation 0xF - 0 - 1 produces 0xE without a borrow from bit 4.