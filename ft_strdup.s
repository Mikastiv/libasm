global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

section .text

; rax -> return value (char*)
; rdi -> const char* s

ft_strdup:
    push rdi           ; save s

    call ft_strlen     ; ft_strlen(s)

    mov rdi, rax       ; len = ft_strlen(s)
    inc rdi            ; ++len
    call malloc        ; malloc(len)
    test rax, rax      ; if (ptr == NULL)
    je .end

    mov rdi, rax       ; ptr = malloc(len)
    pop rsi            ; src = s
    call ft_strcpy     ; ft_strcpy(ptr, src)
.end:
    ret
