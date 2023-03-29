//
//  MyCircularQueue.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/03/29.
//

import Foundation

/*
 Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle, and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

 One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

 Implement the MyCircularQueue class:

 MyCircularQueue(k) Initializes the object with the size of the queue to be k.
 int Front() Gets the front item from the queue. If the queue is empty, return -1.
 int Rear() Gets the last item from the queue. If the queue is empty, return -1.
 boolean enQueue(int value) Inserts an element into the circular queue. Return true if the operation is successful.
 boolean deQueue() Deletes an element from the circular queue. Return true if the operation is successful.
 boolean isEmpty() Checks whether the circular queue is empty or not.
 boolean isFull() Checks whether the circular queue is full or not.
 You must solve the problem without using the built-in queue data structure in your programming language.
 */

class MyCircularQueue {
    var list: [Int]
    
    let maxCount: Int
    var firstPoint: Int
    var secondPoint: Int
    
    init(_ k: Int) {
        list = (0..<k).map { _ in -1 }
        maxCount = k
        firstPoint = 0
        secondPoint = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if list[secondPoint] == -1 {
            list[secondPoint] = value
            secondPoint = (secondPoint + 1) % maxCount
            return true
        }
        return false
    }
    
    func deQueue() -> Bool {
        if list[firstPoint] == -1 {
            return false
        }
        
        list[firstPoint] = -1
        firstPoint = (firstPoint + 1) % maxCount
        return true
        
    }
    
    func front() -> Int {
        if firstPoint - 1 < 0 {
            return list.first ?? -1
        }
        return list[firstPoint]
    }
    
    func rear() -> Int {
        if secondPoint - 1 < 0 {
            return list.last ?? -1
        }
        return list[secondPoint - 1]
    }
    
    func isEmpty() -> Bool {
        return firstPoint == secondPoint && list[firstPoint] == 0
    }
    
    func isFull() -> Bool {
        return firstPoint == secondPoint && list[firstPoint] != 0
    }
}

/*
 private var arr: [Int]
   
   private var read = 0
   private var write = 0
   private var count = 0

   init(_ k: Int) {
       arr = Array(repeating: 0, count: k)
   }
   
   func enQueue(_ value: Int) -> Bool {
       if isFull() {
           return false
       }
       
       arr[write] = value
       write = (write + 1) % arr.count
       count += 1
       return true
   }
   
   func deQueue() -> Bool {
       if isEmpty() {
           return false
       }
       
       read = (read + 1) % arr.count
       count -= 1
       return true
   }
   
   func Front() -> Int {
       if isEmpty() {
           return -1
       }
       
       return arr[read]
   }
   
   func Rear() -> Int {
       if isEmpty() {
           return -1
       }
       
       var index = write - 1
       if index < 0 {
           index = arr.count - 1
       }
       return arr[index]
   }
   
   func isEmpty() -> Bool {
       return count == 0
   }
   
   func isFull() -> Bool {
       return count == arr.count
   }
 */
