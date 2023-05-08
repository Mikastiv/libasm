global ft_write
extern __errno_location

section .text

; rax -> return value (int)
; rdi -> int fd
; rsi -> const void* ptr
; rdx -> size_t count

ft_write:
    mov rax, 1                  ; write syscall value
    syscall                     ; call sys_write

    cmp rax, 0                  ; compare syscall return with 0
    jl  _error                  ; if (return_value < 0) error

    ret

_error:
    neg rax                     ; turn error to positive value
    mov rdi, rax                ; save error value
    call __errno_location       ; get errno address
    mov dword [rax], edi        ; errno = eax
    mov rax, -1                 ; return -1
    ret
