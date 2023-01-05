//
//  Pratice12.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/05.
//

import Foundation

/*
 시저 암호
 
 문제 설명

 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 "AB"는 1만큼 밀면 "BC"가 되고, 3만큼 밀면 "DE"가 됩니다. "z"는 1만큼 밀면 "a"가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.
 제한 조건
 공백은 아무리 밀어도 공백입니다.
 s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
 s의 길이는 8000이하입니다.
 n은 1 이상, 25이하인 자연수입니다.
 입출력 예
 s    n    result
 "AB"    1    "BC"
 "z"    1    "a"
 "a B z"    4    "e F d"
 
 */

func pratice12(_ s:String, _ n:Int) -> String {
    guard !s.isEmpty else { return "" }
    let alpabet = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
    let maxIndex = alpabet.count - 1
    
    var upper = [String: Int]()
    var lower = [String: Int]()
    for (index, text) in alpabet.enumerated() {
        upper[text.uppercased()] = index
    }
    
    for (index, text) in alpabet.enumerated() {
        lower[text] = index
    }
    var resultText = ""
    
    for i in s.map ({ String($0) }) {
        if let base1 = upper[i] {
            let index = base1 + n
            if index > maxIndex {
                resultText += alpabet[index - maxIndex - 1].uppercased()
            } else {
                resultText += alpabet[index].uppercased()
            }
            continue
        }
        
        if let base2 = lower[i] {
            let index = base2 + n
            if index > maxIndex {
                resultText += alpabet[index - maxIndex - 1]
            } else {
                resultText += alpabet[index]
            }
            continue
        }
        
        resultText += " "
    }
    
    return resultText
}

/*
 좋은 정답 발췌
 let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
   return String(s.map {
       guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
       let letter = alphabets[(index + n) % alphabets.count]
       return $0.isUppercase ? Character(letter.uppercased()) : letter
   })
 */
