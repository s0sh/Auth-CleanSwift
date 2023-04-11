//
//  CSWorker.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

enum CSWorkers {
    static let networkWorker = WorkersFabric.getWorker(.network)
    static let databaseWorker = WorkersFabric.getWorker(.localStorage)
}
