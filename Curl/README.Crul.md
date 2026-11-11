# Curl

curl 명령어의 다양한 HTTP 메서드와 헤더 옵션에 대한 예시

## GET 요청

```bash
curl -X GET https://api.example.com/users

# -Method Get 은 기본값 (생략가능)
Invoke-WebRequest -Method Get -Uri "https://api.buddham.com/Demo"
```
설명: 가장 기본적인 GET 요청으로 특정 URL에서 데이터를 조회합니다. `-X GET`은 생략 가능합니다.

헤더를 추가한 GET 요청:
```bash
curl -X GET https://api.example.com/users -H "Authorization: Bearer token123" -H "Content-Type: application/json"
```
설명: Authorization과 Content-Type 헤더가 포함된 GET 요청입니다.

## POST 요청

```bash
curl -X POST https://api.example.com/users -d "name=홍길동&email=hong@example.com"
```
설명: form 데이터를 사용한 POST 요청입니다.

JSON 데이터로 POST 요청:
```bash
curl -X POST https://api.example.com/users \
  -H "Content-Type: application/json" \
  -d '{"name": "홍길동", "email": "hong@example.com"}'
```
설명: JSON 형식 데이터를 본문에 포함한 POST 요청입니다.

파일에서 데이터를 읽어 POST:
```bash
curl -X POST https://api.example.com/users \
  -H "Content-Type: application/json" \
  -d @user_data.json
```
설명: user_data.json 파일의 내용을 요청 본문으로 사용합니다.

## PUT 요청

```bash
curl -X PUT https://api.example.com/users/123 \
  -H "Content-Type: application/json" \
  -d '{"name": "김철수", "email": "kim@example.com"}'
```
설명: ID가 123인 사용자 정보를 업데이트하는 PUT 요청입니다.

## DELETE 요청

```bash
curl -X DELETE https://api.example.com/users/123
```
설명: ID가 123인 사용자를 삭제하는 DELETE 요청입니다.

헤더를 포함한 DELETE 요청:
```bash
curl -X DELETE https://api.example.com/users/123 -H "Authorization: Bearer token123"
```
설명: 인증 토큰이 포함된 DELETE 요청입니다.

## 추가 헤더 옵션 예시

### 여러 헤더 추가

```bash
curl -X GET https://api.example.com/users \
  -H "Authorization: Bearer token123" \
  -H "Accept: application/json" \
  -H "User-Agent: MyApp/1.0"
```
설명: 여러 헤더를 포함한 GET 요청입니다.

### 커스텀 헤더 추가

```bash
curl -X POST https://api.example.com/users \
  -H "X-API-Key: api_key_123" \
  -H "X-Custom-Header: 사용자정의값" \
  -d '{"name": "이영희"}'
```
설명: 커스텀 헤더(X-로 시작하는)를 포함한 POST 요청입니다.

## 유용한 추가 옵션

### 응답 헤더 보기
```bash
curl -i -X GET https://api.example.com/users
```
설명: `-i` 옵션을 사용하여 응답 헤더도 함께 출력합니다.

### 상세 정보 표시
```bash
curl -v -X GET https://api.example.com/users
```
설명: `-v` 옵션을 사용하여 요청과 응답에 대한 자세한 정보를 표시합니다.

### 응답을 파일로 저장
```bash
curl -X GET https://api.example.com/users -o response.json
```
설명: 응답을 response.json 파일로 저장합니다.

---

## 테스트 사이트

JSONPlaceholder 사이트 주소: https://jsonplaceholder.typicode.com

이 사이트에서는 다음과 같은 여러 엔드포인트를 제공합니다:
- /posts (100개의 게시물)
- /comments (500개의 댓글)
- /albums (100개의 앨범)
- /photos (5000개의 사진)
- /todos (200개의 할일)
- /users (10명의 사용자)

## 테스트 예시

```bash
# GET 요청 예시
curl -X GET https://jsonplaceholder.typicode.com/posts/1

# POST 요청 예시
curl -X POST https://jsonplaceholder.typicode.com/posts \
  -H "Content-Type: application/json" \
  -d '{"title": "테스트 제목", "body": "테스트 내용", "userId": 1}'

curl -X POST https://jsonplaceholder.typicode.com/posts `
  -H "Content-Type: application/json" `
  -d '{"title": "테스트 제목", "body": "테스트 내용", "userId": 1}'

# PUT 요청 예시
curl -X PUT https://jsonplaceholder.typicode.com/posts/1 \
  -H "Content-Type: application/json" \
  -d '{"id": 1, "title": "수정된 제목", "body": "수정된 내용", "userId": 1}'

curl -X PUT https://jsonplaceholder.typicode.com/posts/1 `
  -H "Content-Type: application/json" `
  -d '{"id": 1, "title": "수정된 제목", "body": "수정된 내용", "userId": 1}'

# DELETE 요청 예시
curl -X DELETE https://jsonplaceholder.typicode.com/posts/1
```

---

## curl에서 예제

1. `curl --manual`을 사용하면 curl의 전체 매뉴얼 페이지를 볼 수 있습니다. 여기에는 많은 예제가 포함되어 있습니다.

2. `curl --help all`을 사용하면 모든 가능한 옵션에 대한 도움말을 볼 수 있습니다.

3. `curl --help [category]`를 사용하면 특정 카테고리의 옵션에 대한 도움말을 볼 수 있습니다. 예를 들어:
   - `curl --help http`
   - `curl --help ftp`
   - `curl --help upload`
   - `curl --help verbose`

예를 들어, HTTP 관련 옵션에 대한 도움말을 보려면:
```bash
curl --help http
```

또는 curl의 공식 문서 웹사이트(https://curl.se/docs/)에서 더 많은 예제와 자세한 설명을 찾을 수 있습니다.

특정 기능이나 옵션에 대한 예제가 필요하시면 알려주시기 바랍니다.
