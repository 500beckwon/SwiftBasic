//
//  main.swift
//  Subscript
//
//  Created by ByungHoon Ann on 2022/11/24.
//

import Foundation

let text = "Hell, World"


extension String {
    subscript(cIndex: Int) -> String? {
        guard (0..<count).contains(cIndex) else {
            return nil
        }
        
        let target = index(startIndex, offsetBy: cIndex)
        return String(self[target])
    }
}

struct Stack {
    var stack: [Int] = [0, 1, 2, 3, 4, 5]
 
    subscript(index: Int) -> Int {
        get {
            return stack[index]
        }
        set {
            stack[index] = newValue
        }
    }
}

struct Stack2 {
    static var stack: [Int] = [0, 1, 2, 3, 4, 5]
 
    static subscript(index: Int) -> Int {
        get {
            return stack[index]
        }
        set {
            stack[index] = newValue
        }
    }
}




print("""
      \(text[1])
      \(text[4])
      \(text[5])
      \(text[22])
      
      """)

var stack = Stack()
stack[5] = 6
print(stack)

print("""
      \(stack[1])
      \(stack[2])
      \(stack[5])
      
      """)

print("""
      \(Stack2[1])
      \(Stack2[2])
      \(Stack2[5])
      """)

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[10])")
// "six times three is 18" 출력

struct Matrix {
    let rows: Int
    let columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5 // [0.0, 1.5, 0.0, 0.0]
matrix[2, 2] = 3.6 // 범위가 넘어가므로 assertion 발생
