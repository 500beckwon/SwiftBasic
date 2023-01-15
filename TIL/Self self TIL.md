# Self와 self의 차이

## self
- self 는 모든 인스턴스들이 암시적으로 생성하는 프로퍼티

```swift
/* 
    용도 1
    인스턴스 내부에 같은 이름으로 선언된 변수들이 있을 경우 더 명확히 명시하기 위해 사용
    생성자 내부에 있는 지역 변수, 매개 변수, 인스턴스 프로퍼티 순으로 무엇을 지칭하는 지 찾고
    인스턴스 프로터피로 지칭해주기 위해서 사용됨
*/ 
class PersonA {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

/* 
    용도 2
    값 타입 인스턴스 자체의 값을 치환하기 위하 사용
*/
struct Calculator {
    var number: Int = 0
    mutating func plus(num: Int) {
        self.number += num
    }
    
    mutating func reset() {
        self = Calculator()
    }
}
```

## Self
- Self 타입은 특정한 Type이 아니고 타입의 이름을 반복해서 사용하는 대신에 현재 타입을 쓸 수 있도록 도와준다
- class, struct, enum 등에서 Self를 사용하면 그 타입 자체를 가르킨다
- 타입 프로퍼티와 타입 메서드를 가리킬 때 사용된다
```swift
class SuperClass { 
    func justType() -> Self {
        return self
    }
}

class SubClass: SuperClass {  }
    
let x = SuperClass()
x.justType() // SuperClass

let y = SubClass()
y.f() // SubClass


```


## 용도
- 포로토콜, 프로토콜 확장을 사용할 때 self는 내부의 값, Self는 프로토콜을 준수하는 타입을 의미한다
### self
- 인스턴스 내부에서 인스턴스 속성을 가르킬 때
- 타입속성 메서드에서 타입 자체를 가르킬 때
- 타입자체의 형태를 가르킬 때

### Self
- 프로토콜에서 채택하는 타입을 지칭할 때
- 타입을 확장할 때 내부에서 타입을 선언할 때
- 타입 내부에서 타입 속성 및 타입 메서드를 지칭할 때 

### 예시
```swift

extension BinaryInteger {
    func squared() -> Self { 
        return self * self
    }

    func plus() -> Self {
        return self + self
    }
}

10.squared() // 100
10.plus() // 20
```
