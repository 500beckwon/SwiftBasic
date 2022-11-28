# ArraySlice
- Array를 subscript, index 범위를 통해 새로운 배열을 지정한 경우의 타입 이 때는 Array가 아닌 ArraySlice 타입이 된다
- 사용할 때의 편리성을 제공하고 따로 메모리 공간을 만들지 않는 최적화의 이점에 의하여 탄생했다
- ArraySlice는 본래의 Array를 참조하고 있는 형태이므로 새로운 메모리를 사용하지 않는 장점이 있다
- 참조하고 있는 상태이기 때문에 오랫동안 방치하게 되면 Memory Leak이 발생할 수 있다
- 하나의 배열이 있을 때 반으로 나누어서 각 배열의 합을 비교하는 데에 사용할 수 있다

```swfit
var intArray: [Int] = [1, 2, 3, 4, 5]
var subIntArray = intArray[2...4] // [3, 4, 5]

print(type(of: intArray)) // Array<Int>
print(type(of: subIntArray)) // ArraySlice<Int>

//subIntArray[0] // Fatal error: Index out of bounds
subIntArray.startIndex // 2
subIntArray[subIntArray.startIndex] // 3
subIntArray[2] // 3

let scoreArray = [3.5, 4.0, 2.0, 4.5, 3.2, 4.3]
let mid = scoreArray.count / 2
let leftArraySum = scoreArray[..<mid].reduce(0, +)
let rightArraySum = scoreArray[mid...].reduce(0, +)

if leftArraySum < rightArraySum {
  print(left < right)
} else {
  print(left >= right)
}
```
