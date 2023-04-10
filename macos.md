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

## 맥 단축키 (mac shortcuts)

- 파인더에서 숨김파일 보기 : Shift + CMD + >
