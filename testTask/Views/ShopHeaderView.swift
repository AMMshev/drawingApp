//
//  HeaderView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ShopHeaderView: UIView {
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.ImageNames.cancel.rawValue), for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.shadowOpacity = 0.2
        button.layer.shadowRadius = 25.0
        button.layer.cornerRadius = 25.0
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowColor = UIColor.gray.cgColor
        return button
    }()
    fileprivate let moreColorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        label.text = "MORE COLORS"
        return label
    }()
    let colorCountView: ColorCountView = {
        let view = ColorCountView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        view.layer.shadowRadius = 25.0
        view.layer.cornerRadius = 25.0
        view.layer.shadowOpacity = 0.2
        return view
    }()
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let productsPriceView: ShopPriceView = {
        let view = ShopPriceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackView.addArrangedSubview(closeButton)
        stackView.addArrangedSubview(moreColorLabel)
        stackView.addArrangedSubview(colorCountView)
        addSubview(stackView)
        addSubview(productsPriceView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productsPriceView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productsPriceView.topAnchor.constraint(equalTo: stackView.bottomAnchor,
                                                   constant: 15),
            productsPriceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
