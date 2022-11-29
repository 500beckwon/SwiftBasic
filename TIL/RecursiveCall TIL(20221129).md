# 재귀함수(RecursiveCall)
- 자기 자신의 함수 안에서 결과값을 얻기까지 자신의 함수를 호출하는 형태
- 탈출 조건이 없으면 함수가 무한으로 호출 즉 무한 재귀에 빠질 수 있어 위험하기 때문에 탈출 조건을 꼭 명시해야한다.

```swift
// 일반 함수 호출
func factorial(_ num: Int) -> Int {
    var result = 1
    for n in 2...num {
        result *= n
    }
    return result
}

// 재귀 함수 호출
func factorial(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    return (num * factorial(num - 1))
}

// 최대공약수를 재귀함수로 구하는 법
/*
1. a를 b로 나눈 나머지를 R이라고 할 때 a와 b의 최대 공약수는 b와 r의 최대 공약수와 같다
2. a > b
*/
func gcdR(a:Int, b:Int) -> Int {
    if a == b {
        return a 
    } else if a > b { 
        if a % b == 0 {
            return b
        } else { 
            return gcdR(a: b, b: a % b)
            }
    } else {
        if b % a == 0 { 
            return a 
        } else { 
            return gcdR(a: a, b: b % a)
        }
    }
}
gcdR(a: 12, b: 16)

```
