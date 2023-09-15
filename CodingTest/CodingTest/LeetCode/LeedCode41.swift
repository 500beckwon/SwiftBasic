//
//  LeedCode41.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/09/15.
//

import Foundation


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var nums1 = nums1
    nums1 += nums2
    nums1.sort()
    let count = nums1.count
    if count%2 == 0 {
        let first = count/2 - 1
        let second = count/2
        let a = nums1[first]
        let b = nums1[second]
        return Double(a + b) / 2
    } else {
        let first = count/2
        return Double(nums1[first])
    }
}
