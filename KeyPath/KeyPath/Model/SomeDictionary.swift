//
//  SomeDictionary.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import Foundation

@dynamicMemberLookup
struct SomeDictionary {
    let value = [
        "name": "jake",
        "age": "12"
    ]
    
    subscript(dynamicMember member: String) -> String? {
        return value[member]
    }
}

