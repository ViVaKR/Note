# Ubuntu

## 127.0.0.53 DNS 비활성하기

```bash
    sudo vim /etc/systemd/resolved.conf

    # find (DNSStubListener=yes)
    # change to (DNSStubListener=no)

    # check
    resolvectl status | grep -i "DNS Serve"

```
