//
//  priceView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//
//  MARK: - stack of boosters price at shop screen
import UIKit

class ShopPriceView: UIView {
    
    fileprivate var boostersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 30.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(boostersStackView)
        NSLayoutConstraint.activate([
            boostersStackView.topAnchor.constraint(equalTo: topAnchor),
            boostersStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boostersStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            boostersStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func addToStack(productImage: String, priceCount: String) {
        let productImage = UIImageView(image: UIImage(named: productImage))
        let priceLabel = UILabel()
        priceLabel.text = " - \(priceCount) "
        priceLabel.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 12.0)
        priceLabel.textColor = #colorLiteral(red: 0.3450980392, green: 0.2745098039, blue: 0.4588235294, alpha: 1)
        let paintImage = UIImageView(image: UIImage(named: Constants.ImageNames.fill.rawValue))
        let stackView = UIStackView(arrangedSubviews: [productImage, priceLabel, paintImage])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        boostersStackView.addArrangedSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
