
**01.asm : Push and Pop Operations**

01.asm is a program that demonstrates how a computer's stack works using basic push and pop instructions. It shows how values are temporarily stored in memory and retrieved in reverse order (Last-In, First-Out), while tracking how the stack pointer moves up and down.

Code explanation:

1. Storing numbers in memory registers (mov rax, 100 and mov rbx, 200):
   The program starts by loading the number 100 into a register named RAX, and 200 into a register named RBX.
2. Adding values on the stack (push rax and push rbx):
   First, push rax adds the stored 100 onto the stack. When this happens, the stack pointer (RSP) moves downward in memory to make room. Next, push rbx takes 200 and puts it on top of the stack. The stack pointer moves downward again. 200 was added last and now sits on top of the stack.
3. Removing values from the stack (pop rcx and pop rdx):
   pop rcx takes the item currently at the top of the stack (200) and stores it into a new register RCX. The stack pointer moves up and pop rdx takes the next item (100) and stores it into RDX. The stack pointer moves up again, returning to its starting position.
4. Exiting the program (mov rax, 60, xor rdi, rdi, syscall):
   This final section tells the operating system to stop the program cleanly. RAX is set to 60 (the code for "exit"), and RDI is cleared to 0, meaning "success/no errors", before triggering the final syscall.

Observations

- Last-In, First-Out (LIFO): Because 200 was pushed onto the stack last, it had to be popped off first (into RCX) before we could get to 100.
- Stack Direction: Every time you push something, the stack memory grows downward (toward lower memory addresses). Every time you pop, it shrinks upward.
- Clean exit: Running the program and checking its exit status results in a clean exit code of 0.
