//
//  main.swift
//  PraticeGrammar
//
//  Created by ByungHoon Ann on 2022/11/28.
//

import Foundation

print("Hello, World!")

// FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 타입 Int
Int(-8).printSelf()

// CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 UInt
UInt(8).printSelf()

// CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 String
String("asas").printSelf()

// CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 Double
Double(8.0).printSelf()

optionalWhere()
var intC = Color(red: 128, green: 128, blue: 200)
var doubleC = Color(red: 128.0, green: 128.0, blue: 200.0) // error
let intComponents = intC.getComponets()
// let doubleComponents = doubleC.getComponets()
