//
//  AuthBlockViewModel.swift
//  CS
//
//  Created by Roman Bigun on 15.04.2023.
//

import Foundation
import Combine

enum ViewStates {
    case loading
    case success
    case failed
    case none
}

class AuthBlockViewModel {
    @Published var email = "".lowercased()
    @Published var password = "".lowercased()
    @Published var state: ViewStates = .none
    
    var isValidEmailPublisher: AnyPublisher<Bool, Never> {
        $email.map { $0.isEmail() }.eraseToAnyPublisher()
    }
    
    var isValidPasswordPublisher: AnyPublisher<Bool, Never> {
        print(password)
        return $password.map { $0.isPasswordValid() }.eraseToAnyPublisher()
        
    }
    
    var isLoginEnabled: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isValidEmailPublisher, isValidPasswordPublisher)
            .map { $0 && $1 }.eraseToAnyPublisher()
    }
    
    func submitLogin(completion: @escaping (Bool) -> Void) {
        state = .loading
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            guard let self = self else { return }
            if self.isLoginCorrect() { 
                self.state = .success
                completion(true)
            } else {
                self.state = .failed
                completion(false)
            }
        }
    }
    
    func isLoginCorrect() -> Bool {
        return email.lowercased() == "test@test.com" && password == "123456"
    }
}
