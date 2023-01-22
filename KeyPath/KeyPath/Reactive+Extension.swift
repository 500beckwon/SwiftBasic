//
//  Reactive+Extension.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIButton {
    var tap: ControlEvent<Void> {
        controlEvent(.touchUpInside)
    }
}

extension Reactive where Base: URLSession {
    enum RxURLSessionError: Error {
        case unknown
        case invalidResponse(response: URLResponse)
        case requestFailed(response: URLResponse, data: Data)
    }
    
    func response(url: URL) -> Observable<(HTTPURLResponse, Data)> {
        return Observable.create { observer in
            let task = self.base.dataTask(with: url) { data, response, error in
                guard
                    let response = response,
                    let data = data
                else {
                    observer.onError(error ?? RxURLSessionError.unknown)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.onError(RxURLSessionError.invalidResponse(response: response))
                    return
                }
                observer.onNext((httpResponse, data))
                observer.onCompleted()
            }
            
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func data(url: URL) -> Observable<Data> {
        return response(url: url).map { response, data -> Data in
            guard 200..<300 ~= response.statusCode else {
                throw RxURLSessionError.requestFailed(response: response, data: data)
            }
            return data
        }
    }
    
    func string(url: URL) -> Observable<String> {
        return data(url: url).map { data in
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
    
    func json(url: URL) -> Observable<Any> {
        return data(url: url).map { data in
            return try JSONSerialization.jsonObject(with: data)
        }
    }
    
    func image(url: URL) -> Observable<UIImage> {
        return data(url: url).map { data in
            return UIImage(data: data) ?? UIImage()
        }
    }
}
