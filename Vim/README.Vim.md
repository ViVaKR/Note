# Vim Cheat Sheet

## Mode

1. Normal
    - esc
    - 커서 움직이기, 특정 명령 수행
2. Insert
    - i, a, I, A
    - 문자열 입력
3. Command
    - :
    - 문서저장, 종료, 문자열 찾기 또는 수정하기
4. Visual
    - CTRL + V, SHIFT + V
    - 마우스 드래그 하여 블럭을 씌우는 역할 수행
    - 문서 내 범위 지정

## 일반

    :h[elp] keyword - 도움말 열기
    :sav[eas] file - 다른 이름으로 저장
    :clo[se] - 현재 창 닫기
    :ter[minal] - 터미널 열기
    :set nu - view number
    :set nonu - hide number
    :set ignore - case insensitive

## 커서이동

    h - 왼쪽으로 한 칸 이동
    j - 아래로 한 칸 이동
    k - 위로 한 칸 이동
    l - 오른쪽으로 한 칸 이동
    gj - 다음 문장으로 이동 (한 문장이 여러 줄로 나뉘어 있을 경우)
    gk - 이전 문장으로 이동 (한 문장이 여러 줄로 나뉘어 있을 경우)
    H - 현재화면 상단으로 점프
    M - 현재화면 중단으로 점프
    L - 현재화면 하단으로 점프
    w - 다음 단어 시작으로 점프
    W - 다음 단어 시작으로 점프 (특수문자 포함)
    e - 다음 단어 끝으로 점프
    E - 다음 단어 끝으로 점프 (특수문자 포함)
    b - 이전 단어 시작으로 점프
    B - 이전 단어 시작으로 점프 (특수문자 포함)
    ge - 이전 단어 끝으로 점프
    gE - 이전 단어 끝으로 점프 (특수문자 포함)
    % - 현재 괄호의 짝으로 점프 (:h matchpairs를 통해 더 많은 정보를 얻을 수 있습니다.)
    0 - 현재 행 시작으로 점프 (공백 포함)

    ^ - 현재 행 시작으로 점프
    $ - 현재 행 끝으로 점프 (공백 포함)

    gg - 문서 첫 줄 시작으로 점프
    G - 문서 끝 줄 시작으로 점프

    5gg or 5G - 5번째 행 시작으로 점프
    gd - 지역변수 선언위치로 점프
    gD - 전역변수 선언위치로 점프
    fx - 다음 검색 문자 x로 점프
    tx - 다음 검색 문자 x 앞에 점프
    Fx - 이전 검색 문자 x로 점프
    Tx - 이전 검색 문자 x 뒤에 점프
    ; - 최근 f/t/F/T 명령어 실행
    , - 최근 F/T/f/t 명령어 실행
    } - 다음 단락으로 점프
    { - 이전 단락으로 점프

    zz - 화면 위치 중간으로 조정
    zt - 화면 맨 위로 커서 이동
    zb - 화면 맨 아래로 커서 이동

    Ctrl + e - 한 줄 아래로 화면 조정
    Ctrl + y - 한 줄 위로 화면 조정
    Ctrl + b - 한 화면 위로 조정
    Ctrl + f - 한 화면 아래로 조정
    Ctrl + d - 반 화면 아래로 조정
    Ctrl + u - 반 화면 위로 조정
    Tip 이동 명령 앞에 숫자를 붙이면 그 수만큼 반복합니다. 예를 들면, 4j는 4행 아래로 이동합니다.

## 삽입 모드

    i - 현재 커서 앞에 삽입
    I - 현재 커서 행 시작에 삽입
    a - 현재 커서 뒤에 삽입
    A - 현재 커서 행 끝에 삽입
    o - 현재 커서 행 아래에 새 행을 삽입
    O - 현재 커서 행 위에 새 행을 삽입
    ea - 단어 끝 뒤에 삽입
    Ctrl + h - 이전 문자 제거
    Ctrl + w - 이전 단어 제거
    Ctrl + j - 한 줄 바꿈
    Ctrl + t - 한 탭 들여쓰기
    Ctrl + d - 한 탭 내어쓰기
    Ctrl + n - 다음 단어 탐색 (자동완성)
    Ctrl + p - 이전 단어 탐색 (자동완성)
    Ctrl + rx - 레지스터 x의 내용 삽입
    Ctrl + ox - 일시적으로 삽입 모드에서 노멀 모드로 이동하여 command x 실행
    Esc or Ctrl + c - 삽입모드 종료

## 편집 모드

    r - 한 글자 바꾸기
    R - 한 글자 이상 바꾸기(ESC 누르면 종료)
    J - 현재 행과 다음 행 연결
    gJ - 현재 행과 다음 행 연결 (공백무시)
    gwip - 단락 리플로우
    g~ - 커서 이동으로 대·소문자 전환
    g~$ - 커서에서 끝까지 대소문 변환
    gu - 커서 이동으로 소문자 전환
    gU - 커서 이동으로 대문자 전환
    cc - 한 행 전체 새로 쓰기
    c$ or C - 한 행 끝까지 새로 쓰기
    ciw - 한 단어 전체 새로 쓰기
    cw or ce - 한 단어 끝까지 새로 쓰기
    s - 한 문자 새로 쓰기
    S - 한 행 전체 새로 쓰기 (cc와 동일)
    xp - 잘라내고 붙여넣기
    u - 실행취소
    U - 최근 수정한 줄 복원(실행취소)
    Ctrl + r - 다시실행
    . - 최근 명령어 반복
    x -

## 선택 모드 (비주얼 모드)

    v - 비주얼 모드
    V - 비주얼 라인
    o - 선택 영역 반대쪽 끝으로 점프

    * Ctrl + v - 비주얼 블록 : up/down -> `Shift + i` -> type the text -> Esc
    * Shift + Alt + Up/Down Arrow
    O - 블록의 반대쪽 모서리로 이동, 시작 커서 현재 커서 토글.
    aw - 단어 선택
    ab - 소괄호() 구간 선택
    aB - 중괄호{} 구간 선택
    at - 태그<> 구간 선택
    ib - 소괄호() 내부 선택
    iB - 중괄호{} 내부 선택
    it - 태그<> 내부 선택
    Esc or Ctrl + c - 선택 모드 종료
    Tip b 또는 B 대신에 ( 또는 { 사용가능.
    gv - 이전 블록 재 선택

    - hello("Hi everyone fine!") {fine Thanks} < tags > hhh

## 선택 모드 명령
    >
    > - 선택 행 들여쓰기
    < - 선택 행 내어쓰기
    y - 선택 구간 복사
    d - 선택 구간 삭제
    ~ - 대소문자 반전
    u - 선택 구간 소문자 전환
    U - 선택 구간 대문자 전환

## 레지스터

    - 레지스터는 [쌍따옴표(") + 문자] 로 지정
    - 레지스터 이름을 받을 수 잇는 명령어
      - 일반적인 삭제(d, D, x, X)
      - 교체 (s, S)
      - 복사 (y)
    - 운영체제와 공유 : "+ or "*

    :reg[isters] - 레지스터 내용 확인
    "xy - 레지스터 x 복사
    "xp - 레지스터 x 붙여넣기
    "+y - 클립보드 복사
    "+p - 클립보드 붙여넣기

        Tip 특수 레지스터:
             0 - 최근 복사 레지스터
             " - 최근 사용 레지스터
             % - 현재 파일명
             # - 대체 파일명
             * - 클립보드 (X11 primary)
             + - 클립보드 (X11 clipboard)
             / - 최근 검색 패턴
             : - 최근 Vim 명령줄
             . - 최근 삽입 텍스트
             - - 최근 제거 문자
             = - 표현식 레지스터
             _ - 블랙홀 레지스터

## 마킹

    :marks - 마킹 항목 표시
    ma - 현재 위치를 a로 마킹
    `a - 마크 a로 점프
    y`a - 마크 a까지 복사
    `0 - 종료 전 커서위치로 점프
    `" - 최근 편집한 커서 위치로 점프
    `. - 최근 변경한 커서 위치로 점프
    `` - 최근 점프 전 위치로 점프
    :ju[mps] - 점프목록
    Ctrl + i - 이전 점프목록 위치로 점프
    Ctrl + o - 다음 점프목록 위치로 점프
    :changes - 변경목록
    g, - 이전 변경목록 위치로 점프
    g; - 다음 변경목록 위치로 점프
    Ctrl + ] - 커서가 가리키는 태그로 점프
    Tip 마킹한 곳으로 점프 시 그레이브 액센트 (`) 또는 아포스트로피 (') 모두 사용가능합니다. 아포스트로피 사용 시, 마킹한 곳의 줄 머리로 이동합니다. (공백 미포함)

## 매크로

    q - 매크로 기록 중지
    @a - 매크로 a 실행
    @@ - 최근 매크로 재실행
    yy - 한 행 복사하기
    2yy - 2줄 복사하기
    yw - 다음 단어까지 복사하기
    yiw - 한 단어 복사하기
    yaw - 한 단어 복사하기 (공백포함)
    y$ or Y - 한 행 끝까지 복사하기
    p - 커서 뒤에 붙여넣기
    P - 커서 앞에 붙여넣기
    gp - 커서 뒤에 붙여넣고 붙여넣은 행 다음으로 커서 옮기기
    gP - 커서 앞에 붙여넣고 붙여넣은 행 다음으로 커서 옮기기
    dd - 한 행 잘라내기
    2dd - 2줄 잘라내기
    dw - 다음 단어까지 잘라내기
    diw - 한 단어 잘라내기
    daw - 한 단어 잘라내기 (공백포함)
    :3,5d - 3행 부터 5행 까지 삭제

### Tip 특정 범위를 지정하기 위해 다음과 같은 문자들을 사용할 수 있습니다

    e.g.
    :.,$d - 현재 행 부터 끝까지
    :.,1d - 현재 행 부터 처음까지
    :10,$d - 10 번째 행 부터 처음까지

    :g/{pattern}/d - 패턴을 포함하는 모든 행 삭제
    :g!/{pattern}/d - 패턴을 포함하지 않는 모든 행 삭제
    d$ or D - 한 행 끝까지 잘라내기
    x - 한 문자 잘라내기

## 문단모양

    >> - 한 탭 들여쓰기
    << - 한 탭 내어쓰기
    >% - 중·소괄호 구간 들여쓰기
    <% - 중·소괄호 구간 내어쓰기
    >ib - 소괄호 내부 들여쓰기
    >at - 태그 구간 들여쓰기
    3== - 3줄 자동정렬
    =% - 중·소괄호 구간 자동정렬
    =iB - 중괄호 내부 자동정렬
    gg=G - 전체 버퍼 자동정렬
    ]p - 붙여쓰고 현재 행 들여쓰기 조

## 나가기

    :w - 저장하기
    :w !sudo tee % - 관리자로 저장하기
    :wq or :x or ZZ - 저장하고 나가기
    :q - 나가기 (변경확인)
    :q! or ZQ - 나가기 (변경무시)
    :wqa - 모든 탭 저장하고 나가기

## 검색과 바꾸기

    /pattern - 패턴 검색 (순방향)
    ?pattern - 패턴 검색 (역방향)
    \vpattern - 특수 매직 패턴
    n - 다음 검색항목으로 점프, repeat forward
    N - 이전 검색항목으로 점프, repeat backward
    :%s/old/new/g - 모든 old를 new로 바꾸기
    :%s/old/new/gc - 모든 old를 new로 확인하며 바꾸기
    :noh[lsearch] - 검색 하이라이트 제거

## 여러 파일 검색

    :vim[grep] /pattern/ {`{file}`} - 여러 파일에서 패턴 검색
    e.g. :vim[grep] /foo/ **/*
    :cn[ext] - 다음 검색항목으로 점프
    :cp[revious] - 이전 검색항목으로 점프
    :cope[n] - 일치 목록을 새 창으로 열기
    :ccl[ose] - 일치 목록 창 닫기

## 탭

    :tabnew or :tabnew {page.words.file} - 새 탭에서 파일 열기
    Ctrl + wT - 현재 분할 창을 새로운 탭으로 이동
    gt or :tabn[ext] - 다음 탭으로 이동
    gT or :tabp[revious] - 이전 탭으로 이동
    #gt - #번째 탭으로 이동
    :tabm[ove] # - 현재 탭을 #번째로 이동
    :tabc[lose] - 현재 탭과 그 안의 창들 닫기
    :tabo[nly] - 현재 탭 이외의 모든 탭 닫기
    :tabdo command - 모든 탭에서 command 실행하기 (예를 들어, :tabdo q - 열린 모든 탭 닫기)

## 여러 파일 작업

    :e[dit] file - 새 버퍼에서 파일 편집
    :bn[ext] - 다음 버퍼로 이동
    :bp[revious] - 이전 버퍼로 이동
    :bd[elete] - 버퍼 삭제 (파일 닫기)
    :b[uffer]# - #번째 버퍼로 이동
    :b[uffer] file - 파일명 버퍼로 이동
    :ls or :buffers - 열린 버퍼 모두 나열
    :sp[lit] file - 새 버퍼에 파일 열고 상하로 창 분할
    :vs[plit] file - 새 버퍼에 파일 열고 좌우로 창 분할
    :vert[ical] ba[ll] - 모든 버퍼 열고 좌우로 창 분할
    :tab ba[ll] - 모든 버퍼 열고 탭으로 창 분할
    Ctrl + ws - 상하로 창 분할
    Ctrl + wv - 좌우로 창 분할
    Ctrl + ww - 창 전환
    Ctrl + wq - 창 닫기
    Ctrl + wx - 창 바꾸기
    Ctrl + w= - 모든 창 크기 조정
    Ctrl + wh - 왼쪽 창으로 이동
    Ctrl + wl - 오른쪽 창으로 이동
    Ctrl + wj - 아래 창으로 이동
    Ctrl + wk - 위 창으로 이동
    Ctrl + wH - 현재 창을 최대 높이인 상태로 왼쪽 이동(가장 왼쪽)
    Ctrl + wL - 현재 창을 최대 높이인 상태로 오른쪽 이동(가장 오른쪽)
    Ctrl + wJ - 현재 창을 최대 너비인 상태로 아래로 이동(가장 아래쪽
    Ctrl + wK - 현재 창을 최대 너비인 상태로 위로 이동(가장 위쪽)

## 비교

    zf - 폴딩 정의
    zd - 폴드 제거
    za - 폴드 설정
    zo - 폴드 열기
    zc - 폴드 닫기
    zr - 한 단계씩 폴드 열기
    zm - 한 단계씩 폴드 접기
    zi - 스마트 폴딩
    ]c - 다음 수정으로 점프
    [c - 이전 수정으로 점프
    do or :diffg[et] - 다른 버퍼에서 차이점 얻기
    dp or :diffpu[t] - 다른 버퍼로 차이점 보내기
    :diffthis - 현재 창 비교모드 열기
    :dif[fupdate] - 비교모드 새로고침
    :diffo[ff] - 현재 창 비교모드 닫기

- `di"` = delete inside quote "sdjklfsjdkfsdl", []
- `di[`
- `di{`
- d + {Motion} - Motion (h,i,k,l)
- dj - 현 커부 아 줄을 삭제

## Playground

```javascript
const animals = ['pigs', 'goats', 'sheep' ];
const obj = { 1: 'one', 2: 'two', 3:'three' };
const count = animals.push('cows');
// expected output: 4
console.log(count) // 주석까지 삭제 하기. dt/
// Remove Right OfRAll
animals.push('chickens', 'cats', 'dogs');
console.log(animals);

```

// expected output: 4
Y (yank, pull) : 현재 라인을 복사
yy
p (put) : 복사한 내용을 붙여넣기
P

## 운영체제 클립보드에서 Vim으로 붙여넣기

- Normal Mode 에서 `"*p` 를 순차적으로 입력하면 클립보드의 내용이 커서 다음에 붙여넣어진다.
- Normal Mode 에서 `"*P` 를 순차적으로 입력하면 클립보드의 내용이 커서 이전에 붙여넣어진다.
- Insert Mode 에서 ctrl + r 을 입력 후 "* 를 순차적으로 입력하면 클립보드의 내용이 커서를 기점으로 붙여넣어진다.
- 레지스터를 지정하는 방법이 쌍따옴표(")와 레지스터 이름을 나타내는 문자를 연결시키는 것이었다. 위 명령들에서 "* 는 클립보드를 지시하는 레지스터다.
- 마찬가지로 레지스터명으로 "+ 을 입력해도 동일한 결과를 볼 수 있다.

## Vim 에서 운영체제 클립도드로 복사하기

- `*y{모션}` 명령 또는 `"*Y` 명령을 활용하여 클립보드로 원하는 내용을 복사한다.
- y 대신 삭제 관련 명령을 활용하여 지워진 내용이 클립보드에 복사되도록 할 수도 있다

## 모션으로 활용가능한 기본 커서 이동 명령

- h, j, k, l
- w, W, b, B, e, E
- gg, G
- 0, ^, $

## 워드단위 모션

- iw, iW, ip, ie
- aw, aW, ap, ae

- s
- S
- C
// Some Code
// Some Code
// Some Code
// NiceThanks Code
// NiceThanks Code
// NiceThanks Code
// NiceThanks Code
// NiceThanks Code
// NiceThanks Code
// Some Code
// Some Code
// Some Code
// Some Code
// Some Code

## Replace Term

`:%s/origin/replace/g`

## Within Specific Lines

`:start_line_number, end_line_number s/search_term/replace_term/g`

`yy -> jj -> 5p`

`5dd`

"show me the money please"

-> 5fe # 5번째 e
int a = 123
`Ctrl + x`

- Undo : `u`
- Redo : `Ctrl + r`

Hello, World Good Morning Fine Hi Temp
