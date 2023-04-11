//
//  WorkersFabric.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

enum WorkerType {
    case network
    case localStorage
}

struct WorkersFabric {
    static func getWorker(_ type: WorkerType) -> Worker {
        switch type {
        case .network:
            return AuthNetworkWorker()
        case .localStorage:
            return AuthDatabaseWorker()
        }
    }
}
