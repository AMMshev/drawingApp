//
//  SectionCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class SectionCollectionViewCell: UICollectionViewCell {
    
    fileprivate var decorationImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    fileprivate var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(decorationImage)
        NSLayoutConstraint.activate([
            decorationImage.topAnchor.constraint(equalTo: topAnchor, constant: 5.0),
            decorationImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.0),
            decorationImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5.0),
            decorationImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5.0)
        ])
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 5.0
    }
    
    func setImage(image: UIImage?) {
        decorationImage.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
