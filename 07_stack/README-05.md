
**05.asm**

05.asm is similar to 01.asm, but it uses larger 64-bit hexadecimal values (`0x1122334455667788` and `0x1234`) to demonstrate how data is organized and reversed when pushed and popped on an x86-64 stack.

## Code Explanation

1. **Storing large numbers in registers (`mov rax` and `mov rbx`)**

* The program starts by loading a large 64-bit hexadecimal value into `RAX` and a smaller value into `RBX.`

2. **Adding values to the stack (`push rax` and `push rbx`)**

* `push rax` puts the large `0x1122334455667788` onto the stack, moving the stack pointer (`RSP`) downward.
* `push rbx` puts `0x1234` right on top of it, moving `RSP` downward again.

3. **Removing values from the stack (`pop rbx` and `pop rax`)**

* `pop rbx` takes the item currently at the top of the stack (`0x1234`) and stores it into `RBX`. The stack pointer moves up.
* `pop rax` takes the next item (`0x1122334455667788`) and stores it into `RAX`. The stack pointer moves up, returning to its starting position.*(Notice that because of the reverse pop order, `RBX` and `RAX` swap their original values!)*

4. **Program Termination**

* The program finishes up by setting `RAX` to `60` and clearing `RDI` to `0` before triggering the final `syscall` to exit cleanly.

## Observations

* **Value Swapping via Stack** : Pushing two registers and popping them in reverse order (`pop rbx` then `pop rax`) swaps the values stored inside those registers.
* **Clean Exit** : Running the program results in a successful exit code of `0`.
