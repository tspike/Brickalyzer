//
//  LoginViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit

enum LoginType {
    case rebrickable
    case brickset
}

class LoginViewController: UIViewController {
    var loginType: LoginType? = .brickset
    var scrollView = UIScrollView()
    var emailField = UITextField()
    var passwordField = UITextField()
    var createAccountButton = Styles.secondaryButton()
    var loginButton = Styles.primaryButton()
    var skipButton = Styles.secondaryButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])

        setupTextFields()
        setupButtons()
    }

    private func setupButtons() {
        let buttons: [UIButton] = [createAccountButton, loginButton, skipButton]
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.addSubview(button)
        }
        createAccountButton.setTitle("Create Account", for: .normal)
        loginButton.setTitle("Link Account", for: .normal)
        skipButton.setTitle("Skip", for: .normal)

        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            createAccountButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: passwordField.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 15),
            skipButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }

    private func setupTextFields() {
        guard let loginType = loginType else { return }
        switch loginType {
        case .brickset:
            title = "Login to Brickset"
            emailField.placeholder = "Brickset e-mail address"
            passwordField.placeholder = "Brickset password"
        case .rebrickable:
            title = "Login to Rebrickable"
            emailField.placeholder = "Rebrickable e-mail Address"
            passwordField.placeholder = "Rebrickable password"
        }

        emailField.returnKeyType = .next
        emailField.textContentType = .emailAddress
        passwordField.returnKeyType = .go
        passwordField.textContentType = .password
        passwordField.isSecureTextEntry = true
        [emailField, passwordField].forEach { field in
            field.translatesAutoresizingMaskIntoConstraints = false
            self.scrollView.addSubview(field)
            field.delegate = self
            field.autocorrectionType = .no
            field.autocapitalizationType = .none
            field.borderStyle = UITextField.BorderStyle.roundedRect
            NSLayoutConstraint.activate([
                field.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
                field.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.75),
                field.heightAnchor.constraint(equalToConstant: 44)
                ])
        }
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15)
            ])
    }
}

extension LoginViewController: UITextFieldDelegate {

}
