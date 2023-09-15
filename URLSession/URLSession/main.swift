//
//  main.swift
//  URLSession
//
//  Created by ByungHoon Ann on 2022/11/30.
//

import Foundation

print("Hello, World!")

let urlString = "https://itunes.apple.com/search?media=music&entity=musicVideo&term=collier"
let url = URL(string: urlString)


enum HttpMethod<T: Codable> {
    case get
    case post(body: T)
    case put(body: T)
    case patch(body: T)
    case delete(body: T)
}

extension URLRequest {
    init<Body: Encodable> (url: URL, method: HttpMethod<Body>) {
        self.init(url: url)
        self.timeoutInterval = TimeInterval(10)
        
        switch method {
        case .get:
            self.httpMethod = "GET"
        case .post(let body):
            self.httpMethod = "POST"
            self.httpBody = try? JSONEncoder().encode(body)
        case .put(let body):
            self.httpMethod = "PUT"
            self.httpBody = try? JSONEncoder().encode(body)
        case .patch(let body):
            self.httpMethod = "PATCH"
            self.httpBody = try? JSONEncoder().encode(body)
        case .delete(let body):
            self.httpMethod = "DELETE"
            self.httpBody = try? JSONEncoder().encode(body)
        }
    }
}

extension URLSession {
    func request<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping(T?, Error?) -> Void) {
        dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                completion(nil, error)
            }
            
            if let response = response as? HTTPURLResponse,
                 (200..<300).contains(response.statusCode),
                 let data = data {
                print("URLSession data: \(String(describing: data))")
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                completion(decodedData, nil)
            }
        }.resume()
    }
}

struct User: Codable {
    let name: String
    let age: Int
}

let user = User(name: "500beckwon", age: 20)
let req = URLRequest(url: url!, method: HttpMethod<User>.post(body: user))

func requestJSON<T: Codable>(completion: @escaping(T?, Error?) -> Void)  {
    URLSession.shared.request(req, completion: completion)
    
}

print("""
      urlString = \(urlString)
      absoluteString = \(url!.absoluteURL)
      scheme = \(url?.scheme)
      path = \(url?.path)
      query = \(url?.query)
      """)

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search", relativeTo: baseURL)

print("""
      
      relativeURL absoluteString = \(relativeURL!.absoluteURL)
      baseURL = \(relativeURL?.baseURL)
      path = \(relativeURL?.path)
      """)

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "jacob collier")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)
urlComponents.url?.scheme // "https"

print("""
      
      urlComponents scheme = \(urlComponents.url?.scheme)
      urlComponents.string = \(urlComponents.string)
      urlComponents.queryItems = \(urlComponents.queryItems)
      
      """)

let url3 = "https://github.500beckwon.com/login/oauth/authorize?client_id=1234&scope=repo%20gist%20user"
let components = URLComponents(string: url3)
let items = components?.queryItems ?? []

for item in items{
    print(item.name)
    print(item.value)
}


let urlString2 = "https://github.500beckwon.com/login/oauth/authorize?client_id=1234&scope=repo%20gist%20user"
let url2 = URL(string: urlString2)!

print("url2.absoluteURL)", url2.absoluteURL)
print("url2.scheme)", url2.scheme)
print("url2.host)", url2.host)
print("url2.path)", url2.path)
print("url2.query)", url2.query)
print("url2.baseURL)", url2.baseURL)
