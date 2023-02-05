//
//  LeetCode02.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import Foundation

/*
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
 */

func twoSum(_ num: [Int], _ target: Int) -> [Int] {
    var dictionary = [Int: Int]()
    for (index, number) in num.enumerated() {
        let value = target - number
        
        if let firstIndex = dictionary[value] {
            return [firstIndex,index]
        }
      
        dictionary[number] = index
    }
    return []
}
