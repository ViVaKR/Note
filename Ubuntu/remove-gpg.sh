#!/bin/bash

# 유지할 이메일 주소
KEEP_EMAIL="admin@vivabj.com"

# 삭제할 키 검색
DELETE_KEYS=$(gpg --list-keys --with-colons | awk -v email="$KEEP_EMAIL" -F: '
    $1 == "pub" { key = $5 }
    $1 == "uid" && $10 !~ email { print key }
' | sort -u)

# 키 삭제
for KEY in $DELETE_KEYS; do
    echo "Deleting key: $KEY"
    gpg --batch --yes --delete-key "$KEY"
done

echo "All keys except $KEEP_EMAIL have been deleted."
