//
//  ViewController.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    private let myButton = UIButton()
    var myImageView = UIImageView()
    var personObservable: Observable<Person> {
        Observable.create { observer in
            observer.onNext(Person(age: 12, name: "jake"))
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    var personObservable3: Observable<Person3> {
        Observable.create { observer in
            observer.onNext(Person3(name: "jay", gender: "??"))
            observer.onCompleted()
            return Disposables.create()
        }
    }
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nameKeyPath: KeyPath<Person, String> = \Person.name
        let person = Person(age: 12, name: "jake")
        
        let contact = Contact(persons: ["지구": "Earth", "달":"Moon"])
        
        print(contact[dynamicMember: "지구"])
        print(contact.지구)
        print(contact.hahaha)
        print(person[keyPath: nameKeyPath])
        personObservable
            .map(\.age)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        let someDictionary = SomeDictionary()
        print(someDictionary.name ?? "")
        print(someDictionary.abc ?? "")
        print(someDictionary.age ?? "")
        
        let myStruct = MyStruct(name: "jake", age: 12)
        let myContainer = MyContainer(myStruct)
        print(myContainer.name)
                
        personObservable3.name.asObservable().subscribe {
            print($0)
        }.disposed(by: disposeBag)
        
        
        let myClass = MyClass()
        print(myClass.rx.base)
        
        let myView = MyView(myProperty: "123")
        
        myButton.rx.tap
            .map { "tap"}
            .bind(to: myView.rx.myProperty)
            .disposed(by: disposeBag)
        
        let urlSession = URLSession.shared
        urlSession.rx.image(url: URL(string: "https://ios-development.tistory.com/")!)
            .bind(to: myImageView.rx.image)
            .disposed(by: disposeBag)
    }
    

}

