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
//        serialSync()
//        serialAsync()
//        concurrentSync()
//        concurrentAsync()
               
        semaphore()
//        let concurrentQueue = DispatchQueue(label: "SodeulQueue")
//        concurrentQueue.sync  { print("start") }
//        concurrentQueue.async { for _ in 0...5 { print("async") }}
//        concurrentQueue.sync  { for _ in 0...5 { print("sync") } }
//        concurrentQueue.sync  { print("end") }
//
//        print("end")
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
    
    func semaphore() {
        let queue = DispatchQueue(label: "Queue", attributes: .concurrent, target: .main)
        let group = DispatchGroup()
        var result: Int = 0

        // 보통 리소스 풀을 관리할 때는 0보다 큰 값을 value 파라미터로 전달합니다.
        // 여러 작업을 하나씩 순서대로 실행해야 한다면 1을 전달합니다.
        let semaphore = DispatchSemaphore(value: 1)

        queue.async(group: group) {
            for _ in 1...1000 {
                semaphore.wait() // 1 감소
                result += 1
                semaphore.signal() // 1 증가
            }
        }

        queue.async(group: group) {
            for _ in 1...1000 {
                semaphore.wait()
                result += 1
                semaphore.signal()
            }
        }

        queue.async(group: group) {
            for _ in 1...1000 {
                semaphore.wait()
                result += 1
                semaphore.signal()
            }
        }

        group.notify(queue: DispatchQueue.main) {
            print(result)
        }
    }
}
