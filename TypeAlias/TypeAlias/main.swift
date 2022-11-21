//
//  main.swift
//  TypeAlias
//
//  Created by ByungHoon Ann on 2022/11/21.
//

import Foundation

print("Hello, World!")
/*
 타입 별명 선언은 존재하는 타입에 대한 별칭을 프로그램에 명시하는(알려주는) 것
 typealias는 새로운 타입을 생성하는 것이 아닌 별칭을 사용했을 때 실제 타입을 참조하고 대신해서 사용하는 것을 허용해주는 문법
 */
typealias Pair = (Int, Int)
typealias Tuple = (Int, Int, Int)
typealias Number = (String, Int)

var pair: Pair = (1, 2)
var tuple: Tuple = (1, 2, 3)
var number: Number = ("Six", 6)
print(pair, tuple, number)

typealias StringDictionary<Value> = Dictionary<String, Value>
typealias DictionaryOfInts<Key: Hashable> = Dictionary<Key, Int>

var aliasDictionary: StringDictionary<Character> = [:]
var originDictionary: Dictionary<String, Character> = [:]
var intDictionary: DictionaryOfInts<Int> = [:]

aliasDictionary["hi"] = "h"
originDictionary["Hello"] = "H"
intDictionary[10] = 100

print(aliasDictionary["hi"])
print(originDictionary["Hello"])
print(intDictionary[10])


func getPiar() -> Pair {
    return (2, 4)
}

print(getPiar())
