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


let startIndex = string.startIndex // 최초(시작) 인덱스
let endIndex = string.endIndex // 마지막 인덱스 다음
let indexBefore = string.index(before: endIndex) // 인자 index 1칸 앞(전)
let indexAfter = string.index(after: startIndex) // 인자 index 1칸 뒤
let offsetBy = string.index(startIndex, offsetBy: 3)
let firstIndex = string.firstIndex(of: "c") 
let lastIndex = string.lastIndex(of: "c")
let suffix = string.suffix(3)
let prefix = string.prefix(3)
print(suffix, prefix, "prefix")
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !(s.isEmpty) else { return 0 }
            var characterDict = [Character: Int]()

            var count = 0
            var maxLength = 0
            var checkRepeat = -1
            for char in s {
               
                //if characterDict[char] != nil && (characterDict[char]) > checkRepeat {
                  //  print(characterDict[char], checkRepeat, checkRepeat, char)
                    //checkRepeat = characterDict[char] ?? -1
                //}
                print(characterDict[char], checkRepeat, char)
                maxLength = max(count - checkRepeat, maxLength)
                characterDict[char] = count
                count += 1
                
            }

            return maxLength
   }

print(lengthOfLongestSubstring("pwwkew"))
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

let aya = ["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]
// a = 교환에 필요한 빈병 갯수
// b = 현재 소유 중인 빈병 갯수
// c = 구매한 콜라 병 갯수
func solution2(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var have = n
    var least = 0 // 총 받은 콜라
    
    while a < have {
        print("헤브 = \(have)", "콜라 = \(have/a)", "니멎; \(have % a)")
        let bottle = have/a * b// <- 빈병으로 얻은 콜라
        least += bottle
       
        have = (bottle + have%a)  // <- 생겨난 총 빈병
    }
 //  print("라스트", have)
    return least +  (have < 2 ? 0 : have/a)
}
print(solution2(10, 9, 5000))
//print(solution2(5, 1, 10))
//print(solution2(3, 1, 20))
//print(solution2(3, 2, 20))
//print(solution2(2, 1, 2),"!")

protocol A {
    var name: String { get }
}

protocol B {
    var age: Int { get }
}
struct AA: A , B {
    var name: String
    var age: Int
}

func with(to: A & B) {
    
}

class Test {
    
}

func TestT(cl: Test & B) {
    
}

class TestTT: Test, B {
    var age: Int = 0
    
    
}

TestT(cl: TestTT())
var aaa = AA(name: "", age: 1)
with(to: aaa)

for i in 1...120 {
    print(i)
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var confirmCount = 0
    var firstTotal = queue1.reduce(0, +)
    let secondTotal = queue2.reduce(0, +)
    
    let totalQueue = queue1 + queue2
    
    let result = (firstTotal + secondTotal)/2
    
    guard let max1 = queue1.max(),
          let max2 = queue2.max(),
          max1 <= result && max2 <= result else { return -1 }
    
    var firstQueueCount = 0
    var secondQueueCount = queue1.count
    
    //var sumResult = 0
    
    while secondQueueCount < totalQueue.count && firstQueueCount <= secondQueueCount {
        print(secondQueueCount, totalQueue.count, firstQueueCount, secondQueueCount)
        if firstTotal < result {
            firstTotal += totalQueue[secondQueueCount]
            secondQueueCount += 1
        } else if firstTotal > result {
            firstTotal -= totalQueue[firstQueueCount]
            firstQueueCount += 1
        } else {
            break
        }
        
        confirmCount += 1
    }
    
    
    return firstTotal == result ? confirmCount: -1
}

print(solution([3,2,7,2], [4,6,5,1]))
print(solution([1, 2, 1, 2], [1,10,1,2]))

func solution32(_ babbling:[String]) -> Int {
    
    let aya = "aya"
    let ye = "ye"
    let woo = "woo"
    let ma = "ma"
    let baby = babbling
        .filter { $0.count > 1 }
        .map {
            $0.replacingOccurrences(of: aya, with: "1")
        }.map {
            $0.replacingOccurrences(of: ye, with: "2")
        }.map {
            $0.replacingOccurrences(of: woo, with: "3")
        }.map {
            $0.replacingOccurrences(of: ma, with: "4")
        }.filter {
       
            return Int($0) != nil
        }.filter {
            if $0.count > 1 {
                let list = $0.compactMap { Int(String($0)) }
                
                for i in 0..<list.count {
                    var count = list[i]
                    for j in 1..<list.count {
                        let nextCount = list[j]
                        
                        if i + 1 == j, count == nextCount {
                            return false
                        }
                    }
                }
                return true
            } else {
                return true
            }
        }
    return baby.count
}
print(solution32(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
print(solution32(["ayamaaya"]))
print(solution32(["ma"]))




