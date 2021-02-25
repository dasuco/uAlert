//
//  LoginViewController.swift
//  uAlert
//
//  Created by Sucias Colomer, David on 23/02/2021.
//  Copyright © 2021 Sucias Colomer, David. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    var context = LAContext()
    
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
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        self.view.backgroundColor = ColorTheme.lightOrange.color
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        biometryIcon.addGestureRecognizer(tapGestureRecognizer)
        biometryIcon.isUserInteractionEnabled = true
        
        configureCenteredLabel(label: appTitleLabel, with: "uALERT", with: FontTheme.h1.font)
        configureLeftLabel(label: userLabel, with: "Usuario o Correo Electrónico", with: FontTheme.authLabels.font)
        configureLeftLabel(label: passLabel, with: "Contraseña", with: FontTheme.authLabels.font)
        configureImages()
        configureButtons()
        configureTextFields()
    }
    
    // MARK: Functions actions
    
    func validateBiometryAuthentication() {
        
        context = LAContext()
        
        // First check if we have the needed hardware support.
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ) { success, error in
                DispatchQueue.main.async {
                    if success {
                        guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "uAlertViewController") else {
                            return
                        }
                        self.present(mainViewController, animated: true)
                    } else {
                        // User did not authenticate successfully, look at error and take appropriate action
                        print(error?.localizedDescription)
                    }
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")

            // Fall back to a asking for username and password.
            // ...
        }
    }
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        validateBiometryAuthentication()
    }
    
    @IBAction func userFieldIsChanging(_ sender: UITextField) {
        if sender.text == "" {
            userLabel.textColor = ColorTheme.darkBlue.color
            userTextField.layer.borderWidth = 0
        }
    }
    
    @IBAction func passFieldIsChanging(_ sender: UITextField) {
        if sender.text == "" {
            passLabel.textColor = ColorTheme.darkBlue.color
            passTextField.layer.borderWidth = 0
        }
    }
    
    @IBAction func doLoginAuth(_ sender: UIButton) {
        
        guard let inputUserText = userTextField.text,
            let inputPassText = passTextField.text else {
                return
        }
        
        if inputUserText == "User" && inputPassText == "user123" {
            guard let mainViewController = self.storyboard?.instantiateViewController(identifier: "uAlertViewController") else {
                return
            }
            self.present(mainViewController, animated: true)
        } else {
            authenticationFailedStyle()
        }
    }
    
    private func authenticationFailedStyle() {
        userLabel.textColor = ColorTheme.failAuth.color
        passLabel.textColor = ColorTheme.failAuth.color
        
        userTextField.layer.borderWidth = 1
        userTextField.layer.borderColor = ColorTheme.failAuth.color.cgColor
        
        passTextField.layer.borderWidth = 1
        passTextField.layer.borderColor = ColorTheme.failAuth.color.cgColor
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
        userTextField.addConstraint(NSLayoutConstraint(item: userTextField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 42.0))
        
        passTextField.placeholder = "Contraseña"
        passTextField.isSecureTextEntry = true
        passTextField.addConstraint(NSLayoutConstraint(item: passTextField!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 42.0))
    }
    
    private func configureButtons() {
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.titleLabel?.font = FontTheme.loginButton.font
        loginButton.setTitleColor(ColorTheme.white.color, for: .normal)
        
        loginButton.layer.backgroundColor = ColorTheme.darkBlue.color.cgColor
        loginButton.layer.cornerRadius = 5
    }
}

