//
//  main.swift
//  URLSession
//
//  Created by ByungHoon Ann on 2022/11/30.
//

import Foundation

print("Hello, World!")



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
let req = URLRequest(url: URL(string: "")!, method: HttpMethod<User>.post(body: user))

func requestJSON<T: Codable>(completion: @escaping(T?, Error?) -> Void)  {
    URLSession.shared.request(req, completion: completion)
    
}

