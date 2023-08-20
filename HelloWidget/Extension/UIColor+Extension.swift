//
//  UIColor+Extension.swift
//  HelloWidget
//
//  Created by ByungHoon Ann on 2023/05/07.
//

import UIKit
import SwiftUI

extension UIColor {
    var randomColor: UIColor {
        UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}

extension Color {
    var randomColor: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
