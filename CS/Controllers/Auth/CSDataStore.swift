//
//  CSDataStore.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

struct CSDataStore {
    var message: String
}

protocol CSDataPassingProtocol {
    var dataStore: CSDataStore? { get }
}
