//
//  AssociatedType.swift
//  PraticeGrammar
//
//  Created by ByungHoon Ann on 2022/11/28.
//

import Foundation

protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

class MyContainer: Container {
    var items: [Int] = []
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

protocol QueueCompatible {
    associatedtype Element
    func enqueue(value: Element)
    func dequeue() -> Element?
}

class IntegerQueue: QueueCompatible {
    //typealias Element = Int
    let value: Element = 1
    
    func enqueue(value: Int) {
        print(value)
    }
    
    func dequeue() -> Int? {
        return 0
    }
    
    
}
