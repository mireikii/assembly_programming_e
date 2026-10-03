; running the file on gdb terminal 

;nasm -f elf32 01_immediate.asm
;ld -m elf_i386 -s -o 01_immediate 01_immediate.o
;gdb ./01_immediate

section .text
global _start

_start:

    mov rax, 10
    mov rbx, 20

    add rax, 5

    mov rax, 60
    xor rdi, rdi
    syscall