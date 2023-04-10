//
//  CSTextField.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace
protocol CSTextFieldDelegate: AnyObject {
    func deactivateAll(except tag: Int)
}

final class CSTextField: BaseView {
    
    public var text: String = ""
    
    weak var delegate: CSTextFieldDelegate?
    
    private var isActive: Bool = true
    private var isPassword: Bool = false
    private var placeholder: String? = ""
    
    private let showHideButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Icons.eyeBig, for: .normal)
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = R.Colors.titleDarkGrey
        textField.backgroundColor = .clear
        textField.font = R.Fonts.helveticaRegular(with: 15)
        return textField
    }()
    
    init(placeholder: String, isActive: Bool = true, isPassword: Bool = false) {
        self.placeholder = placeholder
        self.isActive = isActive
        self.isPassword = isPassword
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    @objc func showHidePassword() {
        textField.isSecureTextEntry.toggle()
    }
}

extension CSTextField {
    override func addViews() {
        super.addViews()
        addView(textField)
        addView(showHideButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            showHideButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            showHideButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showHideButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            textField.trailingAnchor.constraint(equalTo: showHideButton.leadingAnchor),
            textField.topAnchor.constraint(equalTo: showHideButton.topAnchor),
            textField.centerYAnchor.constraint(equalTo: showHideButton.centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        setActive(active: isActive)
        
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isPassword
        textField.textContentType = isPassword == true ? .password : .emailAddress
        textField.delegate = self
        
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        showHideButton.isHidden = !isPassword
        
        layer.masksToBounds = true
        layer.cornerRadius = 10
    }
    
    func setActive(active: Bool) {
        if active {
            backgroundColor = R.Colors.active
            layer.borderColor = R.Colors.mainAppColor.cgColor
            layer.borderWidth = 1
        } else {
            backgroundColor = R.Colors.inactive
            layer.borderWidth = 0
        }
       layoutIfNeeded()
    }
}

extension CSTextField: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text = textField.text ?? ""
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        setActive(active: true)
        delegate?.deactivateAll(except: tag)
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if let text = textField.text {
            self.text = text
        }
        
        return true
    }
}
