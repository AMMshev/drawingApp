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
        view.layer.cornerRadius = 10
        return view
    }()
    var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(decorationImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            decorationImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            decorationImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            decorationImage.heightAnchor.constraint(equalToConstant: bounds.height),
            decorationImage.widthAnchor.constraint(equalToConstant: bounds.width)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        decorationImage.image = image
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 1.5, height: 3)
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10.0
        decorationImage.layer.cornerRadius = 10.0
        decorationImage.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
