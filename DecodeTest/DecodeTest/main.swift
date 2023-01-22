//
//  main.swift
//  DecodeTest
//
//  Created by ByungHoon Ann on 2023/01/17.
//

import Foundation

struct Test: Codable {
    var own: Bool
    
    enum CodingKeys: String, CodingKey {
        case own
    }
}

extension Test {
    init(from decoder: Decoder) throws {
        let continer = try decoder.container(keyedBy: CodingKeys.self)
        self.own = try continer.decode(Int.self, forKey: .own) == 1
    }
}

let testBundle = Bundle.main

enum JsonLoaderError: Error {
    case unknownFile
}
let urlString = "/Users/500beckwon/SwiftWork/SwiftBasic/DecodeTest/DecodeTest/Resource.json"

let filePath = testBundle.path(forResource: "Resource", ofType: "json")

let fileURL = URL(fileURLWithPath: urlString )
print(fileURL)
if let data = try? Data(contentsOf: fileURL) {
    print(data)
    let json = try? JSONDecoder().decode(Test.self, from: data)
    print(json?.own)
}
