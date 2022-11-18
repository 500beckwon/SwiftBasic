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
 
 Peek : 맨 앞에 위치한 데이터
 front : 큐 맨 앞의 index
 back(rear) : 큐 맨 뒤의 index
 
 선형 Queue
 막대 모영  Queue Queue의 마지막에 원소를 추가하고 맨 앞의 원소를 뺍니다
 기본 Queue는 front를 감소시키는 방법이 없기 때문에 공간이 꽉 차게 되면 더이상 요소를 추가할 수 없다
 심지어 dequeue로 데이터가 빠져서 앞에 공간이 남아도 이 공간에 데이터를 추가할 수 있는 방법이 없다
  
 원형 Queue
 front가 back과 같아지면 Queue의 맨 앞으로 데이터를 넣어 원형으로 연결하는 Queue
 즉, 맨 끝까지 데이터가 차고 맨 앞에 공간이 있다면 맨 앞에 데이터를 넣겠다는 의미
 맨 뒤와 맨 앞이 연결되어 원형이라고 부른다
  
 front를 추가로 조작해야 하지만 선형 Queue보다 메모리 효율면에서 우수하다
 
 우선순위 Queue
 Enqueue 하는 것은 일반 Queue와 동일하지만 Dequeue를 하는 것에 차이가 있다.
 일반 Queue는 먼저 집어 넣은 데이터가 먼저 나오는 구조이지만 우선순위 Queue는 우선순위에 따라 나오는 순서가 결정된다
 넣는 순서에 상관 없이 우선순위를 매겨 이를 기준으로 Dequeue합니다.
  
 Deque
 입구와 출구가 따로 존재하는 Queue와 달리 양쪽에서 모두 삽입, 삭제가 가능한 자료구조
 Stack과 Queue의 특성을 모두 갖고 있으며 양쪽에서 삽입, 삭제가 필요한 경우 사용하다
 
 Queue의 사용처
 어떠한 작업/데이터를 순서대로 실행, 사용하기 전 대기시킬 때
 서로 다른 thread 또는 process 사이에서나 네트워크를 통해 자료를 주고 받을 때 자료를 일시적으로 저장할 때
 
 운영체제에서의 Queue
 Buffer Queue : 데이터를 전송하는 동안 일시적으로 데이터를 보관하는 메모리의 Queue
 Scheduling Queue : CPU 할당을 얻기 위해 대기 중인 프로세스가 쌓이는 Queue
 운영체제는 I/O 작업의 데이터를 임시로 보관하거나 Scheduling을 위해 Queue를 사용
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

struct Queue2<T> {
   var queue: [T?] = []
   var front: Int
   
   var frontValue: Int {
      return front
   }
   
   var size: Int {
      return queue.count
   }
   
   var isEmpty: Bool {
      return queue.isEmpty
   }
   
   mutating func enqueue(_ element: T) {
      queue.append(element)
   }
   
   mutating func dequeue() -> T? {
      guard front <= size, let element = queue[front] else {
         return nil
      }
      
      queue[front] = nil
      front += 1
      return element
   }
   
}
