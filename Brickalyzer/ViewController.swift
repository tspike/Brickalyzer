//
//  ViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scanButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        scanButton.setTitle("Scan", for: .normal)
        scanButton.setTitleColor(.blue, for: .normal)
        self.view.addSubview(scanButton)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.centerYAnchor.constraint(equalTo: scanButton.centerYAnchor),
            self.view.centerXAnchor.constraint(equalTo: scanButton.centerXAnchor)
            ])
        scanButton.addTarget(self, action: #selector(self.showScanner), for: .touchUpInside)
    }
    
    @objc func showScanner() {
        let scanVC = ScanSetViewController()
        self.navigationController?.pushViewController(scanVC, animated: true)
    }
}

