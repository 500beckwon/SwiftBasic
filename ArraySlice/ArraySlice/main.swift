//
//  main.swift
//  ArraySlice
//
//  Created by ByungHoon Ann on 2023/01/19.
//

import Foundation

print("Hello, World!")

var intArray = [1, 2, 3, 4, 5, 6, 7, 8]

var intSliceArray1 = intArray[2...3]
var intSliceArray2 = intArray[0...3]
var intSliceArray3 = intArray[0...]
var intSliceArray4 = intArray[..<4]

print(intSliceArray1, intSliceArray2, intSliceArray3, intSliceArray4, separator: "\n")

var stringArray = ["가", "나", "다", "라", "마", "바", "사"]

var stringSliceArray1 = stringArray[2...3]
var stringSliceArray2 = stringArray[0...3]
var stringSliceArray3 = stringArray[5...]
var stringSliceArray4 = stringArray[..<stringArray.count]
print(stringSliceArray1, stringSliceArray2, stringSliceArray3, stringSliceArray4, separator: "\n")

let scoreArray = [3.5, 4.0, 2.0, 4.5, 3.2, 4.3]
let mid = scoreArray.count / 2
let leftArraySum = scoreArray[..<mid].reduce(0, +)
let rightArraySum = scoreArray[mid...].reduce(0, +)

print(mid, leftArraySum, rightArraySum, separator: "\n")
