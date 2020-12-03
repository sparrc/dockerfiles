BITS 32
              org     0x00200000
              db      0x7F, "ELF"
hello:        db      "hello world", 10
              dw      2
              dw      3
              ; nasm insisted on aligning them properly so let's do it this way
exit:         dd      0x80cd4066 ; inc eax - int 0x80
              dd      start
              dd      phdr - $$
phdr:         dd      1
              dd      0
              dd      $$
              dw      1
              dw      0
              dd      filesize
              dd      filesize
start:        mov     ecx, hello ; B9 0400 0200 -> flag 1 set -> executable
              mov     edx, 12
              inc     eax
              shl     eax,2
              int     0x80
              xor     eax, eax
              jmp     exit
filesize      equ     $ - $$
