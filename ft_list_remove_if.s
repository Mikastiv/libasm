global ft_list_remove_if

section .text

; t_list {
;     void* data;    -> 8 bytes
;     t_list* next;  -> 8 bytes
; };

; rdi -> t_list** list
; rsi -> void* data_ref
; rdx -> int (*cmp)(void*, void*)
; rcx -> void (*free_fct)(void*)

ft_list_remove_if:
    push rbp
    push rbx
    push r12
    push r13
    push r14
    push r15
    mov rbx, qword [rdi]            ; curr = *list
    xor r15, r15                    ; prev = NULL
    test rbx, rbx                   ; if (curr)
    je .end
    mov r12, rdi                    ; save list
    mov r13, rsi                    ; save data_ref
    mov r14, rdx                    ; save cmp
    mov rbp, rcx                    ; save free_fct
.loop:
    test rbx, rbx                   ; if (curr)
    je .end
    mov rdi, r13
    mov rsi, qword [rbx]
    call r14                        ; res = cmp(data_ref, curr->data)
    test rax, rax                   ; if (res == 0)
    jne .next_loop
    mov rdi, rbx                    ; tmp = curr
    test r15, r15                   ; if (prev == NULL)
    jne .prev_not_null
    mov rsi, qword [rbx + 8]
    mov qword [r12], rsi            ; *list = curr->next
    mov rbx, qword [r12]            ; curr = *list
    jmp .free_fct
.prev_not_null:
    mov rsi, qword [rbx + 8]
    mov qword [r15 + 8], rsi        ; prev->next = curr->next
    mov rbx, qword [r15 + 8]        ; curr = prev->next
.free_fct:
    call rbp                        ; free_fct(tmp)
    jmp .loop
.next_loop:
    mov r15, rbx                    ; prev = curr
    mov rbx, qword [rbx + 8]        ; curr = curr->next
    jmp .loop
.end:
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret