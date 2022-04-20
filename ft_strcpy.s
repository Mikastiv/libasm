global ft_strcpy

section .text

; rax -> return value
; rdi -> char* restrict dst
; rsi -> const char* src

ft_strcpy:
    mov rax, rdi            ; return dst
_loop:
    cmp byte [rsi], 0       ; *src == 0
    mov cl, byte [rsi]      ; *dst = *src
    mov byte [rdi], cl
    lea rdi, [rdi + 1]      ; ++dst
    lea rsi, [rsi + 1]      ; ++src
    jne _loop               ; if (*src != 0) loop
    ret
