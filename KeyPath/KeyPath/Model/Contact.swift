//
//  Contact.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import Foundation

@dynamicMemberLookup
struct Contact {
    var persons: [String: String]
    
//    subscript(planet: String) -> String {
//        get {
//            return persons[planet] ?? ""
//        } set {
//            persons[planet] = newValue
//        }
//    }
    
    subscript(dynamicMember planet: String) -> String? {
        return persons[planet]
    }
}


