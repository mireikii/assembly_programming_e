
**03.asm**

03.asm demonstrates how control flow works when a program jumps to a subroutine (function) and back, and how the computer automatically handles the return address behind the scenes using the stack.

## Code Explanation

1. **Setting up the initial number (`mov rax, 10`)**

* The program starts by loading the number `10` into register `RAX`.

2. **Calling the subroutine (`call calculate`)**

* The program calls a function named `calculate`. Before jumping to it, the CPU automatically pushes the return address (the spot right after the call) onto the stack so it knows where to come back later.

3. **Doing the calculation (`add rax, 5`)**

* Inside the `calculate` function,`add rax, 5` adds `5` to the `10` currently stored in `RAX`, bringing the total to `15`.

4. **Returning from the subroutine (`ret`)**

* The `ret` instruction automatically pops the saved return address off the stack and jumps back to the main program right after the call.

5. **Program Termination**

* After returning, the program reaches `after_call` where `RAX` holds `15`, and then finishes up by setting `RAX` to `60` and clearing `RDI` to `0` before triggering the final `syscall` to exit cleanly.

## Observations

* **Automatic Return Address Handling** : Unlike manual `push` and `pop` commands, the `call` and `ret` instructions handle the stack implicitly behind the scenes to keep track of where to return.
* **Subroutine Flow** : Shows how data (`RAX`) can be operated on inside a separate function and returned smoothly to the main execution flow.
* **Clean Exit** : Running the program results in a successful exit code of `0`.
