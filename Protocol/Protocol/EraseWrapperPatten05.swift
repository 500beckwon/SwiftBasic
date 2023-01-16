//
//  EraseWrapperPatten05.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/16.
//

import Foundation

protocol CarFactoryProtocol {
    associatedtype CarType
    func produce() -> CarType
}

struct ElectricCar {
    let brand: String
}

struct PetrolCar {
    let brand: String
}

struct TeslaFactory: CarFactoryProtocol {
    typealias CarType = ElectricCar
    
    func produce() -> TeslaFactory.CarType {
        print("producing tesla electric car ...")
        return ElectricCar(brand: "Tesla")
    }
}

struct BMWFactory: CarFactoryProtocol {
    typealias CarType = ElectricCar
    
    func produce() -> BMWFactory.CarType {
        print("producing bmw electric car ...")
        return ElectricCar(brand: "BMW")
    }
}

struct AnyCarFactory<CarType>: CarFactoryProtocol {
    private let _produce: () -> CarType
    
    init<Factory: CarFactoryProtocol>(_ carFactory: Factory) where Factory.CarType == CarType {
        _produce = carFactory.produce
    }
    
//    init(_ carFactory: CarFactoryProtocol)  {
//        _produce = carFactory.produce
//    }
    
    func produce() -> CarType {
        return _produce()
    }
}
