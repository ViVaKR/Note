# Ubuntu

## Shell ZSH

```zsh

    # Shutdown
    >- shutdown -r now
    >- shutdown -P now
    >- shutdown -h +5 # 5분 후
    >- shutdown -c # cancel
    >- shutdown -k +5 # 가짜 종료 명령
    >- init 0
    >- halt -p
    >- poweroff

    # Reboot
    >- reboot
    >- init 6

    # 로그아웃
    >- logout
    >- exit

    # Default
    >- ls -al
    >- pwd
    >- rm
    >- rm -rf
    >- cp
    >- touch
    >- mv : 파일 또는 디렉토리 이름 변경 및 위치 변경
    >- mkdir : 새로운 디렉토리 생성
    >- dpkg --list
    >- dpkg --purge [program name]

    # install utilities
    $ sudo apt-get install -y bsdmainutils

    1. cal : -n, -b, >, >>, -
    2. tac
    3. tee : >> or > 대신 사용할 수 있음.
        -> cat a1 | tee a2
        -> dpkg --list | tee a3 # 화면출력 + 파일 저장
        -> who | tee -a a4 # append
    4. nl (number line) : == cat -b a1
        -> nl a1
        -> nl -w10 a1
        -> nl -i2 iw2 a1 # 2씩 증가
        -> nl -i10 -v10 a1 # 시작 번호 지정
        -> nl -i2 -v0 a1 # 짝수로 증가

    5. uptime
    6. dpkg --list
    7. apt autoremove
    8. head : 플러스 기호가 생략되어 있고 기본 10개
        -> head -n 10 number # default count 10
        -> head -n 5 number city # number 5, city 5 개
        -> head -n -3 number city -q # 끝에서 부터 3개 잘라내고 출력, 해더 없애고 출력
        -> head -c 30 number

    9. tail : 마이너스 기호가 생략되어 있고 기본 10개, 추적 기능이 있음.
        -> tail -n 5 number
        -> tail -n +5 number # 앞에서 부터 5개 잘라내고 출력, 5부터 끝까지.
        -> tail -c 30 number # byte 단위로 출력
        -> tail -f number # 추적 기능이 있음 tail 고유 기능

    10. seq
            -> seq 100 100 1500 > number
    11. wc -l fileName # line count

    12. split
        -> split --help
        -> split fileName # 1000 라인당 분리
        -> wc -l xa* # 각각의 파일 행 확인하기
        -> cat xa* > fileName2 # 합치기
        -> diff k k2 # 파일 동일성 여부 확인하기
        -> split -d -a 3 fileName # 숫자로 명명, 이름 크기칸수
        -> split -d --additional-suffix=.txt fileName
        -> split -d --additional-suffix=.txt fileName backup_ # 접두사 변경
        -> split -d --additional-suffix=.txt -l 500 n backup_ # 500 라인 단위
        -> split -d --additional-suffix=.txt -C 10240 n backup_ # byte 단위,  10K
        -> split -d --additional-suffix=.txt -n 10 n backup_ # 갯수로 자르기, 같은 크기로 10개로 자름
        -> split -d --additional-suffix=.bak -n 10 --numeric-suffix=50 n backup_ # 시작 번호 지정 50부터
        -> cat backup_* > orgin.bak # 합치기..

    13. csplit : 행으로 자르기
        -> cp /etc/passwd ps
        -> csplit k 10 20 30 40 # each lines split
        -> csplit p /pattern/
        -> csplit p /pattern/
        -> csplit p /pattern/1 # 패턴 단어가 앞쪽에 포함됨, 숫자 만큼 앞쪽/뒤쪽(음수) 에 포함됨
        -> csplit -f x_ p # change prefix
        -> csplit -f aa_ ch.txt "/Chapter/2" "{*}" # multi split

    14. w
        -> wc -c file # byte
        -> wc -l file # line
        -> wc -w file # word
        -> wc file # line, word, byte 순

    15. diff : file compare
        -> diff a b

    16. du
        -> du -sh ./folder

    17. grep
        -> grep keyWord /etc/passwd | nl # .zshrc -> alias grep="grep --color=always"

    18. echo : built in command, display a line of textq
        -> echo $a $b $c
        -> echo -e "aa \t bb \n cc" # 제어 특수문자 인식
        -> echo -e "\uAC00" # unicode (2byte) -> '가', \u2665, \u2661, \u2664"
        -> man echo
        -> run-help # bultin commands list
        -> run-help echo

    19. env : 환경변수

    20. printf
        -> printf "%d\t%f\t%s\n" 100 3.14 'A' # imadate value
        -> printf "%d\t%f\t%s\n" $a $b $c # variable
        -> printf "[%10d]\n" 100
        -> man printf # help,== man 1 printf
        -> man 3 printf # Library Functions Manual

    21. yes : 무한 루프
        -> yes "Hello World" | nl # 인터럽트 - Ctrl + C 중지

    22. ls, dir, vdir, dircolors
        -a  all
        -A  . .. 제외 하고 all
        -l  자세한 정보
        -i  inode
        -h	human-readable
        -F	one of */=>@|
        -R  recursive
        -S  size
        -r reverse
		-t : modification time
		-u : access time
		-c : change time

        |file or dir | 권한 | 하드링크수 | 소유주 | 소유 그릅 | 파일사이즈 | 파일접근날짜 | 파일 |

		-> find / -type s -exec ls -alF {} \; 2> /dev/null # hide error messages
		-> find / -type s -S ls -alF {} \; 2> /dev/null # hide error messages

	22. vdir, dir
	23. remove alias (원본 명령어 실행) : `\command` -> \ls
	24. alias : view alias
	25. dircolors : view colors
		-> dircolors --help
		-> Hello
    26. histroy
    -> ~/.zsh_history
    -> echo $HISTFILE
    27. paste
        -> paste name kor eng
        -> paste name kor eng -s > sc2
        -> paste name kor eng -s -d", " > sc2
        -> paste name -s -d"," > names
        -> paste name -s -d"|" > names
        -> paste name -s -d"\t" > names

    28. join : 공통된 필드를 찾아서 합침
        -> join k1 e1 # 중복된 항목 단일 항목 처리, 학생들의 과목 1, 과목 2 병합 처리
        -> join -e"00" -o 0,1.2,2.2 k2 e2 # 공백 부분 00처리
            >- 이순신 90 95
            >- 황진이 00 25
            >- 한석봉 95 95
            >- 신돌석 50 00
            >- 양주종 50 50

    29. cut
        -> cat /etc/passwd | cut -d : -f 1,3

    30. awk
        -> ps -ef | awk '{ print $1,$2 }'
        -> ps -ef | awk '{ print $0 }'
        -> ps -ef | awk '{print $1, "\t", $3}'

    31. sort
        -> b : 선행 공백 무시
        -> f : 대소문자 구분 안함
        -> n : 해시의 키값 기준, 랜덤 정렬
        -> r : 역순 (내림 차순) - sort kor -r | nl
        -> h : --human(2K, 1G)
        -> c : 정렬 되어 있는지 검사
        -> k n : n번째 필드를 기준으로 정렬
        -> m : 이미  정렬된 파일들을 병합
        -> o : 파일 출력
        -> t : 필드 구분자를 지정 (기본은 공백)
        -> u : 정렬 후 중복 제거
        -> sort kor | nl

    32. passwd

    33. ssh
        -> ssh -p 22 viv@192.168.0.8
    34. uniq

    35. shuf

    36. Auto SSH Login

        - (Client)
        -> ssh-keygen -t rsa -b 4096
            -> file ~/.ssh/id_rsa
            -> ~/.zshrc ->
            -> ssh-copy -p 52344 root@server-ip

        - (Git)
        -> ssh-keygen -t ed25519 -C "kimburmjun@gmail.com"
            -> eval "$(ssh-agent -s)
            -> open ~/.ssh/config

    37. tr : 문자 변경  및 삭제, translae or delete characters
        - 삭제 (-d, delete)
            -> echo "abcd" | tr -d 'c'
            -> echo "aaabbbbcccccddddd" | tr -d 'bcd'
            -> echo "1234abcdefg" | tr -d 'a-z' | nl
            -> echo "1234abcdefg" | tr -d '0-9' | nl
            -> echo "1245AbcZKy cde" | tr -d 'A-Z''a-z' | nl
            -> echo "AaBb1234567HelloWorld" | tr -d '[:upper:]''[:lower:]' | nl
            -> echo "AaBb1234567HelloWorld" | tr -d '[:digit:]' | nl # 숫자만 지우기
            -> echo {1..9} | tr -d '1-4'
            -> echo "abcdefg" | tr 'abc' 'ABC' | nl
            -> echo "korea" | tr 'a-z' 'A-Z'
            -> echo "서울 부산 대구 광주" | tr " " "\n"
            -> echo "서울 부산 대구 광주" | tr " " "\v"
            -> cat /etc/passwd | tr ':' ','
            -> echo {a..z} | tr '[a-z]' '[A-Z]'
            -> echo {a..z} | tr '[:lower:]' '[:upper:]'
            -> echo {a..z} | tr '[:lower:]' '[:upper:]' | tr -d ' '
            -> echo {a..z}{1..3} | tr -d ' '

        - 변경
            -> echo 'Abcd' | tr 'A' 'Z'
            -> who | tr -s ' '

        - -s : squeeze, 반복되는 1 문자 삭제
            -> echo "kkkkbbbbssss" | tr -s kbs
        - -t : truncate
        - -c, -- complement : 보수 연산

    38. expand : 탭을 공백으로 변환, Convert tabs in each FILE to spaces
        -> echo -e "aa\tbb\tcc" | expand -t 4

    39. unexpand
        -> cat b30 | unexpand -t 2

    40. touch
        -> touch blankFile
        -> touch -t 05201240 b5

    # 표준 입출력 및 에러
    # 숫자(0,1,2) = 파일 디스크립터 파일, 포인터, fopen fclose

    - stdin ( 0 ) : 표준 입력 standard input (키보드)
        -> nl 0< file
        -> cat < s

    - stdout ( 1 ) : 표준 출력 standard output (모니터)
        -> date > d
        -> who 1> w

    - stderr ( 2 ) : 표준 에러 standard  error (모니터)
        -> badcommand 2> saveToFile (에러 발생, 오류내용이 파일에 저장됨)
        -> rmdir ./ds 2>/dev/null (에러 발생시 메시지 숨기기)
        -> /dev/null : 블랙홀, 휴지통 개념

    - 출력 재 지향 : ( 1> )
        -> `date > d1` <==>  data 1> d1 (즉, 1이 생략되어 있음)

    - Append ( >> ) : 파일내용 끝에 추가

    - Here Document ( << ) :

    - 입력 재 지향 : ( 0< )
        -> nl < file
        -> cat < file <==> cat 0< file (즉, 0 이 생략되어 있음)

    - ^D : End Of File, 파일의 끝 (반듯이 빈칸에서)
        -> cat << END > t3
            >- haha
            >- hoho
            >- END

    41. mkdir
        -> mkdir d1
        -> mkdir d1 d2 d3
        -> mkdir dd{1..5}
        -> mkdir -p d1/d2/d3


    42. rmdir
        -> rmdir -p d1/d2/d3

    43. rm : 파일 삭제 (recursive, force)
        -> rm -rf dir


    44. cp : 파일 복사
        ->

    45. alias, unalias
        -> turn off : \command


```

## Run Level

- 초기화 명령어 -> init 뒤의 숫자
    >- 0 : Power Off
    >- 6 : Reboot
    >- 1 : Rescue
    >- 2, 3, 4 : 3번이 보편적 (Server)
    >- 5 : Grapical, 그래픽 모드의 다중 사용자 모드

```bash

    # Modes
    >- ls -alF /lib/systemd/system/runlevel?.target

    # Get Current Mode
    >- ls -l /lib/systemd/system/default.target

    # Mode Change
    >- ln -sf /lib/systemd/system/graphical.target /lib/systemd/system/default.target

    >- startx

```

## Edit

```bash

    #!/usr/bin/env bash

```

1. gedit -> `$ apt-get update && apt-get install gedit && apt -y install gnome`
2. nano
3. vi

## 네트워크 명령어

```bash
    #
```

## 패키지 관리

```bash
    #
```

```bash

    # auto remove
    >- apt autoremove


```

## 127.0.0.53 DNS 비활성하기

```bash

    $ sudo vim /etc/systemd/resolved.conf
        #-> find         (DNSStubListener=yes)
        #-> change to   (DNSStubListener=no)

    # check
    $ resolvectl status | grep -i "DNS Serve"

    $ named-checkconf /etc/bind/named.conf.options
```

## Commands

```bash

    # named
    $ sudo systemctl status systemd-resolved
    $ systemctl stop systemd-resolved
    $ systemctl disable systemd-resolved

    $ cd /run/systemd/resolve
    $ stub-resolv.conf

    # bind9 재시작
    $ sudo systemctl restart bind9

    $ ip a
    $ ufw status
    $ ufw allow 53/udp
    $ tcpdump -vv -n -i ens33 port 53
    $ dig @192.168.0.11 linux.org
    $ dig -x 192.168.0.11
    $ ss -ltn
    $ mtr kernel.org
    $ traceroute kernel

    # ssh
    $ ssh-keygen -t ed25519 -b 4096

    # 우분투 버전 업그레이드
    # kernel upgrade : -> Prompt=normal
    $ sudo nano /etc/update-manager/release-upgrades
    $ sudo iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
    $ sudo do-release-upgrade
```

## GDB

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

## Reload

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

## SysCall (x86_64, 64bit)

>- sys_write
- NR = 1
- unsigned int fd (File Descriptor), const char *buf (Location of string to write), size_t count (Length of string)
- 0 : Standard Input
- 1 : Standard Output
- 2 : Standard Error
