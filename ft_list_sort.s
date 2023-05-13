global ft_list_sort
extern malloc

section .text

; t_list {
;     void* data;    -> 8 bytes
;     t_list* next;  -> 8 bytes
; };

; rdi -> t_list** list
; rsi -> int (*cmp)(void*, void*)

ft_list_sort:
    push r12
    push r13
    push r14
    mov r12, qword [rdi]            ; ptr1 = *list
    mov r14, rsi                    ; save cmp
.loop:
    test r12, r12                   ; if (ptr1)
    je .end
    mov r13, qword [r12 + 8]        ; ptr2 = ptr->next
.inner_loop:
    test r13, r13                   ; if (ptr2)
    je .next_loop
    mov rdi, qword [r12]
    mov rsi, qword [r13]
    call r14                        ; res = cmp(ptr1->data, ptr2->data)
    cmp eax, 0                      ; if (res > 0) (eax because of int)
    jle .next_inner_loop
    mov rax, qword [r12]            ; tmp1 = ptr1->data
    mov rcx, qword [r13]            ; tmp2 = ptr2->data
    mov qword [r12], rcx            ; ptr1->data = tmp2
    mov qword [r13], rax            ; ptr2->data = tmp1
.next_inner_loop:
    mov r13, qword [r13 + 8]        ; ptr2 = ptr2->next
    jmp .inner_loop
.next_loop:
    mov r12, qword [r12 + 8]        ; ptr1 = ptr1->next
    jmp .loop

.end:
    pop r14
    pop r13
    pop r12
    ret
