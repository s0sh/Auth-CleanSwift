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
    var sourceController: RoutableController? { get set }
    var destinationController: RoutableController? { get set }
}

protocol RoutableController {}

final class CSRouter: CSRoutingLogic, CSDataPassingProtocol {
   
    var dataStore: CSDataStore?
    
    var sourceController: RoutableController?
    
    var destinationController: RoutableController?
    
    func routeToNext() {
        guard let data = dataStore, var destination = destinationController as? CSMainViewController else { return }
        /// Нв случай, если нужно передать данные в другой контроллер
        passData(data, destinationController: &destination)
        
        guard let viewController = sourceController as? CSViewController else { return }
        navigateTo(viewController, destination: destination)
    }
    
    private func navigateTo(_ source: CSViewController, destination: CSMainViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    private func passData(_ source: CSDataStore, destinationController: inout CSMainViewController) {
        destinationController.router?.dataStore = CSDataStore(data: source.data)
    }
}
