
# netsh

* 모든 윈도우 방화벽 규칙 확인하는 방법   
`$ netsh advfirewall firewall show rule name=all`

* 현재 프로필에 대한 모든 방화벽 규칙을 표시하는 방법   
`$ netsh advfirewall show currentprofile`

* 네트워크 인터페이스 상태를 확인하는 방법   
`$ netsh interface show interface`

* 모든 네트워크 인터페이스의 인덱스 번호를 확인하는 방법
`$ netsh interface ip show interfaces`

* 모든 무선 프로파일을 확인하는 방법   
`$ netsh wlan show profile`

* 사용 가능한 모든 무선 연결을 확인하는 방법   
`$ netsh wlan show networks`

* 무선 와이파이 비밀번호 확인하는 방법  
`$ netsh wlan show profiles name="BM_5G" key=clear`

* 모든 와이파이 프로파일과 비밀번호 확인하기  
`$ for /f "skip=9 tokens=1,2 delims=:" %i in ('netsh wlan show profiles') do @echo %j | findstr -i -v echo | netsh wlan show profiles %j key=clear`

* 사용 가능한 모든 무선 연결의 강도를 확인하는 방법  
`$ netsh wlan show networks mode=bssid`

* 사용 가능한 무선 장치에 연결하는 방법  
`$ netsh wlan connect name="BM_5G"`

* 현재 연결된 무선 장치에서 연결을 끊는 방법
`$ netsh wlan disconnect`

* 모든 무선 인터페이스를 표시하는 방법
`$ netsh wlan show interfaces`

* 무선 인터페이스의 드라이버를 표시하는 방법  
`$ netsh wlan show drivers`

* 윈도우에서 현재 프록시 설정을 확인하는 방법  
`$ netsh winhttp show proxy`

* TCP 전역 매개변수 상태를 확인하는 방법  
`$ netsh interface tcp show global`

* UDP 전역 매개 변수 상태를 확인하는 방법  
`$ netsh interface udp show global`

* 정의된 모든 별칭을 나열하는 방법  
`$ netsh show alias`

* 윈도우 에서 프록시를 설정하는 방법  
`$ netsh winhttp set proxy "myproxy.proxyaddress.com:8484" "<local>;*.proxyaddress.com"`

* 인터페이스의 IP 주소를 변경하는 방법  
`$ netsh int ip set address "local area connection" static 192.168.219.150 255.255.255.0 192.168.219.1`

* 모든 네트워크 인터페이스에 대해 멀티캐스트 조인을 표시 하는 방법  
`$ netsh interface ip show joins`

* 방화벽 포트를 허용하는 방법  
`$ netsh advfirewall firewall add rule name="Open Remote Desktop" protocol=TCP dir=in localport=3389 action=allow`

* DNS 서버를 추가하는 방법  
`$ netsh interface ip add dns name="Local Area Connetction" addr=8.8.8.8`

* Ping 요청 방화벽 허용하는 방법   
`$ netsh advfirewall firewall add rule name="All ICMP V4" dir=in action=allow protocol=icmpv4`

* Ping 요청을 방화벽 차단하는 방법  
`$ netsh advfirewall firewall add rule name="All ICMP V4" dir=in action=block protocol=icmpv4`

* 모든 프로필에서 방화벽을 사용하지 않도록 중지한는 방법  
`$ netsh advfirewall set allprofiles state off`

* 방화벽 설정을 기본값으로 다시 설정하는 방법  
`$ netsh advfirewall reset`

* 패킷을 캡처하는 방법  
`$ netsh trace start capture=yes tracefile="D:\trace_packet.etl" persistent=yes maxsize=4096`

* 패킷 캡처를 중지하는 방법  
`$ netsh trace stop`

* 패킷 txt  file로 변환하는 방법 
`$ pktmon etl2txt .\trace_packet.etl`

* 사용가능한 모든 옵션을 확인하는 방법
`$ netsh /?`


