//
//  LeetCode40.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/07/26.
//

import Foundation

func mySqrt(_ x: Int) -> Int {
    guard x > 1 else { return 0 }
    var start = 1
    var end = x
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        if mid * mid == x {
            return mid
        } else if mid * mid < x {
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    return result
}
