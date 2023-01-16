//
//  EraseWrapperPatten04.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/16.
//

import SwiftUI

protocol Component {
    associatedtype Content
    var id: String { get }
    func contentView() -> Content
    func layoutSize() -> CGSize
}

private class AnyComponentBase<Content>: Component {
    var id: String { fatalError("implement it!") }
    
    func contentView() -> Content {
        fatalError("implement it!")
    }
    
    func layoutSize() -> CGSize {
        fatalError("implement it!")
    }
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

public class AnyComponent<Content>: Component {
    // Content를 담는 컴포넌트 박스를 표현해야 하므로
    // Abstract class 포인터로 Box를 가리키게 한다.
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
