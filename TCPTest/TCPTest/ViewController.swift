//
//  ViewController.swift
//  TCPTest
//
//  Created by dev dfcc on 12/19/23.
//

import UIKit
import Network

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.establishConnection()
    }
}

