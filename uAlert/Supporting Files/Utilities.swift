//
//  Utilities.swift
//  uAlert
//
//  Created by Sucias Colomer, David on 24/02/2021.
//  Copyright © 2021 Sucias Colomer, David. All rights reserved.
//

import UIKit

// MARK: CUSTOM COLORS
// HOW USE IT? -- view.backgroundColor = ColorTheme.lightOrange.color

enum ColorTheme {
    case lightOrange
    case darkOrange
    case lightBlue
    case darkBlue
    case black
    case white
    case ligthGray
    case darkGray
    
    var color: UIColor {
        switch self {
        case .lightOrange:
            return UIColor(red: 255, green: 235, blue: 171, alpha: 1.0)
        case .darkOrange:
            return UIColor(red: 255, green: 213, blue: 130, alpha: 1.0)
        case .lightBlue:
            return UIColor(red: 217, green: 231, blue: 255, alpha: 1.0)
        case .darkBlue:
            return UIColor(red: 140, green: 183, blue: 255, alpha: 1.0)
        case .black:
            return UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        case .white:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        case .ligthGray:
            return UIColor(red: 232, green: 232, blue: 232, alpha: 1.0)
        case .darkGray:
            return UIColor(red: 184, green: 184, blue: 184, alpha: 1.0)
        }
    }
}

// MARK: CUSTOM FONT
// HOW USE IT? -- something.font = FontTheme.loginButton.font

enum FontTheme {
    case h1
    case h2
    case cardTitle
    case cardDescription
    case loginButton
    
    var font: UIFont {
        switch self {
        case .h1:
            return UIFont(name: "Arial", size: 34.0)!
        case .h2:
            return UIFont(name: "Arial", size: 26.0)!
        case .cardTitle:
            return UIFont(name: "Arial", size: 18.0)!
        case .cardDescription:
            return UIFont(name: "Arial", size: 12.0)!
        case .loginButton:
            return UIFont(name: "Arial", size: 16.0)!
        }
    }
}
