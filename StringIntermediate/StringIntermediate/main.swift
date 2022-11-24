//
//  main.swift
//  StringIntermediate
//
//  Created by ByungHoon Ann on 2022/11/24.
//

import Foundation

let string = "abce123"

let stringRepeat = String(repeating: "A", count: 10)

print(stringRepeat)

for character in stringRepeat {
    print(character)
}

let startIndex = string.startIndex // 최초(시작) 인덱스
let endIndex = string.endIndex // 마지막 인덱스 다음
let indexBefore = string.index(before: endIndex) // 인자 index 1칸 앞(전)
let indexAfter = string.index(after: startIndex) // 인자 index 1칸 뒤
let offsetBy = string.index(startIndex, offsetBy: 3)
let firstIndex = string.firstIndex(of: "c") 
let lastIndex = string.lastIndex(of: "c")

print("""
startIndex = \(startIndex)
endIndex = \(endIndex)
indexBefore = \(indexBefore)
indexAfter = \(indexAfter)
offsetBy = \(offsetBy)
firstIndex = \(firstIndex)
lastIndex = \(lastIndex)
""")

