# Ubuntu

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
```
