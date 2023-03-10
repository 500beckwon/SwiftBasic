//
//  LeetCode24.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/03/10.
//

import Foundation

/*
 Given an array of integers temperatures represents the daily temperatures,
 return an array answer such that answer[i] is the number of days
 you have to wait after the ith day to get a warmer temperature.
 If there is no future day for which this is possible, keep answer[i] == 0 instead.

 xample 1:

 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 
 Example 2:

 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 
 Example 3:

 Input: temperatures = [30,60,90]
 Output: [1,1,0]
  

 Constraints:

 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100
 */

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var stack = [Int]()
    var result = (0..<temperatures.count).map { _ in 0 }
    for (index, tem) in temperatures.enumerated() {
        while let top = stack.last, temperatures[top] < tem {
            result[top] = index - top
            stack.removeLast()
        }
        stack.append(index)
    }
    
    return result
  }

 
