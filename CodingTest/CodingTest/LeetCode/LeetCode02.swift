//
//  LeetCode02.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import Foundation

func twoSum(_ num: [Int], _ target: Int) -> [Int] {
    for (index, first) in num.enumerated() {
        for second in (index+1)..<num.count {
            if first + num[second] == target {
                return [index, second]
            }
        }
    }
    return []
}
