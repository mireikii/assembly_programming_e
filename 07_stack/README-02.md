
**02.asm**

02.asm demonstrates how functions manage their own temporary memory space, a stack frame, when they run. It shows how a function creates space for local variables, uses a base pointer anchor to find them, and cleans itself after before returning control to the main program.

## Code Explanation

1. ***Calling the function***

* The program calls a function named "work ". The CPU automatically saves where it came from by pushing the return address onto the stack before running the function.

1. Creating variable space :

**push rbp** Saves the previous function's base pointer

**move rbp, rsp** sets the current stack pointer rsp as our new base pointer anchor rbp as a fixed reference point

**sub rsp 16** creates16 bytes of space on the stack to hold local variables for two 8-byte slots.

2. **Storing and reading local values**:

* `mov qword [rbp - 8], 10`: Stores the number `100` in the first 8-byte slot just below our base pointer.
* `mov qword [rbp - 16], 200`: Stores `200` in the second 8-byte slot right next to it.
* `mov rax, [rbp - 8]` and `mov rbx, [rbp - 16]`: Pulls the stored numbers from memory and loads them into registers `RAX` and `RBX`.

3. **Cleaning up and exiting**:

* `mov rsp, rbp`: Resets the stack pointer back to where it started, and removes the temporary memory space.
* `pop rbp`: Restores the original base pointer of the caller function.
* `ret`: Returns execution back to `_start` using the saved return address.

4. **Program Termination** :

* The main program finishes up by setting `RAX` to `60` and clearing `RDI` to `0` before triggering the final `syscall` to exit .

## Observations

* **Base Pointer Anchor (`RBP`)** : Using `RBP` as a fixed anchor makes it easy to find local variables using offsets (like `-8` and `-16`) despite what the stack pointer does.
* **Stack Restoration** : The function ensures that each byte of stack space borrowed is returned after function execution.
* **Clean Exit** : Running the program results in a successful exit code of `0`.
