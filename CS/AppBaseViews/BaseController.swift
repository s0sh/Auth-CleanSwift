//
//  BaseController.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureViews()
        setupComponents()
    }
}

@objc extension BaseController {
    func setupViews() {}
    func layoutViews() {}
    func configureViews() {
        view.backgroundColor = .white
    }
    func setupComponents() {}
    func navBarLeftButtonHandler() {
        print("NavBar left button tapped")
    }
    func navBarRightButtonHandler() {
        print("NavBar right button tapped")
    }
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaLight(with: 17)
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
