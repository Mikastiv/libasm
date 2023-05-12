global ft_strcmp

section .text

; rax -> return value (int)
; rdi -> const char s1
; rsi -> const char s2

ft_strcmp:
    xor rdx, rdx                    ; i = 0
.loop:
    movzx rax, byte [rdi + rdx]     ; c1 = s1[i]
    movzx rcx, byte [rsi + rdx]     ; c2 = s2[i]
    test rax, rax                   ; c1 & c1
    je .end                         ; if (c1 == 0)
    cmp rax, rcx                    ; compare c1 with c2
    jne .end                        ; if (c1 == c2) end
    inc rdx                         ; ++i
    jmp .loop                       ; if (c1 == c2) loop
.end:
    sub eax, ecx                    ; return c1 - c2
    ret
