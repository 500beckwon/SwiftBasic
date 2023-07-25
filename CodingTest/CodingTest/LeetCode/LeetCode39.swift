//
//  LeetCode39.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/07/25.
//

import Foundation

func addBinary(_ a: String, _ b: String) -> String {
    var sum = ""
    var carry = 0
    var i = a.count - 1
    var j = b.count - 1
    
    while i >= 0 || j >= 0 || carry > 0 {
        var digitSum = carry
        if i >= 0 {
            let aDigit = Int(String(a[a.index(a.startIndex, offsetBy: i)]))!
            digitSum += aDigit
            i -= 1
        }
        if j >= 0 {
            let bDigit = Int(String(b[b.index(b.startIndex, offsetBy: j)]))!
            digitSum += bDigit
            j -= 1
        }
        sum = "\(digitSum % 2)" + sum
        carry = digitSum / 2
    }
    
    return sum
    
//    guard !a.isEmpty else { return b }
//    guard !b.isEmpty else { return a }
//
//    var carry = 0
//    let a = Array(a)
//    let b = Array(b)
//    var i = a.count - 1
//    var j = b.count - 1
//    var ans = [Int]()
//
//    while i >= 0 || j >= 0 || carry != 0 {
//
//
//        var sum = carry
//
//        if i >= 0, a[i] == "1" {
//            sum += 1
//        }
//
//        if j >= 0, b[j] == "1" {
//            sum += 1
//        }
//
//        let digit = sum % 2
//        carry = sum / 2
//
//        ans.append(digit)
//
//        i -= 1
//        j -= 1
//    }
//
//    return ans.map { String($0) }.reversed().joined()
}
