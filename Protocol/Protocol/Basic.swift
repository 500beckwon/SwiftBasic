//
//  Basic.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2022/11/25.
//

import Foundation

protocol MyInitProtocol {
    init()
    init(cmd: String)
}

struct SInit: MyInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = ""
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
}

class CInit: MyInitProtocol {
    var cmd: String
    
    required init(cmd: String) {
        self.cmd = cmd
    }
    
    required init() {
        cmd = ""
    }
}

protocol Init {
    init()
}

class ParentClass {
    init() {
        
    }
}

class Child: ParentClass, Init {
    override required init() {
        
    }
}

protocol Init2 {
    func getValue()
}

class ParentClass2 {
    func getValue() {
        
    }
}

class Child2: ParentClass2, Init2 {
    override func getValue() {
        
    }
}

protocol While {
    func spin()
    func hold()
}

class Bicycle: While {
    var moveState = false
    
    func spin() {
        pedal()
    }
    
    func hold() {
        pullBreak()
    }
    
    func pedal() {
        self.moveState = true
    }
    
    func pullBreak() {
        self.moveState = false
    }
}

protocol Aa {
    func doA()
}

protocol Bb {
    func doB()
}

protocol Cc: Aa, Bb {
    func doA()
    func doB()
    func doC()
}

class ABC: Cc {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func doC() {
        
    }
}

func foo(abc: Cc) {
    
}

func boo(abc: Aa & Bb) {
    
}
