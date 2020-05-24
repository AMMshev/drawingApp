//
//  InformationCollectionView.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class InformationCollectionView: UICollectionView {
    
    let cellsData = InformationScreenData().cellsDataArray
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(InformationCollectionViewCell.self,
        forCellWithReuseIdentifier: Constants.CollectionViewCellsID.informationCell.rawValue)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InformationCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellsID.informationCell.rawValue, for: indexPath) as? InformationCollectionViewCell else { return UICollectionViewCell() }
        let cellData = cellsData[indexPath.item]
        cell.addToCell(imageName: cellData.imageName, labelText: cellData.labelText)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.bounds.size
        return CGSize(width: (collectionViewSize.width - 76) / 2, height: (collectionViewSize.width - 76) / 2)
    }
}
