//
//  WorkerProtocols.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

protocol Worker {
    func execute(request: UserEntities.UserAuth.Request,
                     completion: @escaping (UserEntities.UserAuth.Response?, Error?) -> Void)
}
