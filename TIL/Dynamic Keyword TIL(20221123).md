# dynamic
- Swift와 Objective-C와의 상호운용성(Interoperability)을 위해 사용하는 키워드
- 선언 앞에 사용할 경우 @objc 속성이 암시적으로 표시된다.
- class 맴버에만 사용할 수 있다

```swift
dynamic var = "dynamic"
```

- 해당 키워드를 통해 Objective-C 런타임을 사용한 Dynamic Dispatch가 가능하다
- Swift가 아닌 Objective-C 런타임을 쓰겠다는 키워드로 객체한테 메세지를 전송 -> 객체가 해당 메소드의 위치를 찾아서 실행하는 뜻을 의미한다
