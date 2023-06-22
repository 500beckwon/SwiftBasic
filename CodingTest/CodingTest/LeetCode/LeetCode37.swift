//
//  LeetCode37.swift
//  CodingTest
//
//  Created by dev dfcc on 2023/06/22.
//

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    let textList = s.map { String($0) }
    var currentRow = 0
    var dic = [Int: [String]]()
    var upRow = true
    
    for text in textList {
        dic[currentRow, default: []].append(text)

        if upRow == true {
            if currentRow == numRows - 1 {
                currentRow -= 1
                upRow = false
            } else {
                currentRow += 1
            }
        } else {
            if currentRow == 0 {
                currentRow += 1
                upRow = true
            } else {
                currentRow -= 1
            }
        }
    }
    
    var resultText = ""
    
    dic.sorted(by: { $0.key < $1.key }).forEach {
        resultText += $0.value.joined()
    }
    
    return resultText
}
