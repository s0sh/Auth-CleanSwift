//
//  CSMainRouter.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//

import Foundation
// swiftlint:disable trailing_whitespace
protocol CSMainRoutingLogic {
    func routeToNext()
    func routeBack()
    var dataStore: CSDataStore? { get set }
}

final class CSMainRouter: CSDataPassingProtocol {
    var dataStore: CSDataStore?
}

extension CSMainRouter: CSMainRoutingLogic {
    func routeToNext() {
        
    }
    
    func routeBack() {
        
    }
}
