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

var containers: [StackContainer<Int>] = [
    StackContainer(items: [])
]

containers[0].push(item: 1)
containers[0].push(item: 2)
containers[0].push(item: 3)

print(containers)
print(containers[0].count)


var anyContainer: StackContainer<Any> = StackContainer(items: [])
anyContainer.push(item: 1)
anyContainer.push(item: "Hello")
anyContainer.push(item: 12.5)

print(anyContainer)
if let item = anyContainer.pop() {
    // item의 타입을 모른다.
    // 그래서 아래와 같이 타입 캐스팅이 필요하다.
    switch item {
    case is Int:
        print("Hi, I'm Int. and value is \(item)")
    case is String:
        print("Hi, I'm String. and value is \(item)")
    case is Double:
        print("Hi, I'm Double. and value is \(item)")
    default:
        print("I don't know what I am")
    }
}
/*
 var errorContainers = [
 StackContainer<Int>(items: []),
 StackContainer<Double>(items: [])
 ]
 */

var dataCollection = [
    CellModel<String>(),
    CellModel<Int>()
]

