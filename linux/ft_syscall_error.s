extern __errno_location

section .text

_syscall_error:
    neg rax                     ; turn error to positive value
    push rdi                    ; save error value
    call __errno_location       ; get errno address
    pop rdi                     ; get back error value
    mov qword [rax], rdi        ; errno = rax
    mov rax, -1                 ; return -1
    ret
