//
//  SectionTableViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func collectionView(collectionviewcell: UICollectionViewCell?, index: Int, didTappedInTableViewCell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    var tableViewCellIndex: Int?
    var sectionData: SectionModel?
}

class SectionTableViewCell: TableViewCell {
    
    var collectionView: UICollectionView?
    weak var cellDelegate: CollectionViewCellDelegate?
    
    var sectionImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var menuImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 15
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 10, right: 15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        guard let collectionView = collectionView else { return }
        addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: "sectionCollectionCell")
        
        addSubview(sectionImageView)
        addSubview(sectionLabel)
        addSubview(menuImageView)
        NSLayoutConstraint.activate([
            sectionImageView.topAnchor.constraint(equalTo: topAnchor),
            sectionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            sectionImageView.heightAnchor.constraint(equalToConstant: 32),
            sectionImageView.widthAnchor.constraint(equalToConstant: 32),
            sectionLabel.leadingAnchor.constraint(equalTo: sectionImageView.trailingAnchor, constant: 10),
            sectionLabel.centerYAnchor.constraint(equalTo: sectionImageView.centerYAnchor),
            menuImageView.centerYAnchor.constraint(equalTo: sectionImageView.centerYAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            menuImageView.heightAnchor.constraint(equalToConstant: 32),
            menuImageView.widthAnchor.constraint(equalToConstant: 32)
        ])
        sectionImageView.image = UIImage(named: sectionData?.imageName ?? "")
        sectionLabel.text = sectionData?.sectionName.uppercased()
    }
}


extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionData?.cellsPictures.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCollectionCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCollectionCell", for: indexPath)
        self.cellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 200, height: 200)
    }
}
