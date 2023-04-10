//
//  Resources.swift
//  CS
//
//  Created by Roman Bigun on 09.04.2023.
//
import UIKit

// swiftlint:disable type_name trailing_whitespace nesting
typealias R = Resources

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#5AA5E2").withAlphaComponent(0.2)
        static let activeDark = UIColor(hexString: "#5AA5E2").withAlphaComponent(0.8)
        static let inactive = UIColor(hexString: "#F7F7F7")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let titleDarkGrey = UIColor(hexString: "#2C2948")
        static let mainAppColor = UIColor(hexString: "#5AA5E2")
        static let secondaryBackground = UIColor(hexString: "#F0F3FF")
        static let mainAppDark = UIColor(hexString: "#1C1939")
        static let mainAppGray = UIColor(hexString: "#F9F9F9")
        static let devider = UIColor(hexString: "#D8D8D8")
        static let tipColor = UIColor(hexString: "#1C1939").withAlphaComponent(0.8)
    }
   
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        static func helveticaLight(with size: CGFloat) -> UIFont {
            return UIFont(name: "Helvetica-Light", size: size) ?? UIFont()
        }
    }
    
    enum Strings {
        static let send = "Send"
        static let password = "Password"
        static let email = "Email"
        static let name = "Name"
    }
    
    enum Icons {
        static let eye = UIImage(named: "eye")
        static let eyeBig = UIImage(named: "eye_big")
        enum Buttons {
            static let send = UIImage(named: "send")
        }
    }
}
