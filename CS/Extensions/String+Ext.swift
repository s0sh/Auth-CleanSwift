//
//  String+Ext.swift
//  CS
//
//  Created by Roman Bigun on 15.04.2023.
//

import Foundation

extension String {

    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isPasswordValid() -> Bool {
        return self == "123456"
    }
}
