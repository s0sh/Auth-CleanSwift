//
//  DatabaseWorker.swift
//  CS
//
//  Created by Roman Bigun on 11.04.2023.
//

import Foundation

struct AuthDatabaseWorker: Worker {
    func execute(request: CSModels.UserAuth.Request,
                 completion: @escaping (CSModels.UserAuth.Response?, Error?) -> Void) {
        let userPhone = "+38(099) 111 22 33"
        let userEmail = "dot@dot.com"
        let address = "Ukrine, Kharkiv, Sadovy Passage 19/33"
        
        let response = CSModels.UserAuth.Response(userPhone: userPhone,
                                                  userEmail: userEmail,
                                                  userAddress: address)
        completion(response, nil)
    }
}
