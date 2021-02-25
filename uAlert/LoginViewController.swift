//
//  LoginViewController.swift
//  uAlert
//
//  Created by Sucias Colomer, David on 23/02/2021.
//  Copyright © 2021 Sucias Colomer, David. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var biometryIcon: UIImageView!
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorTheme.lightOrange.color
            
        // Configure Labels
        configureCenteredLabel(label: appTitleLabel, with: "uALERT", with: FontTheme.h1.font)
        configureLeftLabel(label: userLabel, with: "Usuario o Correo Electrónico", with: FontTheme.authLabels.font)
        configureLeftLabel(label: passLabel, with: "Contraseña", with: FontTheme.authLabels.font)
        
        // Configure images
        configureImages()
        
        // Configure buttons
        configureButtons()
        
        // Configure textFields
        configureTextFields()
    }
    
    // MARK: Configure functions
    
    private func configureImages() {
        biometryIcon.image = UIImage(named: "fingerprint.png")
        biometryIcon.image = biometryIcon.image?.withRenderingMode(.alwaysTemplate)
        biometryIcon.tintColor = ColorTheme.darkBlue.color
        appIcon.image = UIImage(named: "uAlertIcon.png")
    }
    
    private func configureCenteredLabel(label: UILabel, with text: String, with font: UIFont) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(6.0), range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.textAlignment = .center
        label.textColor = ColorTheme.darkBlue.color
        label.font = font
        label.font = UIFont.boldSystemFont(ofSize: 42)
    }
    
    private func configureLeftLabel(label: UILabel, with text: String, with font: UIFont) {
        label.text = text
        label.textAlignment = .left
        label.textColor = ColorTheme.darkBlue.color
        label.font = font
    }
    
    private func configureTextFields() {
        userTextField.placeholder = "Usuario o Correo Electrónico"
        passTextField.placeholder = "Contraseña"
    }
    
    private func configureButtons() {
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.titleLabel?.font = FontTheme.loginButton.font
        loginButton.setTitleColor(ColorTheme.white.color, for: .normal)
        
        loginButton.layer.backgroundColor = ColorTheme.darkBlue.color.cgColor
        loginButton.layer.cornerRadius = 5
    }
    
}

