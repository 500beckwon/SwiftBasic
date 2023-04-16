//
//  main.swift
//  AccesControl
//
//  Created by ByungHoon Ann on 2022/11/19.
//

import Foundation

print("Hello, World!")

internal class SomeInternalClass {}
private class SomePrivateClass {}
 
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here
}

private func someFunction2() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here
}

public protocol myProtocol{

    func someMethod()

}

open class MyClass : myProtocol{

    public init(){}

    public func someMethod() {
   

    }

}
