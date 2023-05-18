extern ___error

section .text

_syscall_error:
    push rax                    ; save error value
    call ___error               ; get errno address
    pop rdi                     ; get back error value
    mov qword [rax], rdi        ; errno = rax
    mov rax, -1                 ; return -1
    ret
