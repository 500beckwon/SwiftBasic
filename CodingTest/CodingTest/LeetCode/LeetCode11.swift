//
//  LeetCode11.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/16.
//

import Foundation
/*
 15. 3Sum
 Medium
 24.1K
 2.2K
 Companies
 Given an integer array nums, return all the triplets
 [nums[i], nums[j], nums[k]] such that
 i != j, i != k, and j != k, and
 nums[i] + nums[j] + nums[k] == 0.
 
 Notice that the solution set must not contain duplicate triplets.
 
 
 
 Example 1:
 
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 
 Example 2:
 
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 
 Example 3:
 
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
 
 
 Constraints:
 
 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 
 배열 내에서 3개의 인자로 0을 만들 수 있는 엘리먼트를 리턴
 */


func threeSum(_ nums: [Int]) -> [[Int]] {
    var results = [[Int]]()
    let nums = nums.sorted(by: <)
    for i in 0..<(nums.count - 2) {
        
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            if sum < 0 {
                left += 1
            } else if sum > 0 {
                right -= 1
            } else {
                results.append([nums[i], nums[left], nums[right]])
                
                // 같은 값 있는지 확인 존재하면 +1
                while left < right && nums[left] == nums[left + 1] {
                    left += 1
                }
                
                // 같은 값 있는지 확인 존재하면 -1
                while left < right && nums[right] == nums[right - 1] {
                    right -= 1
                }
                
                left += 1
                right -= 1
            }
        }
        
    }
    return results
}
