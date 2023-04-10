//
//  CSDataStore.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

struct CSDataStore {
    var data: CSModels.UserAuth.ViewModel?
}

protocol CSDataPassingProtocol {
    var dataStore: CSDataStore? { get }
}
