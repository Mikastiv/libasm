global ft_strcmp

section .text

; rax -> return value
; rdi -> const char s1
; rsi -> const char s2

ft_strcmp:
    xor rdx, rdx
_loop:
    movzx rax, byte [rdi + rdx]
    movzx rcx, byte [rsi + rdx]
    test rax, rax
    je _end
    cmp rax, rcx
    jne _end
    inc rdx
    jmp _loop
_end:
    sub rax, rcx
    ret

