//
//  LeetCode31.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/05/24.
//

import Foundation

func lengthOfLongesSubstring(_ s: String) -> Int {
    var textDictionary = [String : Int]()
    var maxLength = 0
    var start = 0
    
    let texts = s.map { String($0) }
    
    for (index, text) in texts.enumerated() {
        if start <= textDictionary[text, default: 0] {
            start += textDictionary[text, default: 0] + 1
        } else {
            maxLength = max(maxLength, index - start + 1)
        }
        
        textDictionary[text] = index
    }
    
    return maxLength
}
