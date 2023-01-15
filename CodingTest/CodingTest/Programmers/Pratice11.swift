//
//  Pratice11.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2023/01/04.
//

import Foundation


func pratice11(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for i in 0..<commands.count {
        let start = commands[i][0] - 1
        let end = commands[i][1] - 1
        let indexK = commands[i][2] - 1
        
        let slice = array[start...end].sorted(by: <)
        answer.append(slice[indexK])
    }
   
    return answer
}

/*
 깔끔한 다른 천재의 답
 return commands.map({(key) in
       return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
   })
 */
