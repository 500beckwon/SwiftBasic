//
//  DynamicMemberLookupObservableType.swift
//  KeyPath
//
//  Created by ByungHoon Ann on 2023/01/22.
//

import RxSwift

@dynamicMemberLookup
protocol DynamicMemberLookupObservableType {
    associatedtype Root
    subscript<Value>(dynamicMember keyPath: KeyPath<Root, Value>) -> Observable<Value> { get }
}

extension Observable: DynamicMemberLookupObservableType {
    subscript<Value>(dynamicMember keyPath: KeyPath<Element, Value>) -> Observable<Value> {
        self.map { $0[keyPath: keyPath] }
    }
}
