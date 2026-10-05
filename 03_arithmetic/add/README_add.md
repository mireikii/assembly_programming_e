# assembly_programming_e
# Division Operations

# Program 1: div1.asm
The build that was tested is the 64-bit file. The instruction divides the unsigned value in AX by the 8-bit value in BL. The quotient is stored in AL and the remainder is stored in AH.

The calculation is 100 / 7 = 14 remainder 2, because 7 * 14 = 98 and 100 - 98 = 2.

The results of gdb after the DIV instruction are:
AL (quotient) = 14
AH (remainder) = 2

The arithmetic flags CF, OF, SF, ZF, PF, and AF are undefined after DIV. This means their values cannot reliably be described as set or cleared, even if GDB displays flag names.

# Program 2: div2.asm
The build that was tested is the 64-bit file. Due to the use of BX, the division is 16-bit. The unsigned dividend is stored in DX:AX, the divisor is in BX, the quotient is stored in AX, and the remainder is stored in DX.

The calculation is 50000 / 300 = 166 remainder 200, because 300 * 166 = 49800 and 50000 - 49800 = 200.

The results of gdb after the DIV instruction are:
AX (quotient) = 166
DX (remainder) = 200

The earlier value AX = 0xC350 is the dividend before DIV, not the quotient. As an unsigned 16-bit value, 0xC350 is 50000.

The arithmetic flags CF, OF, SF, ZF, PF, and AF are undefined after DIV. This means their values cannot  be described as set or cleared, even if GDB displays flag names.

# Program 3: div3.asm
The build that was tested is the 64-bit file. Due to the use of EBX, the division is 32-bit. The unsigned dividend is stored in EDX:EAX, the divisor is in EBX, the quotient is stored in EAX, and the remainder is stored in EDX.
The calculation is 300000000 / 1000 = 300000 remainder 0.

The results of gdb after the DIV instruction are:
EAX (quotient) = 300000
EDX (remainder) = 0

The arithmetic flags CF, OF, SF, ZF, PF, and AF are undefined after DIV, meaning their values cannot  be described as set or cleared, even if GDB displays flag names.