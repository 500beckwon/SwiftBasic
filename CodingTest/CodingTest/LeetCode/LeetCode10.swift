//
//  LeetCode10.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/15.
//

import Foundation

/*
42. Trapping Rain Water
Hard
25.1K
344
Companies
Given n non-negative integers representing an elevation map where the width of each bar is 1,
compute how much water it can trap after raining.

 

Example 1:

Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
In this case, 6 units of rain water (blue section) are being trapped.

Example 2:

Input: height = [4,2,0,3,2,5]
Output: 9
 
 
 
*/

func trappingRainWater(_ height: [Int]) -> Int {
    if height.isEmpty {
        return 0
    }
       
    var volume = 0
    var left = 0
    var right = height.count - 1

    var left_max = height[left]
    var right_max = height[right]
       
    while left < right {
        left_max = max(height[left], left_max)
        right_max = max(height[right], right_max)
        
        // 더 높은 쪽을 향해 투 포인터 이동
        if left_max <= right_max {
            volume += left_max - height[left]
            left += 1
        } else {
            volume += right_max - height[right]
            right -= 1
        }
    }
    return volume
}


// 모범 답안 1
func trappingRainWater2(_ height: [Int]) -> Int {
    if height.isEmpty {
        return 0
    }
    
    var left = 0
    var right = height.count - 1
    var maxLeft = height[left]
    var maxRight = height[right]
    var res = 0
    print("height = \(height)")
    while left < right {
        print("left = \(left)", "right = \(right)", separator: "\n")
        print("maxLeft = \(maxLeft)", "maxRight = \(maxRight)", separator: "\n")
        print("res = \(res)")
        print("\n")
        if maxLeft <= maxRight {
            left += 1
            maxLeft = max(maxLeft, height[left])
            
            res += maxLeft - height[left]
        } else {
            right -= 1
            maxRight = max(maxRight, height[right])
            res += maxRight - height[right]
        }
    }
    
    return res
}

// 모범 답안 2

func trappingRainWater3(_ height: [Int]) -> Int {
    var stack: [Int] = [], result = 0
    
    for i in height.indices {
        let hidx = height[i]
        print("체크1", i)
        
        /*
         while문이 지속되는 조건 (3가지가 충족되어야함)
         1. stack이 비어 있지 않아야 한다
         2. stack last가 존재해야 한다
         3. 스택 라스트값을 height에 인댁싱하여 얻은 값이 hidx 상수보다 작아야 한다
         */
        if let stackLast = stack.last {
            print(hidx, height[stackLast], "ㅗ몸")
        }
        while !(stack.isEmpty), let last = stack.last, hidx > height[last] {
            print(i, "체크2")
            let top = stack.removeLast()
            print("스택 빔 유무", stack.isEmpty)
            if !(stack.isEmpty), let last = stack.last {
                print(hidx, height[last],  height[top])
                let diff = min(hidx, height[last]) - height[top]
                result += (i - last - 1) * diff
            } else {
                
                break
            }
        }
        stack.append(i)
    }
    
    return result
}
