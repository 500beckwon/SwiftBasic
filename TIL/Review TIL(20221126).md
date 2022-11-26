# **2022.11.18 ~ 2022 11.25 TIL>**  복습 TIL

## dynamic Keyword
- Swift와 Objective-C의 상호운용성을 위해 사용하는 키워드
- 동적 디스패치(Dynamic Dispatch)를 사용하게 된다₩
- 해당 키워드를 사용하면 자동으로 @objc 속성이 부여된다
- 주로 앱 분석을 위한 코드를 동적으로 삽입할 때나 Objectvie-C에서 사용하는 코드(기능)을 그대로 Swift에서 실행하고 싶을 때 사용한다

## subscript
- class, struct, enum에서 시퀸스의 맴버 요소에 접근하기 위한 바로가기 첨자
- 한 타입에 여러개의 서브스크립트 정의 가능
- set-only를 제외하고 모두 가능하다
- class type, static type 전부 가능
