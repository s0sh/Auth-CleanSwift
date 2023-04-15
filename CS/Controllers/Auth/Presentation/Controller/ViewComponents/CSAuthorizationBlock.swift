//
//  CSAuthorizationBlock.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import UIKit
import Combine

// swiftlint:disable trailing_whitespace

final class CSAuthorizationBlock: BaseView {
    
    var buttonPressedCallback: ((String, String) -> Void)?
    var viewModel = AuthBlockViewModel()
    var cancelable = Set<AnyCancellable>()
    
    
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
        button.isEnabled = false
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
        viewModel.submitLogin { [weak self] allGood in
            guard let self = self else { return }
            if allGood {
                self.buttonPressedCallback?(self.userNameTextField.text,
                                            self.userPasswordTextField.text)
                return
            }
        }
        
    }
    
    func bindViewModel() {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: userNameTextField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.email, on: viewModel)
            .store(in: &cancelable)
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: userPasswordTextField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.password, on: viewModel)
            .store(in: &cancelable)
        
        viewModel.isLoginEnabled
            .assign(to: \.isEnabled, on: sendButton)
            .store(in: &cancelable)
        
        viewModel.$state
            .sink { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .loading:
                    self.sendButton.isEnabled = false
                case .failed:
                    self.sendButton.isEnabled = true
                case .success:
                    self.sendButton.isEnabled = false
                case .none:
                    break
                }
            }.store(in: &cancelable)
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
        
        bindViewModel()
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
