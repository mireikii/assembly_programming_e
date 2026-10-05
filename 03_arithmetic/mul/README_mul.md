# assembly_programming_e
# Multiplication Operations

# Program 1: mul1.asm
The build that was tested is the 64-bit file. The MUL instruction uses 8-bit operands because it multiplies AL by a byte. The full product is stored in AX.

The calculation is 25 * 10 = 250.

The results of gdb after MUL are:
ax             0xfa                250
eflags         0x202               [ IF ]

The result of the flags includes:

The Carry Flag is cleared because the upper half of the product, AH, is zero. The Overflow Flag is also cleared because the upper half is zero. The Sign, Zero, Auxiliary, and Parity Flags are undefined after MUL, so their displayed values cannot be treated as set or cleared results of this instruction.

# Program 2: mul2.asm
The build that was tested is the 64-bit file. Due to the use of AX and a word-sized operand, the MUL operation uses 16-bit operands. The full product is stored in DX:AX.

The calculation is 3000 * 200 = 600000. The result is DX:AX = 0x0009:0x27C0. This equals 9 * 65536 + 10176 = 600000.

The results of gdb after MUL are:
ax             0x27c0              10176
dx             0x9                 9
eflags         0xa03               [ CF IF OF ]

The result of the flags includes:

The Carry Flag is set because the upper half of the product, DX, is not zero. The Overflow Flag is also set because the upper half is not zero. The Sign, Zero, Auxiliary, and Parity Flags are undefined after MUL, so their displayed values cannot be treated as set or cleared results of this instruction.

# Program 3: mul3.asm
The build that was tested is the 64-bit file. Due to the use of EAX and a dword-sized operand, the MUL operation uses 32-bit operands. The full product is stored in EDX:EAX.

The calculation is 100000 * 300000 = 30000000000. The result is EDX:EAX = 0x00000006:0xFC23AC00.

The results of gdb after MUL are:
eax            0xfc23ac00          -64771072
edx            0x6                 6
eflags         0xa03               [ CF IF OF ]

The EAX value is the lower half of the product. GDB displays its signed decimal interpretation as -64771072; the complete unsigned product is represented by EDX:EAX.

The result of the flags includes:

The Carry Flag is set because the upper half of the product, EDX, is not zero. The Overflow Flag is also set because the upper half is not zero. The Sign, Zero, Auxiliary, and Parity Flags are undefined after MUL, so their displayed values cannot be treated as set or cleared results of this instruction.
