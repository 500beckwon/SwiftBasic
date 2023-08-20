//
//  ViewController.swift
//  CGAffineTransform
//
//  Created by ByungHoon Ann on 2023/01/03.
//

import UIKit

class ViewController: UIViewController {

    var affineView = UIView()
    let getFeedQueue = DispatchQueue(label: "getFeedQueue", qos: .userInteractive, attributes: .concurrent)
    let group = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
       

        getFeedQueue.async(group: group) {
            self.timer(3)
        }
        
        getFeedQueue.async(group: group) {
            self.timer(5)
        }
        
        getFeedQueue.async(group: group) {
            self.timer(1)
        }
        
      
        group.notify(queue: .main) {
            print("hahaha End")
        }
        self.layout()

        
        DispatchQueue.global().sync {
            print("asdfsadf1")
        }

        
        
        print(affineView.frame, affineView.bounds)
        
        affineView.transform = .init(scaleX: 1.5, y: 1.5)
        
        print(affineView.frame, affineView.bounds)
    }
    
    func timer(_ duration: Double = 0.5, _ endTime: Int = 5) {
        var time = 0
       
            print("skldffj")
          
            
        
    }
    

    func layout() {
        view.addSubview(affineView)
        affineView.frame = CGRect(x:50, y: 100, width: 100, height: 100)
        affineView.backgroundColor = .red
        
    }
}
