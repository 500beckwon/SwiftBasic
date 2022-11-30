# URLSession
- iOS App에서 서버와 통신하기 위해 애플이 제공하는 API
- HTTP를 포함한 프로토콜을 지원하고 인증, 쿠키/캐시 관리 등을 지원한다

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
