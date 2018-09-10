//
//  SetsViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit

class SetCell: UICollectionViewCell {
    let name = UILabel()
    
    var set: LegoSet? {
        didSet {
            guard let setName = set?.name else {
                return
            }
            self.name.text = setName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
    }
    
    func addViews() {
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.topAnchor),
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            name.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            name.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
}

class SetsDataSource: NSObject, UICollectionViewDataSource {
    var sets: [LegoSet] = Array()
    
    func fetchData(_ completion: (() -> Void)?) {
        RebrickableService().getSets(completion: { sets in
            self.sets = sets
            if let completion = completion {
                completion()
                return
            }
        })
    }

    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "set", for: indexPath) as! SetCell
        cell.set = sets[indexPath.row]
        return cell
    }
}

class SetsViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    let dataSource = SetsDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.fetchData { self.collectionView.reloadData() }
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(SetCell.self, forCellWithReuseIdentifier: "set")
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    // MARK: - UICollectionDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 44)
    }
}

