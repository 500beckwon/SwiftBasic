//
//  ViewController.swift
//  ModalTransitionStyle
//
//  Created by ByungHoon Ann on 2022/11/20.
//

import UIKit

class ViewController: UIViewController {
    var modalAutomaticButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Automatic", for: .normal)
        button.addTarget(self, action: #selector(modalAutomaticButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalNoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("None", for: .normal)
        button.addTarget(self, action: #selector(modalNoneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalFullScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FullScreen", for: .normal)
        button.addTarget(self, action: #selector(modalFullScreenButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalPageSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PageSheet", for: .normal)
        button.addTarget(self, action: #selector(modalPageSheetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalCurrentContextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CurrentContext", for: .normal)
        button.addTarget(self, action: #selector(modalCurrentContextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalOverCurrentContextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OverCurrentContext", for: .normal)
        button.addTarget(self, action: #selector(modalOverCurrentContextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalPopOverButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PopOver", for: .normal)
        button.addTarget(self, action: #selector(modalPopOverButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalFormSheetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BlurOverFullScreen", for: .normal)
        button.addTarget(self, action: #selector(modalFormSheetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var modalOverFullScreenButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OverFullScreen", for: .normal)
        button.addTarget(self, action: #selector(modalOverFullScreenButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        buttonLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    @objc func modalAutomaticButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
    
    @objc func modalNoneButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .none
        present(vc, animated: true)
    }
    
    @objc func modalFullScreenButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func modalPageSheetButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    @objc func modalCurrentContextButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
    
    @objc func modalOverCurrentContextButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    @objc func modalPopOverButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .popover
        present(vc, animated: true)
    }
    
    @objc func modalFormSheetButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .formSheet
        present(vc, animated: true)
    }
    
    @objc func modalOverFullScreenButtonTapped() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func buttonLayout() {
        view.addSubview(modalAutomaticButton)
        view.addSubview(modalNoneButton)
        view.addSubview(modalFullScreenButton)
        view.addSubview(modalPageSheetButton)
        view.addSubview(modalCurrentContextButton)
        view.addSubview(modalOverCurrentContextButton)
        view.addSubview(modalPopOverButton)
        view.addSubview(modalFormSheetButton)
        view.addSubview(modalOverFullScreenButton)
        
        modalAutomaticButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalAutomaticButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalAutomaticButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        modalAutomaticButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalNoneButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalNoneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalNoneButton.topAnchor.constraint(equalTo: modalAutomaticButton.bottomAnchor, constant: 30).isActive = true
        modalNoneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalFullScreenButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalFullScreenButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalFullScreenButton.topAnchor.constraint(equalTo: modalNoneButton.bottomAnchor, constant: 30).isActive = true
        modalFullScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalPageSheetButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalPageSheetButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalPageSheetButton.topAnchor.constraint(equalTo: modalFullScreenButton.bottomAnchor, constant: 30).isActive = true
        modalPageSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalCurrentContextButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalCurrentContextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalCurrentContextButton.topAnchor.constraint(equalTo: modalPageSheetButton.bottomAnchor, constant: 30).isActive = true
        modalCurrentContextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalOverCurrentContextButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalOverCurrentContextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalOverCurrentContextButton.topAnchor.constraint(equalTo: modalCurrentContextButton.bottomAnchor, constant: 30).isActive = true
        modalOverCurrentContextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalPopOverButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalPopOverButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalPopOverButton.topAnchor.constraint(equalTo: modalOverCurrentContextButton.bottomAnchor, constant: 30).isActive = true
        modalPopOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalFormSheetButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalFormSheetButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalFormSheetButton.topAnchor.constraint(equalTo: modalPopOverButton.bottomAnchor, constant: 30).isActive = true
        modalFormSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        modalOverFullScreenButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        modalOverFullScreenButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        modalOverFullScreenButton.topAnchor.constraint(equalTo: modalFormSheetButton.bottomAnchor, constant: 30).isActive = true
        modalOverFullScreenButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

