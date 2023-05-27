//
//  LeetCode33.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/05/27.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var dic = [Int: Int]()
    let dicts = nums
    
    for i in dicts {
        dic[i, default: 0] += 1
    }
    
    let result = dic.sorted { $0.value > $1.value }.prefix(k).map { $0.key }

    return result
}
