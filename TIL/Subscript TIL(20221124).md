# Subscript
- 클래스, 구조체, 열거형에서 시퀀스의 멤버 요소에 접근하기 위한 바로가기 첨자
- 단일 타입에 여러 서브스크립트를 정의할 수 있다
- 배열의 서브스크립트는 parameter로 Int형을 index로 받고, 해당 index에 해당하는 Element를 반환하는 형태
- Dictionary의 subscrip는 Parameter로 Key를 받고 해당 Value에 해당하는 Value를 반환하는 형태
- Class, Type Subscript, Method Subscript 전부 가능
- get-only, get/set 만 가능 set-only는 불가

```swift
let num = [1,2,3,4,5]
num[1]
num[4] 
// 이 접근이 subscript
```


# 용어
## Argument Label
- 함수의 인자 정의 시 매개변수와 함께 사용한다
- 인자가 무엇을 위한 기능인지 보여주는 이름
- _ 으로 생략 가능

## Parameter 
- 어떤 이름으로 함수 내부에서 사용할 것인지를 명시하는 것
- 함수의 정의에서 사용하는 개념

## Argument
- 함수를 Call 할 때 전달하는 실제 값

```swift
/*
func name(argumentLabel parameterName: Type) { 
  // argumentValue   
}
*/
// Parameter(매개변수)와 Argument(전달인자)의 이름이 일치할 때
func sayNumber(number: Int) { // < - number Parameter(매개변수) 
    print("\(number)!") // <- number Argument(전달 인자),Argument Label를 사용하지 않은 경우
}

// Parameter(매개변수)와 Argument(전달인자)의 이름이 일치할 때
func sayNumber(number to: Int) { // < - to Parameter(매개변수), number Argument Label 
    print("\(number)!") // <- number Argument(전달 인자)
}
```


