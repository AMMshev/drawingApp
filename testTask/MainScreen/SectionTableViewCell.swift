//
//  SectionTableViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func collectionView(collectionviewcell: UICollectionViewCell?, collectionCellIndex: Int, didTappedInTableViewCell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    var tableViewCellIndex: Int?
    var sectionPictures: [String]?
}

class SectionTableViewCell: TableViewCell {
    
    private var collectionView: UICollectionView?
    weak open var cellDelegate: CollectionViewCellDelegate?
    
    private var sectionImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var sectionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var menuImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: Constants.ImageNames.MainScreen.more.rawValue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 15
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 0, right: 15)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        guard let collectionView = collectionView else { return }
        addSubview(collectionView)
        addSubview(sectionImageView)
        addSubview(sectionLabel)
        addSubview(menuImageView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SectionCollectionViewCell.self,
                                forCellWithReuseIdentifier: Constants.CollectionViewCellsID.sectionCollectionCell.rawValue)
        setLayout(collectionView)
    }
    
    func setSectionData(sectionName: String, imageName: String) {
        sectionLabel.text = sectionName.uppercased()
        sectionImageView.image = UIImage(named: imageName)
    }
    fileprivate func setLayout(_ collectionView: UICollectionView) {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionImageView.topAnchor.constraint(equalTo: topAnchor),
            sectionImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 15),
            sectionLabel.leadingAnchor.constraint(equalTo: sectionImageView.trailingAnchor, constant: 10),
            sectionLabel.centerYAnchor.constraint(equalTo: sectionImageView.centerYAnchor),
            menuImageView.centerYAnchor.constraint(equalTo: sectionImageView.centerYAnchor),
            menuImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        sectionPictures?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellsID.sectionCollectionCell.rawValue,
                                                            for: indexPath) as? SectionCollectionViewCell else { return UICollectionViewCell() }
        cell.setImage(image: UIImage(named: sectionPictures?[indexPath.item] ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellsID.sectionCollectionCell.rawValue, for: indexPath)
        self.cellDelegate?.collectionView(collectionviewcell: cell,
                                          collectionCellIndex: indexPath.item,
                                          didTappedInTableViewCell: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2.5,
               height: collectionView.bounds.width / 2.5)
    }
}
