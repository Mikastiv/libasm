; global ft_atoi_base
global ft_strchr
global ft_isspace
; extern ft_strlen

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
