//
//  Node.swift
//  LinkedList
//
//  Created by ByungHoon Ann on 2022/11/26.
//

import Foundation


/*
  Node
   Data       Pointer(next)
  _________________
  |__________|____|
 */

class Node<T>: Equatable {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else { return "\(value)"}
        return "\(value) -> \(String(describing: next))"
    }
}
