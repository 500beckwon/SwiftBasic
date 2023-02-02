//
//  LeetCode07.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/02.
//

import Foundation

/*
 Given a string paragraph and a string array of the banned words banned,
 return the most frequent word that is not banned. It is guaranteed there is at least one word that is not banned,
 and that the answer is unique.

 The words in paragraph are case-insensitive and the answer should be returned in lowercase.

  

 Example 1:

 Input: paragraph = "Bob hit a ball, the hit BALL flew far after it was hit.", banned = ["hit"]
 Output: "ball"
 Explanation:
 "hit" occurs 3 times, but it is a banned word.
 "ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph.
 Note that words in the paragraph are not case sensitive,
 that punctuation is ignored (even if adjacent to words, such as "ball,"),
 and that "hit" isn't the answer even though it occurs more because it is banned.
 Example 2:

 Input: paragraph = "a.", banned = []
 Output: "a"
 
 Constraints:

 1 <= paragraph.length <= 1000
 paragraph consists of English letters, space ' ', or one of the symbols: "!?',;.".
 0 <= banned.length <= 100
 1 <= banned[i].length <= 10
 banned[i] consists of only lowercase English letters.
 
 */

func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {

    let textList = paragraph
        .lowercased()
        .components(separatedBy: CharacterSet(charactersIn: " !?',;."))
        .filter { !$0.isEmpty }
        .map { String($0) }
        .filter { !banned.contains($0) }

    guard textList.count > 1 else {
        return textList.first ?? ""
    }
    
    var dict = [String: Int]()
    
    textList.forEach {
        let count = dict[$0] ?? 0
        dict[$0] = (count + 1)
    }

    let maxKey = dict.max { $0.value < $1.value}?.key ?? ""
    return maxKey
}
