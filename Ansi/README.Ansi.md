# ANSI

## Escape Sequences

+ Octal: `\033`
+ Unicode: `\u001b`
+ HexaDecimal: `\x1B`
+ Decimal: `27`

## Sequence

+ ESC : 시퀀스 시작
+ CSI : 제어 시퀀스
+ DCS : 장치 제어 문자열
+ OSC : 운영체제 명령

## Cursor Controls

+ ESC[H : moves cursor to home position (0,0)

<h1 style="color:#ff0000">
\x1b [ 31;4 m
</h1>

+ `\x1b` : CSI (Control Sequence Introducer), ESC character in Hex ASCII, `\e`, `\033`
+ `31;4` : Color codes, [<PREFIX>] ; [<COLOR>] ; [<TEXT DECORATION>]
+ `m` : Finishing symbox

Part of the CSI Finishing symbol
ESC character in Hex ASCII

Vector : 숫자들의 순서쌍
Dense vector : 대부분의 숫자가 0 이 아닌 값으로 채워져 있는 벡터
Sparse vector : 대부분의 숫자가 0 인값으로 채워저 있는 벡터
