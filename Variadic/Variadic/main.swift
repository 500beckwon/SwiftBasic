//
//  main.swift
//  Variadic
//
//  Created by ByungHoon Ann on 2022/11/21.
//

import Foundation

/* 가변인자
 임의의 인수로 이루어진 매개 변수 매개변수 타입 뒤에 ... 을 붙여 사용한다
 가변 매개 변수는 함수 내부에서 array 형태로 쓰이게 된다
 함수마다 가변 매개 변수는 한개만 가질 수 있다
*/
func average(score: Int...) -> Double {
    var total = 0
    for index in score {
        total += index
    }
    print(score)
    return (Double(total) / Double(score.count))
}

print(average(score: 10,20,30,40))
print(average(score: ))

func joinString(strings: String...) -> String {
    var totalString = ""
    for string in strings {
        totalString += string
    }
    
    return totalString
}

print(joinString(strings: "1" , "2", "3", "4"))
