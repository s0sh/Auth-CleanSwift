//
//  WorkerProtocols.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

enum WorkerAction {
    case add
    case update
    case retrieve
    case authentificate
}

protocol Worker {
    func execute(with action: WorkerAction, parameters: AnyHashable,
                 completion: @escaping (UserEntities.UserAuth.Response?,
                 Error?) -> Void)
}
