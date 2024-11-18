; Kathir_RajeshKannan_260_assign8.asm


section .data
    NUM dd 12            ; Change this value for different sample runs
    quadArray times 12 dd 0  ; Array to store Quadonacci numbers, initialized to 0

section .text
    global _start

_start:
    ; Initialize the base cases
    mov ecx, 4               ; Counter for the first 4 Quadonacci values
    mov esi, quadArray       ; ESI points to the start of quadArray

initialize_base_cases:
    mov [esi], dword 1       ; Set each of the first 4 values to 1
    add esi, 4               ; Move to the next DWORD in the array
    loop initialize_base_cases

    ; Calculate Quadonacci values for NUM >= 5
    mov ecx, [NUM]           ; Load NUM into ECX
    cmp ecx, 4               ; If NUM <= 4, no need to calculate further
    jle done                 ; Jump to done if NUM <= 4

    mov ebx, 4               ; EBX will be our loop counter starting from 4
    mov esi, quadArray       ; Reset ESI to the start of quadArray
    add esi, 16              ; Move ESI to the 5th element (DWORD 16 bytes from start)

calculate_quadonacci:
    ; Load the last four values from the array and add them
    mov eax, [esi-4]         ; Load Quad(N-1)
    add eax, [esi-8]         ; Add Quad(N-2)
    add eax, [esi-12]        ; Add Quad(N-3)
    add eax, [esi-16]        ; Add Quad(N-4)
    mov [esi], eax           ; Store the result in the current position

    add esi, 4               ; Move to the next DWORD in the array
    inc ebx                  ; Increment the loop counter
    cmp ebx, ecx             ; Compare EBX with NUM
    jl calculate_quadonacci  ; Loop until EBX < NUM

done:
    ; Exit the program
    mov eax, 60              ; syscall: exit
    xor edi, edi             ; status: 0
    syscall
