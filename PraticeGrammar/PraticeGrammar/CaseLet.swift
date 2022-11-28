//
//  CaseLet.swift
//  PraticeGrammar
//
//  Created by ByungHoon Ann on 2022/11/28.
//

import Foundation

enum Phone {
    case android(device: String)
    case iphone(modelNumber: String)
    case etc
}

func checkSwitchPhone(phone: Phone) {
   
    switch phone {
    case let .android( device):
        print(device)
    default:
        ()
    }
    
    switch phone {
    case .android(let device):
        print(device)
    default:
        ()
    }
}

func checkIfPhone(phone: Phone) {
    if case let .android(device) = phone {
        print(device)
    }
    
    if case .android(let device) = phone {
        print(device)
    }
}

func checkGuardPhone(phone: Phone) {
    guard case .android(let device) = phone else { return }
    guard case let .android(device2) = phone else { return }
    print(device, device2)
}

func checkOptionalSwitchPhone(phone: Phone?) {
   
    switch phone {
    case let .android(device):
        print(device)
    default:
        ()
    }
    
    switch phone {
    case .android(let device):
        print(device)
    default:
        ()
    }
}

func checkOptionalIfPhone(phone: Phone?) {
    if case let .android(device) = phone {
        print(device)
    }
    
    if case .android(let device) = phone {
        print(device)
    }
}

func checkOptionalGuardPhone(phone: Phone?) {
    guard case .android(let device) = phone else { return }
    guard case let .android(device2) = phone else { return }
    print(device, device2)
}
