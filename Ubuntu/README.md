# Ubuntu

## 기본 명령어

```bash

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
