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
        // Do any additional setup after loading the view.
        let myGroup = DispatchGroup()
        let serialQueue = DispatchQueue(label: "serialQueue")
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
//        let workItem = DispatchWorkItem {
//            print(Thread.current, "workItem")
//            for i in 1...10 {
//                print("?", i)
//            }
//        }
        
        serialQueue.async(group: myGroup) {
            print(Thread.current, "serialQueue")
            for i in 1...10 {
                print("!", i)
            }
        }
        
        serialQueue.async(group: myGroup) {
            print(Thread.current, "serialQueue2")
            for i in 1...10 {
                print("#", i)
            }
        }
        
        myGroup.notify(queue: .main) {
            print("Done - 1")
        }
        
        concurrentQueue.async(group: myGroup) {
            print(Thread.current, "concurrentQueue")
            for i in 1...10 {
                print("%", i)
            }
        }
        
        myGroup.notify(queue: .main) {
            print("Done - 2")
        }
        
//        serialQueue.async(group: myGroup, execute: workItem)
//        print("#1")
//        workItem.wait()
//        print("#2")
        
        
    }


}

