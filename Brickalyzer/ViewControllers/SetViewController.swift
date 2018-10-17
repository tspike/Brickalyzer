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
    let dimmingView = UIView()
    let loader = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchSet()
        setupStackView()
        setupLoader()
    }

    func setupLoader() {
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dimmingView)
        dimmingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.bringSubviewToFront(dimmingView)
        NSLayoutConstraint.activate([
            dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        dimmingView.addSubview(loader)
        let image = UIImage(named: "smileyfig", in: Bundle(for: SetViewController.self), compatibleWith: nil)
        loader.image = image
        loader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loader.heightAnchor.constraint(equalToConstant: 60),
            loader.widthAnchor.constraint(equalToConstant: 60),
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
//        loader.isHidden = true
//        dimmingView.isHidden = true
    }

    func showLoader() {
//        dimmingView.isHidden = false
//        loader.isHidden = false
        rotateLoader()
    }

    func rotateLoader() {
        loader.rotate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.95, execute: {
            self.loader.stopRotating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.95, execute: {
                self.rotateLoader()
            })
        })
    }

    func hideLoader() {
        dimmingView.isHidden = true
        loader.isHidden = true
        loader.stopRotating()
    }

    func fetchSet() {
        showLoader()
        let dataSource = DataSource()
        dataSource.fetchSet(setID: setID, completion: { [weak self] set, error in
            guard let strongSelf = self else { return }
            strongSelf.hideLoader()
            strongSelf.set = set
            if let error = error {
                let alert = UIAlertController(title: "Error", message: "There was a problem fetching set \(strongSelf.setID ?? ""): \(error.localizedDescription)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { action in
                    strongSelf.navigationController?.popViewController(animated: true)
                }))
                strongSelf.present(alert, animated: true, completion: nil)
                return
            }
            if error == nil && set == nil {
                let alert = UIAlertController(title: "Error", message: "No set found \(strongSelf.setID ?? "")", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { action in
                    strongSelf.navigationController?.popViewController(animated: true)
                }))
                strongSelf.present(alert, animated: true, completion: nil)
                return
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
//        rarePartsText.text =
    }
}
