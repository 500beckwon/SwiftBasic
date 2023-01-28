//
//  LeetCode03.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/28.
//

import Foundation
/*
35. Search Insert Position
Easy
11.4K
522
Companies
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with O(log n) runtime complexity.
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for (index, number) in nums.enumerated() {
        if target <= number {
            return index
        }
    }
    return nums.count
}
