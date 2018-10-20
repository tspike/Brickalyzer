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
    let scrollView = UIScrollView()
    let emailField = UITextField()
    let passwordField = UITextField()
    let createAccountButton = Styles.secondaryButton()
    let loginButton = Styles.primaryButton()
    let skipButton = Styles.secondaryButton()
    var scrollViewHeight = NSLayoutConstraint()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillUpdate), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillUpdate), name: UIWindow.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillUpdate), name: UIWindow.keyboardWillChangeFrameNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func keyboardWillUpdate(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let keyboardHeight = keyboardFrame.size.height
        let viewHeight = view.frame.size.height
        print("keyboard height: \(keyboardHeight)")
        print("view height: \(viewHeight)")
        UIView.animate(withDuration: 0.1, animations: {
            self.scrollViewHeight.constant = viewHeight - keyboardHeight
            self.scrollView.layoutIfNeeded()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollViewHeight = scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewHeight,
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            ])

        setupTextFields()
        setupButtons()
    }

    private func setupButtons() {
        let buttons: [UIButton] = [createAccountButton, loginButton, skipButton]
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview(button)
        }
        createAccountButton.setTitle("Create Account", for: .normal)
        loginButton.setTitle("Link Account", for: .normal)
        skipButton.setTitle("Skip", for: .normal)

        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            createAccountButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalTo: passwordField.widthAnchor, multiplier: 0.8),
            loginButton.heightAnchor.constraint(equalToConstant: 44),
            loginButton.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 15),
            skipButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            skipButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            skipButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
            self.contentView.addSubview(field)
            field.delegate = self
            field.autocorrectionType = .no
            field.autocapitalizationType = .none
            field.borderStyle = UITextField.BorderStyle.roundedRect
            NSLayoutConstraint.activate([
                field.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
                field.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.75),
                field.heightAnchor.constraint(equalToConstant: 44)
                ])
        }
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15)
            ])
    }
}

extension LoginViewController: UITextFieldDelegate {

}
