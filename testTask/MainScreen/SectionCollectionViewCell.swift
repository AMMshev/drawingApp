//
//  SectionCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class SectionCollectionViewCell: UICollectionViewCell {
    
    var decorationImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(decorationImage)
        NSLayoutConstraint.activate([
            decorationImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            decorationImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            decorationImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            decorationImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 1.5, height: 3.0)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10.0
    }
    
        func setImage(image: UIImage?) {
            decorationImage.image = image
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
