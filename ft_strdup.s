global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc
extern __errno_location

%define	ENOMEM  12

section .text

; rax -> return value (char*)
; rdi -> const char* s

ft_strdup:
    push rdi            ; save s

    call ft_strlen     ; ft_strlen(s)

    mov rdi, rax        ; len = ft_strlen(s)
    call malloc        ; malloc(len)
    test rax, rax       ; if (ptr == NULL)
    je _error

    mov rdi, rax        ; ptr = malloc(len)
    pop rsi             ; src = s
    call ft_strcpy     ; ft_strcpy(ptr, src)

    ret

_error:
    call __errno_location       ; get errno address
    mov dword [rax], ENOMEM     ; errno = ENOMEM
    mov rax, 0                  ; return NULL
    ret
