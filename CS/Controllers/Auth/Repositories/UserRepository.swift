//
//  CSWorker.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

enum UserRepository {
    static let network = WorkersFabric.getWorker(.network)
    static let database = WorkersFabric.getWorker(.localStorage)
}
