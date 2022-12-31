//
//  Pratice10.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2022/12/31.
//

import Foundation
/*
문제 설명

2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT
입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.
제한 조건
2016년은 윤년입니다.
2016년 a월 b일은 실제로 있는 날입니다. (13월 26일이나 2월 45일같은 날짜는 주어지지 않습니다)
*/


// 윤년
// 1/1 금요일

func pratice10(_ a:Int, _ b:Int) -> String {
    let days = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    
    func getMonthDayCount(_ month: Int) -> Int {
        let threeOneMonth = [1,3,5,7,8,10,12]
        let threeZeroMonth = [4,6,9,11]
        var endDay = 29
        if threeOneMonth.contains(month) {
            endDay = 31
        } else if threeZeroMonth.contains(month) {
            endDay = 30
        }
        return endDay
    }
    
    var total = 0
    
    if a > 1 {
        for i in 1..<a {
            total += getMonthDayCount(i)
        }
        
        total += b
    } else if a == 1 {
        total = b
    }
  
    var index = total % 7
    print("인덱스", index)
    if index > 0 {
        index -= 1
    } else {
        index = 6
    }
    print(a,b)
    return days[index]
}

/*
배열 극한 활용
 func solution(_ a:Int, _ b:Int) -> String {

     let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
     let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
     let totalDay = monthDay[0..<a-1].reduce(0, +) + b

     return w[totalDay % 7]
 }
 
 */
