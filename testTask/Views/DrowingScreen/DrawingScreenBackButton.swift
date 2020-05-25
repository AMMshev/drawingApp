//
//  DrawingViewBackButton.swift
//  testTask
//
//  Created by Artem Manyshev on 24.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class DrawingScreenBackButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 25.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.5)
        setImage(UIImage(named: Constants.ImageNames.DrowingScreen.back.rawValue),
                 for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        heightAnchor.constraint(equalToConstant: 50.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
