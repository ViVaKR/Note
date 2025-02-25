# GIT

```bash
# 1. rebase
<<<<<<< HEAD
로컬 변경 사항
=======
원격 변경 사항
>>>>>>> commit-hash

# 2. 충돌해결
<<<<<<< HEAD
로컬에서 수정한 내용
=======
원격에서 수정한 내용
>>>>>>> commit-hash

# 3. 충돌 해결 후 파일 스테이징
git add README.md

# 4. 리베이스 계속 진행
git rebase --continue

# 5. 변경사항 푸시
git push origin main




git status -s

git log --oneline --decorate --graph --all

```

## .gitignore

```gitignore

# 현재 디렉토리에 있는 TODO 는 무시하하고 subdir/TODO 처럼 하위디렉토리에 있는 파일은 무시하지 않음
/TODO

# doc 디렉토리 아래의 모든 .pdf 파일을 무시
doc/**/*.pdf

```
