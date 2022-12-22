//
//  Pratice03.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2022/12/22.
//

import Foundation

/*
 크기가 작은 부분문자열
 dark
 light
 sublime
 vim
 emacs
  Swift
 문제 설명

 숫자로 이루어진 문자열 t와 p가 주어질 때, t에서 p와 길이가 같은 부분문자열 중에서,
 이 부분문자열이 나타내는 수가 p가 나타내는 수보다 작거나 같은 것이 나오는 횟수를 return하는 함수 solution을 완성하세요.
 예를 들어, t="3141592"이고 p="271" 인 경우, t의 길이가 3인 부분 문자열은 314, 141, 415, 159, 592입니다.
 이 문자열이 나타내는 수 중 271보다 작거나 같은 수는 141, 159 2개 입니다.
 
 제한사항
 1 ≤ p의 길이 ≤ 18
 p의 길이 ≤ t의 길이 ≤ 10,000
 t와 p는 숫자로만 이루어진 문자열이며, 0으로 시작하지 않습니다.
 
 입출력 예
 t               p       result
 "3141592"       "271"   2
 "500220839878"  "7"     8
 "10203"         "15"    3

 */

func pratice03(_ t:String, _ p:String) -> Int {
    let tCount = t.count
    let pCount = p.count
    let tIntList = t.map { String($0) }
    let pInt = Int(p) ?? 0
    var count = 0
    for i in 0..<tCount {
        let max = i + pCount
        if max <= tCount {
            let reduce = Int(tIntList[i..<max].reduce("", +)) ?? 0
            if reduce <= pInt {
                count += 1
            }
        }
    }
    return count
}
