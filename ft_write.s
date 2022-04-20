global ft_write
extern __errno_location

section .text

; rax -> return value
; rdi -> int fd
; rsi -> const void* ptr
; rdx -> size_t count

ft_write:
    call __errno_location       ; get errno location
    mov r8, rax                 ; errno location to r8
    mov rax, 1                  ; write syscall value
    syscall                     ; call sys_write

    cmp rax, 0                  ; compare syscall return with 0
    jl  _error                  ; if (return_value < 0) error

    mov dword [r8], 0
    ret

_error:
    neg rax                     ; turn errno to positive value
    mov dword [r8], eax         ; errno = eax
    mov rax, -1                 ; return -1
    ret
