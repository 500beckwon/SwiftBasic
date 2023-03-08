//
//  LeetCode23.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/03/08.
//

import Foundation

/*
 
 Given a string s, remove duplicate letters so that every letter appears once and only once.
 You must make sure your result is
 the smallest in lexicographical order
  among all possible results.

  

 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 
 
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"
  

 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.

 
 */

func removeDuplicateLetters(_ s: String) -> String {
    var countDictionary = [Character: Int]()
    s.forEach {
        countDictionary[$0] = countDictionary[$0, default: 0] + 1
    }
    var stack = [Character]()
    var onlyList = Set<Character>()
    print(countDictionary)
    for character in s {
        countDictionary[character] = countDictionary[character, default: 0] - 1
        
        if onlyList.contains(character) {
            continue
        }
      
        while let last = stack.last, character < last, countDictionary[last, default: 0] > 0 {
            stack.removeLast()
            onlyList.remove(last)
        }
        stack.append(character)
        onlyList.insert(character)
    }
    
    return String(stack)
}
