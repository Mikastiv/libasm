global _ft_strdup
extern _ft_strlen
extern _ft_strcpy
extern _malloc

section .text

; rax -> return value (char*)
; rdi -> const char* s

_ft_strdup:
    push rdi           ; save s
    call _ft_strlen    ; ft_strlen(s)
    mov rdi, rax       ; len = ft_strlen(s)
    inc rdi            ; ++len
    call _malloc       ; malloc(len)
    test rax, rax      ; if (ptr == NULL)
    je .end
    mov rdi, rax       ; ptr = malloc(len)
    pop rsi            ; src = s
    call _ft_strcpy    ; ft_strcpy(ptr, src)
.end:
    ret
