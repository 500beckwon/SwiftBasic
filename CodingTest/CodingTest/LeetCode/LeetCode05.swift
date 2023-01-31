//
//  LeetCode05.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/31.
//

import Foundation

/*
 Companies
 Write a function that reverses a string. The input string is given as an array of characters s.

 You must do this by modifying the input array in-place with O(1) extra memory.


 Example 1:

 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
  

 Constraints:

 1 <= s.length <= 105
 s[i] is a printable ascii character.
 
 */

func reverseString(_ s: inout [Character]) {
    var leftIndex = 0
    var rightIndex = s.count - 1
    
    while leftIndex < rightIndex {
        s.swapAt(leftIndex, rightIndex)
        leftIndex += 1
        rightIndex -= 1
    }
}
