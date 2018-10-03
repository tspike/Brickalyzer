//
//  ViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()
    var scanButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    func setupButtons() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        
        scanButton.setTitle("Scan", for: .normal)
        scanButton.setTitleColor(.blue, for: .normal)
        view.addSubview(scanButton)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(scanButton)
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
            ])
        scanButton.addTarget(self, action: #selector(showScanner), for: .touchUpInside)
    }
    
    @objc func showScanner() {
        let scanVC = ScanSetViewController()
        navigationController?.pushViewController(scanVC, animated: true)
    }
}

