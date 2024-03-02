# GDB

```bash
$ gdb <exe file>
(gdb) layout asm
(gdb) break _start
(gdb) run
(gdb) stepi # step into
(gdb)
(gdb) info registers eax
(gdb) stepi
(gdb) info registers ebx #== info reg ebx

```
- DB (Define Byte) 8 bit
- DW (Define Word. Generally 2bytes on typical(대표적인) x86 32 bit system)
- DD (Define double word. Generally 4 bytes ) 4 (32bit)
- DQ 8
- DT 10
    - db      0x55                ; just the byte 0x55
    - db      0x55,0x56,0x57      ; three bytes in succession
    - db      'a',0x55            ; character constants are OK
    - db      'hello',13,10,'$'   ; so are string constants
    - dw      0x1234              ; 0x34 0x12
    - dw      'A'                 ; 0x41 0x00 (it's just a number)
    - dw      'AB'                ; 0x41 0x42 (character constant)
    - dw      'ABC'               ; 0x41 0x42 0x43 0x00 (string)
    - dd      0x12345678          ; 0x78 0x56 0x34 0x12
    - dq      0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
    - ddq     0x112233445566778899aabbccddeeff00
    - do      0x112233445566778899aabbccddeeff00 ; same as previous
    - dd      1.234567e20         ; floating-point constant
    - dq      1.234567e20         ; double-precision float
    - dt      1.234567e20         ; extended-precision float

DB 그리고 친구들: 초기화된 데이터 선언
DB, DW, DD, DQ, DT, DDQ, 그리고DO 에서 초기화된 데이터를 선언하는 데 사용됩니다. 출력 파일 다음과 같은 다양한 방법으로 호출할 수 있습니다.

$ gdb <exe file>
$ layout asm
$ break _start
$ run
$ stepi # step into

$ (gdb) info registers eax
$ stepi
$ (gdb) info registers ebx #== info reg ebx

- DB (Define Byte) 8 bit
- DW (Define Word. Generally 2bytes on typical(대표적인) x86 32 bit system)
- DD (Define double word. Generally 4 bytes ) 4 (32bit)
- DQ 8
- DT 10

    db      0x55                ; just the byte 0x55
    db      0x55,0x56,0x57      ; three bytes in succession
    db      'a',0x55            ; character constants are OK
    db      'hello',13,10,'$'   ; so are string constants
    dw      0x1234              ; 0x34 0x12
    dw      'A'                 ; 0x41 0x00 (it's just a number)
    dw      'AB'                ; 0x41 0x42 (character constant)
    dw      'ABC'               ; 0x41 0x42 0x43 0x00 (string)
    dd      0x12345678          ; 0x78 0x56 0x34 0x12
    dq      0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
    ddq     0x112233445566778899aabbccddeeff00
    ; 0x00 0xff 0xee 0xdd 0xcc 0xbb 0xaa 0x99
    ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
    do      0x112233445566778899aabbccddeeff00 ; same as previous
    dd      1.234567e20         ; floating-point constant
    dq      1.234567e20         ; double-precision float
    dt      1.234567e20         ; extended-precision float

DB 그리고 친구들: 초기화된 데이터 선언
DB, DW, DD, DQ, DT, DDQ, 그리고DO 에서 초기화된 데이터를 선언하는 데 사용됩니다. 출력 파일 다음과 같은 다양한 방법으로 호출할 수 있습니다.

        db 0x55; 바이트만 0x55
        db 0x55,0x56,0x57; 연속 3바이트
        db 'a',0x55; 문자 상수는 정상입니다.
        db '안녕하세요', 13, 10,'$'   ; 문자열 상수도 마찬가지입니다.
        dw 0x1234; 0x340x12
        dw'a'; 0x410x00(숫자일 뿐)
        dw 'ab'; 0x410x42(문자 상수)
        dw 'abc'; 0x410x420x430x00 (string)
        dd 0x12345678; 0x780x560x34 0x12
        dq      0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
        ddq     0x112233445566778899aabbccddeeff00
        ; 0x00 0xff 0xee 0xdd 0xcc 0xbb 0xaa 0x99
        ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
        do     0x112233445566778899aabbccddeeff00 ; same as previous
        dd 1.234567e20; 부동 소수점 상수
        dq 1.234567e20; 이중 정밀 부유물
        dt 1.234567e20; 확장 정밀 부유물
DT 숫자 상수를 피연산자로 사용하지 않습니다.DDQ 플로트를 허용하지 않습니다. 피연산자로 상수를 지정합니다. 다음보다 큰 사이즈DD 문자열을 다음과 같이 사용할 수 없습니다. 피연산자

[s]tep
[s]tep[i]
[n]extx
[n]ext[i]
[b]ack[t]race : Prints a stack trace, listing each function and its arguements.
This deos the same thing as the commands info stack and wherei
c[ontinue]
q(uit)

echo "set disassembly-flavor intel" > ~/.gdbinit

## Reload

- after source change
- `:file <exec file>`
- `$ no change -> r - run`

`(gdb) print /t $eax  # binary`

```bash
    print /x $eip             Print program counter in hex
    print /d $eip             Print program counter in decimal
    print /t $eip             Print program counter in binary

    x/w   0xbffff890         # Examine (4-byte) word starting at address 0xbffff890
    x/w   $esp               # Examine (4-byte) word starting at address in $esp
    x/wd  $esp               # Examine (4-byte) word starting at address in $esp. Print in decimal
    x/a   $esp               # Examine address in $esp. Print as offset from previous global symbol.
    x/s   0xbffff890         # Examine a string stored at 0xbffff890
    x/20b sum                # Examine first 20 opcode bytes of function sum
    x/10i sum                # Examine first 10 instructions of function sum
```
`print /t $eax << db 0x55; 바이트만 0x55`

    >- db 0x55,0x56,0x57; 연속 3바이트
    >- db 'a',0x55; 문자 상수는 정상입니다.
    >- db '안녕하세요', 13, 10,'$'   ; 문자열 상수도 마찬가지입니다.
    >- dw 0x1234; 0x340x12
    >- dw'a'; 0x410x00(숫자일 뿐)
    >- dw 'ab'; 0x410x42(문자 상수)
    >- dw 'abc'; 0x410x420x430x00 (string)
    >- dd 0x12345678; 0x780x560x34 0x12
    >- dq      0x1122334455667788  ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
    >- ddq     0x112233445566778899aabbccddeeff00
    >- ; 0x00 0xff 0xee 0xdd 0xcc 0xbb 0xaa 0x99
    >- ; 0x88 0x77 0x66 0x55 0x44 0x33 0x22 0x11
    >- do     0x112233445566778899aabbccddeeff00 ; same as previous
    >- dd 1.234567e20; 부동 소수점 상수
    >- dq 1.234567e20; 이중 정밀 부유물
    >- dt 1.234567e20; 확장 정밀 부유물

```bash
    [s]tep
    [s]tep[i]
    [n]extx
    [n]ext[i]
    [b]ack[t]race
    c[ontinue]
    q(uit)
```

## gdb init

`echo "set disassembly-flavor intel" > ~/.gdbinit`

`(gdb) x/2x 0x804a000`

`(gdb) i reg eflags`

## Debuggin Reload

1. after source change -> file <exec file>
2. $ `r - run`

(gdb) print /t $eax       # binary
print /x $eip             Print program counter in hex
print /d $eip             Print program counter in decimal
print /t $eip             Print program counter in binary

- x/w   0xbffff890          Examine (4-byte) word starting at address 0xbffff890
- x/w   $esp                Examine (4-byte) word starting at address in $esp
- x/wd  $esp                Examine (4-byte) word starting at address in $esp. Print in decimal
- x/a   $esp                Examine address in $esp. Print as offset from previous global symbol.
- x/s   0xbffff890          Examine a string stored at 0xbffff890
- x/20b sum                 Examine first 20 opcode bytes of function sum
- x/10i sum                 Examine first 10 instructions of function sum

`print /t $eax << 1`

---
