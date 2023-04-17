//
//  WorkerProtocols.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

protocol Worker {
    func execute(parameters: AnyHashable,
                 completion: @escaping (UserEntities.UserAuth.Response?,
                 Error?) -> Void)
}
