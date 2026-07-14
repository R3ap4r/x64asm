;Assembly X64 Linux programming
;Using NASM and Intel standards
;No copyrights, just testing purposes
;To run this program, run the following commands in the terminal:
;
; nasm -f elf64 test.asm -o test.o
; ld test.o -o test
; ./test
;
; to do all steps in one go, use the following command:
;
; make test
;
;The Makefile is dynamic, so if you rename the sourcefile test.asm to main.asm
;Do the following:
;
; make main
;

default rel

section .data
    welcome db "This is my first NASM program",10
    welcome_len equ $-welcome
    systeminfo db "Using VSCode and several NASM extensions",10
    systeminfo_len equ $-systeminfo

section .text

    global _start

_start:

    ; show our welcome message to the console

    mov rax,1               ;sys_write           ;
    mov rdi,1               ;stdout
    mov rsi,welcome         ;welcome message
    mov rdx,welcome_len     ;length of message

    syscall                 ;write message to terminal

    ; show our systeminfo message to the console

    mov rax,1
    mov rdi,1
    mov rsi,systeminfo
    mov rdx,systeminfo_len

    syscall

    xor rax,rax         ; resetting register to 0
    mov rax,60          ; Linux exit call
    mov rdi,0           ; handing the exit with 0 (all is well)

    syscall             ; Exiting our program gracefully


