//
//  CSModels.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

// swiftlint:disable nesting
enum UserEntities {
    enum UserAuth {
        /// Запрос к Interactor из View Controller (TextFields данные или что-то другое)
        ///  То, что уходит параметрами в сетевой запрос
        struct Request: Encodable, Hashable {
            let userName: String
            let userPassword: String
        }
        /// Пришел ответ от сервера, передаем в Presenter и форматируем там данные если нужно
        struct Response: Decodable, Hashable {
            let userPhone: String
            let userEmail: String
            let userAddress: String
        }
        /// Передаем отформатированые данные во View Controller из Presenter
        /// Формируем это в структуру CSDataSource в Presenter для удобства
        struct ViewModel {
            let userPhone: String
            let userEmail: String
            let userAddress: String
        }
    }
}
