//
//  EraseWrapperPatten.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/15.
//

import Foundation


// Self 제약과 연관 타입이 없는 Protocol

protocol Person {
    var name: String { get set }
    var age: Int { get set }
    func greeting() -> String
}

struct KoreanPerson: Person {
    var name: String
    var age: Int

    func greeting() -> String {
        return ""
    }
}

struct EnglishPerson: Person {
    var name: String
    var age: Int
    
    func greeting() -> String {
        return "Hello, My name is \(name) and I'm \(age) years old."
    }
}

class PersonTest {
    
    let someone: Person = KoreanPerson(name: "김철수", age: 31)
    
    var people: [Person] = [
        KoreanPerson(name: "김철수", age: 31),
        EnglishPerson(name: "Berry Chan", age: 21)
    ]
    
    func meet(person: Person) {
        print(person.greeting())
    }
    
    func lastPerson(people: [Person]) -> Person? {
        return people.last
    }
}

protocol Person2 {
    var name: String { get set }
    var age: Int { get set }
    func greeting() -> String
    func meet(other: Self)
}

struct KoreanPerson2: Person2 {
    
    var name: String
    var age: Int

    func greeting() -> String {
        return ""
    }
    
    func meet(other: KoreanPerson2) {
        print(other)
    }
}
