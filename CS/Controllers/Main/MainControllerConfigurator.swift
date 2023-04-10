//
//  Configurator.swift
//  CS
//
//  Created by Roman Bigun on 10.04.2023.
//

import UIKit

struct MainControllerConfigurator {
    static func build() -> CSMainViewController {
        let controller = CSMainViewController()
        let interactor = CSMainInteractor()
        let presenter = CSMainPresenter()
        let router = CSMainRouter()
        interactor.presenter = presenter
        controller.interactor = interactor
        controller.router = router
        /// Some setup here
        return controller
    }
}
