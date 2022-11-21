//
//  ViewController.swift
//  GCDPratice
//
//  Created by ByungHoon Ann on 2022/11/21.
//

import UIKit

var numbers = [0, 1, 2, 3, 4]

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        serialSync()
        serialAsync()
        concurrentSync()
        concurrentAsync()
    }
    
    func deadlockQueue() {
        // 해당 코드를 사용하면 앱이 종료된다
        DispatchQueue.main.async {
            DispatchQueue.main.sync {
                // 끊임없이 앱의 이벤트 처리를 하고 있던 Main Thread가 sync 호출에 의해 멈추게 되고 Deadlock 발생
                // 외부 블록은 내부 블록이 완료되기를 기다리는 상태
            }
        }
    }
    
    func serialSync() {
        let dispatchQueue = DispatchQueue(label: "custom")
        numbers.forEach { index in
            dispatchQueue.sync {
                print("serialSync1", index)
            }
        }
    }
    
    func serialAsync() {
        numbers.forEach { index in
            DispatchQueue.main.async {
                print("warningDispatchQueue", index)
            }
        }
    }
    
    func concurrentSync() {
        numbers.forEach { index in
            DispatchQueue.global().sync {
                print("concurrentSync", index)
            }
        }
    }
    
    func concurrentAsync() {
        numbers.forEach { index in
            DispatchQueue.global().async {
                print("concurrentAsync", index)
            }
        }
    }
}
