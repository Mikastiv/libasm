global ft_write
extern __errno_location

section .data
    EBADF equ 9
    EFAULT equ 14

section .text

; rax -> return value
; rdi -> int fd
; rsi -> const void* ptr
; rdx -> size_t count

ft_write:
    call __errno_location       ; get errno location
    mov r8, rax                 ; errno location to r8
    mov dword [r8], 0           ; errno = 0
    test rdx, rdx               ; count & count
    jne _check_fd               ; if (count != 0) check_fd
    mov rax, 0                  ; return 0
    ret

_check_fd:
    cmp edi, -1                 ; compare fd with -1
    jg  _check_ptr              ; if (fd > -1) check_ptr
    mov dword [r8], EBADF       ; errno = EBADF
    mov rax, -1                 ; return -1
    ret

_check_ptr:
    test rsi, rsi               ; ptr & ptr
    jne _write                  ; if (ptr != NULL) write
    mov dword [r8], EFAULT      ; errno = EFAULT
    mov rax, -1                 ; return -1
    ret

_write:
    mov rax, 1                  ; write syscall value
    syscall                     ; call sys_write
    cmp rax, rdx                ; check how many bytes were written
    jne _error                  ; if (bytes_written != count) error
    ret

_error:
    mov dword [r8], EBADF       ; errno = EBADF
    mov rax, -1                 ; return -1
    ret
