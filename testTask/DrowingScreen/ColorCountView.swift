//
//  ColorCountView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ColorCountView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let fillImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageNames.fill.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let colorCountLabel: UILabel = {
        let label = UILabel()
        label.text = ((UserDefaults.standard.object(forKey: Constants.UserDafaultsKeys.balance.rawValue) as? Double)?.stringWithoutZeroFraction ?? "") + "K"
        label.textColor = UIColor(named: "colorCount")
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        stackView.addArrangedSubview(fillImageView)
        stackView.addArrangedSubview(colorCountLabel)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    func addToStack(element: UIView) {
        stackView.addArrangedSubview(element)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
