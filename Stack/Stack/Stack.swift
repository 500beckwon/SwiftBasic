//
//  Stack.swift
//  Stack
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation

/*
 Stack은 어떤 것을 쌓는다는 것을 표현하기 위해 만든 선형 자료 구조로 배열과 같지만 특정 기능에 특화한 배열이다
 
 * 선형 자료구조란?
 - 하나의 자료 뒤에 하나의 자료가 존재하는 것이다. 자료들 간의 앞뒤 관계가 1:1의 선형관계
 
 * 비선형 자료구조란?
 - 비선형 자료구조란 하나의 자료 뒤에 여러개의 자료가 존재할 수 있는 것
 - 자료들 간의 앞뒤 관계가 1:n, 또는 n:n 의 관계
 - 트리와 그래프가 대표적이며 계층적 구조를 나타내기에 적절하다.
 
 Stack은 LIFO의 특징을 가지는 자료구조이다 스택은 자료를 저장할 때 먼저 넣은 데이터를 마지막에 꺼내게 되는 구조로 이루어져있다
 LIFO(Last Input First Out) 라이포라고 읽는다
 swift의 배열은 스택과 동일한 append, removeLast 메서드를 지원하기 때문에 배열을 한 번 감싸주는 자료구조를 구현하면 쉽게 제작이 가능하다
 
 중간 데이터 삭제같은 행위가 들어가는 자료로는 Stack이 적합하지 않고 효율도 좋지 않기 때문에 주의해야한다
 
 역순 문자열 재작
 수식의 괄호 검사
 후위 표기볍 계산
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
    /// peak라고도 표시한 자료가 있엇다
    /// 배열의 last 프로퍼티를 통해 마지막 요소를 반환한다
    func top() -> T? {
        return elements.last
    }
}
