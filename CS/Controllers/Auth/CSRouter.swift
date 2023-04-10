//
//  CSRouter.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import UIKit

// swiftlint:disable trailing_whitespace
protocol CSRoutingLogic {
    func routeToNext()
    var dataStore: CSDataStore? { get set }
    var controller: CSViewController? { get set }
    var destinationController: CSMainViewController? { get set }
}

final class CSRouter: CSRoutingLogic, CSDataPassingProtocol {
   
    var dataStore: CSDataStore?
    
    weak var controller: CSViewController?
    
    var destinationController: CSMainViewController?
    
    func routeToNext() {
        guard let data = dataStore, var destination = destinationController else { return }
        /// Нв случай, если нужно передать данные в другой контроллер
        passData(data, destinationController: &destination)
        
        guard let viewController = controller else { return }
        navigateTo(viewController, destination: destination)
    }
    
    private func navigateTo(_ source: CSViewController, destination: CSMainViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    private func passData(_ source: CSDataStore, destinationController: inout CSMainViewController) {
        destinationController.router?.dataStore = CSDataStore(data: source.data)
    }
}
