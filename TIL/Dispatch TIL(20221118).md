# TIL(20221118)


## Process & Thread
### Process
- 실행중인 프로그램에서 단위로써의 개념을 갖고 있는 작업
- 프로그램에서 메모리에 적재되어 운영체제의 제어를 받는 상태

### Thread
- 스레드는 프로세스(실행 중인 프로그램) 내에서 실제로 작업을 수행하는 주체
- 프로그램을 실행하는 자원
- 실행되는 제어의 흐름(디스패칭되는 개체)

### Dispatch
- 어떤 메서드를 호출할 것인지를 결정하여 그것을 실행하는 매커니즘
- Swift에선 Static Dispatch와 Dynamic Dispatch 두 가지 방식이 있다
- 호출할 함수를 컴파일 타임에 결정하느냐 런타임에 결정하느냐에 따른 방식

    #### Types of Dispatch
    - 정적 디스패치는 값, 참조 타입 모두에서 지원되고 동적 디스패치는 참조타입에서만 지원된다
    - 동적 디스패치는 상속이 필요하기 때문에 참조타입에서만 지원한다

    ##### Static Dispatch(Direct Call)
    - 변수의 명목상 타입에 맞춰서 메소드와 프로퍼티를 참조한다
    - 참조될 요소를 컴파일 타임에 호출될 함수를 결정하여, 런타임 때 그대로 실행한다 
    - 컴파일 타임에 결정이 나기 때문에 성능상 이점을 가질 수 있다
    - 서브클래스의 요소를 호출하고 싶으면 명시적인 타입 캐스팅으로 변수를 자식 타입으로 만들어 줘야하기 때문에 다형성을 활용하기 어렵게 만드는 단점이 있다

    ##### Dynamic Dispatch(indirect Call)
    - 변수의 실제 타입에 맞춰서 메소드와 프로퍼티를 호출한다 
    - 코드상으로는 드러나지 않기 때문에 실제 참조 될 요소는 런타임에 호출될 함수를 결정한다
    - Swift에서는 클래스마다 함수 포인터들의 배열인 vTable(Virtual Dispatch Table)이라는 것을 유지한다
    - 하위 클래스가 메서드를 호출할 때, 이 vTable 를 참조하여 실제 호출할 함수를 결정한다
    - 이 과정들이 런타임에 일어나기 때문에 성능상 손해를 보게 된다
    
    #### final
    - 클래스, 메서드, 프로퍼티 앞에 붙있을 수 있는 키워드
    - final이 붙은 class의 경우 상속이 메서드, 프로퍼티에 따로 붙일 경우 하위 클래스에서 오버라이딩을 할 수 없다
    - ~~final이 붙은 메소드와 프로퍼티는 Static Dispatch로 동작하게 되기 때문에 성능관리를 위해서는 적절하게 final 키워드를 사용해야한다~~
    - 경우에 따라 다르지만 final한 요소로 동작을 하는 게 분명해야 Static Dispatch가 이루어진다, 그렇지 않다면 Dynamic dispatch가 이루어진다. 그럼에도 불구하고 유저의 성능을 고려한다면 일단 사용하는게 좋다
    #### extension
    - class에 extension하여 메서드를 추가한 경우 서브클래스에서 오버라이딩이 불가능하기 때문에 Static Dispatch로 동작한다
 
    #### protocol
    - protocol을 채택하여 정의한 메서드를 실행할 경우 어느 타입인지 단정을 짓지 못하기 때문에 Dynamic Dispatch로 동작한다
    - protocol 내부가 아닌 extension에만 메서드를 구현한 경우이고 class에서 채택만 하고 따로 정의를 하지 않았을 경우에는 Static Dispatch로 실행된다



## Deadlock
- 교착상태
- 두 개 이상의 process 및 thread가 서로 상대방의 작업이 끝나기만을 기다리고 있어서 task들을 처리하지 못하는 상태
```swift
// Serial Queue인 상황: 한 번에 하나의 작업만 가능 > 내부에 sync한 작업이 존재 > deadlock 발생
let testQueue = DispatchQueue(label: "testQueue")
testQueue.async {
    testQueue.sync {
        /*
        외부 블럭이 완료되기 전에 내부 블록이 시작되지 않는 상태
        외부 블럭이 완료되기를 기다리는 상태
        */
        }

        // 여기가 영원히 실행되지 않음 Deadlock 현상?
    }
```
- 같은 Queue에 보내면 같은 스레드레 배치될 수 있기 때문에 sync로 멈춰잇는 상황에서는 더 어떤 작업을 수행할 수 없는 상황