//
//  WorkerProtocols.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

protocol Worker {
    func execute(request: CSModels.UserAuth.Request,
                     completion: @escaping (CSModels.UserAuth.Response?, Error?) -> Void)
}
