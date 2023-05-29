//
//  LeetCode35.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/05/29.
//

import Foundation

func letterCombinationsOfPhoneNumber(_ digits: String) -> [String] {
    guard digits.isEmpty == false else  { return [] }
    let digitsArray = digits.map { "\($0)" }
    var result = [String]()
    let  digitsDictionary = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno" ,"7": "pqrs", "8": "tuv", "9": "wxyz"]
    func dfs(index: Int, path: String) {
        if path.count == digits.count {
            result.append(path)
            return
        }
        
        for i in index..<digits.count {
            let theme = digitsDictionary[digitsArray[i]]!.compactMap { String($0) }
            for j in theme {
                dfs(index: i + 1, path: path + j)
            }
        }
    }
    
    dfs(index: 0, path: "")
    
    return result
}
