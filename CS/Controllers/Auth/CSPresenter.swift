//
//  CSPresenter.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable trailing_whitespace
protocol CSPresentetionLogic: AnyObject {
    func presentUser(_ response: UserEntities.UserAuth.Response)
    func authUserCalled(with request: UserEntities.UserAuth.Request)
    var viewController: CSDisplayLogic? { get set }
}

final class CSPresenter: CSPresentetionLogic {
    
    weak var viewController: CSDisplayLogic?
    var interactor: CSBusinessLogic?
    
    func authUserCalled(with request: UserEntities.UserAuth.Request) {
        interactor?.authUser(request)
    }
    
    func presentUser(_ response: UserEntities.UserAuth.Response) {
        // Для примера отформатируем номер телефона
        let formattedPhone = response.userPhone.replacingOccurrences(of: " ", with: "-")
        
        // Создаем экземляр ViewModel для отправки в View Controller
        let viewModel = UserEntities.UserAuth.ViewModel(userPhone: formattedPhone,
                                                    userEmail: response.userEmail,
                                                    userAddress: response.userAddress)
        
        let dataStore = CSDataStore.init(data: viewModel)
        // Вызываем метод логики отображения у View Controller'a
        viewController?.displayUser(dataStore)
    }
}
