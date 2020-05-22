//
//  priceView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class PriceView: UIView {
    
    private let productsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(productsStackView)
        productsStackView.addArrangedSubview(addToStack(productImage: Constants.ImageNames.witch.rawValue,
                                                           priceCount: "1"))
        productsStackView.addArrangedSubview(addToStack(productImage: Constants.ImageNames.witch.rawValue,
                                                           priceCount: "20"))
        NSLayoutConstraint.activate([
            productsStackView.topAnchor.constraint(equalTo: topAnchor),
            productsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func addToStack(productImage: String, priceCount: String) -> UIStackView {
        let productImage = UIImageView(image: UIImage(named: productImage))
        let priceLabel = UILabel()
        priceLabel.text = " - \(priceCount) "
        priceLabel.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 12)
        priceLabel.textColor = #colorLiteral(red: 0.3450980392, green: 0.2745098039, blue: 0.4588235294, alpha: 1)
        let paintImage = UIImageView(image: UIImage(named: Constants.ImageNames.fill.rawValue))
        let oneProductStackView = UIStackView(arrangedSubviews: [productImage, priceLabel,
                                                                 paintImage])
        oneProductStackView.alignment = .fill
        oneProductStackView.distribution = .fillEqually
        return oneProductStackView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
