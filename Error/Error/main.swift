//
//  main.swift
//  Error
//
//  Created by ByungHoon Ann on 2022/11/19.
//

import Foundation

print("Hello, World!")

enum ValidationError: Error {
    case tooShort
    case tooLong
    case invalidCharacterFound(Character)
}

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .tooShort:
            return NSLocalizedString("4글자 보다 적습니다", comment: "invalid tooShort Error")
        case .tooLong:
            return NSLocalizedString("15글자 보다 깁니다", comment: "invalid tooLong Error")
        case .invalidCharacterFound(let character):
            return NSLocalizedString("\(character)은 문자가 아닙니다", comment: "invalid invalidCharacterFound Error")
        }
    }
    
    var failureReason: String? {
        switch self {
        case .tooShort:
            return "failureReason: 4글자 미만입니다"
        case .tooLong:
            return "failureReason: 15글자 이상입니다"
        case .invalidCharacterFound:
            return "failureReason: 문자가 아닙니다"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .tooShort:
            return "4글자 이상을 입력하세요"
        case .tooLong:
            return "15글자 미만으로 입력하세요"
        case .invalidCharacterFound(_):
            return "특수문자나 숫자가 아닌 문자를 입력하세요"
        }
    }
}

func isVaildStringInput(inputResult: Result<String, ValidationError>) throws {
    switch inputResult {
    case .success(let userName):
        print("\(userName)은 형식에 맞다")
    case .failure(let failure):
        print("""
              error type : \(failure)
              error errorDescription : \(failure.localizedDescription)
              error failureReason : \(failure.failureReason ?? "")
              error recoverySuggestion : \(failure.recoverySuggestion ?? "")
              """)
    }
}

func userDidPickName(_ username: String) -> Result<String, ValidationError> {
    guard username.count > 3 else {
        return .failure(ValidationError.tooShort)
        //throw ValidationError.tooShort
    }
    
    guard username.count < 15 else {
        return .failure(ValidationError.tooLong)
    }
    
    for character in username {
        // isLetter = 문자인지 아닌지 확인하는 용도
        guard character.isLetter else {
            return .failure(.invalidCharacterFound(character))
        }
    }
    return .success("\(username)은 형식에 맞음")
}

let testStrings = ("apple", "app", "apple is apple is apple", "123123", ")()$$")

switch userDidPickName(testStrings.4) {
case .success(let result):
    print(result)
case .failure(let error):
    print("""
          error type : \(error)
          error errorDescription : \(error.localizedDescription)
          error failureReason : \(error.failureReason ?? "")
          error recoverySuggestion : \(error.recoverySuggestion ?? "")
          """)
}
