//
//  LeetCode08.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/02/02.
//

import Foundation

/*
 Given an array of strings strs, group the anagrams together.
 You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
 typically using all the original letters exactly once.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var anagramDictionary = [String: [String]]()
    
    strs.forEach {
        anagramDictionary[String($0.sorted()), default: []].append($0)
    }
    
    return Array(anagramDictionary.values)
}

