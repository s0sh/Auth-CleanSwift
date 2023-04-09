//
//  CSPresenter.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable trailing_whitespace
protocol CSPresentetionLogic: AnyObject {
    func presentUser(_ response: CSModels.FethUser.Response)
}

final class CSPresenter: CSPresentetionLogic {
    
    var viewController: CSDisplayLogic?
    
    func presentUser(_ response: CSModels.FethUser.Response) {
        // Для примера отформатируем номер телефона
        let formattedPhone = response.userPhone.replacingOccurrences(of: " ", with: "-")
        
        // Создаем экземляр ViewModel для отправки в View Controller
        let viewModel = CSModels.FethUser.ViewModel(userPhone: formattedPhone,
                                                    userEmail: response.userEmail,
                                                    userAddress: response.userAddress)
        
        let dataStore = CSDataStore.init(data: viewModel)
        // Вызываем метод логики отображения у View Controller'a
        viewController?.displayUser(dataStore)
    }
}
