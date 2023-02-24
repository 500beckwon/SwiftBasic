//
//  LeetCode17.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/24.
//

import Foundation

var nodeSample = ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1)))))

func reverseList(_ head: ListNode?) -> ListNode? {
//    if head?.next == nil || head == nil {
//        return head
//    }
//
//    var node = head
//    var prev: ListNode? = nil
//
//    while node != nil {
//        let next = node?.next
//        node?.next = prev
//        prev = node
//        node = next
//    }
//    return prev
    
    guard let root = head,
          let rhs = root.next else { return head }
    let node = reverseList(rhs)
    rhs.next = root
    root.next = nil
    return node
}
