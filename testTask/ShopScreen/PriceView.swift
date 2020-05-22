//
//  priceView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class PriceView: UIView {
    
    let productsStackView: UIStackView = {
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
        productsStackView.addArrangedSubview(makePriceView(productImageName: "witch",
                                                           priceCount: "1"))
        productsStackView.addArrangedSubview(makePriceView(productImageName: "smile",
                                                           priceCount: "20"))
        NSLayoutConstraint.activate([
            productsStackView.topAnchor.constraint(equalTo: topAnchor),
            productsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func makePriceView(productImageName: String, priceCount: String) -> UIStackView {
        let productImage = UIImageView(image: UIImage(named: productImageName))
        let priceLabel = UILabel()
        priceLabel.text = " - \(priceCount) "
        priceLabel.font = UIFont(name: "ArialRoundedMTBold", size: 12)
        priceLabel.textColor = #colorLiteral(red: 0.3450980392, green: 0.2745098039, blue: 0.4588235294, alpha: 1)
        let paintImage = UIImageView(image: UIImage(named: "fill"))
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
