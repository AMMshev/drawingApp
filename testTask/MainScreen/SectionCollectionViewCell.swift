//
//  SectionCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 18.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class SectionCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 3)
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
