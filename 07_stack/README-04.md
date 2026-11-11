**04.asm**

04.asm demonstrates how functions manage local stack frames similar to 02.asm but written for a 32-bit architecture (`BITS 32`). It shows how the 32-bit stack pointer (`ESP`) and base pointer (`EBP`) move, and how smaller 4-byte slots are used for local variables instead of 8-byte slots.

## Code Explanation

1. **Calling the function (`call work`)**

* The program jumps to the `work` function, automatically pushing the 32-bit return address onto the stack.

2. **Creating variable space** 

* `push ebp`: Saves the caller's base pointer onto the stack.
* `mov ebp, esp`: Sets the current stack pointer `ESP` as our new base pointer anchor `EBP`.
* `sub esp, 8`: Allocates 8 bytes of space on the stack for local variables (two 4-byte slots, since 32-bit integers take 4 bytes each).

3. **Storing and reading local values** 

* `mov dword [ebp - 4], 100`: Stores the number `100` in the first 4-byte slot just below our base pointer.
* `mov dword [ebp - 8], 200`: Stores `200` in the second 4-byte slot right next to it.
* `mov eax, [ebp - 4]` and `mov ebx, [ebp - 8]`: Pulls those stored numbers from memory and loads them into registers `EAX` and `EBX`.

4. **Cleaning up and exiting** 

* `mov esp, ebp`: Resets the stack pointer back to where it started, wiping out our temporary local workspace.
* `pop ebp`: Restores the original base pointer of the caller function.
* `ret`: Returns execution back to `_start` using the saved return address.

5. **Program Termination**

* Finishes up by setting `EAX` to `1` (the 32-bit Linux exit syscall number) and clearing `EBX` to `0` (success exit status) before triggering the 32-bit software interrupt `int 0x80` to exit cleanly.

## Observations

* **32-Bit Register & Sizing Differences** : The 32-bit naming conventions (`EAX`,`EBX`,`ESP`,`EBP`) and variable slots are `dword` (4 bytes) instead of 8 bytes (`qword`).
* **Base Pointer Anchor (`EBP`)** : Using `EBP` as a fixed anchor makes it easy to find local variables using negative offsets (`-4` and `-8`) regardless of stack pointer changes.
* **Clean Exit** : Running the program results in a successful exit code of `0`.
