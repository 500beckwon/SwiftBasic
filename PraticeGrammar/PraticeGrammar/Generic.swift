//
//  Generic.swift
//  PraticeGrammar
//
//  Created by ByungHoon Ann on 2022/11/28.
//

import Foundation

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

extension Color where T: FixedWidthInteger {
    func getComponets() -> [T] {
        return [red, green, blue]
    }
}
