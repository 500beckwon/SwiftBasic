//
//  main.swift
//  Stack
//
//  Created by ByungHoon Ann on 2022/11/17.
//

import Foundation

print("Hello, World!")

var intStack1 = Stack<Int>(elements: [1,2,3,4,5,6,7])
var intStack2 = Stack<Int>(elements: [])

print(intStack1.isEmpty)
print(intStack2.isEmpty)

let pop1 = intStack1.pop()
let pop2 = intStack2.pop()
print(pop1, pop2)
