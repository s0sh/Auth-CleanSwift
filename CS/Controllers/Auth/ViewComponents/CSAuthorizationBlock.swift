//
//  CSAuthorizationBlock.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace

final class CSAuthorizationBlock: BaseView {
    
    var buttonPressedCallback: ((String, String) -> Void)?
    
    private let userNameTextField: CSTextField = {
        let textField = CSTextField(placeholder: R.Strings.name, isActive: true)
        textField.tag = 0
        return textField
    }()
    
    private let userPasswordTextField: CSTextField = {
        let textField = CSTextField(placeholder: R.Strings.password,
                                    isActive: false,
                                    isPassword: true)
        textField.tag = 1
        return textField
    }()
    
    private lazy var sendButton: CSBaseButton = {
        let button = CSBaseButton(with: .dark, title: R.Strings.send)
        button.addTarget(target: self, action: #selector(buttonPressed))
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 15
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    @objc func buttonPressed() {
        buttonPressedCallback?(userNameTextField.text, userPasswordTextField.text)
    }
}

extension CSAuthorizationBlock {
    override func addViews() {
        super.addViews()
        addView(stackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 1),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(userPasswordTextField)
        stackView.addArrangedSubview(sendButton)
        
        userNameTextField.delegate = self
        userPasswordTextField.delegate = self
    }
}

extension CSAuthorizationBlock: CSTextFieldDelegate {
    func deactivateAll(except tag: Int) {
        for element in stackView.subviews where element is CSTextField {
            if (element as? CSTextField)?.tag != tag {
                (element as? CSTextField)?.setActive(active: false)
            }
        }
    }
}
