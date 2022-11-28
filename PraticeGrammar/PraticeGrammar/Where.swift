//
//  Where.swift
//  PraticeGrammar
//
//  Created by ByungHoon Ann on 2022/11/28.
//

import Foundation


func checkIValue() {
    for i in 1...5 where i < 3 {
        print(i)
    }
}

func optionalWhere() {
    let arrayOfOptionalInts = [1, 2, 3, nil, 5, nil, 6]
    for case let number? in arrayOfOptionalInts where number > 2 {
        print(number)
    }
}

func checkAnyValue(value: Any) {
    switch value {
    case let value where value is Int:
        print("\(value) is Int")
    case let value where value is String:
        print("\(value) is String")
    case let value where value is Double:
        print("\(value) is Double")
    default:
        print("\(value) is Any")
    }
}


protocol SelfPrintable {
    func printSelf()
}

extension Int: SelfPrintable { }
extension UInt: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of:self))")
    }
}

extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of:self))")
    }
}
