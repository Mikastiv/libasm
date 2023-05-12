extern __errno_location

section .text

_syscall_error:
    neg rax                     ; turn error to positive value
    mov rdi, rax                ; save error value
    call __errno_location       ; get errno address
    mov dword [rax], edi        ; errno = eax
    mov rax, -1                 ; return -1
    ret
