//
//  CSInteractor.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable trailing_whitespace
protocol CSBusinessLogic {
    func fetchUser(_ request: CSModels.FethUser.Request)
}

final class CSInteractor: CSBusinessLogic {
    
    var presenter: CSPresentetionLogic?
    
    private let worker = CSWorkers.networkWorker
    
    func fetchUser(_ request: CSModels.FethUser.Request) {
        
        worker.sendRequest(to: URL(string: "http://google.com")!,
                           parameters: request) { response, error in
            
            guard error == nil else { return }
            
            guard let presenter = self.presenter, let response = response else { return }
            
            // Вызываем метод логики презентации у Presentor'а
            presenter.presentUser(response)
        }
    }
}
