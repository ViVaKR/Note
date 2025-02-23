# BASH

---

### **예제 1: 특정 컬럼 추출하기**

**대상 파일**: `data.csv`

```
이름,나이,직업
김철수,30,개발자
이영희,25,디자이너
박민수,35,매니저
```

**목적**: 두 번째 컬럼(나이)만 추출
**명령어**:

```bash
awk -F',' '{print $2}' data.csv
```

**결과**:

```
나이
30
25
35
```

---

### **예제 2: 조건에 맞는 행 필터링**

**대상 파일**: `employees.txt`

```
John Sales 5000
Alice Engineer 7000
Bob Manager 6000
```

**목적**: 세 번째 컬럼(급여)이 6000 이상인 행 출력
**명령어**:

```bash
awk '$3 >= 6000 {print $0}' employees.txt
```

**결과**:

```
Alice Engineer 7000
Bob Manager 6000
```

---

### **예제 3: 합계 계산**

**대상 파일**: `sales.txt`

```
2023-01-01 150
2023-01-02 200
2023-01-03 180
```

**목적**: 두 번째 컬럼의 총합 계산
**명령어**:

```bash
awk '{sum += $2} END {print "총합: " sum}' sales.txt
```

**결과**:

```
총합: 530
```

---

### **예제 4: 로그 파일에서 특정 패턴 검색**

**대상 파일**: `app.log`

```
[ERROR] DB 연결 실패
[INFO] 사용자 로그인 성공
[WARN] 메모리 부족
```

**목적**: "ERROR"가 포함된 로그만 출력
**명령어**:

```bash
awk '/ERROR/ {print}' app.log
```

**결과**:

```
[ERROR] DB 연결 실패
```

---

### **예제 5: 여러 파일 동시 처리**

**대상 파일**: `file1.txt`, `file2.txt`

```
# file1.txt
Apple 3
Banana 5

# file2.txt
Orange 4
Grape 2
```

**목적**: 모든 파일의 두 번째 컬럼 합계
**명령어**:

```bash
awk '{sum += $2} END {print "전체 합계: " sum}' file1.txt file2.txt
```

**결과**:

```
전체 합계: 14
```

---

### **예제 6: 사용자 정의 구분자 사용**

**대상 파일**: `custom.txt`

```
이름|나이|주소
김철수|30|서울
이영희|25|부산
```

**목적**: 파이프(`|`)로 구분된 파일에서 주소 추출
**명령어**:

```bash
awk -F'|' '{print $3}' custom.txt
```

**결과**:

```
주소
서울
부산
```

---

### **예제 7: 복합 조건 처리 (AND/OR)**

**대상 파일**: `students.csv`

```
이름,점수,과목
김철수,85,수학
이영희,92,과학
박민수,78,영어
```

**목적**: 점수가 80 이상 **이면서** 과목이 "과학"인 행 찾기
**명령어**:

```bash
awk -F',' '$2 >= 80 && $3 == "과학" {print $0}' students.csv
```

**결과**:

```
이영희,92,과학
```

---

### **예제 8: 문자열 결합**

**대상 파일**: `users.txt`

```
user1:John:Doe
user2:Jane:Smith
```

**목적**: Full Name 생성 (예: "John Doe")
**명령어**:

```bash
awk -F':' '{print $2 " " $3}' users.txt
```

**결과**:

```
John Doe
Jane Smith
```

---

### **예제 9: 파일 내용 변환 (대문자로)**

**대상 파일**: `fruits.txt`

```
apple
banana
cherry
```

**목적**: 모든 단어를 대문자로 변환
**명령어**:

```bash
awk '{print toupper($0)}' fruits.txt
```

**결과**:

```
APPLE
BANANA
CHERRY
```

---

### **예제 10: NR과 NF 변수 활용**

**대상 파일**: `data.txt`

```
사과 1000 3
바나나 2000 5
```

**목적**: 각 행의 번호와 컬럼 수 출력
**명령어**:

```bash
awk '{print "행 번호:" NR, "컬럼 수:" NF}' data.txt
```

**결과**:

```
행 번호:1 컬럼 수:3
행 번호:2 컬럼 수:3
```

---

### **예제 11: BEGIN/END 블록 사용**

**대상 파일**: `numbers.txt`

```
10
20
30
```

**목적**: 계산 전후로 메시지 출력
**명령어**:

```bash
awk 'BEGIN {print "계산 시작"} {sum += $1} END {print "계산 완료", "합계: " sum}' numbers.txt
```

**결과**:

```
계산 시작
계산 완료 합계: 60
```

---

### **예제 12: 패턴 범위 처리**

**대상 파일**: `text.txt`

```
시작
A
B
C
종료
D
E
```

**목적**: "시작"부터 "종료" 사이의 내용 출력
**명령어**:

```bash
awk '/시작/,/종료/' text.txt
```

**결과**:

```
시작
A
B
C
종료
```

---

### **예제 13: 필드 값 수정**

**대상 파일**: `price.txt`

```
상품:가격
노트북:1000000
마우스:20000
```

**목적**: 가격에 10% 인상 후 출력
**명령어**:

```bash
awk -F':' -v OFS=':' '{$2 = $2 * 1.1; print}' price.txt
```

**결과**:

```
상품:가격
노트북:1.1e+06
마우스:22000
```

---

### **예제 14: 중복 행 제거**

**대상 파일**: `duplicates.txt`

```
Apple
Banana
Apple
Orange
```

**목적**: 중복된 행 제거 후 출력
**명령어**:

```bash
awk '!seen[$0]++' duplicates.txt
```

**결과**:

```
Apple
Banana
Orange
```

---

### **예제 15: 여러 파일 처리 후 결과 병합**

**대상 파일**: `fileA.txt`, `fileB.txt`

```
# fileA.txt
100
200

# fileB.txt
300
400
```

**목적**: 모든 파일의 숫자 합계
**명령어**:

```bash
awk '{sum += $1} END {print sum}' fileA.txt fileB.txt
```

**결과**:

```
1000
```

---

### **예제 16: 정규 표현식으로 필터링**

**대상 파일**: `emails.txt**

```
user1@example.com
invalid_email
user2@test.org
```

**목적**: 유효한 이메일 형식만 출력
**명령어**:

```bash
awk '/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/' emails.txt
```

**결과**:

```
user1@example.com
user2@test.org
```

---

### **예제 17: 특정 행 번호 출력**

**대상 파일**: `lines.txt**

```
첫 번째 줄
두 번째 줄
세 번째 줄
```

**목적**: 2번째 행 출력
**명령어**:

```bash
awk 'NR == 2' lines.txt
```

**결과**:

```
두 번째 줄
```

---

### **예제 18: 조건부 서식 지정 출력**

**대상 파일**: `grades.txt**

```
김철수 90
이영희 85
박민수 95
```

**목적**: 90점 이상이면 "[A]" 추가
**명령어**:

```bash
awk '{grade = ($2 >= 90) ? "[A] " $0 : $0; print grade}' grades.txt
```

**결과**:

```
[A] 김철수 90
이영희 85
[A] 박민수 95
```

---

### **예제 19: 여러 구분자 혼용**

**대상 파일**: `mixed.txt**

```
Name=John;Age=30
Name=Alice;Age=25
```

**목적**: `Name`과 `Age` 값 추출
**명령어**:

```bash
awk -F'[=;]' '{print $2, $4}' mixed.txt
```

**결과**:

```
John 30
Alice 25
```

---

### **예제 20: 파일 비교 후 차이점 찾기**

**대상 파일**: `list1.txt`, `list2.txt**

```
# list1.txt
Apple
Banana
Orange

# list2.txt
Banana
Grape
```

**목적**: `list1.txt`에만 있는 항목 찾기
**명령어**:

```bash
awk 'NR==FNR {a[$0]; next} !($0 in a)' list2.txt list1.txt
```

**결과**:

```
Apple
Orange
```

---

이렇게 다양한 예제들을 통해 awk의 강력한 기능을 활용해 보세요! 더 궁금한 점이 있으면 언제든 물어보세요. 😊

```bash
awk '{sum += $2} END {print "총합: " sum}' file5 file6
awk '!seen[$0]++' dup.txt  
```


