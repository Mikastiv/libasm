global _ft_write

%include "mac/ft_syscall_error.s"

section .text

; rax -> return value (int)
; rdi -> int fd
; rsi -> const void* ptr
; rdx -> size_t count

_ft_write:
    mov rax, 0x2000004          ; write syscall value
    syscall                     ; call sys_write
    jc _syscall_error           ; if carry flag set -> error
    ret
