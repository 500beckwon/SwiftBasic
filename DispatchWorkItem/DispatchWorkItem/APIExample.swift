//
//  APIExample.swift
//  DispatchWorkItem
//
//  Created by ByungHoon Ann on 2023/03/19.
//

import Foundation

struct APIExample {
    func nestedClosureWork() {
        var arr = [String]()
        let startTime = Date()
        callApiA { responseFromA in
            callApiB { responseFromB in
                callApiC { responseFromC in
                    arr.append(responseFromA)
                    arr.append(responseFromB)
                    arr.append(responseFromC)
                    debugPrint(Date().timeIntervalSince(startTime))
                }
            }
        }
    }
    
    func dispatchWorkGroup() {
        var arr = [String]()
        let startTime = Date()
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        callApiA { responseFromA in
            arr.append(responseFromA)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        callApiB { responseFromB in
            arr.append(responseFromB)
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        callApiC { responseFromC in
            arr.append(responseFromC)
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            debugPrint(Date().timeIntervalSince(startTime))
        }
    }
    
    func callApiA(completion: @escaping(String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
            completion("data from service A")
        }
    }
    
    func callApiB(completion: @escaping(String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
            completion("data from service B")
        }
    }
    
    func callApiC(completion: @escaping(String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3)) {
            completion("data from service B")
        }
    }
}

