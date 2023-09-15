//
//  ViewController.swift
//  Selector
//
//  Created by dev dfcc on 2023/05/16.
//

import UIKit

@objc protocol RouteTest {
    func routeTest(seuge: UIStoryboardSegue?)
}

class Router: NSObject, RouteTest {
    weak var viewController: ViewController?
    
    func routeTest(seuge: UIStoryboardSegue?) {
        print(seuge)
    }
}

class MyClass: NSObject {
    @objc func myMethod() {
        print("Hello, world!")
    }
    
    func justMethod() {
        
    }
}

struct Todo {
    var name: String
}

class TodoStore {
    static var todos: [Todo] = [
        Todo(name: "A"),
        Todo(name: "B"),
        Todo(name: "C")
    ]
    
    
    func fetchTodos(completionHandler: @escaping(() throws -> [Todo]) -> Void) {
        completionHandler {
            
            return type(of: self).todos
        }
    }
}
class ViewController: UIViewController {
    var router: (NSObjectProtocol & RouteTest)?
    
    var todoStore = TodoStore()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 추가적인 초기화 작업 수행
        setup()
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodos()
    }
    
    func fetchTodos() {
        todoStore.fetchTodos { todos in
            let todo = try? todos()
            print(todo)
        }

    }
    
    func setup() {
        let viewController = self
        
        let router = Router()
        
        viewController.router = router
        router.viewController = viewController
    }
    
    func doSomething() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        let selector = NSSelectorFromString("routeTestWithSeuge:")
        print(router?.responds(to: selector), router)
    }
}

