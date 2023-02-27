//
//  ListNode.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/27.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil;
        
     }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    static let sample = ListNode(1, ListNode(2, ListNode(2)))
}
