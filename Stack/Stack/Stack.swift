//
//  Stack.swift
//  Stack
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation

/*
 Stack은 LIFO의 특징을 가지는 자료구조이다 스택은 자료를 저장할 때 먼저 넣은 데이터를 마지막에 꺼내게 되는 구조로 이루어져있다
 swift의 배열은 스택과 동일한 append, removeLast 메서드를 지원하기 때문에 배열을 한 번 감싸주는 자료구조를 구현하면 쉽게 제작이 가능하다

 */

struct Stack<T> {
    var elements: [T] = []
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    /// 삽입 연선  0(1)
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    /// 삭제 0(1)
    /// removeLast()는 배열애 비어있을 때 사용하면 에러를 발생시키지만 popLast를 사용하면 nil을 반환한다
    mutating func pop() -> T? {
        elements.popLast()
    }
    
    /// 조회 0(1)
    /// 스택의 조회는 특정한 요소를 조회하는게 아닌 스택의 가장 위에 쌓여있는 요소를 조회활 수 있게 한다
    /// 배열의 last 프로퍼티를 통해 마지막 요소를 반환한다
    func top() -> T? {
        return elements.last
    }
}
