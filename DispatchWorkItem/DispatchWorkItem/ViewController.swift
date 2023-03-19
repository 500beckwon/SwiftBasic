//
//  ViewController.swift
//  DispatchWorkItem
//
//  Created by ByungHoon Ann on 2022/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // practice2()
        // practice3()
        // practice4()
        //workNestClosureItemExampleTest()
        workDispatchQueueItemExampleTest()
    }
    
    func workNestClosureItemExampleTest() {
        let object = APIExample()
        
        object.nestedClosureWork()
    }
    
    func workDispatchQueueItemExampleTest() {
        let object = APIExample()
        
        object.dispatchWorkGroup()
    }

    
    func practice1() {

    }
    
    func practice2() {
        let workItem = DispatchWorkItem {
            print(Thread.current)
            for i in 1...10 {
                print("><", i)
            }
        }
        workItem.perform()
    }
    
    func practice3() {
        let annQueue = DispatchQueue(label: "Ann", qos: .userInitiated)
        let hoonQueue = DispatchQueue(label: "hoon", qos: .userInitiated)
        
        annQueue.async {
            for i in 1...5 {
                print("Ann \(i)")
            }
        }
        
        hoonQueue.async {
            for i in 100...105 {
                print("hoon \(i)")
            }
        }
    }
    
    func practice4() {
        let myQueue = DispatchQueue(label: "MyQueue", attributes: .concurrent)
        
        
        let annItem = DispatchWorkItem(qos: .userInitiated) {
            print(Thread.current)
            for i in 1...5 {
                print("Ann Item = \(i)")
            }
        }
        
        let hoonItem = DispatchWorkItem(qos: .utility) {
            print(Thread.current)
            for i in 100...105 {
                print("Hoon Item = \(i)")
            }
        }
        myQueue.async(execute: hoonItem)
        myQueue.async(execute: annItem)
    }
}

