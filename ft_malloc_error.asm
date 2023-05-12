extern __errno_location

%define	ENOMEM 12

section .text

_malloc_error:
    call __errno_location       ; get errno address
    mov dword [rax], ENOMEM     ; errno = ENOMEM
    mov rax, 0                  ; return NULL
    ret
