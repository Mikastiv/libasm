global ft_strlen

section .text

; rax -> return value
; rdi -> const char* s

ft_strlen:
    mov rax, -1             ; len = -1
_loop:
    inc rax                 ; ++len
    cmp byte [rdi], 0       ; *s == 0
    lea rdi, [rdi + 1]      ; ++s
    jne _loop               ; if (*s != 0) loop
    ret
