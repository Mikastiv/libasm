global _ft_strlen

section .text

; rax -> return value (size_t)
; rdi -> const char* s

_ft_strlen:
    mov rax, -1             ; len = -1
.loop:
    inc rax                 ; ++len
    cmp byte [rdi], 0       ; compare *s with 0
    lea rdi, [rdi + 1]      ; ++s
    jne .loop               ; if (*s != 0) loop
    ret
