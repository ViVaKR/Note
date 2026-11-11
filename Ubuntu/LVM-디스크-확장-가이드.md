# LVM 디스크 확장 가이드
> Ubuntu + VMware Fusion + LVM + Kubernetes 환경 기준  
> 작성일: 2026-10-08

---

## 🚨 핵심 복병 — growpart 한글 로케일 버그

```bash
# ❌ 이렇게 하면 한글 OS 에서 무조건 실패!
sudo growpart /dev/nvme0n1 3
# unexpected output in sfdisk --version [util-linux 2.41.3에서 sfdisk]

# ✅ 근본 해결 — growpart 스크립트 맨 위에 추가
sudo vim /usr/bin/growpart
# #!/bin/bash 아래에 추가:
# export LC_ALL=C
# export LANG=C

# ✅ 또는 임시 우회
sudo bash -c 'export LC_ALL=C; export LANG=C; growpart /dev/nvme0n1 3'
```

---

## 전체 흐름 (VMware Fusion 용량 확장 후)

### 1단계 — VMware Fusion 에서 디스크 용량 증가
```
VMware Fusion → 설정 → 하드디스크 → 용량 변경
(VM 종료 상태에서 진행)
```

### 2단계 — 파티션 확장
```bash
# 파티션 구조 확인
lsblk

# 파티션 확장 (3번 파티션 기준)
sudo vim /usr/bin/growpart   # LC_ALL=C 추가 (최초 1회)
sudo growpart /dev/nvme0n1 3

# 성공 메시지:
# CHANGED: partition=3 start=... old: size=... new: size=...
```

### 3단계 — 파일시스템 타입 확인
```bash
lsblk -f /dev/nvme0n1p3

# FSTYPE 확인:
# LVM2_member → LVM 환경 (아래 LVM 섹션으로)
# ext4        → 일반 환경 (resize2fs 바로 실행)
# xfs         → xfs_growfs 실행
```

### 4단계 — LVM 환경 확장 (3단계)
```bash
# 4-1. 물리 볼륨 확장
sudo pvresize /dev/nvme0n1p3
# Physical volume "/dev/nvme0n1p3" changed ✅

# 4-2. 논리 볼륨 확장 (100% 전부 사용)
sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
# Logical volume successfully resized ✅

# 4-3. 파일시스템 확장
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
# The filesystem is now ... blocks long ✅
```

### 5단계 — 확인
```bash
df -h
# /dev/mapper/ubuntu--vg-ubuntu--lv  145G  57G  82G  41% /
```

---

## Kubernetes 환경 추가 확인
```bash
kubectl get pv
kubectl get pvc -A
kubectl get pods -n [네임스페이스]
```

---

## 환경별 파일시스템 확장 명령 요약

| 환경 | 명령 |
|------|------|
| 일반 ext4 | `sudo resize2fs /dev/nvme0n1p3` |
| LVM + ext4 | `pvresize` → `lvextend` → `resize2fs` |
| XFS | `sudo xfs_growfs /` |
| Btrfs | `sudo btrfs filesystem resize max /` |
| ZFS | `sudo zpool online -e poolname` |

---

## 핵심 교훈
- `growpart` 는 한글 로케일에서 버그 발생 → `/usr/bin/growpart` 에 `LC_ALL=C` 추가
- LVM 환경은 반드시 **3단계** (pvresize → lvextend → resize2fs)
- `lsblk -f` 로 파일시스템 타입 먼저 확인 후 진행
- Kubernetes PVC 는 확장 후 `kubectl get pv/pvc` 로 상태 확인

---
*buddham.co.kr 🪷*
