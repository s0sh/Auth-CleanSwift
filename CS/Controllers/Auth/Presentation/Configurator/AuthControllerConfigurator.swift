//
//  AuthControllerConfigurator.swift
//  CS
//
//  Created by Roman Bigun on 10.04.2023.
//

import UIKit

struct AuthControllerConfigurator {
    static func build() -> CSViewController {
        
        let interactor = UserAuthUseCase()
        let presenter = CSPresenter()
        let router = CSRouter()
        
        
        
        let sourceController = CSViewController()
        sourceController.router = router
        
        presenter.viewController = sourceController
        interactor.presenter = presenter
        sourceController.interactor = interactor
        
        router.destinationController = (MainControllerConfigurator.build() as? any RoutableController)
        router.sourceController = (sourceController as? any RoutableController)
        
        return sourceController
    }
}
