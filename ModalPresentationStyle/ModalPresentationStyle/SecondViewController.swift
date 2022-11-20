//
//  SecondViewController.swift
//  ModalPresentationStyle
//
//  Created by ByungHoon Ann on 2022/11/20.
//

import UIKit

class SecondViewController: UIViewController {
    var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로가기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(dismissButton)
        
        dismissButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true)
    }
}
