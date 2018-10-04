//
//  SetViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/16/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class SetViewController: UIViewController {
    var setID: String!
    var set: LegoSet? {
        didSet {
            render()
        }
    }

    let scrollView = UIScrollView()
    let stackView = UIStackView()

    let imageView = UIImageView()
    let setIDLabel = UILabel()
    let setTitleLabel = UILabel()
    let numPiecesLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchSet()
        setupStackView()
    }

    func fetchSet() {
        DataSource().fetchSet(setID: setID, completion: { [weak self] set, error in
            guard let strongSelf = self else { return }
            strongSelf.set = set
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "There was a problem fetching set \(strongSelf.setID ?? ""): \(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
            }
        })
    }

    func setupStackView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            imageView.widthAnchor.constraint(equalTo: stackView.widthAnchor)
            ])
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        setIDLabel.translatesAutoresizingMaskIntoConstraints = false
        setTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(setIDLabel)
        stackView.addArrangedSubview(setTitleLabel)

    }

    func render() {
        if let imageURL = set?.setImageURL {
            imageView.af_setImage(withURL: imageURL)
        }
        setIDLabel.text = String(setID)
        setTitleLabel.text = set?.name
    }
}
