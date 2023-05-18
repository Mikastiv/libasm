global _ft_read

%include "mac/ft_syscall_error.s"

section .text

; rax -> return value (int)
; rdi -> int fd
; rsi -> void* buf
; rdx -> size_t count

_ft_read:
    mov rax, 0x2000003          ; read syscall value
    syscall                     ; call sys_write
    jc _syscall_error           ; if carry flag set -> error
    ret
