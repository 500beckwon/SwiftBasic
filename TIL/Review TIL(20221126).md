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

## Closure
- 1회용 함수를 제작할 수 있는 구문
- Closure가 정의된 주변 context로부터 모든 상수와 변수의 값을 Capture하거나 레퍼런스 저장이 가능하다

## Process
- 실행중인 프로그램 단위로써의 개념을 가지고 있는 작업
- CPU를 할당받고 메모리에 올라가게 되면(동적인 상태가 되면) 작업으로써의 단위 개념을 갖게 된다
- Process는 최소 1개의 Thread를 가진다
- 서로 분리된 작업 영역을 가지고 있어 자원 공유가 어렵다(비효율적)
 
## Thread
- Process내에서 실제로 작업을 수행하는 주체
- 코드 덩어리의 연산을 통해 이루어지고 연산은 연속성의 특성을 가진다 이를 하나의 흐름(Flow)을 만들게 되고 이를 Thread라고한다
- 메모리를 공유하며 동작할 수 있다
- iOS에서는 병렬하게 동시에 실행이 가능하다
- 모든 UI는 Main Thread에서만 실행이 된다 

## Multi-Threading
- 복잡한 Process가 N개의 Thread를 사용하여 작업을 하는것 여거랙의 Process인 경우는 Multi-Tasking이라고 한다 
- 운영체제는 Process 별로 할당된 메모리 내 정보에만 접근이 가능하도록 제약을 두고 있고 CPU에서는 Thread가 최소 단위로 되어 있게 Thread가 필요 한 것
- 한 Process에서 오류가 난 것이 다른 Process에 영향을 주진 않지만 한 Thread에서 문제가 발생하면 공유 중인 메모리 영역이 존재하기에 공통된 자원을 여러 Thread 접근하게 되는 경우 Process의 실행이 종료된다 Multi-Threading 환경에서는 이를 방지하기 위한 동기화 관리가 필요하다

## GCD
- iOS의 공유된 Thread Pool을 관리하는 API
- 멀티코어 시스템에서 동시성 실행을 제공하는 프로그램 언어 요소, 런타임 라이브러리

### GCD Queue
#### Main Queue
- Main Thread인 Serial Queue를 사용
- 단 하나만 존재할 수 있고 Serial 특성을 가진다, Queue에 쌓이는 작업을 순차적으로 실행한다

#### Global Queue
- Main Thread가 아닌 다른 Thread에서 작업을 처리
- 전체 시스템에 공유되는 Concurrent queue를 사용 
- 같은 순서의 호출(실행)을 보장하지 않는다

### CustomQueue
- 개발자가 특성을 설정하여 결정 짓는 Queue
- 설정에 따라 Serial, Concurrent로 정할 수 있다

### Synchronous
- sync. Queue에서 실행 중인 작업이 끝날 때까지 다음 작업을 진행하지 않는다

### Asynchronous
- Async. Queue에 이미 작업이 있어도 다음 작업을 비동기로 동시에 진행한다

## 용어
### Context
- 개발에서 Context란 단어는 추상적인 개념으로 어떠한 행위를 할 때 필요한 정보 라는 뜻이 있지만 정확하진 않다
- 코드의 배경이 되는 조건, 환경 이러한 코드 영역을 실행할 떄 필요한 환경 정보
- Context에는 필수, 선택의 종류가 있는데 필수 Context는 메서드에서 실제 매개변수로 요구하는 것을 의미하고 선택 Context는 어디서든 어떤 것이든 담을 수 있는 Key-Value 맵이나 어떤 곳에서는 필요한 경우에 접근 가능한 Thread local storage에서 사용할 수 있다

### 멀티코어
-
