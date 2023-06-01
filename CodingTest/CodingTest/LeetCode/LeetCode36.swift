//
//  LeetCide36.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/05/31.
//

import Foundation

/*
 3Sum Closest
 
 Given an integer array nums of length n and an integer target,
 find three integers in nums such that the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input would have exactly one solution.

 Example 1:

 Input: nums = [-1,2,1,-4], target = 1
 
 Output: 2
 
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 
 Example 2:

 Input: nums = [0,0,0], target = 1
 
 Output: 0
 
 Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
  

 Constraints:

 3 <= nums.length <= 500
 -1000 <= nums[i] <= 1000
 -104 <= target <= 104
 
 nums =
 [-43,57,-71,47,3,30,-85,6,60,-59,0,-46,-40,-73,53,68,-82,-54,88,73,20,-89,-22,39,55,-26,95,-87,-57,-86,28,-37,43,-27,-24,-88,-35,82,-3,39,-85,-46,37,45,-24,35,-49,-27,-96,89,87,-62,85,-44,64,78,14,59,-55,-10,0,98,50,-75,11,97,-72,85,-68,-76,44,-12,76,76,8,-75,-64,-57,29,-24,27,-3,-45,-87,48,10,-13,17,94,-85,11,-42,-98,89,97,-66,66,88,-89,90,-68,-62,-21,2,37,-15,-13,-24,-23,3,-58,-9,-71,0,37,-28,22,52,-34,24,-8,-20,29,-98,55,4,36,-3,-9,98,-26,17,82,23,56,54,53,51,-50,0,-15,-50,84,-90,90,72,-46,-96,-56,-76,-32,-8,-69,-32,-41,-56,69,-40,-25,-44,49,-62,36,-55,41,36,-60,90,37,13,87,66,-40,40,-35,-11,31,-45,-62,92,96,8,-4,-50,87,-17,-64,95,-89,68,-51,-40,-85,15,50,-15,0,-67,-55,45,11,-80,-45,-10,-8,90,-23,-41,80,19,29,7]
 
 output = 255
 
 */
func threeSumCloset(_ nums: [Int], _ target: Int) -> Int {
    let nums = nums.sorted(by: <)
    var closeValue = nums[0] + nums[1] + nums[2]
    for i in 0..<nums.count {
        var start = i + 1
        var end = nums.count - 1
        
        
        while start < end {
            let currentSum = nums[start] + nums[end] + nums[i]
      
            if abs(currentSum - target) < abs(closeValue - target) {
                print(closeValue, currentSum)
                closeValue = currentSum
            }
            
            if currentSum < target {
                start += 1
            } else {
                end -= 1
            }
        }
    }
    
    return closeValue
}
