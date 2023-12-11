//
//  main.swift
//  Fibonacci
//
//  Created by ByungHoon Ann on 2023/12/11.
//

import Foundation

print("Hello, World!")

func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2)
    }
}

for i in 0..<10 {
    print(fibonacci(i))
}


func fibonacci2(_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    
    var fib = Array(repeating: 0, count: max(n + 1, 2))
    fib[1] = 1
    
    for i in 2...n {
        fib[i] = fib[i - 1] + fib[i - 2]
    }
    
    return fib[n]
}

// 피보나치 수열의 첫 10개 항을 출력
for i in 0..<10 {
    print("hi",fibonacci2(i))
}
