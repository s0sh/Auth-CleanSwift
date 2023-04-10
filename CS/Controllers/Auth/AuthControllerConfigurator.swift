//
//  AuthControllerConfigurator.swift
//  CS
//
//  Created by Roman Bigun on 10.04.2023.
//

import UIKit

struct AuthControllerConfigurator {
    static func build() -> CSViewController {
        
        let interactor = CSInteractor()
        let presenter = CSPresenter()
        let router = CSRouter()
        
        router.destinationController = MainControllerConfigurator.build()
        
        let controller = CSViewController()
        presenter.viewController = controller
        interactor.presenter = presenter
        
        return controller
    }
}
