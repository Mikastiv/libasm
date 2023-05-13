global ft_list_size

section .text

; t_list {
;     void* data;    -> 8 bytes
;     t_list* next;  -> 8 bytes
; };

; rax -> return value (int)
; rdi -> t_list* list

ft_list_size:
    xor rax, rax                ; size = 0
.loop:
    test rdi, rdi               ; if (list)
    je .end
    mov rdi, qword [rdi + 8]    ; list = list->next
    inc rax                     ; ++size
    jmp .loop                   ; loop
.end:
    ret
