//
//  Pratice14.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/17.
//

import Foundation

func Pratice14(_ s:String) -> Int {
    let stringList = s.map { String($0) }
    var disuniteList = [String]()
    var compressionCountList = [Int]()
    var pieceString = ""
    var countNumber = 0
    
    for count in 1..<stringList.count {
        for index in 0..<stringList.count {
            pieceString += stringList[index]
            countNumber += 1
            
            if count == countNumber || index == stringList.count - 1 {
                disuniteList.append(pieceString)
                pieceString = ""
                countNumber = 0
            }
        }
        
        var zipString = ""
        var overlapCount = 1
        
        for index in 0..<disuniteList.count {
            if index + 1 >  disuniteList.count - 1 {
                let _overString = overlapCount == 1 ? "": "\(overlapCount)"
                zipString += "\(_overString)\(disuniteList[index])"
                break
            }
            
            if disuniteList[index] == disuniteList[index + 1] {
                overlapCount += 1
            } else {
                let _overString = overlapCount == 1 ? "": "\(overlapCount)"
                zipString += "\(_overString)\(disuniteList[index])"
                overlapCount = 1
            }
        }
        compressionCountList.append(zipString.count)
        disuniteList = []
    }
    
    return compressionCountList.min() ?? 0
}
