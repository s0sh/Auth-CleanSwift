//
//  CSInteractor.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable trailing_whitespace
protocol CSBusinessLogic {
    func authUser(_ request: UserEntities.UserAuth.Request)
    var presenter: CSPresentetionLogic? { get set }
}

final class UserAuthUseCase: CSBusinessLogic {
    
    var presenter: CSPresentetionLogic?
    
    private let worker = CSWorkers.networkWorker
    
    func authUser(_ request: UserEntities.UserAuth.Request) {
        
        worker.execute(request: request) { response, error in
            
            guard error == nil else { return }
            
            guard let presenter = self.presenter, let response = response else { return }
            
            // Вызываем метод логики презентации у Presenter
            presenter.presentUser(response)
        }
    }
}
