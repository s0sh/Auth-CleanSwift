//
//  NetworkWorker.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

struct NetworkWorker {
    private let session = URLSession.shared
    func sendRequest(to url: URL,
                     parameters: CSModels.UserAuth.Request,
                     completion: @escaping (CSModels.UserAuth.Response?, Error?) -> Void) {
        let userPhone = "+38(099) 111 22 33"
        let userEmail = "dot@dot.com"
        let address = "Ukrine, Kharkiv, Sadovy Passage 19/33"
        // Создаем ответ Presentor'у с необходимыми данными
        let response = CSModels.UserAuth.Response(userPhone: userPhone,
                                                  userEmail: userEmail,
                                                  userAddress: address)
        completion(response, nil)
    }
}
