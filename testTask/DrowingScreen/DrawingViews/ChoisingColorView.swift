//
//  ChoisingColorView.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ChoisingColorView: UIView {
    
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 20.0, height: 20.0)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 33.0
        return layout
    }()
    
    var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 25.0
        layer.cornerRadius = 25.0
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.shadowColor = UIColor.gray.cgColor
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        guard let collectionView = collectionView else { return }
        collectionView.register(ChoisingColorCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.CollectionViewCellsID.choisingColorCell.rawValue)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 15.0, left: 0, bottom: 15,
                                                             right: UIScreen.main.bounds.width - 29.0)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 25.0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
