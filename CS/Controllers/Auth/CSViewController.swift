//
//  ViewController.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace
protocol CSDisplayLogic: AnyObject {
    func displayUser(_ data: CSDataStore)
}

final class CSViewController: BaseController {
    private var authBlock = CSAuthorizationBlock()
    private var interactor: CSBusinessLogic?
    private var router: CSRouter?
}

extension CSViewController {
    
    override func setupViews() {
        super.setupViews()
        view.addView(authBlock)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            authBlock.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            authBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authBlock.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        authBlock.buttonPressedCallback = { (name, passsword) in
            guard let interactor = self.interactor else { return }
            interactor.fetchUser(CSModels.FethUser.Request(userName: name, userPassword: passsword))
        }
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        // Создаем компоненты VIP цикла
        let interactor = CSInteractor()
        let presenter = CSPresenter()
        
        // Связываем созданные компоненты
        interactor.presenter = presenter
        presenter.viewController = self
        
        router = CSRouter()
        router?.controller = self
        
        let destinationController = CSMainViewController()
        router?.destinationController = destinationController
        
        // Указываем ссылку на Interactor для View Controller
        self.interactor = interactor
    }
}

extension CSViewController: CSDisplayLogic {
    func displayUser(_ data: CSDataStore) {
        router?.dataStore = data
        router?.routeToNext()
    }
}
