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
}

final class CSRouter: CSRoutingLogic, CSDataPassingProtocol {
   
    var dataStore: CSDataStore?
    
    weak var controller: CSViewController?
    
    func routeToNext() {
        guard var dataStore = self.dataStore else {
            fatalError("no data to present")
        }
        passData(dataStore, destination: &dataStore)
    }
    
    private func navigateTo(_ source: CSViewController, destination: UIViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    private func passData(_ source: CSDataStore, destination: inout CSDataStore) {
        destination.message = source.message
    }
}
