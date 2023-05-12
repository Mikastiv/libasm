global ft_atoi_base
extern ft_strlen

section .text

; rax -> return value (char*)
; rdi -> const char* s
; rsi -> char c

ft_strchr:
    mov rax, rdi
.loop:
    movzx rcx, byte [rax]
    cmp cl, sil                 ; if (*s == c)
    je .end                     ; return s
    inc rax                     ; ++s
    test cl, cl                 ; if (*s == '\0')
    jne .loop
    xor rax, rax                ; return NULL
.end:
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
    cmp rax, 2                      ; if (len < 2)
    jl .return_0
    xor r12, r12                    ; i = 0
.loop:
    movzx r14, byte [r13 + r12]     ; c = s[i]
    test r14, r14                   ; if (c == '\0')
    jne .skip_return
    mov rax, 1                      ; return 1
    jmp .end
.skip_return:
    mov rdi, r14                    ; if (ft_isspace(c))
    call ft_isspace
    test rax, rax
    jne .return_0
    cmp r14, 43                     ; if (c == '+')
    je .return_0
    cmp r14, 45                     ; if (c == '-')
    je .return_0
    lea r14, [r13 + r12 + 1]        ; if (ft_strchr(s + i + 1, c)) check for duplicate characters
    mov rdi, r14
    movzx rsi, byte [r13 + r12]
    call ft_strchr
    inc r12                         ; ++i
    test rax, rax
    je .loop
.return_0:
    xor rax, rax                    ; ret 0
.end:
    pop r14
    pop r13
    pop r12
    ret

; rax -> return value (int)
; rdi -> const char* base
; rsi -> char c

ft_base_index:
    push rdi
    call ft_strchr                  ; char* addr = ft_strchr(base, c)
    pop rdi
    sub rax, rdi                    ; ret addr - base
    ret

; rax -> return value (int)
; rdi -> const char* s
; rsi -> const char* base

ft_atoi_base:
    push r12
    push r13
    push r14
    push r15
    push rbx
    mov r12, rdi                    ; r12 = s
    mov r13, rsi                    ; r13 = base
    mov rdi, rsi
    call ft_is_base_valid
    test rax, rax                   ; if (!ft_is_base_valid(base))
    je .end                         ; return 0
    xor r14, r14                    ; i = 0
.skip_space_loop:
    movzx rdi, byte [r12 + r14]     ; c = s[i]
    call ft_isspace                 ; ft_isspace(c)
    inc r14
    test rax, rax                   ; if (ft_isspace(c)) loop
    jne .skip_space_loop
    lea r12, [r12 + r14 - 1]        ; remove spaces from s
    xor r14, r14                    ; i = 0
    mov rsi, 1                      ; sign = 1
.sign_loop:
    movzx rdi, byte [r12 + r14]     ; c = s[i]
    cmp rdi, 43                     ; if (c == '+')
    jne .check_minus
    inc r14                         ; ++i
    jmp .sign_loop                  ; loop
.check_minus:
    cmp rdi, 45                     ; if (c == '-')
    jne .sign_end
    neg rsi                         ; sign *= -1
    inc r14                         ; ++i
    jmp .sign_loop                  ; loop
.sign_end:
    push rsi                        ; save sign
    lea r12, [r12 + r14]            ; remove + and - from s
    mov rdi, r13
    call ft_strlen                  ; base_len = ft_strlen(base)
    mov r15, rax
    xor r14, r14                    ; i = 0
    xor rbx, rbx                    ; ret = 0
.convert_loop:
    mov rdi, r13
    movzx rsi, byte [r12 + r14]     ; c = s[i]
    test rsi, rsi                   ; if (c == '\0')
    je .value_end
    call ft_strchr                  ; base_ptr = ft_strchr(base, c)
    test rax, rax                   ; if (base_ptr == NULL) loop done
    je .value_end
    mov rdi, r13
    movzx rsi, byte [r12 + r14]     ; c = s[i]
    call ft_base_index              ; base_index = ft_base_index(base, c)
    imul rbx, r15                   ; ret *= base_len
    lea rbx, [rbx + rax]            ; ret += base_index
    inc r14                         ; ++i
    jmp .convert_loop               ; loop

.value_end:
    pop rsi                         ; get sign
    imul rbx, rsi                   ; ret *= sign
    mov rax, rbx                    ; return ret
.end:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    ret
