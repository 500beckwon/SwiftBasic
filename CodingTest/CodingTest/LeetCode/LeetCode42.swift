//
//  LeetCode42.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/09/15.
//

import Foundation

func isMatch(_ s: String, _ p: String) -> Bool {
    guard s.count == p.count else { return false }
    let base = s.map { String($0) }
    let patten = p.map { String($0) }
    
    let baseResult = base.joined(separator: "")
    var makeResultString = ""
    
    for (index, item) in patten.enumerated() {
        
        for i in 0..<base.count {
            
        }
    }
    print(makeResultString)
    let pre = makeResultString.hasPrefix(baseResult)
    return makeResultString == baseResult
}
//print(isMatch("aab", "c*a*b"))
