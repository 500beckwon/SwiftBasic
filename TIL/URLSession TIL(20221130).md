# URLSession
- iOS App에서 서버와 통신하기 위해 애플이 제공하는 API
- HTTP를 포함한 프로토콜을 지원하고 인증, 쿠키/캐시 관리 등을 지원한다

## URL의 구성요소
### .absoluteString
- 해당 URL의 절대주소(경로)를 URL 형태로 반환한다.
### .scheme
- 해당 URL의 프로토콜(http or https)를 String 형태로 반환한다.
### .host
- 해당 URL의 도메인(호스트) 이름을 String 형태로 반환한다.
### .path
- 해당 URL의 경로를 String 형태로 반환한다.
### .query
- 해당 URL의 쿼리를 String 형태로 반환한다.
### baseURL
- 해당 URL의 기본 URL을 URL 형태로 반환한다.
- URL이 상대주소일 경우 기본 URL, 절대주소일 경우 nil을 반환한다.

```swift
let urlString = "https://github.500beckwon.com/login/oauth/authorize?client_id=1234&scope=repo%20gist%20user"
let url = URL(string: urlString)!

url.absoluteURL  // https://github.500beckwon.com/login/oauth/authorize?client_id=1234&scope=repo%20gist%20user
url.scheme       // https
url.host         // github.500beckwon.com
url.path         // /login/oauth/authorize
url.query        // Optional("client_id=1234&scope=repo%20gist%20user")
url.baseURL      // nil
```

## Session
1. Default Session: 기본적인 Session으로 디스크 기반 캐싱을 지원한다
2. Ephemeral Session: 어떠한 데이터도 저장하지 않는 형태의 세션
3. Background Session: 앱이 종료된 이후에도 통신이 이뤄지는 것을 지원하는 세션


## URLRequest
- 서버로 요청을 보낼 때 어떻게 데이터를 캐싱할 것인지, 어떤 메소드를 사용할 것인지 어떤 내용을 전송할 것인지를 설정할 수 있다

## Task
- Task 객체는 일반적으로 Session 객체가 서버로 요청을 보낸 후 응답을 받을 때 URL 기반의 내용을 받는 역할을 한다
1. Data Task - Data 객체를 통해 데이터 주고받는 Task
2. Download Task - data를 파일의 형태로 전환 후 다운 받는 Task입니다. 백그라운드 다운로드 지원한다
3. Upload Task - data를 파일의 형태로 전환 후 업로드하는 Task

```swift
var urlRequest = URLRequest(url: URL(string: "http://localhost:8080/")!)
urlRequest.httpMethod = "GET"
urlRequest.timeoutInterval = TimeInterval(10)
urlRequest.httpBody = Data()
        
let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
    if let error = error {
        // error handling
    }
            
    if let response = response {
        // response handling
    }
}

task.resume()
```

## URLComponents 
- 구성 요소들로부터 URL 사용하기 쉽도록 조각내고 구성하는 기능을 제공하는 구조이다
- URL과 URLComponents는 같은 값을 가질 수 있지만, 다른 타입이다
- URL을 URL(string:)으로 작성한다면, URLComponents는 URLComponents(string:)으로 작성할 수 있다
- URL과 URLComponents의 값은 동일하기 때문에 URLComponents로도 파일의 경로나 웹페이지 주소로 이동할 수 있다
- URL과의 차이점은 URL 구성요소들을 관리할 수 있다

# 용어
## URL
- Uniform Resource Locater의 약자로, Apple에서는 원격 서버의 항목이나 로컬 파일의 경로와 같은 리소스의 위치를 ​​식별하는 값 이라고 설명한다
- 웹 페이지를 찾기 위한 주소 또는 로컬 파일의 경로
- 앱에서는 URL을 통해 서버와 통신하며 데이터를 주고 받을 뿐만 아니라, 웹 페이지를 이용하여 다양한 기능들을 활용할 수 있다. 또한, 앱 내에서 URL을 통해 파일이나 폴더에 접근, 생성, 삭제를 할 수 있다.

