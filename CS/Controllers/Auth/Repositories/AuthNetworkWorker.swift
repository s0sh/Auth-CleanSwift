//
//  NetworkWorker.swift
//  CS
//
//  Created by Roman Bigun on 08.04.2023.
//

import Foundation

struct AuthNetworkWorker: Worker {
    
    func execute(parameters: AnyHashable,
                     completion: @escaping (UserEntities.UserAuth.Response?, Error?) -> Void) {
        let userPhone = "+38(099) 111 22 33"
        let userEmail = "dot@dot.com"
        let address = "Ukrine, Kharkiv, Sadovy Passage 19/33"
        
        /// Тут формируем данные для интерактора, что-бы в презентер уже ушли нормализованые
        /// данные для отображения во вью
        let response = UserEntities.UserAuth.Response(userPhone: userPhone,
                                                  userEmail: userEmail,
                                                  userAddress: address)
        completion(response, nil)
    }
}
