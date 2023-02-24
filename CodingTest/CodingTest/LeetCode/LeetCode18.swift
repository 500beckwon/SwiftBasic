//
//  LeetCode18.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/24.
//

import Foundation

//func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//
//    var over = 0
//    var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
//    over = sum >= 10 ? 1:0
//    var resultSum = sum % 10
//    var listNode = ListNode(resultSum)
//    let node = listNode
//    var listNode1 = l1?.next
//    var listNode2 = l2?.next
//
//    while listNode1 != nil || listNode2 != nil {
//        sum = (listNode1?.val ?? 0) + (listNode2?.val ?? 0) + over
//        over = sum >= 10 ? 1:0
//        resultSum =  sum % 10
//        listNode1 = listNode1?.next
//        listNode2 = listNode2?.next
//
//        listNode.next = ListNode(resultSum)
//        listNode = listNode.next!
//    }
//
//    if over == 1 {
//        listNode.next = ListNode(1)
//    }
//
//    return node
//}

var dig = 0 // 10일 경우 1을 더해서 내려주깅

var addTwoNumbersSample1 = ListNode(2, ListNode(4, ListNode(3)))
var addTwoNumbersSample2 = ListNode(5, ListNode(6, ListNode(4)))

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil, l2 == nil, dig == 0 {
        return nil
    }
    
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
    print("fakeSum", (l1?.val ?? 0) + (l2?.val ?? 0))
    dig = sum / 10 // 10이 넘어가면 +1 이므로 몫만 계산 10미만이면 몫이 0이므로 추가 연산 필요 x
    return ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
}
