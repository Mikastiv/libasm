global ft_write

%include "linux/ft_syscall_error.s"

section .text

; rax -> return value (int)
; rdi -> int fd
; rsi -> const void* ptr
; rdx -> size_t count

ft_write:
    mov rax, 1                  ; write syscall value
    syscall                     ; call sys_write
    cmp rax, 0                  ; compare syscall return with 0
    jl _syscall_error           ; if (return_value < 0) error
    ret
