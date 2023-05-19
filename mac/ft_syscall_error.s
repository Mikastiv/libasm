extern ___error

section .text

_syscall_error:
    push rax                    ; save error value
    call ___error               ; get errno address
    pop rdi                     ; get back error value
    mov dword [rax], edi        ; errno = edi (errno is 32bits)
    mov rax, -1                 ; return -1
    ret
