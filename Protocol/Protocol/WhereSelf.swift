//
//  WhereSelf.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/19.
//

import Foundation

protocol TestWhere {
    func textPrint(text: String)
}

class PClass: TestWhere {
    func textPrint(text: String) {
        print(text)
    }
}

extension TestWhere where Self: PClass  {
    func onlyPClassTest(text: String) {
        print(text)
    }
}

class TestWhereClass: PClass {
    func extPrint(text: String) {
        textPrint(text: text)
    }
}
/*
 Referencing instance method 'onlyPClassTest(text:)' on 'TestWhere' requires that 'DClass' inherit from 'PClass'

class DClass: TestWhere {
    func textPrint(text: String) {
        onlyPClassTest(text: text)
    }
    
}


*/

