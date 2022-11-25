//
//  main.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2022/11/25.
//

import Foundation

let trans = Bicycle()

trans.moveState
trans.pullBreak()
trans.spin()
trans.hold()

let trans2: While = Bicycle()
trans2.hold()
trans2.spin()



protocol A {
    func doA()
}

protocol B {
    func doB()
}

class Impl: A, B {
    func doA() {
        
    }
    
    func doB() {
        
    }
    
    func desc() -> String {
        return "Class instance method"
    }
}

var ipl: A & B = Impl()
ipl.doB()
ipl.doA()

let abc: Cc = ABC()
let a: Aa = ABC()
let ab: Aa & Bb = ABC()
let abc2: Aa & Bb & Cc = ABC()

foo(abc: abc)
boo(abc: abc)

protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate?
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    func startPump() {
        while true {
            if fuelGage > 0 {
                jetFuel()
            } else {
                break
            }
        }
    }
    
    func jetFuel() {
        fuelGage -= 1
    }
}

class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    
    func lackFuel() {
        print("부족")
    }
    
    func fullFuel() {
        print("가득")
    }
    
    func start() {
        fuelPump.startPump()
    }
}

let car = Car()
car.start()

