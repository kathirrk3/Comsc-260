.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
; change NUM to the value that you want to run the program with
NUM = 12
.data
; do NOT change quadArray here in the data segment!!!
; You will be building this array with your loop
quadArray DWORD NUM DUP(0)
.code
main proc
; initialize esi
mov esi, OFFSET quadArray
invoke ExitProcess,0
main endp
end main
