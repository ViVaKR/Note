# Ubuntu

## Bash

```bash

# snap
sudo apt install -y snapd
systemctl list-unit-files | grep snapd
sudo systemctl status sanpd.service
snamp version

# certbot
sudo snap install core
sudo snap refresh core
sudo snap install --classic certbot
sudo ln -sf /snap/bin/certbot /usr/bin/certbot


# remove service
sudo systemctl disable --now service-name.service
sudo rm /etc/systemd/system/service-name.service
sudo systemctl daemon-reload

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

uv --version
uv init

uv python install 3.14
uv python pin 3.14
uv venv
uv add requests
uv run python main.py
uv python list

dpkg -l | grep python3.14

# python 3.14 완전 제거
sudo apt remove --purge python3.14 libpython3.14-stdlib -y
sudo apt autoremove --purge -y
sudo apt clean
```

### Ubuntu Service Example

```ini
# sudo vim /etc/systemd/system/buddham-api.service

[Unit]
Description=Buddham API Service
After=network.target

[Service]
User=ubuntu
Group=ubuntu

# 작업 디렉토리
WorkingDirectory=/home/ubuntu/WebServer/kr.co.buddham/api

# 실행 명령
ExecStart=/usr/bin/dotnet /home/ubuntu/WebServer/kr.co.buddham/api/Buddham.API.dll

# 환경 변수
Environment=ASPNETCORE_ENVIRONMENT=Production

# 로그 경로 설정 (표준 출력과 에러를 파일로 리다이렉트)
StandardOutput=append:/homeubuntu/WebServer/kr.co.buddham/api/buddham-api.log
StandardError=append:/home/ubuntu/WebServer/kr.co.buddham/api/buddham-api.err

# 재시작 정책 (macOS 의 KeepAlive 역할)
Restart=always
RestartSec=10

# 권장 옵션 (dotnet 앱은 SIGTERM 을 잘 처리하므로 graceful shutdown 가능)
KillSignal=SIGINT
SyslogIdentifier=buddham-api

[Install]
WantedBy=multi-user.target

# 시스템에 등록
# --> $ sudo systemctl daemon-reload

# 서비스 시작 및 자동 실행 설정
# --> $ systemctl start buddham-api
# --> $ systemctl enable buddham-api

# 상태 확인
sudo systemctl status buddham-api

# 로그 확인
cat /home/ubuntu/WebServer/kr.co.buddham/api/buddham-api.log
sudo jurnalctl -u buddham-api -f

```

### Create .NET Solution

```bash
dotnet new sln -n ViVaKR
mkdir -p src && cd src
dotnet new webapi -n ViVaKR.Api --framework net9.0
dotnet new blazorwasm -n ViVaKR.UI --framework net9.0
dotnet new classlib -n ViVaKR.Core
dotnet new classlib -n ViVaKR.Infrastructure
dotnet sln add src/**/ViVaKR.*.csproj
docker build -t vivakr/api:9.0 .
docker build -t vivakr/ui:9.0 .

# 솔루션 차원에서의 배포
dotnet build ViVaKR.sln -c Release
dotnet publish src/ViVaKR.Api/ViVaKR.Api.csproj -c Release -o ./publish/api
dotnet publish src/ViVaKR.UI/ViVaKR.UI.csproj -c Release -o ./publish/ui
```

```powershell
# build_all.ps1
dotnet build ViVaKR.sln -c Release

$projects = @(
  "src/ViVaKR.Api/ViVaKR.Api.csproj",
  "src/ViVaKR.UI/ViVaKR.UI.csproj"
)

foreach ($proj in $projects) {
  dotnet publish $proj -c Release -o "./publish/$(Split-Path $proj -LeafBase)"
}
```

```xml
<Project>
  <PropertyGroup>
    <OutputPath>$(SolutionDir)build\$(MSBuildProjectName)\</OutputPath>
  </PropertyGroup>
</Project>
```

| 명령어           | 솔루션 지원        | 결과물                       | 주용도      |
| ---------------- | ------------------ | ---------------------------- | ----------- |
| `dotnet build`   | ✅ 지원            | DLL (개발용)                 | 컴파일 확인 |
| `dotnet run`     | ✅ 지원            | 실행 (개발용)                | 테스트 실행 |
| `dotnet publish` | ❌ (프로젝트 전용) | DLL, deps.json, runtime 포함 | 배포용      |

### ZSH

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

    >- Shell (쉘, 명령어 해석기) Types : sh, ksh, csh, tch, bash, zsh, dash
    >- $ echo $SHELL

---

    [ 리눅스 명령어 종류 ]

    - compgen -a (-k), - whence -wm '*'

    - alias
        - alias c (cp, rq)

    - keyword (reserved word)
        - if, while, for, fi, select, done, then, case, do, else, elseif, esac, until, time, in, elif
        - compgen -k | column

    - function
        - hi() { echo "Hi, Everyone"; }

    - 내부 명령어 (builtin-command)  : 쉘 안에 포함되어야 하는 명령어, 쉘만 있으면 실행 가능한 명령어
        - enable | column

    -----------------------------------------------------------------
    -		        compquote	fg		    pushln		umask
    .		        compset		float		pwd		    unalias
    :		        comptags	functions	r		    unfunction
    [		        comptry		getln		read		unhash
    alias		    compvalues	getopts		readonly	unlimit
    autoload	    continue	hash		rehash		unset
    bg		        declare		history		return		unsetopt
    bindkey		    dirs		integer		sched		vared
    break		    disable		jobs		set		    wait
    builtin		    disown		kill		setopt		whence
    bye		        echo		let		    shift		where
    cd		        echotc		limit		source		which
    chdir		    echoti		local		suspend		zcompile
    command		    emulate		log		    test		zf_ln
    compadd		    enable		logout		times		zformat
    comparguments	eval		noglob		trap		zle
    compcall	    exec		popd		true		zmodload
    compctl		    exit		print		ttyctl		zparseopts
    compdescribe	export		printf		type		zregexparse
    compfiles	    false		private		typeset		zstat
    compgroups	    fc		    pushd		ulimit		zstyle
    - 외부 명령어 (external-command) :별도로 설치해야만 실행할 수 있는 명령어
        - type pwd, type pwd ...
    -----------------------------------------------------------------

    [ Commands ]

    0. type, file, stat
        - type cp, type mv, type cat : type of file
        - file a1, file dir1
        - stat a1 : file details

    1. cal

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

    5. uptime -p
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

    14. wc
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

    19. env, printenv
        - printenv | grep 'HIST*'

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
        -> find /etc -maxdepth 1 -type d -exec ls -alhF {} \; 2> /dev/null

	22. vdir, dir

    23. remove alias (원본 명령어 실행) : `\command` -> \ls

    24. alias : 별칭

	25. dircolors : view colors
		-> dircolors --help
		-> Hello

    26. histroy
        -> ~/.zsh_history
        -> echo $HISTFILE
        -> `$HISTSIZE` : 최근 명령어 저장할 갯수
        -> file location : `vim /etc/zsh/zshrc` -> `HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history`
        -> clear history
            -> bash : history -c
            -> zsh  : history -p

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
        -> ssh -P 22 viv@192.168.0.8
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
            -> eval "$(ssh-agent -s)"
            -> open ~/.ssh/config

    37. tr

        - 문자 변경  및 삭제, translae or delete characters

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
        -> turn off : \\command
        ->

    46. let : $ enable
        - 수식 다루기 정수 연산
        - id++, id--, ++id, --id
        - !, ~, *, /, +, -, **
        - <<, >>
        - <=, >=, <, >
        - &, ^, |
        - &&, ||
        - expr ? expr : expr
        - =, *=, /=, %=
        - +=, -=, <<=, >>=
        - &=, ^=, |=
        - a=2
            - let a+=4 && echo $a
            - let a\*\*=8 && echo $a
            - let a/=2 && echo $a
        - echo $((a + 10))
        - echo $((a * 2))
        - b=$((2^10)) && echo $b
        - b=$((2 << 1)) && echo $b
        - b=$((100 >> 2)) && echo $b
        - echo $[a - 123] // single square brackets
        - echo $[++a]
        - let b=$[0 | 1] && echo $b
        - let b=$[1 & 1] && echo $b
        - let b=$[3 > 5 ? 500 : 100] && echo $b

    46. history
        - echo $HISTFILE
        - history -5
        - history +5

    47. expr : external command, 외부명령어
        - expr 1 / 2

    48. bc (basic command)
        - echo "3.14 * 5 *5" | bc
        - echo "2^8" | bc
        - x=`echo "2^10" | bc` && $x

    49. USER :
        - 관리자(root), 시스템 (no login), 일반
        - root
            - /etc/profile
            - /etc/profile.d/*.sh
            - /etc/profile.d/*.local
            - /etc/bashrc
        - user
            - ~/.bash_profile
            - ~/.bashrc
            - ~/.bash_history
            - ~/.bash_logout

        - Ubuntu
            - sudo -i
            - su - root
            - passwd
            - useradd -d /home/world -m -b /home/world -s /bin/zsh world
            - userdel world

        - CentOS
            - su - root
            - useradd
            - passwd viv
        - id
            - id -u
            - id -g
        - logname
        - who
        - w : detail view
            - IDLE : 로그인 후 대기 시간.
        - whoami
        - users
        - groups
        - tty
            - w --> get user TTY number
            - 사용자간 TTY 는 중복되지 않음.
            - (send message by TTY, root) --> echo "Hello, viv" > /dev/pts/1

    50. Permission
        - Owner Group Other
        - NOS - Multi-User Operating System
        - 확장자 개념이 없고 권한으로 관리
        - r, w, x
            - r (4, 2^2, Read)
            - w (2, 2^1, Write), 디렉토리에서의 쓰기 권한은 파일 삭제도 가능하므로 주의 필요.
            - x (1, 2^0, Execute), 디렉토리에서의 실행 권한은 디렉토리에 진입할 수 있는 권한을 나타냄.
        - chown : 소유자
        - chgrp : 소유그룹
        - chmod
            -> chmod u=r, g=x, o=r <fileName>
            -> chmod +x <fileName>
            > Get file Stat
                - $ (Ubuntu) stat -c '%a %h %U %G %s %y %n' <fileName>
                %a     access rights in octal (note '#' and '0' printf flags)
                %h     number of hard links
                %U     user name of owner
                %G     group name of owner
                %s     total size, in bytes
                %y     time of last data modification, human-readable
                %n     file name
                - (macos) $ stat -f '%A %N' <fileName>
                - (macos) stat -f '%A %N' *
        - useradd
        - groupadd
        - newgrp [group-name] # only current session
        - usermod -a -G groupName userName
        - file <fileName>

    51. umask : default mask value
        - umask <value>
        - (root, 022) directory -> 755, file -> 644
            - (dir) 777 - 022(umask) => 755, (file) -111 -> 644
            - 파일은 디렉토리에서의 x 값 1을 각각(user/group/other) 빼줌. (1 1 1)
        - (user, 002) directory -> 775, file -> 664
            - (dir) 777 - 002(umask) => 775, file -> 664

    52. HOME (~)
        - root (`/`)
            - /bin, /root, /etc, /home, /usr, /tmp
            - All your settings, config : /etc
            - binary : /bin
        - home (`~`)
            - each users directories
        - root : 시스템 관리자 (administrator, prompt -> `#`)
        - 일반 사용자 (user, prompt -> `$` or `%`)

        # after login #
        # (모든 사용자 용, root 관할)
        - (1) /etc/profile
            - (2) /etc/profile.d/*.sh *.local

        # (개별 사용자 용)
        - bash
            - (3) ~/.profile or ~/.bash_profile # user master file
            - (4) ~/.bashrc => `/etc/bash.bashrc` or `/etc/bashrc (모든 사용)`
                - ~/.bash_aliases
            - ~/.bash_history
            - ~/.bash_logout

        - zsh
            - (3) /etc/zsh/zprofile # (모든 사용자 용, root 관할)
            - (4) ~/.zshrc (개별 사용자) => `/etc/zsh/zshrc (모든 사용자)`
            - /etc/zsh/zshenv

        - export

    53. du
        - du -sh ~/Temp
        - du -shL /etc # sum, human, symbolic link (링크 파일 사이즈까지)
        - quot지
        - fallocate -l 100M temp

    54. df
        - df -h # -h: , -H: , -i : inodes count
            - /boot : like C drive
            - / : main drive
            -
    55. env : 전역변수(환경변수, 시스템 전체에 영향을 줌)
        - env

    56. set : 지역변수
        - set
        - helloworld() { echo 'Hello, World'; }
        - 해당 세션에서만 적용.
        - $* : $0 $1 $2 $3 ...
            - set 400 200 700
            - $1 - 400, $2 - 200, $* - 400 200 700
        - set $(date)
            - `2024. 03. 07. (목) 11:25:05 KST`
                - $1 - 2024., $2 - 03., $3 - 07., $* - all
        - set -o or +o
            - set -o, set -C : turn on
            - set +o, set +C : turn off
                - `$ set -o noclobber` : can not overwrite ` > `
            - set -o ignoreeof : prevent -> `ctrl + d, logout`

    57. printenv

    58. source
        - `$ source ~/.zshrc` == `$ . ~/.zshrc`

    59. export : apply global
        - export B=500    # variable
        - export -f aha   # function export `-f` option

    60. pstree : process tree view
        - pstree | grep zsh

    63. jobs : 현재 진행중인 프로세스 확인
        (test)
        - (1) sleep 600
        - (2) ctrl + z
        - (3) jobs
        - (4) sleep 500
        - (5) ctrl + z
        - (6) jobs
        - (7) kill -9 %1
        - (8) kill -9 %2

        - background (bg) : [command]&
            -> bg
        - forground  (fg) :
            -> fg

    64. kill :
        - 시그널
            >- kill -l
        - kill -9 <pid>, kill -9 59600
        - kill -9 %1  # kill by job number
        - `man 7 signal` : OS <-signal-> Process
        - Package Commands : `info coreutils`

    65. sleep :
        - sleep 30 : 30초 동안 대기상태, forground job
        - CTRL + Z : suspended, to backgound, 백그라운드로 전환

    66. ps
        - ps -ef | grep sleep
---

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

```

## Run Level

- 초기화 명령어 -> init 뒤의 숫자
  > - 0 : Power Off
  > - 6 : Reboot
  > - 1 : Rescue
  > - 2, 3, 4 : 3번이 보편적 (Server)
  > - 5 : Grapical, 그래픽 모드의 다중 사용자 모드

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
    $ sudo vim /etc/update-manager/release-upgrades
        (edit) -> `kernel upgrade : -> Prompt=normal`

    $ sudo iptables -I INPUT -p tcp --dport 1022 -j ACCEPT
    $ sudo do-release-upgrade
```

## SysCall (x86_64, 64bit)

- sys_write
- NR = 1
- unsigned int fd (File Descriptor), const char \*buf (Location of string to write), size_t count (Length of string)
  - 0 : Standard Input
  - 1 : Standard Output
  - 2 : Standard Error

```bash

# imac -> ubuntu
scp -P 59222 root@192.168.0.8:~/.bashrc ~/Temp/hello.txt

# ubuntu -> imac
scp -P 22 vivakr@192.168.0.8:~/Temp/hello.txt ~/hi.txt
```
