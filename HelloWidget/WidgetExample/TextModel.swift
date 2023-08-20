//
//  TextModel.swift
//  HelloWidget
//
//  Created by ByungHoon Ann on 2023/05/07.
//

import Foundation

struct TextModel: Codable {
    enum CodingKeys : String, CodingKey {
        case datas = "data"
    }
    let datas: [String]
}
