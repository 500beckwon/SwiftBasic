//
//  main.swift
//  Stack
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation


var intStack1 = Stack<Int>(elements: [1,2,3,4,5,6,7])
var intStack2 = Stack<Int>(elements: [])

print("intStack1.isEmpty = \(intStack1.isEmpty)")
print("intStack2.isEmpty = \(intStack2.isEmpty)")

intStack2.pop()
print("intStack2이 비어있는 상태에서 pop을 호출하여도 에러를 발생시키지 않는다")

print("""
      push 전 갯수 = \(intStack1.count)
      push 전 top = \(intStack1.top())
      """)

intStack1.push(1)
print("""
      push 후 갯수 = \(intStack1.count)
      push 후 top = \(intStack1.top())
      """)


intStack1.pop()
print("""
      pop 후 top = \(intStack1.top())
      """)


var stackString = Stack<String>()
stackString.push("First")
stackString.push("Second")
stackString.push("Third")
stackString.pop()
stackString.pop()

if let peekItem = stackString.top() {
    print("Top(Peek) Item(element) in Stack: \(peekItem)")
}

print(stackString)

let ace = Student(name: "Ace", age: 15)
let bea = Student(name: "Bea", age: 16)
let john = Student(name: "John", age: 20)

var stackStudent = Stack<Student>()
stackStudent.push(ace)
stackStudent.push(bea)
stackStudent.push(john)

print(stackStudent)

stackStudent.pop()

print(stackStudent)
