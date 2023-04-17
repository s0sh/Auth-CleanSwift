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

final class CSViewController: BaseController, RoutableController {
    
    private lazy var authBlock: CSAuthorizationBlock = {
        let block = CSAuthorizationBlock()
        block.buttonPressedCallback = { [weak self] (name, passsword) in
            guard let self = self, let presenter = self.presenter else { return }
            presenter.authUserCalled(with: UserEntities.UserAuth.Request(userName: name, userPassword: passsword))
        }
        return block
    }()
    
    
    var router: CSRoutingLogic?
    
    var presenter: CSPresentetionLogic?
    
    convenience init(interactor: CSBusinessLogic, router: CSRoutingLogic) {
        self.init(nibName: nil, bundle: nil)
        self.router = router
    }
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
        
    }
}

extension CSViewController: CSDisplayLogic {
    func displayUser(_ data: CSDataStore) {
        router?.dataStore = data
        router?.routeToNext()
    }
}
