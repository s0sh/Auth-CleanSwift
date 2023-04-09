//
//  CSBaseButton.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import UIKit
// swiftlint:disable trailing_whitespace
enum ButtonType {
    case regular
    case dark
    case gray
    case clear
}

final class CSBaseButton: BaseView {
    
    private var textAlignment: UIControl.ContentHorizontalAlignment = .center
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17)
        return button
    }()
    
    private var title: String?
    private var type: ButtonType = .regular
    
    init(with type: ButtonType, title: String,
         textAlignment: UIControl.ContentHorizontalAlignment? = .center) {
        
        self.title = title
        self.type = type
        self.textAlignment = textAlignment ?? .center
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    func addTarget(target: Any?, action: Selector) {
        button.addTarget(target,
                         action: action,
                         for: .touchUpInside)
    }
}

extension CSBaseButton {
    
    override func addViews() {
        super.addViews()
        addView(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = textAlignment
        
        switch type {
        case .regular:
            button.backgroundColor = R.Colors.mainAppColor
        case .dark:
            button.backgroundColor = R.Colors.mainAppDark
        case .gray:
            button.backgroundColor = R.Colors.mainAppGray
        case .clear:
            button.backgroundColor = .clear
            button.setTitleColor(R.Colors.tipColor, for: .normal)
            button.titleLabel?.font = R.Fonts.helveticaRegular(with: 15)
        }
        makeSystem(button)
        button.layer.cornerRadius = 10
    }
    
}
