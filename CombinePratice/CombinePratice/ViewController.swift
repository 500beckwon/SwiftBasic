//
//  ViewController.swift
//  CombinePratice
//
//  Created by ByungHoon Ann on 2022/12/04.
//

import UIKit
import SnapKit
import Combine

protocol Component {
    associatedtype Content
    var id: String { get }
    func contentView() -> Content
    func layoutSize() -> CGSize
}


private class AnyComponentBox<ConcreteComponent: Component>: AnyComponentBase<ConcreteComponent.Content> {
    
    var concrete: ConcreteComponent
    
    init(_ concrete: ConcreteComponent) {
        self.concrete = concrete
    }
    
    override var id: String {
        return concrete.id
    }
    
    override func contentView() -> ConcreteComponent.Content {
        return concrete.contentView()
    }
    
    override func layoutSize() -> CGSize {
        return concrete.layoutSize()
    }
}

class AnyComponent<Content>: Component {
    private let box: AnyComponentBase<Content>
    
    init<ConcreteComponent: Component>(_ concrete: ConcreteComponent) where ConcreteComponent.Content == Content {
        self.box = AnyComponentBox(concrete);
    }
    var id: String {
           return box.id
       }

       func contentView() -> Content {
           return box.contentView()
       }

       func layoutSize() -> CGSize {
           return box.layoutSize()
       }
}
class ViewController: UIViewController {
    var textField01 = UITextField()
    var textField02 = UITextField()
 
    var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
    }
    
    func bind() {
    
    }

    func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(textField01)
        stackView.addArrangedSubview(textField02)
        
        textField01.placeholder = "01"
        textField02.placeholder = "02"
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(16)
            $0.trailing.equalTo(-16)
        }
        
        
    }
}

