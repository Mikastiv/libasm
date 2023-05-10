global ft_strcpy

section .text

; rax -> return value (char*)
; rdi -> char* restrict dst
; rsi -> const char* src

ft_strcpy:
    mov rax, rdi                ; return dst
    xor rcx, rcx                ; i = 0;
_loop:
    movzx rdx, byte [rsi + rcx] ; dst[i] = src[i]
    mov byte [rdi + rcx], dl
    inc rcx                     ; ++i
    test dl, dl                 ; src[i] & src[i] (check for 0)
    jne _loop                   ; if (src[i] != 0) loop
    ret
