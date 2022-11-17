//
//  Heap.swift
//  Heap
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation

/*
 Heap은 이진트리를 사용해서 데이터를 반정렬 상태로 유지하는 자료구조이다 힙은 트리의 루트 노드에 데이터들의 최솟값 혹은 최대값을 저장한다
 최솟값을 루트에 둘 때는 최소힙 최대값을 루트에 두면 최대힙이라고 한다
 
 완전 이진 트리
 
 이진 트리는 트리르 구성하는 모든 노드가 최대 두 개의 자식 노드를 가지는 자료구조이다
 완전 이진트리는 각 높이에 있는 모돈 노드가 자식 노드를 가져야 다음 높이에 새 노드를 추가할 수 있고 가장 왼쪽부터 차례대로 노드를 채워야 한다
*/

struct Heap<T: Comparable> {
    private var elements: [T] = []
    
    // 최소힙, 최대힙의 기준점으로 삼을 정렬 로직을 가진 클로저
    private let sortFunction: (T, T) -> Bool
    
    // 이진트리의 요소들이 1개인지 확인하는 프로퍼티
    // 배열의 0번째 인덱스는 사용하지 않는 값이기 때문에 값이 하나만 있을 때는 비어져 있다는 뜻
    var isEmpty: Bool {
        return elements.count == 1
    }
    
    //
    var peek: T? {
        if isEmpty {
            return nil
        }
        return elements[1]
    }
    
    var count: Int {
        return elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping(T, T) -> Bool) {
        if !elements.isEmpty {
            self.elements = [elements.first!] + elements
        } else {
            self.elements = elements
        }
        
        self.sortFunction = sortFunction
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        return (index)/2
    }
    
    mutating func add(element: T) {
        elements.append(element)
    }
    
    /// 삽입 구현
    /// 트리 제일 끝에서 노드 붙이기
    /// 새 노드를 올릴 수 있는데 까지 올리기
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1 && sortFunction(elements[index], elements[parent(of: index)]) {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    mutating func insert(node: T) {
        if elements.isEmpty {
            elements.append(node)
            return
        }
        
        elements.append(node)
        swimUp(from: elements.endIndex - 1)
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = leftChild(of: index)
        let rightIndex = rightChild(of: index)
        
        if leftIndex < elements.endIndex && sortFunction(elements[leftIndex], elements[higherPriority]) {
            higherPriority = leftIndex
        }
        
        if rightIndex < elements.endIndex && sortFunction(elements[rightIndex], elements[higherPriority]) {
            higherPriority = rightIndex
        }
        
        if higherPriority != index {
            elements.swapAt(higherPriority, index)
            diveDown(from: higherPriority)
        }
    }
    
    mutating func buildHeap() {
        for index in (1...(elements.count / 2)).reversed() {
            diveDown(from: index)
        }
    }
}
