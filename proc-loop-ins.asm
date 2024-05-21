section .data
    prompt db "Enter a single digit (0-9): ", 0
    below db "Input is below 5.", 0
    equal db "Input is equal to 5.", 0
    above db "Input is above 5.", 0

section .text
    global _start

_start:
    ; Display prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 27
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 2
    int 0x80

    ; Compare input to 5
    mov al, [input]
    sub al, '0'
    cmp al, 5
    jl below_input
    je equal_input
    jmp above_input

below_input:
    ; Display below message
    mov eax, 4
    mov ebx, 1
    mov ecx, below
    mov edx, 18
    int 0x80
    jmp exit_program

equal_input:
    ; Display equal message
    mov eax, 4
    mov ebx, 1
    mov ecx, equal
    mov edx, 19
    int 0x80
    jmp exit_program

above_input:
    ; Display above message
    mov eax, 4
    mov ebx, 1
    mov ecx, above
    mov edx, 18
    int 0x80

exit_program:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss       ; block of memory for uninitialized variables
    input resb 11  ; reserves a block of 11 bytes 