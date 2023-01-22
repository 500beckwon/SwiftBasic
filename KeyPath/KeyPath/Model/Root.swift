//
//  Root.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import Foundation

@dynamicMemberLookup
struct MyContainer<Root> {
    private let root: Root
    
    init(_ root: Root) {
        self.root = root
    }
    
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<Root, Value>) -> Value {
        return root[keyPath: keyPath]
    }
}

struct MyStruct {
    var name: String
    var age: Int
}


