# macOS

## Shell Commands

```bash
    # Detail cpu info
    sysctl -a | grep machdep.cpu
    
    # Getting list of pids and process names
    ps auxc
    
    # Get Listen process
    netstat -an | grep LISTEN
    lsof -iTCP -sTCP:LISTEN -n -P
    
    # brew clean cache all
    # /User/${whoami}/Library/Caches/Homebrew/downloads/
    brew cleanup --prune=all
    
    # 시스템에서 열린 파일 목록 가져오기 (프로세스, 디바이스, 종류, 포트 ) 
    lsof -i -P | grep LISTEN | grep :$PORT
    # sudo kill -9 <PID>
    
    # 80 포트
    lsof -i:80
    
    # Get history with date
    history -E
    
    # Read systemlog filter "sshd"
    cat /var/log/system.lg | grep sshd
    
    # 맥 버전 보기
    sysctl kern.version
    sysctl kern.ostype
    sysctl kern.osrelease
    sysctl kern.osrevision
    sysctl kern.osrevision
```

## Home brew

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
  - 숨김파일 보기 : SHIFT + CMD + >

- 터미널
  - 지우기 : CTR: + L

- 이모티콘 : CTRL + CMD + SPACE

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
    1. `/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist`  
    2. `Add Customized (Dictonary) -> (Add) Duplicate Current Line (String)`  
    3. `selectLine:, copy:, moveToBeginningOfLine:, paste:, moveToEndOfLine:`  
    4. Restart XCode : CMD + , -> Search `Duplicate` -> Asign -> `CTRL + SHIFT + L`
