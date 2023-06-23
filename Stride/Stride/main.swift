//
//  main.swift
//  Stride
//
//  Created by dev dfcc on 2023/06/23.
//



/// to는 끝 값을 포함하지 않는다
/// from 시작, to: 끝, by 간격
for i in stride(from: 0, to: 10, by: 2) {
    print(i, terminator: " ")
}

// i : 0 2 4 6 8

print("", terminator: "\n")
print("----------")


/// through는 끝 값을 포함한다
/// from 시작, to: 끝, by 간격
for i in stride(from: 0, through: 10, by: 2) {
    print(i, terminator: " ")
}

// i : 0 2 4 6 8 10

print("", terminator: "\n")
print("---------")

/// 배열 생성에도 쓰일 수 있다.
let evens = Array(stride(from: 0, through: 10, by: 2))
print(evens)


for i in stride(from: 5, to: 55, by: 5) {
    print(i, terminator: " ")
}

// i : 0 2 4 6 8

print("", terminator: "\n")
print("----------")


/// through는 끝 값을 포함한다
/// from 시작, to: 끝, by 간격
for i in stride(from: 5, through: 55, by: 5) {
    print(i, terminator: " ")
}

// i : 0 2 4 6 8 10

print("", terminator: "\n")
print("---------")
