//
//  main.swift
//  TypeMethod
//
//  Created by ByungHoon Ann on 2022/11/22.
//

import Foundation

print("Hello, World!")

class SampleClass {
    /// 저장 타입, 연산 타입 프로퍼티로 사용 가능
    static var sampleStaticProperty = 1
    
    /// 연산 타입 프로퍼티로만 표현이 가능
    /// override 가능
    class var sampleClassProperty: Int {
        return 1
    }
    
    // 인스턴스 함수
    func sampleFunc() {
        
    }
    
    /// static 함수, 타입 메소드
    /// override 불가능
    static func sampleStaticFunc() {
        
    }
    
    // class 함수, 타입 메소드
    // override 가능
    class func sampleClassFunc() {
        
    }
}

class SampleSubClass: SampleClass {
    
    override class var sampleClassProperty: Int {
        return 2
    }
    
    override class func sampleClassFunc() {
        
    }
}

print("""
      SampleClass.sampleStaticProperty \(SampleClass.sampleStaticProperty)
      SampleClass.sampleClassProperty = \(SampleClass.sampleClassProperty)
      SampleSubClass.sampleClassProperty \(SampleSubClass.sampleClassProperty)
      """)


struct Blogpost {
    private static var dateFormatter = ISO8601DateFormatter()
    
    let publishDate: Date?
    // other properties ...
    let title: String
    let body: String
    init(title: String, body: String, _ publishDateString: String) {
        self.title = title
        self.body = body
        self.publishDate = Blogpost.dateFormatter.date(from: publishDateString)
    }
}

/*
 DateFormatter는 생성 비용이 많이 들고 아무런 영향없이 재사용 될 수 있기 때문에 이것을 static property로 생성할 수 있다
 DateFormatter를 static하게 만들어서 instance 대신으로 활용하면 instance가 생성될 때마다 중복으로 DateFormatter가 만들어지는 것을
 방지할 수 있다
 */


enum BlogpostFactory {
    static func create(withTitle title: String, body: String) -> Blogpost {
        //let metadata = Metadata(/* metadata properties */)
        return Blogpost(title: title, body: body, "")
    }
}

extension Blogpost {
    static func sensibleDefault() -> Blogpost {
        return Blogpost(title: "Hello, world!",
                        body: "Hello, sample body",
                        "\(Date())")
    }
}
