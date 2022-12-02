# Equatable
- 값이 동일한 지 아닌지를 비교할 수 있는 타입(protocol)
- Equatable를 준수하는 타입은 등호 연산자 == 또는 != 을 사용하여 동등성을 비교할 수 있다
- Swift의 기본 데이터 타입은 Equatable를 따른다(Int, String...)

```swift
class A: Equatable { 
    var number: Int 
    
    init(_ number: Int) {
        self.number = number
    }

    static func ==(lhs: A, rha: A) -> Bool { 
        return lhs.number == rhs.number
    }
}

// Equatable을 채택하지 않는 객체는 컴파일 에러 발생
if A(5) == A(4) { 
    print("true")
} else {
    print("false") // <- false 
}
```

# Iterator Protocol
- Element :: 반복 순회하며 가져온 요소
- associatedtype (연관타입)으로 지정함으로써 순회해서 가져온 요소의 타입을 지정할 수 있다
- next() 메소드는 시퀀스에 있는 다음 요소를 반환하거나, 시퀀스의 마지막인 경우 nil 을 반환한다

```swift
public protocol IteratorProtocol {
    associatedtype Element
        public mutating func next() -> Self.Element?
}
```

## Sequence
- Array, Dictionary, Collection 타입의 기반이 되는 protocol
- Sequence 는 Sequence 프로토콜에 부합하는 범용 타입이다. Sequence 프로토콜에 부합하는 타입은 for...in 순환문으로 반복 순회할 수 있다
- Iterator는 Iterator Protocol 을 부합해야한다.
- makeIterator() 메소드는 직접 호출할 필요는 없으며, 스위프트 런타임시 for...in 순환문을 사용할 때 자동으로 호출된다.

```swift
public protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    public func makeIterator() -> Self.Iterator
}

for a in array {
    // 해당 반복문을 가능하도록 하는 프로토콜이 Sequence 이다!
}
``` 

## Collection
- Collection 은 Collection 프로토콜에 부합하는 범용 타입이다.
- Collection 프로토콜은 Sequence 프로토콜과 Indexable 프로토콜에도 부합한다.
- Collection 은 요소를 여러번 순회할 수 있으며, 특정 인덱스의 요소를 subscript 로 접근할 수 있는 Sequence 을 뜻한다.
