//
//  ViewController.swift
//  ScreenShotDetect
//
//  Created by dev dfcc on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {
    lazy var testView: UIView = {
        let testView = UIView()
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.backgroundColor = UIColor.green
        
        self.view.addSubview(testView)
        
        testView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        testView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        testView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        testView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        return testView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testView.preventScreenShot()
    }
}

extension UIView {
    @objc func preventScreenShot() {
        DispatchQueue.main.async {
            let backView                = UIView(frame: self.frame)
            backView.backgroundColor    = UIColor.lightGray
            backView.layer.cornerRadius = 5
            self.superview?.insertSubview(backView, at: 0)

            let sPreventField           = UITextField()
            sPreventField.isSecureTextEntry = true
            self.addSubview(sPreventField)

            sPreventField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            sPreventField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

            self.layer.superlayer?.addSublayer(sPreventField.layer)
            sPreventField.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
