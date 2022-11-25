//
//  main.swift
//  StringIntermediate
//
//  Created by ByungHoon Ann on 2022/11/24.
//

import Foundation

var string = "abce123"

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
offsetBy = \(offsetBy), \(string[offsetBy])
firstIndex = \(firstIndex)
lastIndex = \(lastIndex)
""")

                                    
// hasPrefix <- 인자로 주어지는 String이 첫 번째로 시작해서 일치하는지 여부
let a = "김허남"
print("김 ",a.hasPrefix("김"))
print("허 ",a.hasPrefix("허"))
print("김허남" ,a.hasPrefix("김허남"))
print("김허", a.hasPrefix("김허"))
print("허남", a.hasPrefix("허남"))



// hasSuffix <- 인자로 주어지는 String이 마지막에서 직하여 일치하는지 여부

print("남 ",a.hasSuffix("남"))
print("허 ",a.hasSuffix("허"))
print("김허남" ,a.hasSuffix("김허남"))
print("남허", a.hasSuffix("남허"))
print("허남", a.hasSuffix("허남"))

func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        let smallOpen: Character = "("
        let mediamOpen: Character = "{"
        let bigOpen: Character = "["
        let smallClose: Character = ")"
        let mediamClose: Character = "}"
        let bigClose: Character = "]"

        var charCollection = [Character]()
    
        for char in s {
            print(char)
            print(charCollection)
            switch char {
                case smallOpen, mediamOpen, bigOpen:
                    charCollection.append(char)
                case smallClose:
                    if charCollection.popLast() == smallOpen {
                        continue
                    } else {
                        return false
                    }
                case mediamClose:
                    if charCollection.popLast() == mediamOpen {
                        continue
                    } else {
                        return false
                    }
                case bigClose:
                    if charCollection.popLast() == bigOpen {
                        continue
                    } else {
                        return false
                    }
                default:
                    return false
                
            }
            print(char, charCollection,"\n")
        }
        return charCollection.isEmpty
    }

