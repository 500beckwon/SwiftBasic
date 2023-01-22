//
//  MyView.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import UIKit

class MyView: UIView {
    var myProperty: String
    
    init(myProperty: String) {
        self.myProperty = myProperty
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
