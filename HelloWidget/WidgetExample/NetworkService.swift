//
//  NetworkService.swift
//  HelloWidget
//
//  Created by ByungHoon Ann on 2023/05/07.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    private init() { }
    
    func getTexts(count: Int = 1,completion: @escaping ([String]) -> ()) {
        // https://github.com/wh-iterabb-it/meowfacts
        guard
            let url = URL(string: "https://meowfacts.herokuapp.com/?count=\(count)")
        else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let textModel = try? JSONDecoder().decode(TextModel.self, from: data)
            else { return }
            completion(textModel.datas)
        }.resume()
    }
    
 
}
