//
//  LeetCode29.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/05/01.
//

import Foundation


/*
 23. Merge k Sorted Lists0

 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

 Example 1:

 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 Example 2:

 Input: lists = []
 Output: []
 Example 3:

 Input: lists = [[]]
 Output: []
  

 Constraints:

 k == lists.length
 0 <= k <= 104
 0 <= lists[i].length <= 500
 -104 <= lists[i][j] <= 104
 lists[i] is sorted in ascending order.
 The sum of lists[i].length will not exceed 104.
 */

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.isEmpty == false else { return nil }
    
    var nodeValueList = [Int]()
    
    for list in lists
    {
        var temp = list
        while temp != nil
        {
            nodeValueList.append(temp!.val)
            temp = temp!.next
        }
    }
    
    nodeValueList.sort()
    
    guard let firstList = nodeValueList.first else { return nil }
    
    var head : ListNode? = ListNode(firstList)
    var tail : ListNode? = head
    
    for item in nodeValueList.dropFirst()
    {
        tail?.next = ListNode(item)
        tail = tail?.next
    }
    return head
   
}
