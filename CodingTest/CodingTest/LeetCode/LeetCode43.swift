//
//  LeetCode43.swift
//  CodingTest
//
//  Created by dev dfcc on 12/19/23.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    guard n > 2 else { return n }
    
    var prev1 = 2
    var prev2 = 1
    var steps = 0
    
    for i in 3...n {
        steps = prev1 + prev2
        prev2 = prev1
        prev1 = steps
    }
    
    return steps
    
}
