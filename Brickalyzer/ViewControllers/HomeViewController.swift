//
//  HomeViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/20/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLogins()
    }

    private func setupViews() {
        view.backgroundColor = .white
    }

    private func checkLogins() {
        let auth = Authentication()
        if !auth.rebrickableLoggedIn {
            let vc = LoginViewController()
            vc.loginType = .rebrickable
            navigationController?.pushViewController(vc, animated: false)
            return
        }
        if !auth.bricksetLoggedIn {
            let vc = LoginViewController()
            vc.loginType = .brickset
            navigationController?.pushViewController(vc, animated: false)
            return
        }
    }
}
