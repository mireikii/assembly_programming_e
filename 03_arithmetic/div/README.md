# assembly_programming_e
# Division Operations
# Division Operations

## Program 1: div1.asm

The tested executable is the 64-bit build, but `div bl` performs an 8-bit division. The dividend is in AX; the quotient goes into AL and the remainder into AH.

Calculation: 100 / 7 = 14 remainder 2, because 7 * 14 = 98 and 100 - 98 = 2.

After DIV, GDB should show AL = 14 (0x0E) and AH = 2 (0x02).

The arithmetic flags CF, OF, SF, ZF, AF, and PF are undefined after DIV. Therefore, their displayed values in GDB cannot be treated as set or cleared results of this instruction.

## Program 2: div2.asm

The tested executable is the 64-bit build, but `div bx` performs a 16-bit division. The 32-bit dividend is DX:AX; the quotient goes into AX and the remainder into DX.

Calculation: 50000 / 300 = 166 remainder 200, because 300 * 166 = 49800 and 50000 - 49800 = 200.

After DIV, GDB should show AX = 166 and DX = 200. The earlier AX value of 0xC350 is the loaded dividend before DIV, not the quotient. It represents 50000 as an unsigned 16-bit value.

The arithmetic flags CF, OF, SF, ZF, AF, and PF are undefined after DIV. Therefore, their displayed values in GDB cannot be treated as set or cleared results of this instruction.

## Program 3: div3.asm

The tested executable is the 64-bit build, but `div ebx` performs a 32-bit division. The 64-bit dividend is EDX:EAX; the quotient goes into EAX and the remainder into EDX.

Calculation: 300000000 / 1000 = 300000 remainder 0.

After DIV, GDB should show EAX = 300000 and EDX = 0. The earlier EAX value of 300000000 is the loaded dividend before DIV, not the quotient.

The arithmetic flags CF, OF, SF, ZF, AF, and PF are undefined after DIV. Therefore, their displayed values in GDB cannot be treated as set or cleared results of this instruction.