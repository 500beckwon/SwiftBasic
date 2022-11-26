ㄹㄹㄹ# Closure
- 일회용 함수를 제작할 수 있는 구문
- 자신이 정의되었던 문맥(Context)으로부터 모든 상수와 변수의 값을 캡쳐(Capture)하거나 레퍼런스를 저장하는 것

## 클로저 객체라고 지칭되는 것
### 1. 전역 함수
- 이름이 있고 주변 환경에서 캡쳐할 어떤 것도 없는 클로저
### 2. 중첩 함수
- 이름이 있으며 자신을 둘러싼 함수로부터 값을 캡쳐할 수 있는 클로저
### 3. 클로저 표현식
- 이름이 없으며 주변 환경으로부터 값을 캡쳐할 수 있는 경량 문법으로 작성된 클로저

```swift
{ (매개변수) in 
  // 실행구문
}

let f = { () -> Void in 
    print("클로저 실행")
}

f()
// 클로저 실행

let c = { (s1: Int, s2: String) in 
    print("s1: \(s1), s2: \(s2)")
}

c(1, "closure")
//  s1: 1, s2: closure
/*
{ (s1: Int, s2: String) in 
    print("s1: \(s1), s2: \(s2)")
}(1, "closure")
*/

```

## @escaping
- 인자값으로 전달된 클로저를 저장해 두었다가 나중에 다른 곳에서도 실행할 수 있도록 허용해주는 속성
- 기본적으로 함수의 인자값으로 전달된 클로저는 탈출 불가의 속성을 가진다 이는 해당 클로저를 함수 내에서 직접 실행을 위해서만 사용해야 하는것을 의미하며 이 떄문에 함수 내부라 할지라도 변수나 상수에 대입할 수 없다
- 대입을 허용한다면 내부 함수를 통한 캡쳐(Capture) 기능을 이용하여 클로저가 함수 바깥으로 탈출 할 수 있기 때문

```swift
var sampleClosure: () -> Void = { }
func callback(fn: () -> Void)  {
    sampleClosure = fn // 에러
    
}

func callback2(fn: @escaping () -> Void)  {
    sampleClosure = fn
    sampleClosure() // <- 에러 
}

```
## @autoescape
- 인자값으로 전달된 일반 구문이 함수 등을 클로저로 래핑하는 역할
- 이 키워드가 붙어있을 경우 일반 구문을 인자값으로 넣더라도 컴파일러가 알아서 클로저로 만들어서 사용한다
- 인자값 형태를 { }에서 () 형태로 사용할 수 있다는 장점이 있다 
```swift
func condition(stmt: () -> Bool) {
    if stmt() == true {
        print("True")
    } else {
        print("false")
    }
}

condition { 
    4 > 2
}

func condition2(stmt: @autocolsure () -> Bool) {
    if stmt() == true {
        print("True")
    } else {
        print("false")
    }
}

condition(stmt: ( 4 > 2 ))
```
## 용어
### 클로저에서 탈출이란?
- 함수 내부 범위를 벗어나서 실행되는 것
- 탈출 불가(non-escape)하게 관리함으로 얻는 이점은 컴파일러가 코드를 최적화하는 과정에서의 성능향상을 도모하기 위해 탈출 할 수 없다는 뜻은 컴파일러가 더 이상 메모리의 관리상의 관여할 필요가 없기 때문  
- 탈출 불가 클로저 내에서는 self 키워드 사용이 가능 약한 참조를 사용해야할 필요가 없다
- 탈출 가능 함으로써 얻을 수 있는 것은 해당 클로져를 외부 변수/상수에 저장이 가능하고 함수가 호출이 종료된 후에도 클로저 실행이 가능한 이점이 있다
### Capturing Values(클로저 캡쳐)
- 클로저가 매개 변수나 지역변수가 아닌 주변 외부의 context를 사용하기 위해 주변 외부의 문맥(Context)을 참조하는 것
```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

/*
    incrementer 함수가 클로저로 반환되는데 runningTotal과 amount를 캡쳐해서 사용하고 있다
    이것은 makeIncrementer가 호출되면 makeIncrementer의 매개변수인 amount와 지역변수인 runningTotal을 
    incrementer라는 클로저에서 캡쳐해서 사용하고 있다
    
    incrementer 매개변수가 없는 함수이지만 본문 내에서는 runningTotal 및 amount을 참조하고 있다
    참조로 캡쳐(Capturing by referenc)를 하게 되면 makeIncrementer가 종료될 때 runningTotal 및 amount가 사라지지 않으며 
    incrementer 함수가 호출 될 때 사용할 수 있다
    
    Value type인 context를 어떻게 참조로 캡쳐한다는 것(Capturing by reference)은
    1. Value type도 만들어질 때 내부에 레퍼런스 카운터가 생긴다
    2. Value type이더라도 클로저가 캡쳐하면 reference type으로 결정해서 heap 영역으로 옮겨져 호출 즉시 사라지지 않고 Reference Count가 1 증가하여 Context를 사용할 수 있다
*/
```
