//
//  EraseWrapperPatten03.swift
//  Protocol
//
//  Created by ByungHoon Ann on 2023/01/15.
//

import Foundation

protocol Model {
    associatedtype Data
    var data: Data { get set }
}

struct CellModel<Data>: Model {
    var data: Data
}

class DataCollection {
    var dataCollection1 = [CellModel<String>(data: "")]
    var dataCollection2 = [CellModel<Int>(data: 1)]
    
}
