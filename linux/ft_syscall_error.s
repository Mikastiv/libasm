extern __errno_location

section .text

_syscall_error:
    neg rax                     ; turn error to positive value
    push rax                    ; save error value
    call __errno_location       ; get errno address
    pop rdi                     ; get back error value
    mov dword [rax], edi        ; errno = edi (errno is 32bits)
    mov rax, -1                 ; return -1
    ret
