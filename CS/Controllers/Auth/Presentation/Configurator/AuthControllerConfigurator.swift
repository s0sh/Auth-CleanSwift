//
//  AuthControllerConfigurator.swift
//  CS
//
//  Created by Roman Bigun on 10.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace
struct AuthControllerConfigurator {
    
    static func build() -> CSViewController {

        let presenter = CSPresenter()
        let router = CSRouter()
        let interactor = UserAuthUseCase(presenter: presenter)
        
        let sourceController = CSViewController()
        sourceController.router = router
        sourceController.presenter = presenter
        presenter.viewController = sourceController
        presenter.interactor = interactor
        
        router.destinationController = (MainControllerConfigurator.build())
        router.sourceController = (sourceController)
        
        return sourceController
    }
}
