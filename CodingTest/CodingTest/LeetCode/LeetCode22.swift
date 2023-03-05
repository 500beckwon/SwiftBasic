//
//  LeetCode22.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/03/05.
//

import Foundation

/*
 Given a string s containing just the characters
 '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
 
 Example 1:

 Input: s = "()"
 Output: true
 
 Example 2:

 Input: s = "()[]{}"
 Output: true
 
 Example 3:

 Input: s = "(]"
 Output: false
 */

func isValid(_ s : String) -> Bool {
    guard s.count > 1 else { return false }
    let table = [")":"(",
                 "}":"{",
                 "]":"["]
    
    let sList = s.map { String($0) }
    var stack = [String]()
    for text in sList {
        if table[text] == nil {
            stack.append(text)
        } else {
            if stack.isEmpty || table[text] != stack.popLast() {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

