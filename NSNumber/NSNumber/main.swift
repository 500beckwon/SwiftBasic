//
//  main.swift
//  NSNumber
//
//  Created by dev dfcc on 2023/05/15.
//

import Foundation

print("Hello, World!")

let currencyFormatter: NumberFormatter = {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = .currency
    return currencyFormatter
}()


func makeNumberForamtter(text: String, style: NumberFormatter.Style) -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.numberStyle = style
    
    
    return currencyFormatter.string(from: NSDecimalNumber(string: text))!
}


print(makeNumberForamtter(text: "1.11", style: .currency))
print(makeNumberForamtter(text: "1.11", style: .currencyAccounting))
print(makeNumberForamtter(text: "1.11", style: .currencyISOCode))
print(makeNumberForamtter(text: "1.11", style: .currencyPlural))
print(makeNumberForamtter(text: "1.11", style: .decimal))

struct Name {
    var firstName: String
    var secondName: String
    
    func makeName() -> String {
        return "\(firstName) \(secondName)"
    }
}

let name = Name(firstName: "Ann", secondName: "Hoon")

print(name.makeName())


class Router: NSObject {
    func test(text: String?) {
        print("!?!?!?", text ?? "")
    }
    
    
    func testRouter() {
        let selector = NSSelectorFromString("test:")
        print(responds(to: selector))
    }
}

let router = Router()


router.testRouter()
//router.perform(selector, with: "text")
