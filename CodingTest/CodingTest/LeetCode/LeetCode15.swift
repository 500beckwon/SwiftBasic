//
//  LeetCode15.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/22.
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

func isPalindrome(_ head: ListNode?) -> Bool {
    guard let head = head else { return false}
    var list = [ListNode]()
    var currentNode: ListNode? = head
    
    while let node = currentNode {
        list.append(node)
        currentNode = node.next
    }
    
    // 아하! 양끝을 삭제 후 리턴받아서 비교하면서 다르면 펠린드롬이 유효하지 않는다는 뜻이구낭
    while(list.count > 1) {
        if list.removeFirst().val != list.removeLast().val {
            return false
        }
    }
    
    return true
    
}

