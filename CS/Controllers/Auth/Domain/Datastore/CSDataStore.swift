//
//  CSDataStore.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

/// Передача данных между контроллерами
struct CSDataStore {
    var data: UserEntities.UserAuth.ViewModel?
}

protocol CSDataPassingProtocol {
    var dataStore: CSDataStore? { get }
}
