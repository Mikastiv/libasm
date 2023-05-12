global ft_list_push_front
extern malloc

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
    call malloc                 ; malloc 16 bytes
    test rax, rax
    je .end
    mov qword [rax], rbx        ; t_list->data = data
    mov qword [rax + 8], 0      ; t_list->next = 0
.end:
    pop rbx
    ret                     ; return t_list

; rdi -> t_list** begin_list
; rsi -> void* data

ft_list_push_front:

    ret