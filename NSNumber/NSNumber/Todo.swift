//
//  Todo.swift
//  NSNumber
//
//  Created by dev dfcc on 2023/05/15.
//

import Foundation

struct Todo: Equatable {
    var name: String
    var id: String
    var date: Date
}

func ==(lhs: Todo, rhs: Todo) -> Bool {
    return lhs.name == rhs.name
    && lhs.id == rhs.id
    && lhs.date.timeIntervalSince(rhs.date) < 1.0
}


