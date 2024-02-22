# macOS

## Shell Commands

```bash

    # Get IP Address
    $ ipconfig getifaddr en0
    $ ip=`ipconfig getifaddr en0`; echo $ip

    # Get Subnet Mask
    $ ipconfig getoption en0 subnet_mask

    # Get DNS Server
    $ ipconfig getoption en0 domain_name_server

    # Get Network Info
    $ ifconfig en0

    # Route
    $ netstat -nr

    # Detail cpu info
    sysctl -a | grep machdep.cpu

    # Getting list of pids and process names
    ps auxc

    # Get Listen process
    netstat -an | grep LISTEN
    lsof -iTCP -sTCP:LISTEN -n -P


    # 시스템에서 열린 파일 목록 가져오기 (프로세스, 디바이스, 종류, 포트 )
    lsof -i -P | grep LISTEN | grep :$PORT
    # sudo kill -9 <PID>

    # 80 포트
    lsof -i:80

    # Get history with date
    history -E
    $ !<history number>

    # Read systemlog filter "sshd"
    cat /var/log/system.lg | grep sshd

    # 맥 버전 보기
    sysctl kern.version
    sysctl kern.ostype
    sysctl kern.osrelease
    sysctl kern.osrevision
    sysctl kern.osrevision

    # SHA Check Sum
    >- shasum -a 256 /path/to/file
```

## mac port

```bash
 sudo port selfupdate
 sudo port upgrade outdated

 sudo prot install ruby
 ruby --version

 port installed requested
```

## 맥 단축키

- 파인더
    - 숨김파일 보기 : `SHIFT` + `CMD` + `.`(>)

- 터미널
    - 지우기 : `CTR: + L`
    - 커서 라인 처음으로 이동 : `CTRL + A`
    - 커서 라인 뒤로 이동 : `CTRL + E`
    - 현재 라인 지우기 : `CTRL + U`
    - 직전 단어 지우기 : `CTRL + W`
    - 라인 취소 새로운 프롬프트 : `CTRL + C`

- 이모티콘 : `CTRL + CMD + SPACE`

- XCode ShortCut
    - ShortCut : `CMD + ,`
    - Balance Indentation, Code Formatting : `CTRL + I`
    - Code Complete : `CTRL + SPACE`
    - Moving Lines : `ALT + CMD + [  or  ]`
    - Delete Entire Line : `CMD + D`
    - Comment Current Line / Block : `CMD + /`
    - Jump to Definition : `CTRL + CMD +J`
    - Jump to Line : `CMD + L`
    - Go to End or First : `CMD + Arrow (<- or ->)
    - Go to End of Right : `CTRL + E`
    - 줄 복사하기(Duplicate Line) 사용자 단축기 생성
    1. Open : `/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist`
    2. `Add Customized (Dictonary) -> (Add) Duplicate Current Line (String)`
    3. `selectLine:, copy:, moveToBeginningOfLine:, paste:, moveToEndOfLine:`

( IDETextKeyBindingSet.plist e.g.)

```xml
    <key>Insert Line Below</key>
    <string>moveToEndOfLine:, insertNewline:</string>
    <key>Insert Line Above</key>
    <string>moveUp:, moveToEndOfLine:, insertNewline:</string>
```

    4. Restart XCode : CMD + , -> Search `Duplicate` -> Asign -> `CTRL + SHIFT + L`

### 마이크로소프트 오피스 자동 업데이트 비활성화 항목
>
> MAC OS 버전이 낮아 더이상 업데이트가 불가능한 상태에서 지속적인 업데이트 안내 끄기
> Finder -> `CMD + SHIFT + G` 로 아래의 폴더로 이동 모두 삭제
>
1. /Library/Application Support/Microsoft/MAU2.0/`Microsoft 자동 업데이트.app`
2. /Library/LaunchAgents/`com.microsoft.update.agent.plist`
3. /Library/LaunchAgents/`com.microsoft.autoupdate.helper.plist`
4. /Library/PrivilegedHelperTools/`com.microsoft.autoupdate.helper.plist`

## Change Sudo Timeout

```base
  sudo visudo
```

- (10 minute password caching)
    - `Defaults timestamp_timeout=10`

- No password caching
    - `Defaults timestamp_timeout=0`

---

## Automate SSH Login

```bash
$ ssh-keygen -t rsa -b 2048
$ ssh-copy-id id@target-server
$ password enter
$ ssh 'id@server'
.ssh/authorized_keys
$ sudo apt-get install sshpass
$ sshpass -p your_password ssh user@hostname
```

## ssh copy

```bash
  # scp remote local or scp local remote
  $ scp vivabm@ns.vivabm.local:/etc/resolv.c
```

## Find IP Address

```bash
  ifconfig en0
  ipconfig getiflist
  ifconfig | grep "inet "
```

```bash
  ps auxwww | grep sshd:
```

## lldb debug

-> clang++ -g -std=c++17 demo.cpp -o prog
-> lldb ./prog
-> (lldb) run # error stop
-> (lldb) target create prog # re-launch

## break points

-> (lldb) b hi.cpp : 4
-> (lldb) b square(int)
-> (lldb) b Demo::demo()
-> (lldb) b LLDBDemo::add(int, int)
b main
br s -n main
br s -f helloworld.cpp -l 23
b test.c:12
b helloworld.cpp:29
breakpoint set --method main
br s -M main
lldb ./a.out

## break point

- On a function
- On a class method
- Inside a namespace

(lldb) b list
(lldb) br del 4
(lldb) br del

-> (lldb) list 10 # view source line number

## Step Into

-> (lldb) si # 지시 수준 신호 단계.
-> (lldb) s # 소스 레벨 신호 단계.

## back trace

-> (lldb) bt # 어떻게 해당 라인에 도달하였는지 알려줌

## Continue

-> (lldb) c

## Next

-> (lldb) n # next step

## Re Launch

-> (lldb) target create prog

-> (lldb) run

## GUI

-> (lldb) gui # after break point and run
-->  n or s key movement
--> tab key and space -> view variable

## Stepping Around

Step Over
(lldb) next
(lldb) n

Step Into
(lldb) step
(lldb) s

## Step

- Step into : 호출 되는 함수까지 포함 하여 한줄 한줄 실행
	만약 현재 코드라인이 함수라면, 해당 함수 내부로 진입한 이후
	한 줄씩 실행함
	즉, 함수 내부로 진입함

- Step over : 함수 단위로 코드를 실행
	현재 코드라인을 실행하고 다음 라인으로 이동 하되
	만약 현재 코드라인이 함수라면, 해당 함수를 실행은 하되
	디버거는 함수 안에서 먼추지 않는다.
	즉, 함수는 실행하면서 지나감
	특정 함수가 잘 동작하는지만을 확인할 때 사용함

- Step out : 함수에서 나감.
	만약 현재 코드라인이 함수 안이라면, 해당 함수는 끝까지 실행하고 반환하고 멈춤
	함수 안에서 한 줄 한 줄 디버깅하면서 더이상 오류가 없어 함수 실행을 멈출때

s : step into
si : thread step-inst
n : next, thread step-over
ni : thread step-inst-over
finish
r

(lldb) c

thread backtrace
bt

register read
register write rax 123

clang++ -O3 hi.cpp -o hi

`cmake -DCMAKE_BUILD_TYPE=Debug`

lldb a.out
lldb -- a.out argument1

## Running

```bash

(lldb) run
(lldb) r

(lldb) break set -f hi.cpp -l #
(lldb) br s -f hi.cpp -l #
(lldb) b hi.cpp :

```

- Call Stack : 현재 상태 까지 거쳐온 함수를 역순으로 표시해중
- Watch : 특정 변수나 객체의 값을 등록해 놓고 변화되는 값을 관찰할 수 있음.
