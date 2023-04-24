//
//  CSInteractor.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable trailing_whitespace
protocol CSBusinessLogic: AnyObject {
    func authUser(_ request: UserEntities.UserAuth.Request)
}

// MARK: - INTERACTOR
final class UserAuthUseCase: CSBusinessLogic {
    
    private var presenter: CSPresentetionLogic?
    
    private let worker = UserRepository.network
    
    init(presenter: CSPresentetionLogic) {
        self.presenter = presenter
    }
    
    func authUser(_ request: UserEntities.UserAuth.Request) {
        
        worker.execute(with: .authentificate, parameters: request) { response, error in
            
            guard error == nil else { return }
            
            guard let presenter = self.presenter, let response = response else { return }
            
            // Вызываем метод логики презентации у Presenter
            presenter.presentUser(response)
        }
    }
}
