//
//  LeetCode09.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/04.
//

import Foundation

/*

 Given a string s, return the longest
 palindromic
  
 substring in s.

 Example 1:

 Input: s = "babad"
 Output: "bab"
 
 Explanation: "aba" is also a valid answer.
 
 Example 2:

 Input: s = "cbbd"
 Output: "bb"
  
 Constraints:

 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */

func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 || String(s.reversed()) != s else {
        
        return s
    }
    
    let text = s.map { String($0) }
    var result = [String]()
    
    func expand(_ left: Int, _ right: Int) -> [String] {
        // left가 0 보다 작으면 안됌
        // right가 배열 갯수보다 크면 안됌
        // text 배열의 left, right 인덱스 값이 같으면 안됌
        var left = left
        var right = right
        while left >= 0 && (right < text.count) && text[left] == text[right] {
            left -= 1
            right += 1
        }
        return text[left + 1 ..< right].map { String($0) }
    }
    
    for i in 0..<(text.count - 1) {
        let min = expand(i, i + 1).joined()
        let max = expand(i, i + 2).joined()
        result.append(min)
        result.append(max)
    }
    result.sort { $0.count > $1.count }
    return result.first ?? ""
}
