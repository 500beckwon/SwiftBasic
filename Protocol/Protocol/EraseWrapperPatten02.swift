//
//  EraseWrapperPatten02.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/15.
//

import Foundation

protocol Container {
    associatedtype Item
    var items: [Item] { get set }
    var count: Int { get }
    mutating func push(item: Item)
    mutating func pop() -> Item?
}

extension Container {
    var count: Int {
        return items.count
    }
}

struct StackContainer<Item>: Container {
    var items: [Item]
    
    mutating func push(item: Item) {
        items.append(item)
    }
    
    mutating func pop() -> Item? {
        items.popLast()
    }
}
