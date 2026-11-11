
**06.asm**

06.asm is the 32-bit equivalent of 05.asm (`BITS 32`), using 32-bit registers (`EAX`,`EBX`) and 32-bit hexadecimal values (`0x11223344` and `0x1234`) with the `int 0x80` kernel interface.

## Code Explanation

1. **Storing 32-bit values in registers (`mov eax` and `mov rbx`)**

* The program starts by loading a 32-bit hexadecimal value into `EAX` and a smaller value into `EBX`.

2. **Adding values on the stack (`push eax` and `push ebx`)**

* `push eax` puts `0x11223344` onto the stack, shifting `ESP` downward by 4 bytes.
* `push ebx` puts `0x1234` on top of it, shifting `ESP` downward by another 4 bytes.

3. **Removing values from the stack (`pop ebx` and `pop eax`)**

* `pop ebx` takes the top value (`0x1234`) off the stack into `EBX`.
* `pop eax` takes the next value (`0x11223344`) off the stack into `EAX`, restoring `ESP` back to its starting position and swapping the register contents.

4. **Program Termination (`mov eax, 1`, `xor ebx, ebx`, `int 0x80`)**

* Tells the 32-bit operating system to stop the program cleanly using syscall number `1` and exit code `0`.

## Observations

* **32-Bit Register Sizing** : Unlike 05.asm which uses 8-byte chunks, 06.asm pushes and pops 4-byte chunks because it runs in 32-bit mode (`BITS 32`).
* **LIFO Reversal / Swapping** : Just like in 05.asm, popping in reverse order swaps the register values.
* **Clean Exit** : Running the program results in a successful exit code of `0`.
