global ft_strlen

section .text

; rax -> return value
; rdi -> const char* str

ft_strlen:
    mov rax, -1             ; len = -1
_loop:
    inc rax                 ; ++len
    cmp byte [rdi], 0       ; *str == 0
    lea rdi, [rdi + 1]      ; ++str
    jne _loop               ; if (*str != 0) loop
    ret
