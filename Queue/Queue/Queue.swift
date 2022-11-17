//
//  Queue.swift
//  Queue
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation

/*
 한 쪽 끝에서는 자료의 삽입 연산만 가능하고 반대쪽 끝에서는 삭제만 가능한 자료구조이다.
 이러한 특성을 가리켜 선입선출(FIFO: First In First Out)이라고 한다.
 */

struct Queue<T> {
    var queue: [T] = []
    
    /// 큐에 담겨 있는 자료의 개수
    var count: Int {
        return queue.count
    }
    
    /// 큐가 비어있는지를 체크하기 위한 연산 프로퍼티
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    /// 배열의 append(_:) 연산을 사용하여 큐의 끝에 자료 삽입
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    /// 큐가 비어있다면 nil을 반환 - 큐에 자료가 있다면 배열의 removeFirst() 메서드를 사용하여 앞에 있는 자료 삭제
    /// 큐에서 자료를 삭제하는 연산 큐의 앞쪽에서 자료를 가져온다
    mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
