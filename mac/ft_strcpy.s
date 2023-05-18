global _ft_strcpy

section .text

; rax -> return value (char*)
; rdi -> char* restrict dst
; rsi -> const char* src

_ft_strcpy:
    mov rax, rdi                    ; return dst
    xor rcx, rcx                    ; i = 0;
.loop:
    movzx rdx, byte [rsi + rcx]     ; dst[i] = src[i]
    mov byte [rdi + rcx], dl
    inc rcx                         ; ++i
    test dl, dl                     ; src[i] & src[i] (check for 0)
    jne .loop                       ; if (src[i] != 0) loop
    ret
