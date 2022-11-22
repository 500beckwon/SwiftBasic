
# TIL(20221119)


## 집단 자료형
- 서로 관련이 있는 데이터끼리 모아서 관리할 수 있도록 하는 타입

### Array
- 일련번호로 구분되는 순서에따라 데이터가 정렬된 목록 형태의 자료형
    #### 특징
    - 배열에 저장할 아이템의 타입은 제약이 없지만 하나의 배열에 저장하는 아이템 타입은 모두 같아야 한다
    - 선언 시 배열에 저장할 아이템 타입을 명확히 정의해야 한다
    - 배열의 크기는 동적으로 확장 가능
    #### 동적추가 기능
    ##### append(_:)
    - 배열 맨 뒤에 입력된 값을 추가
    - 배열에서 일반적으로 존재하지 않는 인덱스에 접근 하면 오류가 발생하므로 아이템 추가 전에 배열의 크기를 +1 확장하여 공간을 확보한 후 인자값을 마지막 인덱스에 추가하는 기능
    ##### insert(_:at:)
    - 입력 받은 값을 원하는 위치에 직접 추가하는 기능, 일종의 끼어들기 
    ##### append(contentsOf:)
    - 단일 값이 아는 배열자체를 인자로 받아 마지막에 뭉텅이로 추가하는 메서드
### Set
- 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형
- 순서 없는 데이터를 사용할 때 사용하며 중복된 값은 한 번만 저장된다
### Tuple
- 종류에 상관 없이 데이터들을 모은 자료형 수정 및 삭제를 할 수 없음
- 소괄호로 묶어서 나열된 데이터를 사용, 내부적으로 순서가 있지만 순회처리를 지원하지 않는다
```swift
func getTupleValue() -> (String, String, Int) {
    return ("t", "v", 100)
}

let (a, b, c) = getTupleValue() 
let (_, b, c) = getTupleValue() 
```
### Dictionary 
- 배열과 유사하나 일련번호 대신 Key를 사용하여 키 값으로 연관된 데이터들이 순서 없이 모인 자료형


## Access Control(접근 제어자)
- 접근 제어자는 코드를 작성하는 한 파일에서 다른 파일에 있는 코드에 대한 접근을 명시적으로 작성하여 이를 관리하는 것
- class, enum, struct 등에 특정 접근수준을 지정할 수 있고, 타입 내부의 프로퍼티, 메서드, 이니셜라이저, 서브스크립트 각각에도 접근수준을 지정할 수 있다
- 따로 명시하지 않으면 internal로 암묵적으로 지정된다
- 상위 요소보다 하위 요소가 더 높은 접근 수준을 가질 수 없다
- getter setter에 서로 다른 접근제어자를 적용할 수 있다
- open과 public를 타입의 접근 수준으로 지정할 때 구성원은 자동으로 타입의 접근 수준이 아닌 internal로 정해지기 때문에 외부 모듈에서 사용할 필요가 있을 시 구성원들의 접근 수준을 public과 open으로 하나하나 명시해야 한다

### open(개방 접근 수준, 모듈 외부)
### public(공개 접근 수준, 모듈 외부)
### internal(내부 접근 수준, 모듈 내부)
### fileprivate(파일 외부 비공개 접근 수준,파일 내부)
### private(비공개 접근 수준, 기능 정의 내부)

### open과 public의 차이
- 모든 모듈에서 subclass가 가능하지만 public은 불가능하다
- open은 class에서만 사용이 가능하다
- 한 모듈에서 만든 class를 Super class로 하는 SubClass를 다른 모듈에서 만들기 위해서는 해당 Super class가 open으로 선언되어야 한다 이는 overriding에도 적용된다
```swift
// 별다른 조건이 더 없다면 name의 getter은 internal이고 setter은 private가 된다
private(set) var name: string

public struct Car {
  fileprivate var _engine: String

  public var engine: String {
    get {
        return self._engine
    } set {
        self._engine = newValue
    }
  }
}

// 위의 코드를 getter와 setter에 대해 더 간결하고, 명확하게 정의할 수 있다
public struct Car {
  fileprivate(set) var engine: String
}

```

### Tuple Types
- 튜플 타입에 대한 접근 수준은  해당 튜플에 사용된 모든 타입 중 가장 제한적인 접근 수준
- internal 접근 권한과 private 접근 권한이 있는 두가지 타입의 튜플을 작성하는 경우, 해당 복한 튜플 타입의 접근 수준은 private가 된다 
- 튜플 타입의 접근 레벨은 튜플 타입이 사용될 때 자동으로 추론되며, 명시적으로 지정할 수 없다

### Function Types
- 함수 타입에 대한 접근 수준은 함수의 매개변수 타입 및 리턴 타입에 대해 가장 제한적인 접근 수준으로서 계산된다 
- 함수의 계산된 접근 수준이 컨텍스트 기본값과 일치하지 않으면, 접근 정의 수준을 함수 정의의 일부로 명시적으로 지정해야 한다 
```swift
internal class SomeInternalClass {}
private class SomePrivateClass {}
 
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here        
}

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here
}
```

## 용어들
### Module
- 배포할 코드의 묶음 단위
- 모듈은 하나의 프레임워크, import 키워드러 추가되는 것들을 의미한다 
- 프로젝트 하위에 있는 targets도 각각 하나의 모듈이라 할 수 있다 
- 모듈 안에 있는 파일들을 source file이라고 한다
### Source file
- 하나의 스위프트 소스 코드 파일을 의미

### Entity
- 접근 제어자를 작성할 수 있는 Property, method, class, struct 등의 집합을 의미한다
### Literal(리터럴)
- 값 자체, 값이 변수나 상수에 담긴 형태가 아니라 그에 저장되는 값 자체
```swift
var size = 180 // size 변수에 180이라는 리터럴을 대입
Int(size) // 변수를 사용하는 예
Int("170") // 리터럴을 사용하는 예
```

### Hash, 해시 연산
- 임의의 입력된 메세지를 고정 길이의 크기로 변환해주는 알고리즘 해시 알고리즘이라고도 한다
- 이를 사용하면 길거나 짧은 데이터를 고정 길이의 데이터로 변환할 수 있다

### Binding
- 프로그램 구성 요소의 성격을 결정, 변수의 데이터 타입이 정해지는 것
- 함수 주소를 찾아가는 가정
    #### Function binding(함수 바인딩)
    - 함수를 호출하는 부분에 함수가 위치한 메모리 번지로 이동시켜 주는 것
    - 함수의 호출부와 정의부를 연결시커 주는 것
    ##### static binding(일반 함수)
    - 컴파일 시간에 호출될 함수로 점프할 주소가 결정되어 바인딩 되는 것
    ##### Dynamic binding(가상 함수)
    - 실행 파일을 만들 때 바인딩 되지 않고 보류 상태
    - 점프할 메모리 버지를 저장하기 위한 공간을 가지고 있다가 런타임에 결정된다
    - 어떤 포인터에 접근 되었는지에 상관 없이 참조된 인스턴스의 실제 클래스형에 따라 재정의된 함수 호출이 가능하기 때문에 사용된다.
