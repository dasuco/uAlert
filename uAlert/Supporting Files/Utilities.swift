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
            return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(200.0/255.0), blue: CGFloat(155.0/255.0), alpha: CGFloat(1.0))
        case .darkOrange:
            return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(213.0/255.0), blue: CGFloat(130.0/255.0), alpha: CGFloat(1.0))
        case .lightBlue:
            return UIColor(red: CGFloat(217.0/255.0), green: CGFloat(231.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0))
        case .darkBlue:
            return UIColor(red: CGFloat(95.0/255.0), green: CGFloat(140.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0))
        case .white:
            return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(1.0))
        case .black:
            return UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(0.0/255.0), alpha: CGFloat(1.0))
        case .ligthGray:
            return UIColor(red: CGFloat(232.0/255.0), green: CGFloat(232.0/255.0), blue: CGFloat(232.0/255.0), alpha: CGFloat(1.0))
        case .darkGray:
            return UIColor(red: CGFloat(184.0/255.0), green: CGFloat(184.0/255.0), blue: CGFloat(184.0/255.0), alpha: CGFloat(1.0))
        }
    }
}

// MARK: CUSTOM FONT
// HOW USE IT? -- something.font = FontTheme.loginButton.font
// Dynamic structure for fonts --> "https://toplayoutguide.medium.com/swift-custom-fonts-slightly-less-awful-f235e20027f3"

enum FontTheme {
    case h1
    case h2
    case authLabels
    case cardTitle
    case cardDescription
    case loginButton
    
    var font: UIFont {
        switch self {
        case .h1:
            return UIFont(name: "Futura", size: 42.0)!
        case .h2:
            return UIFont(name: "Futura", size: 26.0)!
        case .authLabels:
            return UIFont(name: "Futura", size: 16.0)!
        case .cardTitle:
            return UIFont(name: "Futura", size: 18.0)!
        case .cardDescription:
            return UIFont(name: "Futura", size: 12.0)!
        case .loginButton:
            return UIFont(name: "Futura", size: 20.0)!
        }
    }
}
