; global ft_atoi_base
global ft_strchr
global ft_isspace
global ft_is_base_valid
extern ft_strlen

section .text

; rax -> return value (char*)
; rdi -> const char* s
; rsi -> char c

ft_strchr:
    mov rax, rdi
_l1:
    movzx rcx, byte [rax]       ;
    cmp cl, sil                 ; if (*s == c)
    je _l2                      ; return s
    inc rax                     ; ++s
    test cl, cl                 ; if (*s == '\0')
    jne _l1                     ;
    xor rax, rax                ; return NULL
_l2:
    ret


; rax -> return value (int)
; rdi -> int c

ft_isspace:
    lea     rax, [rdi - 9]      ; c - '\t' (9)
    cmp     rax, 5              ; compare with range '\r' (13) - '\t' (9) + 1
    setb    al                  ; if below set al to 1 (if (c >= '\t' && c <= '\r'))
    cmp     rdi, 32             ; compare c with space (32)
    sete    cl                  ; if (c == ' ') set cl to 1
    or      cl, al              ; cl = al | cl
    movzx   rax, cl             ; ret cl
    ret

; rax -> return value (int)
; rdi -> const char* s

ft_is_base_valid:
    push r12
    push r13
    push r14
    mov r13, rdi
    call ft_strlen
    cmp rax, 2                  ; if (len < 2)
    jl _l5
    xor r12, r12                ; i = 0
_l3:
    movzx r14, byte [r13 + r12] ; c = s[i]
    test r14, r14               ; if (c == '\0')
    jne _l4
    mov rax, 1
    jmp _l6
_l4:
    mov rdi, r14
    call ft_isspace
    test rax, rax
    jne _l5
    cmp r14, 43
    je _l5
    cmp r14, 45
    je _l5
    lea r14, [r13 + r12 + 1]
    mov rdi, r14
    movzx rsi, byte [r13 + r12]
    call ft_strchr
    inc r12
    test rax, rax
    je _l3
_l5:
    xor rax, rax                ; ret 0
_l6:
    pop r14
    pop r13
    pop r12
    ret
