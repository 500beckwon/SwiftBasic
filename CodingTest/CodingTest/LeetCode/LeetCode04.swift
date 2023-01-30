//
//  LeetCode04.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/30.
//

import Foundation

/*
 A phrase is a palindrome if, after converting all uppercase letters into lowercase
 letters and removing all non-alphanumeric characters, it reads the same forward and backward.
 Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
  

 Constraints:

 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 */

func isPalindrome(_ s: String) -> Bool {
    var text = s.lowercased().filter { !$0.isSymbol }
    text = text.filter { !$0.isWhitespace }.filter { !$0.isPunctuation }
    return text == String(text.reversed())
}

/*
 모범답안
 
 func isPalindrome(_ s: String) -> Bool {
     let lowercased = s.lowercased().replacingOccurrences(
         of: "[^a-z0-9]",
         with: "",
         options: .regularExpression)

     return String(lowercased.reversed()) == lowercased
 }

 */
