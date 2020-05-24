//
//  ColorCountView.swift
//  testTask
//
//  Created by Artem Manyshev on 21.05.2020.
//  Copyright © 2020 Artem Manyshev. All rights reserved.
//

import UIKit

class ColorCountView: UIView {
    
    fileprivate let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    fileprivate let fillImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageNames.fill.rawValue)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    fileprivate let colorCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "colorCount")
        label.font = UIFont(name: Constants.Fonts.arialRoundedMTBold.rawValue, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fillImageView)
        stackView.addArrangedSubview(colorCountLabel)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 25.0
        layer.cornerRadius = 25.0
        layer.shadowOpacity = 0.2
        setColorCount(value: UserDefaults.standard.object(forKey: Constants.UserDafaultsKeys.balance.rawValue) as? Double ?? 0.0)
    }
    
    func setColorCount(value: Double) {
        colorCountLabel.text = value / 1000 >= 1 ? String(Int(value / 1000)) + "K" : String(Int(value))
    }
    func addToStack(element: UIView) {
        stackView.addArrangedSubview(element)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
