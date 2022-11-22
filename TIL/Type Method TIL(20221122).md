# TIL(20221122)

## Type Method
- method와 property 앞에 static 키워드를 사용하여 instance가 아닌 선언된 Type 그 자체와 연결할 수 있도록 해주는 문법이다
- 커스텀으로 사용하는 대표적인 사용처로는 환경 설정 목적의 용도을 위한 Singletone을 만들 때 사용한다
- 내장 API 중에는 Notification Center를 통해 전송되는 알림에 사용할 수 있는 문자열이 있다
- class method와 static method 두 종류가 있다

### 추천 사용
- 특정 object를 생성하는 것은 많은 비용이 들 수 있기 때문에 비싼 객체에 대해 static property로 캐시로 사용하는 방법이 있다
- 생성하는데 비용이 많이 들면서 안전하게 재사용 할 수 있는 object에 대해서는 static으로 정의하는 것이 좋다
- 특정 method를 인스턴스가 아닌 type과 연결하려는 경우에 유용하다 
```swift
struct Blogpost {
  private static var dateFormatter = ISO8601DateFormatter()

  let publishDate: Date?
  // other properties ...

  init(_ publishDateString: String /* other properties */) {
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
    let metadata = Metadata(/* metadata properties */)
    return Blogpost(title: title, body: body, createdAt: Date(), metadata: metadata)
  }
}

extension Blogpost {
  static func sensibleDefault() -> Blogpost {
    return Blogpost(title: "Hello, world!",
                    body: "Hello, sample body",
                    createdAt: Date())
  }
}

```

### Static Method와 class method의 차이
- class method는 ovrride가 가능하다

### 비고
- 내용이 어려워서 다른 부분은 더 읽고 정리할 것

### 출처
1. [원본] https://www.donnywals.com/effectively-using-static-and-class-methods-and-properties/
2. [번역본] https://sujinnaljin.medium.com/swift-static과-class-method-property-효과적으로-사용하기-b336311a923c


