//
//  ChoisingColorCollectionViewCell.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ChoisingColorCollectionViewCell: UICollectionViewCell {
    
    let colorNumerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(colorNumerLabel)
        NSLayoutConstraint.activate([
            colorNumerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorNumerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
