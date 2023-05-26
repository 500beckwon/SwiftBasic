//
//  LeetCode32.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/05/26.
//

import Foundation

//n = 3
//Output: ["((()))","(()())","(())()","()(())","()()()"]


func lengthOfLastWord(_ s: String) -> Int {
    let arr = s.split(separator: " ")
    return arr.last?.count ?? 0
}
   
