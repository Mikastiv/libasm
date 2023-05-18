global _ft_list_push_front
extern _malloc

section .text

; t_list {
;     void* data;    -> 8 bytes
;     t_list* next;  -> 8 bytes
; };

; rax -> return value (t_list*)
; rdi -> void* data

ft_create_elem:
    push rbx
    mov rbx, rdi
    mov rdi, 16
    call _malloc                ; malloc 16 bytes
    test rax, rax
    je .end
    mov qword [rax], rbx        ; t_list->data = data
    mov qword [rax + 8], 0      ; t_list->next = 0
.end:
    pop rbx
    ret                     ; return t_list

; rdi -> t_list** list
; rsi -> void* data

_ft_list_push_front:
    push rdi
    mov rdi, rsi
    call ft_create_elem             ; create new_node
    test rax, rax
    je .end
    pop rdi
    mov rsi, qword [rdi]            ; v = *list
    mov qword [rax + 8], rsi        ; new_node->next = v
    mov qword [rdi], rax            ; *list = new_node
.end:
    ret
