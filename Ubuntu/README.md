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

    13. csplit
        -> cp /etc/passwd
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
        -> a   all
        -> A    . .. 제외 하고 all
        -> l    자세한 정보
        -> i    inode
        -> R    recursive
        -> S    size
        -> r    reverse
        -> t    time
        -> Access : 접근
        -> Modify : 수정
        -> Change : 속성

        |file or dir | 권한 | 하드링크수 | 소유주 | 소유 그릅 | 파일사이즈 | 파일접근날짜 |



---

    # histroy
    -> ~/.zsh_history
    -> echo $HISTFILE

    # .NET
    >- dotnet --info
    >- dotnet --list-sdks
    >- dotnet --list-runtimes

    ## install dotnet
    >- wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
    >- chmod +x ./dotnet-install.sh
    >- ./dotnet-install.sh --version latest


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

    $ dig linux.org
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

## 최신 Vim 설치

sudo apt update
sudo apt install -y eza

## ubuntu cal install

sudo apt-get install -y bsdmainutils
