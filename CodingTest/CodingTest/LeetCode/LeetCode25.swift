//
//  LeetCode25.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/03/29.
//

import Foundation


class MyStack {
    var queue: [Int] = []
    init() {
        
    }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    
    func pop() -> Int {
        return queue.popLast()!
    }
    
    func top() -> Int {
        return queue.last!
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}
