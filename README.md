# Note


```bash

cat /proc/meminfo
cat /proc/cpuinfo

top -p 18299
cat /proc/18233/status

sar -r 1

ps -o pid,pcpu,pmem,rss,vsz,cmd -p 18299
lscpu
dpkg --print-architecture
uname -m
echo > /dev/tcp/192.168.0.4/59273
echo $?
netstat -ntlp | grep 22
ps -ef
cat /etc/hosts
cat /etc/os-release
ssh banner
/etc/ssh/sshd_config
# 소요된 작업 시간확인
time $(sleep 1)


pgrep
df -h
iperf3
nc -zv 192.168.0.4 59273
truncate -s 0 nohup.out

# Null 파이프 이용 
: > nohup.out


# /dev/null
cat /dev/null > nohup.out
echo /bin/bash
echo /etc/shells

# 백그라운드 방식 -- & 추가
sample.sh &

# nohup (no hang up)
nohup sample.sh &

stdin  : 0, 키보드
stdout : 1, 화면
stderr : 2, 화면

# AWK 
cat a.txt | awk '{print $1 * $2;}'
awk '{print}' a.txt
awk [option] 'pattern { actin }' [FILE|VAR]
awk -F":" '/linux/ {print $1}' ./test.txt

dpkg -l
locale
cat /etc/default/locale
ls -ERR 2> log.txt
ls -ERR > log.txt 2>&1
./scripts.sh > /dev/null 2>&1


cat /etc/fstab
cat /etc/hosts
./scripts.sh > /dev/null 2>&1
```
