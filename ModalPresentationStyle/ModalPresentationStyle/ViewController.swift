//
//  ViewController.swift
//  ModalPresentationStyle
//
//  Created by ByungHoon Ann on 2022/11/20.
//

import UIKit

enum ModalPresentStyle: Int, CaseIterable {
    case automatic = 0
    case none
    case fullScreen
    case pageSheet
    case currentContext
    case overCurrentContext
    case popover
    case formSheet
    case overFullScreen
}

extension ModalPresentStyle {
    var style: UIModalPresentationStyle {
        switch self {
        case .automatic:
            return .automatic
        case .none:
            return .none
        case .fullScreen:
            return .fullScreen
        case .pageSheet:
            return .pageSheet
        case .currentContext:
            return .currentContext
        case .overCurrentContext:
            return .overCurrentContext
        case .popover:
            return .popover
        case .formSheet:
            return .formSheet
        case .overFullScreen:
            return . overFullScreen
        }
    }
    
    var title: String {
        return String(describing: self)
    }
}

class ViewController: UIViewController {
    var stackView = UIStackView()
    let modelPresentStyle = ModalPresentStyle.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    @objc func modalButtonTapped(_ sender: UIButton) {
        let vc = SecondViewController()
        vc.modalPresentationStyle = modelPresentStyle[sender.tag].style
        present(vc, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(#function)")
    }
    
    func layout() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        
        modelPresentStyle.forEach {
            let button = UIButton(type: .system)
            button.setTitle($0.title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.tag = $0.rawValue
            stackView.addArrangedSubview(button)
            button.frame.size = CGSize(width: 150, height: 50)
            button.addTarget(self, action: #selector(modalButtonTapped), for: .touchUpInside)
        }
    }
}

