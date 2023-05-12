global ft_list_push_front
extern malloc

%include "ft_malloc_error.asm"

section .text

; t_list {
;     void* data;    -> 8 bytes
;     t_list* next;  -> 8 bytes
; };

; rax -> return value (t_list*)
; rdi -> void* data

ft_create_elem:
    push rdi
    mov rdi, 16
    call malloc             ; malloc 16 bytes
    test rax, rax
    je _malloc_error

    
    ret

; rdi -> t_list** begin_list
; rsi -> void* data

ft_list_push_front:

    ret
